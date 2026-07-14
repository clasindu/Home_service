package com.homeservice.ai.service;

import com.homeservice.ai.entity.Severity;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Locale;

/**
 * Deterministic safety layer that can only ESCALATE severity, never soften it.
 *
 * The LLM classifies severity, but for known-dangerous situations (gas, live
 * wiring, water-meets-electricity, sewage, etc.) we do not trust the LLM to be
 * the sole authority — a hallucination or a user talking it down could produce
 * unsafe advice. This layer scans the conversation for hazard keywords and forces
 * severity to at least a floor value, which also forces requiresProfessional=true.
 *
 * This hybrid (LLM flexibility + deterministic safety veto) is the core research
 * contribution of the diagnosis agent.
 */
@Component
public class HazardOverrideService {

    // Any of these present -> severity forced to at least CRITICAL.
    private static final List<String> CRITICAL_HAZARDS = List.of(
            "gas smell", "smell of gas", "gas leak", "smell gas",
            "burning smell", "smoke", "sparking", "spark ",
            "electric shock", "shocked me", "exposed wire", "live wire",
            "water on the outlet", "water in the outlet", "flooding near", "carbon monoxide"
    );

    // Any of these present -> severity forced to at least HIGH.
    private static final List<String> HIGH_HAZARDS = List.of(
            "sewage", "raw sewage", "no power to half", "breaker keeps tripping",
            "repeatedly tripping", "gas stove", "water heater leak", "major leak",
            "ceiling leak", "sagging ceiling"
    );

    /**
     * Returns the severity after applying hazard floors. Never lowers the input
     * severity — only raises it.
     */
    public Severity apply(Severity llmSeverity, String conversationText) {
        String text = conversationText.toLowerCase(Locale.ROOT);

        Severity floor = Severity.LOW;
        if (containsAny(text, HIGH_HAZARDS)) {
            floor = Severity.HIGH;
        }
        if (containsAny(text, CRITICAL_HAZARDS)) {
            floor = Severity.CRITICAL;
        }

        Severity base = llmSeverity == null ? Severity.LOW : llmSeverity;
        // Return whichever is more severe.
        return base.ordinal() >= floor.ordinal() ? base : floor;
    }

    /** True if the override raised severity above what the LLM said. */
    public boolean wasEscalated(Severity llmSeverity, Severity finalSeverity) {
        Severity base = llmSeverity == null ? Severity.LOW : llmSeverity;
        return finalSeverity.ordinal() > base.ordinal();
    }

    private boolean containsAny(String text, List<String> keywords) {
        return keywords.stream().anyMatch(text::contains);
    }
}
