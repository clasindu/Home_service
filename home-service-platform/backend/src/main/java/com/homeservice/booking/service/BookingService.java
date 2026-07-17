package com.homeservice.booking.service;

import com.homeservice.booking.dto.BookingDto;
import com.homeservice.booking.dto.CreateBookingRequest;
import com.homeservice.booking.entity.Booking;
import com.homeservice.booking.entity.BookingStatus;
import com.homeservice.booking.repository.BookingRepository;
import com.homeservice.category.entity.IssueCategory;
import com.homeservice.category.repository.IssueCategoryRepository;
import com.homeservice.common.exception.ForbiddenActionException;
import com.homeservice.common.exception.ResourceNotFoundException;
import com.homeservice.common.security.CurrentUserProvider;
import com.homeservice.user.entity.Role;
import com.homeservice.user.entity.User;
import com.homeservice.worker.entity.Worker;
import com.homeservice.worker.repository.WorkerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class BookingService {

    private final BookingRepository bookingRepository;
    private final IssueCategoryRepository categoryRepository;
    private final WorkerRepository workerRepository;
    private final CurrentUserProvider currentUser;
    private final com.homeservice.review.repository.ReviewRepository reviewRepository;

    @Transactional
    public BookingDto create(CreateBookingRequest req) {
        User homeowner = currentUser.require();

        IssueCategory category = categoryRepository.findById(req.categoryId())
                .orElseThrow(() -> new ResourceNotFoundException("Category not found: " + req.categoryId()));

        Worker worker = null;
        if (req.workerId() != null) {
            worker = workerRepository.findById(req.workerId())
                    .orElseThrow(() -> new ResourceNotFoundException("Worker not found: " + req.workerId()));
        }

        Booking booking = Booking.builder()
                .homeowner(homeowner)
                .worker(worker)
                .category(category)
                .status(BookingStatus.PENDING)
                .description(req.description())
                .scheduledAt(req.scheduledAt())
                .address(req.address())
                .latitude(req.latitude())
                .longitude(req.longitude())
                .build();

        return toDto(bookingRepository.save(booking));
    }

    /** Worker accepts a pending booking, becoming the assigned worker. */
    @Transactional
    public BookingDto accept(UUID bookingId) {
        User caller = currentUser.require();
        if (caller.getRole() != Role.WORKER) {
            throw new ForbiddenActionException("Only workers can accept bookings");
        }
        Worker worker = workerRepository.findById(caller.getId())
                .orElseThrow(() -> new ResourceNotFoundException("Worker profile not found"));

        Booking booking = requireBooking(bookingId);
        // If a specific worker was requested, only they may accept it.
        if (booking.getWorker() != null && !booking.getWorker().getId().equals(worker.getId())) {
            throw new ForbiddenActionException("This booking is assigned to another worker");
        }
        booking.confirm(worker); // enforces PENDING -> CONFIRMED
        return toDto(booking);
    }

    @Transactional
    public BookingDto cancel(UUID bookingId, String reason) {
        User caller = currentUser.require();
        Booking booking = requireBooking(bookingId);
        assertParticipant(booking, caller);
        booking.cancel(reason); // enforces valid transition
        return toDto(booking);
    }

    @Transactional
    public BookingDto complete(UUID bookingId) {
        User caller = currentUser.require();
        Booking booking = requireBooking(bookingId);
        assertParticipant(booking, caller);
        booking.complete(); // enforces IN_PROGRESS -> COMPLETED
        return toDto(booking);
    }

    @Transactional
    public BookingDto start(UUID bookingId) {
        User caller = currentUser.require();
        Booking booking = requireBooking(bookingId);
        assertParticipant(booking, caller);
        booking.start();
        return toDto(booking);
    }

    @Transactional(readOnly = true)
    public BookingDto get(UUID bookingId) {
        User caller = currentUser.require();
        Booking booking = requireBooking(bookingId);
        assertParticipant(booking, caller);
        return toDto(booking);
    }

    @Transactional(readOnly = true)
    public List<BookingDto> listForCurrentUser() {
        User caller = currentUser.require();
        List<Booking> bookings = caller.getRole() == Role.WORKER
                ? bookingRepository.findByWorkerIdOrderByCreatedAtDesc(caller.getId())
                : bookingRepository.findByHomeownerIdOrderByCreatedAtDesc(caller.getId());
        return bookings.stream().map(this::toDto).toList();
    }

    // ---- helpers ----

    private Booking requireBooking(UUID id) {
        return bookingRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Booking not found: " + id));
    }

    /** A caller may act on a booking only if they are its homeowner or its assigned worker. */
    private void assertParticipant(Booking booking, User caller) {
        boolean isHomeowner = booking.getHomeowner().getId().equals(caller.getId());
        boolean isAssignedWorker = booking.getWorker() != null
                && booking.getWorker().getId().equals(caller.getId());
        if (!isHomeowner && !isAssignedWorker) {
            throw new ForbiddenActionException("You are not a participant in this booking");
        }
    }

    private BookingDto toDto(Booking b) {
        return new BookingDto(
                b.getId(),
                b.getHomeowner().getId(),
                b.getHomeowner().getFullName(),
                b.getWorker() != null ? b.getWorker().getId() : null,
                b.getWorker() != null ? b.getWorker().getUser().getFullName() : null,
                b.getCategory().getId(),
                b.getCategory().getName(),
                b.getStatus(),
                b.getDescription(),
                b.getScheduledAt(),
                b.getAddress(),
                b.getLatitude(),
                b.getLongitude(),
                b.getCancellationReason(),
                b.getCreatedAt(),
                reviewRepository.existsByBookingId(b.getId()));
    }
}
