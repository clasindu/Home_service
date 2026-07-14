package com.homeservice.booking.dto;

import com.homeservice.booking.entity.BookingStatus;

import java.time.Instant;
import java.util.UUID;

public record BookingDto(
        UUID id,
        UUID homeownerId,
        String homeownerName,
        UUID workerId,
        String workerName,
        Integer categoryId,
        String categoryName,
        BookingStatus status,
        String description,
        Instant scheduledAt,
        String address,
        double latitude,
        double longitude,
        String cancellationReason,
        Instant createdAt
) {
}
