package com.homeservice.worker.dto;

import jakarta.validation.constraints.Min;

import java.math.BigDecimal;

public record UpdateProfileRequest(
        String bio,
        @Min(0) Integer yearsExperience,
        BigDecimal hourlyRate,
        Boolean available
) {
}
