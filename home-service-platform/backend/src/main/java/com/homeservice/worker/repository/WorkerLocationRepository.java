package com.homeservice.worker.repository;

import com.homeservice.worker.entity.WorkerLocation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface WorkerLocationRepository extends JpaRepository<WorkerLocation, UUID> {
}
