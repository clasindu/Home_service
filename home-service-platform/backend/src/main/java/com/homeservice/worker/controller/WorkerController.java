package com.homeservice.worker.controller;

import com.homeservice.common.security.CurrentUserProvider;
import com.homeservice.worker.dto.*;
import com.homeservice.worker.service.WorkerService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/workers")
@RequiredArgsConstructor
public class WorkerController {

    private final WorkerService workerService;
    private final CurrentUserProvider currentUser;

    // ---- Self-service endpoints (the logged-in worker manages their own profile) ----

    @GetMapping("/me")
    @PreAuthorize("hasRole('WORKER')")
    public WorkerProfileDto myProfile() {
        return workerService.getProfile(currentUser.require().getId());
    }

    @PatchMapping("/me")
    @PreAuthorize("hasRole('WORKER')")
    public WorkerProfileDto updateMyProfile(@Valid @RequestBody UpdateProfileRequest req) {
        return workerService.updateProfile(currentUser.require().getId(), req);
    }

    @PostMapping("/me/skills")
    @PreAuthorize("hasRole('WORKER')")
    public ResponseEntity<SkillDto> addSkill(@Valid @RequestBody SkillRequest req) {
        SkillDto skill = workerService.addSkill(currentUser.require().getId(), req);
        return ResponseEntity.status(HttpStatus.CREATED).body(skill);
    }

    @PutMapping("/me/location")
    @PreAuthorize("hasRole('WORKER')")
    public ResponseEntity<Void> updateMyLocation(@Valid @RequestBody LocationRequest req) {
        workerService.updateLocation(currentUser.require().getId(), req);
        return ResponseEntity.noContent().build();
    }

    // ---- Public-to-authenticated endpoints ----

    @GetMapping("/{id}")
    public WorkerProfileDto profile(@PathVariable UUID id) {
        return workerService.getProfile(id);
    }

    @GetMapping("/search")
    public List<WorkerSearchResult> search(
            @RequestParam Integer category,
            @RequestParam double lat,
            @RequestParam double lng,
            @RequestParam(defaultValue = "25") double radiusKm) {
        return workerService.search(category, lat, lng, radiusKm);
    }
}
