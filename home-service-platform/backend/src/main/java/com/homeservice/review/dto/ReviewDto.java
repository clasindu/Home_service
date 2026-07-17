package com.homeservice.review.dto;

import java.time.Instant;
import java.util.UUID;

public record ReviewDto(
        UUID id,
        UUID bookingId,
        short stars,
        String comment,
        Instant createdAt
) {
}
