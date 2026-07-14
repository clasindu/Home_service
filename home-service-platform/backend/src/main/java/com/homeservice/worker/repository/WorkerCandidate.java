package com.homeservice.worker.repository;

import java.math.BigDecimal;
import java.util.UUID;

/**
 * Projection returned by the worker-search query — flat row of the fields the
 * ranking algorithm and the search DTO need, avoiding entity graph loading.
 */
public interface WorkerCandidate {
    UUID getWorkerId();
    String getFullName();
    BigDecimal getAvgRating();
    Integer getRatingCount();
    BigDecimal getHourlyRate();
    Double getLatitude();
    Double getLongitude();
    Short getProficiencyLevel();
}
