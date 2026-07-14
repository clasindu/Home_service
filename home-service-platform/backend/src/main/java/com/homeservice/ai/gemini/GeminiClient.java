package com.homeservice.ai.gemini;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

import java.util.List;
import java.util.Map;

/**
 * Thin adapter over Gemini's REST generateContent endpoint. Isolates the rest of
 * the codebase from the Gemini wire format (Adapter pattern) — the diagnosis
 * service depends on {@link #generateText}, not on Gemini's JSON shape.
 */
@Component
@RequiredArgsConstructor
public class GeminiClient {

    private final ObjectMapper objectMapper;

    @Value("${gemini.api-key}")
    private String apiKey;

    @Value("${gemini.model}")
    private String model;

    @Value("${gemini.base-url}")
    private String baseUrl;

    private RestClient restClient() {
        return RestClient.builder().baseUrl(baseUrl).build();
    }

    /**
     * Sends a system instruction plus the conversation turns and returns the
     * model's raw text output. Conversation turns are ordered oldest-first;
     * each is a role ("user"/"model") + text.
     */
    public String generateText(String systemInstruction, List<Turn> turns) {
        var contents = turns.stream()
                .map(t -> Map.of(
                        "role", t.role(),
                        "parts", List.of(Map.of("text", t.text()))))
                .toList();

        Map<String, Object> body = Map.of(
                "systemInstruction", Map.of("parts", List.of(Map.of("text", systemInstruction))),
                "contents", contents,
                "generationConfig", Map.of(
                        "temperature", 0.4,
                        "maxOutputTokens", 1024));

        String uri = "/models/" + model + ":generateContent?key=" + apiKey;

        String rawResponse = restClient().post()
                .uri(uri)
                .header("Content-Type", "application/json")
                .body(body)
                .retrieve()
                .body(String.class);

        return extractText(rawResponse);
    }

    /** Pulls the first candidate's text out of Gemini's response envelope. */
    private String extractText(String rawResponse) {
        try {
            JsonNode root = objectMapper.readTree(rawResponse);
            JsonNode textNode = root
                    .path("candidates").path(0)
                    .path("content").path("parts").path(0)
                    .path("text");
            if (textNode.isMissingNode()) {
                throw new GeminiException("Gemini response had no text candidate: " + rawResponse);
            }
            return textNode.asText();
        } catch (GeminiException e) {
            throw e;
        } catch (Exception e) {
            throw new GeminiException("Failed to parse Gemini response", e);
        }
    }

    /** A single conversation turn. role is "user" or "model". */
    public record Turn(String role, String text) {}
}
