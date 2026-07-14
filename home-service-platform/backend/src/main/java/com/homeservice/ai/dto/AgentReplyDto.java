package com.homeservice.ai.dto;

import com.homeservice.ai.entity.Severity;

/**
 * The agent's reply for one turn. If followUpQuestion is present the diagnosis
 * isn't final yet; if diagnosisComplete is true, severity/recommendation are set.
 */
public record AgentReplyDto(
        String reply,
        String categoryName,
        Severity severity,
        boolean requiresProfessional,
        String diyRecommendation,
        boolean diagnosisComplete
) {
}
