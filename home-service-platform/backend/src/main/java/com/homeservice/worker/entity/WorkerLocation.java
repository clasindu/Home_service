package com.homeservice.worker.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.Instant;
import java.util.UUID;

/**
 * A worker's current location, used for proximity search. One row per worker,
 * keyed directly by the worker's id (no @MapsId association — kept simple, the
 * id IS the worker id by convention, enforced by the FK in the V2 migration).
 */
@Entity
@Table(name = "worker_locations")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WorkerLocation {

    @Id
    @Column(name = "worker_id")
    private UUID workerId;

    @Column(nullable = false)
    private double latitude;

    @Column(nullable = false)
    private double longitude;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private Instant updatedAt;
}
