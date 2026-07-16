package com.homeservice.admin.controller;

import com.homeservice.admin.dto.PendingWorkerDto;
import com.homeservice.admin.service.AdminService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/admin")
@RequiredArgsConstructor
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {

    private final AdminService adminService;

    @GetMapping("/workers/pending")
    public List<PendingWorkerDto> pendingWorkers() {
        return adminService.listUnverifiedWorkers();
    }

    @PatchMapping("/workers/{id}/verify")
    public ResponseEntity<Void> verify(@PathVariable UUID id) {
        adminService.verifyWorker(id);
        return ResponseEntity.noContent().build();
    }
}
