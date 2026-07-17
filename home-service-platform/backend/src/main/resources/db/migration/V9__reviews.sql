-- Phase 7: reviews / ratings. A homeowner can rate the worker after a completed
-- booking. Each booking can be reviewed once; the worker's avg_rating and
-- rating_count (on the workers table) are recalculated on each new review.

CREATE TABLE reviews (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    booking_id UUID NOT NULL UNIQUE REFERENCES bookings(id) ON DELETE CASCADE,
    homeowner_id UUID NOT NULL REFERENCES users(id),
    worker_id UUID NOT NULL REFERENCES workers(id),
    stars SMALLINT NOT NULL CHECK (stars BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_reviews_worker ON reviews (worker_id);
