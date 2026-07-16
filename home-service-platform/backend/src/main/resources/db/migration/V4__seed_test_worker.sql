-- Phase 4 (demo data): seed a verified test worker so the "Find a Professional"
-- search returns a result out of the box.
--
-- Written to be safe to run repeatedly: every insert is guarded with
-- "WHERE NOT EXISTS", so re-running (or a DB reset) will not create duplicates
-- and will not fail the migration.

-- 1. Worker user account (password is BCrypt for: password123)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(),
       'plumber@test.com',
       '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu',
       'Kamal Perera',
       '+94 77 123 4567',
       'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'plumber@test.com');

-- 2. Worker profile (verified + available so it appears in search)
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Experienced plumber, 8 years in the trade.', 8, TRUE, TRUE, 4.6, 27, 1500
FROM users u
WHERE u.email = 'plumber@test.com'
  AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);

-- 3. PLUMBING skill (category_id 1 = PLUMBING from the V2 seed)
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u
WHERE u.email = 'plumber@test.com'
  AND NOT EXISTS (
      SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1
  );

-- 4. Location (Colombo — matches the app's default search center)
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.9271, 79.8612
FROM users u
WHERE u.email = 'plumber@test.com'
  AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);
