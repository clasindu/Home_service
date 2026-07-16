package com.homeservice.admin.dto;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public record PendingWorkerDto(
        UUID id,
        String fullName,
        String email,
        String bio,
        Integer yearsExperience,
        BigDecimal hourlyRate,
        List<String> skills
) {
}
