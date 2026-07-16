-- ============================================================
-- Create a test WORKER so the search screen returns results.
-- Run this in psql (or pgAdmin) against the home_service database.
-- ============================================================

-- 1. Create a worker user account.
--    Password hash below is BCrypt for the password:  password123
INSERT INTO users (id, email, password_hash, full_name, phone, role)
VALUES (
    gen_random_uuid(),
    'plumber@test.com',
    '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu',  -- password123
    'Kamal Perera',
    '+94 77 123 4567',
    'WORKER'
);

-- 2. Create the worker profile (verified + available so it appears in search).
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT id, 'Experienced plumber, 8 years in the trade.', 8, TRUE, TRUE, 4.6, 27, 1500
FROM users WHERE email = 'plumber@test.com';

-- 3. Give the worker the PLUMBING skill (category_id 1 = PLUMBING from the seed data).
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'plumber@test.com';

-- 4. Set the worker's location (Colombo — matches the app's default search center).
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT id, 6.9271, 79.8612
FROM users WHERE email = 'plumber@test.com';

-- Done. Now search for PLUMBING near Colombo and this worker will appear.
