package com.homeservice.booking.repository;

import com.homeservice.booking.entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface BookingRepository extends JpaRepository<Booking, UUID> {
    List<Booking> findByHomeownerIdOrderByCreatedAtDesc(UUID homeownerId);
    List<Booking> findByWorkerIdOrderByCreatedAtDesc(UUID workerId);
}
