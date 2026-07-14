package com.homeservice.worker.repository;

import com.homeservice.worker.entity.WorkerSkill;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface WorkerSkillRepository extends JpaRepository<WorkerSkill, UUID> {
    List<WorkerSkill> findByWorkerId(UUID workerId);
    boolean existsByWorkerIdAndCategoryId(UUID workerId, Integer categoryId);
}
