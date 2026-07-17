package com.homeservice.review.controller;

import com.homeservice.review.dto.CreateReviewRequest;
import com.homeservice.review.dto.ReviewDto;
import com.homeservice.review.service.ReviewService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/reviews")
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;

    @PostMapping
    public ResponseEntity<ReviewDto> submit(@Valid @RequestBody CreateReviewRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(reviewService.submit(request));
    }

    @GetMapping("/worker/{workerId}")
    public List<ReviewDto> forWorker(@PathVariable UUID workerId) {
        return reviewService.forWorker(workerId);
    }
}
