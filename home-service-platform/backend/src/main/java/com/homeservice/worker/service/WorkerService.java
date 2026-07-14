package com.homeservice.worker.service;

import com.homeservice.category.entity.IssueCategory;
import com.homeservice.category.repository.IssueCategoryRepository;
import com.homeservice.common.exception.ResourceNotFoundException;
import com.homeservice.common.util.GeoUtils;
import com.homeservice.worker.dto.*;
import com.homeservice.worker.entity.Worker;
import com.homeservice.worker.entity.WorkerLocation;
import com.homeservice.worker.entity.WorkerSkill;
import com.homeservice.worker.repository.WorkerCandidate;
import com.homeservice.worker.repository.WorkerLocationRepository;
import com.homeservice.worker.repository.WorkerRepository;
import com.homeservice.worker.repository.WorkerSkillRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class WorkerService {

    private final WorkerRepository workerRepository;
    private final WorkerSkillRepository skillRepository;
    private final WorkerLocationRepository locationRepository;
    private final IssueCategoryRepository categoryRepository;

    // Ranking weights: nearer, higher-rated workers score better.
    private static final double DISTANCE_WEIGHT = 1.0;
    private static final double RATING_WEIGHT = 2.0;

    @Transactional(readOnly = true)
    public WorkerProfileDto getProfile(UUID workerId) {
        Worker worker = requireWorker(workerId);
        List<SkillDto> skills = skillRepository.findByWorkerId(workerId).stream()
                .map(this::toSkillDto)
                .toList();
        return toProfileDto(worker, skills);
    }

    @Transactional
    public WorkerProfileDto updateProfile(UUID workerId, UpdateProfileRequest req) {
        Worker worker = requireWorker(workerId);
        if (req.bio() != null) worker.setBio(req.bio());
        if (req.yearsExperience() != null) worker.setYearsExperience(req.yearsExperience());
        if (req.hourlyRate() != null) worker.setHourlyRate(req.hourlyRate());
        if (req.available() != null) worker.setAvailable(req.available());
        workerRepository.save(worker);
        return getProfile(workerId);
    }

    @Transactional
    public SkillDto addSkill(UUID workerId, SkillRequest req) {
        Worker worker = requireWorker(workerId);
        IssueCategory category = categoryRepository.findById(req.categoryId())
                .orElseThrow(() -> new ResourceNotFoundException("Category not found: " + req.categoryId()));

        if (skillRepository.existsByWorkerIdAndCategoryId(workerId, req.categoryId())) {
            throw new IllegalStateException("Worker already has this skill category");
        }

        WorkerSkill skill = WorkerSkill.builder()
                .worker(worker)
                .category(category)
                .proficiencyLevel(req.proficiencyLevel())
                .build();
        skillRepository.save(skill);
        return toSkillDto(skill);
    }

    @Transactional
    public void updateLocation(UUID workerId, LocationRequest req) {
        requireWorker(workerId); // ensure the worker exists
        WorkerLocation location = locationRepository.findById(workerId)
                .orElseGet(() -> WorkerLocation.builder().workerId(workerId).build());
        location.setLatitude(req.latitude());
        location.setLongitude(req.longitude());
        locationRepository.save(location);
    }

    /**
     * Ranked search: pulls available+verified workers with the requested skill,
     * computes distance (Haversine) from the requester, then scores each by a
     * weighted blend of proximity and rating. Lower distance and higher rating
     * both improve the score. Linear scan is fine at MVP scale; KD-Tree is the
     * documented scale-up path.
     */
    @Transactional(readOnly = true)
    public List<WorkerSearchResult> search(Integer categoryId, double lat, double lng, double radiusKm) {
        List<WorkerCandidate> candidates = workerRepository.findAvailableCandidates(categoryId);

        return candidates.stream()
                .map(c -> {
                    double distance = GeoUtils.distanceKm(lat, lng, c.getLatitude(), c.getLongitude());
                    double rating = c.getAvgRating() == null ? 0.0 : c.getAvgRating().doubleValue();
                    // Higher score = better. Penalize distance, reward rating.
                    double score = (RATING_WEIGHT * rating) - (DISTANCE_WEIGHT * distance);
                    return new WorkerSearchResult(
                            c.getWorkerId(), c.getFullName(), c.getAvgRating(),
                            c.getRatingCount(), c.getHourlyRate(), c.getProficiencyLevel(),
                            round(distance), round(score));
                })
                .filter(r -> r.distanceKm() <= radiusKm)
                .sorted(Comparator.comparingDouble(WorkerSearchResult::score).reversed())
                .toList();
    }

    private Worker requireWorker(UUID workerId) {
        return workerRepository.findById(workerId)
                .orElseThrow(() -> new ResourceNotFoundException("Worker not found: " + workerId));
    }

    private SkillDto toSkillDto(WorkerSkill s) {
        return new SkillDto(s.getId(), s.getCategory().getId(),
                s.getCategory().getName(), s.getProficiencyLevel());
    }

    private WorkerProfileDto toProfileDto(Worker w, List<SkillDto> skills) {
        return new WorkerProfileDto(
                w.getId(),
                w.getUser().getFullName(),
                w.getBio(),
                w.getYearsExperience(),
                w.isVerified(),
                w.isAvailable(),
                w.getAvgRating() == null ? BigDecimal.ZERO : w.getAvgRating(),
                w.getRatingCount(),
                w.getHourlyRate(),
                skills);
    }

    private static double round(double v) {
        return Math.round(v * 100.0) / 100.0;
    }
}
