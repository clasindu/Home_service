package com.homeservice.review.service;

import com.homeservice.booking.entity.Booking;
import com.homeservice.booking.entity.BookingStatus;
import com.homeservice.booking.repository.BookingRepository;
import com.homeservice.common.exception.ForbiddenActionException;
import com.homeservice.common.exception.ResourceNotFoundException;
import com.homeservice.common.security.CurrentUserProvider;
import com.homeservice.review.dto.CreateReviewRequest;
import com.homeservice.review.dto.ReviewDto;
import com.homeservice.review.entity.Review;
import com.homeservice.review.repository.ReviewRepository;
import com.homeservice.user.entity.User;
import com.homeservice.worker.entity.Worker;
import com.homeservice.worker.repository.WorkerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final BookingRepository bookingRepository;
    private final WorkerRepository workerRepository;
    private final CurrentUserProvider currentUser;

    /**
     * A homeowner rates the worker for a completed booking. Guards:
     *  - only the booking's homeowner may review it,
     *  - the booking must be COMPLETED,
     *  - each booking can be reviewed once.
     * On success the worker's running average (avg_rating) and rating_count are
     * recalculated incrementally — O(1), no full recompute over all reviews.
     */
    @Transactional
    public ReviewDto submit(CreateReviewRequest req) {
        User caller = currentUser.require();

        Booking booking = bookingRepository.findById(req.bookingId())
                .orElseThrow(() -> new ResourceNotFoundException("Booking not found: " + req.bookingId()));

        if (!booking.getHomeowner().getId().equals(caller.getId())) {
            throw new ForbiddenActionException("You can only review your own bookings");
        }
        if (booking.getStatus() != BookingStatus.COMPLETED) {
            throw new IllegalStateException("You can only review a completed booking");
        }
        if (booking.getWorker() == null) {
            throw new IllegalStateException("This booking has no assigned worker to review");
        }
        if (reviewRepository.existsByBookingId(booking.getId())) {
            throw new IllegalStateException("This booking has already been reviewed");
        }

        Worker worker = booking.getWorker();

        Review review = Review.builder()
                .booking(booking)
                .homeowner(caller)
                .worker(worker)
                .stars((short) req.stars().intValue())
                .comment(req.comment())
                .build();
        review = reviewRepository.save(review);

        // Incremental average update:
        //   newAvg = (oldAvg * oldCount + newStars) / (oldCount + 1)
        int oldCount = worker.getRatingCount() == null ? 0 : worker.getRatingCount();
        BigDecimal oldAvg = worker.getAvgRating() == null ? BigDecimal.ZERO : worker.getAvgRating();
        BigDecimal total = oldAvg.multiply(BigDecimal.valueOf(oldCount)).add(BigDecimal.valueOf(req.stars()));
        int newCount = oldCount + 1;
        BigDecimal newAvg = total.divide(BigDecimal.valueOf(newCount), 2, RoundingMode.HALF_UP);

        worker.setRatingCount(newCount);
        worker.setAvgRating(newAvg);
        workerRepository.save(worker);

        return toDto(review);
    }

    @Transactional(readOnly = true)
    public List<ReviewDto> forWorker(UUID workerId) {
        return reviewRepository.findByWorkerId(workerId).stream().map(this::toDto).toList();
    }

    private ReviewDto toDto(Review r) {
        return new ReviewDto(r.getId(), r.getBooking().getId(), r.getStars(), r.getComment(), r.getCreatedAt());
    }
}
