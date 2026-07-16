package com.homeservice.admin.service;

import com.homeservice.admin.dto.PendingWorkerDto;
import com.homeservice.common.exception.ResourceNotFoundException;
import com.homeservice.worker.entity.Worker;
import com.homeservice.worker.repository.WorkerRepository;
import com.homeservice.worker.repository.WorkerSkillRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AdminService {

    private final WorkerRepository workerRepository;
    private final WorkerSkillRepository skillRepository;

    /** Lists all workers that are not yet verified, with their skills. */
    @Transactional(readOnly = true)
    public List<PendingWorkerDto> listUnverifiedWorkers() {
        return workerRepository.findByVerifiedFalse().stream()
                .map(w -> {
                    List<String> skills = skillRepository.findByWorkerId(w.getId()).stream()
                            .map(s -> s.getCategory().getName())
                            .toList();
                    return new PendingWorkerDto(
                            w.getId(),
                            w.getUser().getFullName(),
                            w.getUser().getEmail(),
                            w.getBio(),
                            w.getYearsExperience(),
                            w.getHourlyRate(),
                            skills);
                })
                .toList();
    }

    /** Marks a worker as verified so they appear in customer searches. */
    @Transactional
    public void verifyWorker(UUID workerId) {
        Worker worker = workerRepository.findById(workerId)
                .orElseThrow(() -> new ResourceNotFoundException("Worker not found: " + workerId));
        worker.setVerified(true);
        workerRepository.save(worker);
    }
}
