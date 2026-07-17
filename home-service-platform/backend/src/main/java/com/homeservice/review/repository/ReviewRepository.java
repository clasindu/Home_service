package com.homeservice.review.repository;

import com.homeservice.review.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface ReviewRepository extends JpaRepository<Review, UUID> {
    boolean existsByBookingId(UUID bookingId);
    List<Review> findByWorkerId(UUID workerId);
}
