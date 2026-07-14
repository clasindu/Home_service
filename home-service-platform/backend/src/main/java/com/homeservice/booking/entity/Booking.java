package com.homeservice.booking.entity;

import com.homeservice.category.entity.IssueCategory;
import com.homeservice.user.entity.User;
import com.homeservice.worker.entity.Worker;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "bookings")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Booking {

    @Id
    @GeneratedValue
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "homeowner_id", nullable = false)
    private User homeowner;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "worker_id")
    private Worker worker;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", nullable = false)
    private IssueCategory category;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private BookingStatus status;

    @Column(columnDefinition = "text")
    private String description;

    @Column(name = "scheduled_at")
    private Instant scheduledAt;

    @Column(nullable = false, columnDefinition = "text")
    private String address;

    @Column(nullable = false)
    private double latitude;

    @Column(nullable = false)
    private double longitude;

    @Column(name = "cancellation_reason", columnDefinition = "text")
    private String cancellationReason;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private Instant createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private Instant updatedAt;

    // ---- State machine ----
    // Each method validates the transition against BookingStatus.canTransitionTo,
    // so an invalid move (e.g. completing a PENDING booking) throws rather than
    // silently corrupting state.

    private void transitionTo(BookingStatus target) {
        if (!this.status.canTransitionTo(target)) {
            throw new IllegalStateException(
                    "Cannot transition booking from " + this.status + " to " + target);
        }
        this.status = target;
    }

    public void confirm(Worker acceptingWorker) {
        transitionTo(BookingStatus.CONFIRMED);
        this.worker = acceptingWorker;
    }

    public void markEnRoute() {
        transitionTo(BookingStatus.EN_ROUTE);
    }

    public void start() {
        transitionTo(BookingStatus.IN_PROGRESS);
    }

    public void complete() {
        transitionTo(BookingStatus.COMPLETED);
    }

    public void cancel(String reason) {
        transitionTo(BookingStatus.CANCELLED);
        this.cancellationReason = reason;
    }
}
