package com.homeservice.booking.controller;

import com.homeservice.booking.dto.BookingDto;
import com.homeservice.booking.dto.CancelBookingRequest;
import com.homeservice.booking.dto.CreateBookingRequest;
import com.homeservice.booking.service.BookingService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/bookings")
@RequiredArgsConstructor
public class BookingController {

    private final BookingService bookingService;

    @PostMapping
    public ResponseEntity<BookingDto> create(@Valid @RequestBody CreateBookingRequest req) {
        return ResponseEntity.status(HttpStatus.CREATED).body(bookingService.create(req));
    }

    @GetMapping
    public List<BookingDto> myBookings() {
        return bookingService.listForCurrentUser();
    }

    @GetMapping("/{id}")
    public BookingDto get(@PathVariable UUID id) {
        return bookingService.get(id);
    }

    @PatchMapping("/{id}/accept")
    public BookingDto accept(@PathVariable UUID id) {
        return bookingService.accept(id);
    }

    @PatchMapping("/{id}/start")
    public BookingDto start(@PathVariable UUID id) {
        return bookingService.start(id);
    }

    @PatchMapping("/{id}/complete")
    public BookingDto complete(@PathVariable UUID id) {
        return bookingService.complete(id);
    }

    @PatchMapping("/{id}/cancel")
    public BookingDto cancel(@PathVariable UUID id, @RequestBody(required = false) CancelBookingRequest req) {
        String reason = req != null ? req.reason() : null;
        return bookingService.cancel(id, reason);
    }
}
