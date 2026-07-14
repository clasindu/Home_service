package com.homeservice.worker.dto;

import java.math.BigDecimal;
import java.util.UUID;

public record WorkerSearchResult(
        UUID workerId,
        String fullName,
        BigDecimal avgRating,
        Integer ratingCount,
        BigDecimal hourlyRate,
        Short proficiencyLevel,
        double distanceKm,
        double score
) {
}
