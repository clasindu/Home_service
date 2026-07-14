package com.homeservice.booking.entity;

import java.util.Set;

public enum BookingStatus {
    PENDING,
    CONFIRMED,
    EN_ROUTE,
    IN_PROGRESS,
    COMPLETED,
    CANCELLED,
    DISPUTED;

    /**
     * Defines which statuses each status is allowed to transition to.
     * Centralizing this here keeps the state machine explicit and testable,
     * rather than scattering if-checks across the service layer.
     */
    public Set<BookingStatus> allowedNext() {
        return switch (this) {
            case PENDING -> Set.of(CONFIRMED, CANCELLED);
            case CONFIRMED -> Set.of(EN_ROUTE, IN_PROGRESS, CANCELLED);
            case EN_ROUTE -> Set.of(IN_PROGRESS, CANCELLED);
            case IN_PROGRESS -> Set.of(COMPLETED, DISPUTED, CANCELLED);
            case COMPLETED, CANCELLED, DISPUTED -> Set.of(); // terminal
        };
    }

    public boolean canTransitionTo(BookingStatus target) {
        return allowedNext().contains(target);
    }

    public boolean isTerminal() {
        return allowedNext().isEmpty();
    }
}
