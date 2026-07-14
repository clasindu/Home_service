package com.homeservice.worker.entity;

import com.homeservice.user.entity.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.UUID;

/**
 * Role-specific extension of {@link User} for the WORKER role.
 * Shares its primary key with users.id (see V1 migration: workers.id REFERENCES users.id).
 */
@Entity
@Table(name = "workers")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Worker {

    @Id
    private UUID id; // same value as the owning User's id

    @OneToOne
    @MapsId
    @JoinColumn(name = "id")
    private User user;

    @Column(columnDefinition = "text")
    private String bio;

    @Column(name = "years_experience")
    private Integer yearsExperience;

    @Column(name = "is_verified", nullable = false)
    private boolean verified;

    @Column(name = "is_available", nullable = false)
    private boolean available;

    @Column(name = "avg_rating", nullable = false)
    private BigDecimal avgRating;

    @Column(name = "rating_count", nullable = false)
    private Integer ratingCount;

    @Column(name = "hourly_rate")
    private BigDecimal hourlyRate;
}
