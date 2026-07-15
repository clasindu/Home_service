package com.homeservice.ai;

import com.homeservice.ai.entity.Severity;
import com.homeservice.ai.service.HazardOverrideService;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Tests the deterministic safety layer — the core research contribution.
 * Verifies it escalates on hazard keywords and never softens LLM output.
 */
class HazardOverrideServiceTest {

    private final HazardOverrideService svc = new HazardOverrideService();

    @Test
    void gas_smell_forces_critical_even_if_llm_said_low() {
        Severity result = svc.apply(Severity.LOW, "I think I smell gas near the stove");
        assertThat(result).isEqualTo(Severity.CRITICAL);
        assertThat(svc.wasEscalated(Severity.LOW, result)).isTrue();
    }

    @Test
    void sparking_outlet_forces_critical() {
        Severity result = svc.apply(Severity.MEDIUM, "the outlet is sparking when I plug in");
        assertThat(result).isEqualTo(Severity.CRITICAL);
    }

    @Test
    void repeatedly_tripping_breaker_forces_high() {
        Severity result = svc.apply(Severity.LOW, "the breaker keeps tripping every hour");
        assertThat(result).isEqualTo(Severity.HIGH);
    }

    @Test
    void never_softens_llm_severity() {
        // LLM said CRITICAL, no hazard keyword -> stays CRITICAL, not lowered.
        Severity result = svc.apply(Severity.CRITICAL, "the faucet drips a little");
        assertThat(result).isEqualTo(Severity.CRITICAL);
        assertThat(svc.wasEscalated(Severity.CRITICAL, result)).isFalse();
    }

    @Test
    void benign_issue_stays_low() {
        Severity result = svc.apply(Severity.LOW, "my tap drips slowly sometimes");
        assertThat(result).isEqualTo(Severity.LOW);
    }
}
