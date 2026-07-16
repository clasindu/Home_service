package com.homeservice.worker.repository;

import com.homeservice.worker.entity.Worker;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;

public interface WorkerRepository extends JpaRepository<Worker, UUID> {

    /**
     * Returns available, verified workers who have the requested skill category,
     * together with their current location. Distance ranking is done in the
     * service layer (Haversine) rather than in SQL — the MVP-first approach; a
     * KD-Tree/spatial index is the documented scale-up path.
     */
    @Query(value = """
            SELECT
                w.id                AS workerId,
                u.full_name         AS fullName,
                w.avg_rating        AS avgRating,
                w.rating_count      AS ratingCount,
                w.hourly_rate       AS hourlyRate,
                wl.latitude         AS latitude,
                wl.longitude        AS longitude,
                ws.proficiency_level AS proficiencyLevel
            FROM workers w
            JOIN users u ON u.id = w.id
            JOIN worker_skills ws ON ws.worker_id = w.id
            JOIN worker_locations wl ON wl.worker_id = w.id
            WHERE ws.category_id = :categoryId
              AND w.is_available = TRUE
              AND w.is_verified = TRUE
            """, nativeQuery = true)
    List<WorkerCandidate> findAvailableCandidates(@Param("categoryId") Integer categoryId);

    // Admin: list workers awaiting verification.
    List<Worker> findByVerifiedFalse();
}
