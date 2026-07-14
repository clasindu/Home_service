package com.homeservice.booking;

import com.homeservice.booking.entity.Booking;
import com.homeservice.booking.entity.BookingStatus;
import com.homeservice.worker.entity.Worker;
import org.junit.jupiter.api.Test;

import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

/**
 * Pure unit tests for the booking state machine — no Spring context, no DB.
 * Verifies both the happy path and that illegal transitions are rejected.
 */
class BookingStateMachineTest {

    private Booking pendingBooking() {
        return Booking.builder()
                .id(UUID.randomUUID())
                .status(BookingStatus.PENDING)
                .build();
    }

    private Worker dummyWorker() {
        Worker w = new Worker();
        w.setId(UUID.randomUUID());
        return w;
    }

    @Test
    void happyPath_pending_to_completed() {
        Booking b = pendingBooking();

        b.confirm(dummyWorker());
        assertThat(b.getStatus()).isEqualTo(BookingStatus.CONFIRMED);

        b.markEnRoute();
        assertThat(b.getStatus()).isEqualTo(BookingStatus.EN_ROUTE);

        b.start();
        assertThat(b.getStatus()).isEqualTo(BookingStatus.IN_PROGRESS);

        b.complete();
        assertThat(b.getStatus()).isEqualTo(BookingStatus.COMPLETED);
    }

    @Test
    void cannot_complete_a_pending_booking() {
        Booking b = pendingBooking();
        assertThatThrownBy(b::complete)
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("Cannot transition");
    }

    @Test
    void cannot_confirm_twice() {
        Booking b = pendingBooking();
        b.confirm(dummyWorker());
        assertThatThrownBy(() -> b.confirm(dummyWorker()))
                .isInstanceOf(IllegalStateException.class);
    }

    @Test
    void cancelled_is_terminal() {
        Booking b = pendingBooking();
        b.cancel("changed my mind");
        assertThat(b.getStatus()).isEqualTo(BookingStatus.CANCELLED);
        assertThat(b.getCancellationReason()).isEqualTo("changed my mind");
        assertThatThrownBy(b::start).isInstanceOf(IllegalStateException.class);
    }

    @Test
    void status_transition_rules() {
        assertThat(BookingStatus.PENDING.canTransitionTo(BookingStatus.CONFIRMED)).isTrue();
        assertThat(BookingStatus.PENDING.canTransitionTo(BookingStatus.COMPLETED)).isFalse();
        assertThat(BookingStatus.COMPLETED.isTerminal()).isTrue();
        assertThat(BookingStatus.IN_PROGRESS.canTransitionTo(BookingStatus.COMPLETED)).isTrue();
    }
}
