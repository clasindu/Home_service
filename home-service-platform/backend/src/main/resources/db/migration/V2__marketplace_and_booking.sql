-- Phase 3: marketplace + booking schema

CREATE TABLE issue_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE worker_skills (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    worker_id UUID NOT NULL REFERENCES workers(id) ON DELETE CASCADE,
    category_id INT NOT NULL REFERENCES issue_categories(id),
    proficiency_level SMALLINT CHECK (proficiency_level BETWEEN 1 AND 5),
    UNIQUE (worker_id, category_id)
);
CREATE INDEX idx_worker_skills_category ON worker_skills (category_id);

-- Current location of a worker (used by proximity search). One row per worker.
CREATE TABLE worker_locations (
    worker_id UUID PRIMARY KEY REFERENCES workers(id) ON DELETE CASCADE,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_worker_locations_lat_lng ON worker_locations (latitude, longitude);

CREATE TABLE bookings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    homeowner_id UUID NOT NULL REFERENCES users(id),
    worker_id UUID REFERENCES workers(id),
    category_id INT NOT NULL REFERENCES issue_categories(id),
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING'
        CHECK (status IN ('PENDING','CONFIRMED','EN_ROUTE','IN_PROGRESS','COMPLETED','CANCELLED','DISPUTED')),
    description TEXT,
    scheduled_at TIMESTAMPTZ,
    address TEXT NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    cancellation_reason TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_bookings_worker_status ON bookings (worker_id, status);
CREATE INDEX idx_bookings_homeowner ON bookings (homeowner_id);

-- Seed the standard service categories.
INSERT INTO issue_categories (name, description) VALUES
    ('PLUMBING', 'Pipes, leaks, drainage, water heaters, fixtures'),
    ('ELECTRICAL', 'Wiring, outlets, breakers, lighting, electrical faults'),
    ('CARPENTRY', 'Woodwork, furniture repair, doors, cabinets'),
    ('PAINTING', 'Interior and exterior painting'),
    ('APPLIANCE_REPAIR', 'Refrigerators, washers, ovens, and other appliances'),
    ('CLEANING', 'Home and deep cleaning services'),
    ('GARDENING', 'Lawn care, landscaping, plant maintenance');
