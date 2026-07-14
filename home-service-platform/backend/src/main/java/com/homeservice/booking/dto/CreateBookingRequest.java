package com.homeservice.booking.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.Instant;
import java.util.UUID;

public record CreateBookingRequest(
        @NotNull Integer categoryId,
        UUID workerId,            // optional: pre-selected worker; null = unassigned request
        String description,
        Instant scheduledAt,
        @NotBlank String address,
        @NotNull Double latitude,
        @NotNull Double longitude
) {
}
