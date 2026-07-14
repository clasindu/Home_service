package com.homeservice.ai.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.homeservice.ai.dto.AgentReplyDto;
import com.homeservice.ai.dto.StartConversationResponse;
import com.homeservice.ai.entity.*;
import com.homeservice.ai.gemini.GeminiClient;
import com.homeservice.ai.repository.AiConversationRepository;
import com.homeservice.ai.repository.AiMessageRepository;
import com.homeservice.ai.repository.DiagnosisReportRepository;
import com.homeservice.category.entity.IssueCategory;
import com.homeservice.category.repository.IssueCategoryRepository;
import com.homeservice.common.exception.ResourceNotFoundException;
import com.homeservice.common.security.CurrentUserProvider;
import com.homeservice.user.entity.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class DiagnosisService {

    private final GeminiClient geminiClient;
    private final HazardOverrideService hazardOverride;
    private final ObjectMapper objectMapper;
    private final CurrentUserProvider currentUser;

    private final AiConversationRepository conversationRepository;
    private final AiMessageRepository messageRepository;
    private final DiagnosisReportRepository reportRepository;
    private final IssueCategoryRepository categoryRepository;

    private static final String SYSTEM_PROMPT = """
            You are an AI home-service diagnosis assistant. A homeowner describes a
            household problem (plumbing, electrical, carpentry, painting, appliance
            repair, cleaning, or gardening). Your job:
            1. Ask focused follow-up questions until you can diagnose the issue.
            2. Classify the issue into ONE category from:
               PLUMBING, ELECTRICAL, CARPENTRY, PAINTING, APPLIANCE_REPAIR, CLEANING, GARDENING.
            3. Assess severity: LOW, MEDIUM, HIGH, or CRITICAL.
            4. For LOW/MEDIUM issues, offer safe DIY guidance.
            5. For HIGH/CRITICAL issues, insist on a professional and do NOT give
               DIY steps that could be dangerous.

            SAFETY: Never downplay anything involving gas, smoke, sparking, electric
            shock, exposed wiring, or water meeting electricity. When unsure, escalate.

            You MUST reply with ONLY a JSON object, no markdown, in this exact shape:
            {
              "reply": "<message to show the user>",
              "category": "<one category name or null>",
              "severityCandidate": "<LOW|MEDIUM|HIGH|CRITICAL or null>",
              "followUpQuestion": "<a question, or null if you have enough info>",
              "diyGuidance": "<DIY steps for LOW/MEDIUM final diagnosis, else null>",
              "complete": <true only when this is your final diagnosis>
            }
            """;

    @Transactional
    public StartConversationResponse startConversation() {
        User user = currentUser.require();
        AiConversation conversation = AiConversation.builder().user(user).build();
        conversation = conversationRepository.save(conversation);
        return new StartConversationResponse(conversation.getId());
    }

    @Transactional
    public AgentReplyDto sendMessage(UUID conversationId, String userMessage) {
        AiConversation conversation = conversationRepository.findById(conversationId)
                .orElseThrow(() -> new ResourceNotFoundException("Conversation not found: " + conversationId));

        // Persist the user's message.
        messageRepository.save(AiMessage.builder()
                .conversation(conversation)
                .sender(SenderType.USER)
                .content(userMessage)
                .build());

        // Build the turn history for Gemini from persisted messages.
        List<AiMessage> history = messageRepository.findByConversationIdOrderByCreatedAtAsc(conversationId);
        List<GeminiClient.Turn> turns = new ArrayList<>();
        for (AiMessage m : history) {
            String role = m.getSender() == SenderType.USER ? "user" : "model";
            turns.add(new GeminiClient.Turn(role, m.getContent()));
        }

        // Call Gemini and parse the structured output.
        String rawModelText = geminiClient.generateText(SYSTEM_PROMPT, turns);
        ModelDiagnosis parsed = ModelDiagnosis.parse(rawModelText, objectMapper);

        // Apply the deterministic hazard-override safety layer over the whole
        // conversation text (all user messages), so nothing gets talked down.
        String allUserText = history.stream()
                .filter(m -> m.getSender() == SenderType.USER)
                .map(AiMessage::getContent)
                .reduce("", (a, b) -> a + " " + b);
        Severity llmSeverity = toSeverity(parsed.severityCandidate());
        Severity finalSeverity = hazardOverride.apply(llmSeverity, allUserText);
        boolean escalated = hazardOverride.wasEscalated(llmSeverity, finalSeverity);

        // Persist the agent's reply text.
        messageRepository.save(AiMessage.builder()
                .conversation(conversation)
                .sender(SenderType.AGENT)
                .content(parsed.reply() != null ? parsed.reply() : rawModelText)
                .build());

        // Resolve category if the model provided one.
        IssueCategory category = resolveCategory(parsed.category());
        if (category != null && conversation.getCategory() == null) {
            conversation.setCategory(category);
        }

        boolean complete = parsed.complete();
        // If the safety layer escalated to HIGH/CRITICAL, force a professional
        // referral and treat the diagnosis as complete.
        boolean requiresProfessional = finalSeverity.ordinal() >= Severity.HIGH.ordinal();
        if (escalated) {
            complete = true;
        }

        String diy = requiresProfessional ? null : parsed.diyGuidance();

        // When complete, persist a DiagnosisReport.
        if (complete) {
            reportRepository.save(DiagnosisReport.builder()
                    .conversation(conversation)
                    .category(category != null ? category : conversation.getCategory())
                    .severity(finalSeverity)
                    .diyRecommendation(diy)
                    .requiresProfessional(requiresProfessional)
                    .confidenceScore(BigDecimal.valueOf(0.8))
                    .build());
        }

        String replyText = parsed.reply() != null ? parsed.reply() : rawModelText;
        if (escalated) {
            replyText = "\u26a0\ufe0f This looks potentially dangerous, so I'm recommending a "
                    + "professional rather than a DIY fix. " + replyText;
        }

        return new AgentReplyDto(
                replyText,
                category != null ? category.getName()
                        : (conversation.getCategory() != null ? conversation.getCategory().getName() : null),
                complete ? finalSeverity : null,
                requiresProfessional,
                diy,
                complete);
    }

    private Severity toSeverity(String s) {
        if (s == null) return null;
        try {
            return Severity.valueOf(s.trim().toUpperCase());
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    private IssueCategory resolveCategory(String name) {
        if (name == null || name.isBlank()) return null;
        return categoryRepository.findByName(name.trim().toUpperCase()).orElse(null);
    }
}
