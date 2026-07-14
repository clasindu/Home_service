package com.homeservice.ai.controller;

import com.homeservice.ai.dto.AgentReplyDto;
import com.homeservice.ai.dto.SendMessageRequest;
import com.homeservice.ai.dto.StartConversationResponse;
import com.homeservice.ai.service.DiagnosisService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/ai")
@RequiredArgsConstructor
public class DiagnosisController {

    private final DiagnosisService diagnosisService;

    @PostMapping("/conversations")
    public ResponseEntity<StartConversationResponse> start() {
        return ResponseEntity.status(HttpStatus.CREATED).body(diagnosisService.startConversation());
    }

    @PostMapping("/conversations/{id}/messages")
    public AgentReplyDto sendMessage(
            @PathVariable UUID id,
            @Valid @RequestBody SendMessageRequest request) {
        return diagnosisService.sendMessage(id, request.message());
    }
}
