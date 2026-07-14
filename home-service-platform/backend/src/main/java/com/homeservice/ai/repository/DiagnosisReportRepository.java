package com.homeservice.ai.repository;

import com.homeservice.ai.entity.DiagnosisReport;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface DiagnosisReportRepository extends JpaRepository<DiagnosisReport, UUID> {
    Optional<DiagnosisReport> findFirstByConversationIdOrderByCreatedAtDesc(UUID conversationId);
}
