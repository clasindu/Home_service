package com.homeservice.ai.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * The strict JSON contract we require Gemini to return each turn. Parsing this
 * (rather than free text) is what lets downstream logic — severity, DIY vs.
 * professional, worker hand-off — stay deterministic.
 */
public record ModelDiagnosis(
        String reply,               // natural-language message shown to the user
        String category,            // one of the known category names, or null
        String severityCandidate,   // LOW/MEDIUM/HIGH/CRITICAL, or null if still asking
        String followUpQuestion,    // non-null while more info is needed
        String diyGuidance,         // non-null only for LOW/MEDIUM final diagnoses
        boolean complete            // true when this is a final diagnosis
) {
    public static ModelDiagnosis parse(String modelText, ObjectMapper mapper) {
        try {
            // Strip markdown code fences if the model wrapped its JSON.
            String cleaned = modelText.trim()
                    .replaceAll("(?s)^```(?:json)?", "")
                    .replaceAll("(?s)```$", "")
                    .trim();
            JsonNode n = mapper.readTree(cleaned);
            return new ModelDiagnosis(
                    text(n, "reply"),
                    text(n, "category"),
                    text(n, "severityCandidate"),
                    text(n, "followUpQuestion"),
                    text(n, "diyGuidance"),
                    n.path("complete").asBoolean(false));
        } catch (Exception e) {
            // If the model didn't return valid JSON, treat its text as a plain reply
            // and keep the conversation going rather than crashing.
            return new ModelDiagnosis(modelText, null, null, null, null, false);
        }
    }

    private static String text(JsonNode n, String field) {
        JsonNode f = n.path(field);
        return f.isMissingNode() || f.isNull() ? null : f.asText();
    }
}
