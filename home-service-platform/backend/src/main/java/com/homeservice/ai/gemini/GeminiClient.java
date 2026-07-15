package com.homeservice.ai.gemini;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientResponseException;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * AI client backed by Groq's OpenAI-compatible chat-completions API.
 *
 * (Class name kept as GeminiClient so the rest of the codebase is unchanged;
 * the provider underneath is now Groq, which is faster and more reliable for
 * on-demand demos. Swapping providers behind this single adapter is exactly the
 * Adapter pattern the architecture document describes.)
 */
@Component
@RequiredArgsConstructor
public class GeminiClient {

    private static final Logger log = LoggerFactory.getLogger(GeminiClient.class);

    private final ObjectMapper objectMapper;

    @Value("${groq.api-key}")
    private String apiKey;

    @Value("${groq.model}")
    private String model;

    @Value("${groq.base-url}")
    private String baseUrl;

    private final RestClient restClient = RestClient.create();

    /**
     * Sends a system instruction plus the conversation turns and returns the
     * model's raw text output. Turns are oldest-first; each is a role
     * ("user"/"model") + text. Groq uses OpenAI roles, so "model" maps to
     * "assistant".
     */
    public String generateText(String systemInstruction, List<Turn> turns) {
        if (apiKey == null || apiKey.isBlank()) {
            throw new GeminiException("Groq API key is not configured (set GROQ_API_KEY).");
        }

        List<Map<String, String>> messages = new ArrayList<>();
        messages.add(Map.of("role", "system", "content", systemInstruction));
        for (Turn t : turns) {
            String role = "model".equals(t.role()) ? "assistant" : "user";
            messages.add(Map.of("role", role, "content", t.text()));
        }

        Map<String, Object> body = Map.of(
                "model", model,
                "messages", messages,
                "temperature", 0.4,
                "max_tokens", 1024);

        URI uri = URI.create(baseUrl + "/chat/completions");

        try {
            String rawResponse = restClient.post()
                    .uri(uri)
                    .header("Content-Type", "application/json")
                    .header("Authorization", "Bearer " + apiKey)
                    .body(body)
                    .retrieve()
                    .body(String.class);
            return extractText(rawResponse);
        } catch (RestClientResponseException e) {
            log.error("Groq API error {}: {}", e.getStatusCode(), e.getResponseBodyAsString());
            throw new GeminiException("AI provider returned " + e.getStatusCode()
                    + ": " + e.getResponseBodyAsString());
        } catch (GeminiException e) {
            throw e;
        } catch (Exception e) {
            log.error("Groq call failed", e);
            throw new GeminiException("AI call failed: " + e.getMessage(), e);
        }
    }

    /** Pulls the assistant message text out of the OpenAI-style response. */
    private String extractText(String rawResponse) {
        try {
            JsonNode root = objectMapper.readTree(rawResponse);
            JsonNode textNode = root
                    .path("choices").path(0)
                    .path("message").path("content");
            if (textNode.isMissingNode()) {
                throw new GeminiException("AI response had no message content: " + rawResponse);
            }
            return textNode.asText();
        } catch (GeminiException e) {
            throw e;
        } catch (Exception e) {
            throw new GeminiException("Failed to parse AI response", e);
        }
    }

    /** A single conversation turn. role is "user" or "model". */
    public record Turn(String role, String text) {}
}
