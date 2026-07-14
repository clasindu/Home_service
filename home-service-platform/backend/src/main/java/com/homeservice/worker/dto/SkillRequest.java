package com.homeservice.worker.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public record SkillRequest(
        @NotNull Integer categoryId,
        @Min(1) @Max(5) Short proficiencyLevel
) {
}
