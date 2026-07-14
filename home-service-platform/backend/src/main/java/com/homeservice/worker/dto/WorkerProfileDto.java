package com.homeservice.worker.dto;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public record WorkerProfileDto(
        UUID id,
        String fullName,
        String bio,
        Integer yearsExperience,
        boolean verified,
        boolean available,
        BigDecimal avgRating,
        Integer ratingCount,
        BigDecimal hourlyRate,
        List<SkillDto> skills
) {
}
