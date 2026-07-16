-- Phase 4 (demo data): seed workers across all 25 Sri Lankan districts,
-- each clustered near its district capital so a 5km search finds locals.
-- Idempotent: guarded by WHERE NOT EXISTS on a stable email per worker.

-- Colombo: Dilan Bandara (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Bandara', '+94 71 704 7912', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Bandara — 19 years experience in Colombo.', 19, TRUE, TRUE, 4.0, 18, 2500
FROM users u WHERE u.email = 'colombo.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'colombo.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.936762, 79.850996
FROM users u WHERE u.email = 'colombo.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Colombo: Nimal Fernando (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Fernando', '+94 77 703 5557', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Fernando — 9 years experience in Colombo.', 9, TRUE, TRUE, 4.5, 74, 1800
FROM users u WHERE u.email = 'colombo.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'colombo.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.916406, 79.865281
FROM users u WHERE u.email = 'colombo.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Colombo: Sandya Rajapaksha (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sandya Rajapaksha', '+94 76 199 6881', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sandya Rajapaksha — 4 years experience in Colombo.', 4, TRUE, TRUE, 4.1, 48, 1000
FROM users u WHERE u.email = 'colombo.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'colombo.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.924005, 79.852315
FROM users u WHERE u.email = 'colombo.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Colombo: Chathura Dissanayake (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Dissanayake', '+94 74 949 6925', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Dissanayake — 19 years experience in Colombo.', 19, TRUE, TRUE, 3.9, 53, 1000
FROM users u WHERE u.email = 'colombo.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'colombo.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.908838, 79.859577
FROM users u WHERE u.email = 'colombo.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Saman Fernando (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Saman Fernando', '+94 74 564 6977', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Saman Fernando — 14 years experience in Gampaha.', 14, TRUE, TRUE, 5.0, 34, 1000
FROM users u WHERE u.email = 'gampaha.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'gampaha.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.098151, 80.010623
FROM users u WHERE u.email = 'gampaha.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Tharindu Weerasinghe (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Tharindu Weerasinghe', '+94 78 846 5010', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Tharindu Weerasinghe — 7 years experience in Gampaha.', 7, TRUE, TRUE, 4.6, 14, 2000
FROM users u WHERE u.email = 'gampaha.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'gampaha.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.098507, 80.007773
FROM users u WHERE u.email = 'gampaha.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Buddhika Senanayake (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Buddhika Senanayake', '+94 70 924 6168', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Buddhika Senanayake — 9 years experience in Gampaha.', 9, TRUE, TRUE, 4.5, 46, 1000
FROM users u WHERE u.email = 'gampaha.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'gampaha.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.111281, 80.0053
FROM users u WHERE u.email = 'gampaha.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Lasith Fernando (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Fernando', '+94 76 758 8517', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Fernando — 17 years experience in Gampaha.', 17, TRUE, TRUE, 4.7, 32, 2500
FROM users u WHERE u.email = 'gampaha.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'gampaha.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.108225, 80.002387
FROM users u WHERE u.email = 'gampaha.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Lasith Jayawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Jayawardena', '+94 75 324 3266', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Jayawardena — 14 years experience in Kalutara.', 14, TRUE, TRUE, 4.7, 59, 2000
FROM users u WHERE u.email = 'kalutara.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'kalutara.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.5952, 79.962259
FROM users u WHERE u.email = 'kalutara.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Sanjeewa Fernando (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Fernando', '+94 76 490 8668', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Fernando — 4 years experience in Kalutara.', 4, TRUE, TRUE, 4.6, 59, 2000
FROM users u WHERE u.email = 'kalutara.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'kalutara.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.567285, 79.945086
FROM users u WHERE u.email = 'kalutara.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Lasith Perera (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Perera', '+94 71 400 8123', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Perera — 12 years experience in Kalutara.', 12, TRUE, TRUE, 4.4, 39, 2500
FROM users u WHERE u.email = 'kalutara.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 3
FROM users u WHERE u.email = 'kalutara.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.594229, 79.967968
FROM users u WHERE u.email = 'kalutara.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Buddhika Perera (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Buddhika Perera', '+94 74 961 9317', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Buddhika Perera — 5 years experience in Kalutara.', 5, TRUE, TRUE, 4.4, 27, 2000
FROM users u WHERE u.email = 'kalutara.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'kalutara.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.600434, 79.951236
FROM users u WHERE u.email = 'kalutara.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Saman Jayawardena (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Saman Jayawardena', '+94 77 119 2832', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Saman Jayawardena — 12 years experience in Kandy.', 12, TRUE, TRUE, 4.7, 72, 1000
FROM users u WHERE u.email = 'kandy.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'kandy.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.3011, 80.635275
FROM users u WHERE u.email = 'kandy.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Dilani Ekanayake (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilani Ekanayake', '+94 71 878 9727', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilani Ekanayake — 17 years experience in Kandy.', 17, TRUE, TRUE, 4.9, 15, 2500
FROM users u WHERE u.email = 'kandy.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'kandy.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.272917, 80.64882
FROM users u WHERE u.email = 'kandy.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Chaminda Ratnayake (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Ratnayake', '+94 74 508 7118', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Ratnayake — 8 years experience in Kandy.', 8, TRUE, TRUE, 4.5, 32, 2000
FROM users u WHERE u.email = 'kandy.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 4
FROM users u WHERE u.email = 'kandy.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.277205, 80.634807
FROM users u WHERE u.email = 'kandy.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Gayan Wijesinghe (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Gayan Wijesinghe', '+94 73 107 2163', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Gayan Wijesinghe — 20 years experience in Kandy.', 20, TRUE, TRUE, 3.8, 75, 1200
FROM users u WHERE u.email = 'kandy.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'kandy.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.280516, 80.616261
FROM users u WHERE u.email = 'kandy.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Dilan Silva (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Silva', '+94 77 319 9834', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Silva — 10 years experience in Matale.', 10, TRUE, TRUE, 4.2, 70, 1200
FROM users u WHERE u.email = 'matale.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'matale.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.450196, 80.604657
FROM users u WHERE u.email = 'matale.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Kumari Ratnayake (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kumari Ratnayake', '+94 75 533 7735', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kumari Ratnayake — 15 years experience in Matale.', 15, TRUE, TRUE, 4.0, 17, 2500
FROM users u WHERE u.email = 'matale.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'matale.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.478885, 80.6357
FROM users u WHERE u.email = 'matale.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Nilanthi Silva (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nilanthi Silva', '+94 73 294 9786', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nilanthi Silva — 9 years experience in Matale.', 9, TRUE, TRUE, 3.9, 48, 1000
FROM users u WHERE u.email = 'matale.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'matale.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.473638, 80.629247
FROM users u WHERE u.email = 'matale.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Chaminda Kumara (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Kumara', '+94 70 767 9856', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Kumara — 5 years experience in Matale.', 5, TRUE, TRUE, 4.9, 61, 2000
FROM users u WHERE u.email = 'matale.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'matale.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.458642, 80.613392
FROM users u WHERE u.email = 'matale.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Kamal Gunawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kamal Gunawardena', '+94 70 499 5345', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kamal Gunawardena — 14 years experience in Nuwara Eliya.', 14, TRUE, TRUE, 4.8, 12, 1200
FROM users u WHERE u.email = 'nuwaraeliya.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'nuwaraeliya.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.945957, 80.788354
FROM users u WHERE u.email = 'nuwaraeliya.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Dinesh Kumara (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Kumara', '+94 74 322 1958', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Kumara — 8 years experience in Nuwara Eliya.', 8, TRUE, TRUE, 4.5, 67, 1200
FROM users u WHERE u.email = 'nuwaraeliya.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'nuwaraeliya.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.967993, 80.808917
FROM users u WHERE u.email = 'nuwaraeliya.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Kumari Silva (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kumari Silva', '+94 78 182 4044', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kumari Silva — 3 years experience in Nuwara Eliya.', 3, TRUE, TRUE, 4.4, 72, 1200
FROM users u WHERE u.email = 'nuwaraeliya.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 3
FROM users u WHERE u.email = 'nuwaraeliya.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.942244, 80.771106
FROM users u WHERE u.email = 'nuwaraeliya.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Chathura Fernando (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Fernando', '+94 79 140 2343', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Fernando — 20 years experience in Nuwara Eliya.', 20, TRUE, TRUE, 4.9, 77, 1200
FROM users u WHERE u.email = 'nuwaraeliya.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'nuwaraeliya.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.964173, 80.785251
FROM users u WHERE u.email = 'nuwaraeliya.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Harsha Herath (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Herath', '+94 77 423 2188', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Herath — 11 years experience in Galle.', 11, TRUE, TRUE, 4.1, 55, 1200
FROM users u WHERE u.email = 'galle.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'galle.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.04167, 80.229648
FROM users u WHERE u.email = 'galle.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Buddhika Bandara (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Buddhika Bandara', '+94 75 391 3584', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Buddhika Bandara — 9 years experience in Galle.', 9, TRUE, TRUE, 4.0, 49, 1000
FROM users u WHERE u.email = 'galle.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'galle.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.055005, 80.221235
FROM users u WHERE u.email = 'galle.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Dilani Ekanayake (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilani Ekanayake', '+94 72 370 2891', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilani Ekanayake — 5 years experience in Galle.', 5, TRUE, TRUE, 4.4, 75, 1500
FROM users u WHERE u.email = 'galle.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'galle.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.072854, 80.233284
FROM users u WHERE u.email = 'galle.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Kumari Jayawardena (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kumari Jayawardena', '+94 74 966 1832', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kumari Jayawardena — 17 years experience in Galle.', 17, TRUE, TRUE, 4.2, 38, 2000
FROM users u WHERE u.email = 'galle.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'galle.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.04477, 80.209425
FROM users u WHERE u.email = 'galle.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Dilan Kumara (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Kumara', '+94 78 822 8007', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Kumara — 16 years experience in Matara.', 16, TRUE, TRUE, 4.7, 38, 1200
FROM users u WHERE u.email = 'matara.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'matara.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.945967, 80.535142
FROM users u WHERE u.email = 'matara.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Nimal Bandara (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Bandara', '+94 78 251 8041', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Bandara — 20 years experience in Matara.', 20, TRUE, TRUE, 4.0, 9, 1500
FROM users u WHERE u.email = 'matara.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'matara.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.972702, 80.562641
FROM users u WHERE u.email = 'matara.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Sunil Ekanayake (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sunil Ekanayake', '+94 71 462 7658', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sunil Ekanayake — 9 years experience in Matara.', 9, TRUE, TRUE, 4.8, 50, 1200
FROM users u WHERE u.email = 'matara.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'matara.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.970859, 80.566845
FROM users u WHERE u.email = 'matara.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Kumari Jayawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kumari Jayawardena', '+94 75 901 7745', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kumari Jayawardena — 7 years experience in Matara.', 7, TRUE, TRUE, 4.8, 57, 1000
FROM users u WHERE u.email = 'matara.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'matara.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.969484, 80.574048
FROM users u WHERE u.email = 'matara.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Nilanthi Gunawardena (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nilanthi Gunawardena', '+94 73 936 8541', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nilanthi Gunawardena — 9 years experience in Hambantota.', 9, TRUE, TRUE, 4.3, 9, 1800
FROM users u WHERE u.email = 'hambantota.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'hambantota.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.110468, 81.126551
FROM users u WHERE u.email = 'hambantota.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Dinesh Gunawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Gunawardena', '+94 78 509 9785', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Gunawardena — 13 years experience in Hambantota.', 13, TRUE, TRUE, 4.2, 13, 1500
FROM users u WHERE u.email = 'hambantota.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'hambantota.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.105047, 81.106225
FROM users u WHERE u.email = 'hambantota.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Nimal Bandara (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Bandara', '+94 75 846 6139', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Bandara — 15 years experience in Hambantota.', 15, TRUE, TRUE, 4.1, 18, 2000
FROM users u WHERE u.email = 'hambantota.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'hambantota.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.111243, 81.137001
FROM users u WHERE u.email = 'hambantota.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Chathura Bandara (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Bandara', '+94 78 803 4228', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Bandara — 18 years experience in Hambantota.', 18, TRUE, TRUE, 3.9, 60, 1000
FROM users u WHERE u.email = 'hambantota.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 4
FROM users u WHERE u.email = 'hambantota.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.14008, 81.106103
FROM users u WHERE u.email = 'hambantota.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Roshan Fernando (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Fernando', '+94 78 416 7691', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Fernando — 11 years experience in Jaffna.', 11, TRUE, TRUE, 4.6, 20, 2500
FROM users u WHERE u.email = 'jaffna.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'jaffna.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.678331, 80.030426
FROM users u WHERE u.email = 'jaffna.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Nuwan Ekanayake (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Ekanayake', '+94 74 515 9977', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Ekanayake — 20 years experience in Jaffna.', 20, TRUE, TRUE, 4.9, 27, 2000
FROM users u WHERE u.email = 'jaffna.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'jaffna.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.646592, 80.022318
FROM users u WHERE u.email = 'jaffna.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Dinesh Ekanayake (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Ekanayake', '+94 73 623 8752', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Ekanayake — 16 years experience in Jaffna.', 16, TRUE, TRUE, 4.6, 64, 1800
FROM users u WHERE u.email = 'jaffna.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'jaffna.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.658696, 80.028699
FROM users u WHERE u.email = 'jaffna.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Pradeep Fernando (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Pradeep Fernando', '+94 73 925 4262', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Pradeep Fernando — 11 years experience in Jaffna.', 11, TRUE, TRUE, 4.2, 35, 2500
FROM users u WHERE u.email = 'jaffna.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'jaffna.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.662118, 80.030818
FROM users u WHERE u.email = 'jaffna.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Nimal Silva (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Silva', '+94 73 835 7291', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Silva — 20 years experience in Kilinochchi.', 20, TRUE, TRUE, 4.7, 63, 1800
FROM users u WHERE u.email = 'kilinochchi.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'kilinochchi.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.399657, 80.381451
FROM users u WHERE u.email = 'kilinochchi.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Nuwan Gunawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Gunawardena', '+94 72 923 9486', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Gunawardena — 9 years experience in Kilinochchi.', 9, TRUE, TRUE, 4.7, 18, 1800
FROM users u WHERE u.email = 'kilinochchi.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'kilinochchi.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.386542, 80.357222
FROM users u WHERE u.email = 'kilinochchi.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Sunil Gunawardena (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sunil Gunawardena', '+94 77 727 9270', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sunil Gunawardena — 12 years experience in Kilinochchi.', 12, TRUE, TRUE, 4.4, 72, 2000
FROM users u WHERE u.email = 'kilinochchi.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'kilinochchi.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.365154, 80.362334
FROM users u WHERE u.email = 'kilinochchi.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Dilani Wijesinghe (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilani Wijesinghe', '+94 78 596 4919', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilani Wijesinghe — 10 years experience in Kilinochchi.', 10, TRUE, TRUE, 4.1, 36, 2500
FROM users u WHERE u.email = 'kilinochchi.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'kilinochchi.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.390046, 80.375987
FROM users u WHERE u.email = 'kilinochchi.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Buddhika Fernando (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Buddhika Fernando', '+94 72 336 7275', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Buddhika Fernando — 6 years experience in Mannar.', 6, TRUE, TRUE, 4.2, 74, 1000
FROM users u WHERE u.email = 'mannar.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'mannar.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.972429, 79.895269
FROM users u WHERE u.email = 'mannar.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Chaminda Wickramasinghe (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Wickramasinghe', '+94 76 888 1320', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Wickramasinghe — 15 years experience in Mannar.', 15, TRUE, TRUE, 4.4, 12, 1200
FROM users u WHERE u.email = 'mannar.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'mannar.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.977595, 79.897635
FROM users u WHERE u.email = 'mannar.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Nuwan Ratnayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Ratnayake', '+94 79 325 8999', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Ratnayake — 19 years experience in Mannar.', 19, TRUE, TRUE, 4.3, 58, 2000
FROM users u WHERE u.email = 'mannar.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'mannar.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.99871, 79.896345
FROM users u WHERE u.email = 'mannar.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Lasith Kumara (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Kumara', '+94 77 230 9751', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Kumara — 7 years experience in Mannar.', 7, TRUE, TRUE, 4.6, 56, 2500
FROM users u WHERE u.email = 'mannar.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'mannar.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.962161, 79.897845
FROM users u WHERE u.email = 'mannar.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Nuwan Perera (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Perera', '+94 75 316 8449', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Perera — 14 years experience in Vavuniya.', 14, TRUE, TRUE, 4.4, 11, 1500
FROM users u WHERE u.email = 'vavuniya.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'vavuniya.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.75711, 80.482528
FROM users u WHERE u.email = 'vavuniya.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Kasun Senanayake (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kasun Senanayake', '+94 78 153 6733', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kasun Senanayake — 2 years experience in Vavuniya.', 2, TRUE, TRUE, 4.1, 15, 1800
FROM users u WHERE u.email = 'vavuniya.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'vavuniya.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.76148, 80.510377
FROM users u WHERE u.email = 'vavuniya.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Dilan Fernando (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Fernando', '+94 79 256 4908', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Fernando — 2 years experience in Vavuniya.', 2, TRUE, TRUE, 3.8, 36, 1200
FROM users u WHERE u.email = 'vavuniya.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'vavuniya.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.769691, 80.47871
FROM users u WHERE u.email = 'vavuniya.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Sanjeewa Bandara (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Bandara', '+94 72 418 2771', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Bandara — 5 years experience in Vavuniya.', 5, TRUE, TRUE, 4.1, 52, 1200
FROM users u WHERE u.email = 'vavuniya.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'vavuniya.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.76931, 80.495701
FROM users u WHERE u.email = 'vavuniya.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Nimal Ekanayake (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Ekanayake', '+94 73 204 5941', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Ekanayake — 20 years experience in Mullaitivu.', 20, TRUE, TRUE, 4.3, 30, 1000
FROM users u WHERE u.email = 'mullaitivu.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'mullaitivu.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.274094, 80.832527
FROM users u WHERE u.email = 'mullaitivu.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Chathura Bandara (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Bandara', '+94 71 618 6590', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Bandara — 13 years experience in Mullaitivu.', 13, TRUE, TRUE, 4.2, 59, 2500
FROM users u WHERE u.email = 'mullaitivu.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'mullaitivu.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.286354, 80.825505
FROM users u WHERE u.email = 'mullaitivu.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Nilanthi Kumara (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nilanthi Kumara', '+94 76 280 9548', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nilanthi Kumara — 6 years experience in Mullaitivu.', 6, TRUE, TRUE, 4.2, 63, 2500
FROM users u WHERE u.email = 'mullaitivu.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'mullaitivu.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.266608, 80.811541
FROM users u WHERE u.email = 'mullaitivu.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Lasith Ratnayake (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Ratnayake', '+94 77 349 8613', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Ratnayake — 10 years experience in Mullaitivu.', 10, TRUE, TRUE, 4.1, 36, 1000
FROM users u WHERE u.email = 'mullaitivu.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 5
FROM users u WHERE u.email = 'mullaitivu.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.264423, 80.823441
FROM users u WHERE u.email = 'mullaitivu.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Chathura Senanayake (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Senanayake', '+94 75 386 5526', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Senanayake — 10 years experience in Batticaloa.', 10, TRUE, TRUE, 4.0, 32, 1500
FROM users u WHERE u.email = 'batticaloa.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'batticaloa.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.698148, 81.714038
FROM users u WHERE u.email = 'batticaloa.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Nimal Wickramasinghe (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Wickramasinghe', '+94 77 558 1282', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Wickramasinghe — 17 years experience in Batticaloa.', 17, TRUE, TRUE, 4.5, 35, 2500
FROM users u WHERE u.email = 'batticaloa.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'batticaloa.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.706654, 81.696257
FROM users u WHERE u.email = 'batticaloa.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Dinesh Gunawardena (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Gunawardena', '+94 75 535 6419', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Gunawardena — 18 years experience in Batticaloa.', 18, TRUE, TRUE, 4.5, 65, 2000
FROM users u WHERE u.email = 'batticaloa.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 4
FROM users u WHERE u.email = 'batticaloa.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.724671, 81.692248
FROM users u WHERE u.email = 'batticaloa.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Nadeeka Wijesinghe (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nadeeka Wijesinghe', '+94 72 296 4545', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nadeeka Wijesinghe — 19 years experience in Batticaloa.', 19, TRUE, TRUE, 4.7, 45, 1000
FROM users u WHERE u.email = 'batticaloa.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'batticaloa.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.709265, 81.689222
FROM users u WHERE u.email = 'batticaloa.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Sanjeewa Dissanayake (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Dissanayake', '+94 73 469 3939', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Dissanayake — 11 years experience in Ampara.', 11, TRUE, TRUE, 4.5, 17, 1200
FROM users u WHERE u.email = 'ampara.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'ampara.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.295283, 81.685108
FROM users u WHERE u.email = 'ampara.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Nimal Jayawardena (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Jayawardena', '+94 71 993 1200', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Jayawardena — 17 years experience in Ampara.', 17, TRUE, TRUE, 4.2, 21, 2500
FROM users u WHERE u.email = 'ampara.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'ampara.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.273521, 81.656881
FROM users u WHERE u.email = 'ampara.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Dinesh Ratnayake (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Ratnayake', '+94 76 603 2213', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Ratnayake — 4 years experience in Ampara.', 4, TRUE, TRUE, 3.9, 66, 1000
FROM users u WHERE u.email = 'ampara.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 5
FROM users u WHERE u.email = 'ampara.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.289319, 81.662075
FROM users u WHERE u.email = 'ampara.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Dilan Silva (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Silva', '+94 76 720 4697', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Silva — 19 years experience in Ampara.', 19, TRUE, TRUE, 4.2, 36, 1000
FROM users u WHERE u.email = 'ampara.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'ampara.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.277668, 81.677214
FROM users u WHERE u.email = 'ampara.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Nuwan Wijesinghe (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Wijesinghe', '+94 79 857 2625', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Wijesinghe — 3 years experience in Trincomalee.', 3, TRUE, TRUE, 4.3, 77, 2000
FROM users u WHERE u.email = 'trincomalee.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'trincomalee.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.579294, 81.218741
FROM users u WHERE u.email = 'trincomalee.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Dilan Wickramasinghe (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Wickramasinghe', '+94 76 561 8699', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Wickramasinghe — 2 years experience in Trincomalee.', 2, TRUE, TRUE, 4.0, 14, 1200
FROM users u WHERE u.email = 'trincomalee.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'trincomalee.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.593817, 81.201482
FROM users u WHERE u.email = 'trincomalee.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Sunil Gunawardena (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sunil Gunawardena', '+94 73 535 2880', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sunil Gunawardena — 20 years experience in Trincomalee.', 20, TRUE, TRUE, 4.3, 34, 1500
FROM users u WHERE u.email = 'trincomalee.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'trincomalee.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.595678, 81.22332
FROM users u WHERE u.email = 'trincomalee.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Ajith Jayawardena (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ajith Jayawardena', '+94 74 549 3037', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ajith Jayawardena — 20 years experience in Trincomalee.', 20, TRUE, TRUE, 4.0, 44, 2000
FROM users u WHERE u.email = 'trincomalee.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'trincomalee.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.600465, 81.198056
FROM users u WHERE u.email = 'trincomalee.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Nadeeka Ekanayake (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nadeeka Ekanayake', '+94 76 852 6280', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nadeeka Ekanayake — 3 years experience in Kurunegala.', 3, TRUE, TRUE, 4.4, 61, 1000
FROM users u WHERE u.email = 'kurunegala.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'kurunegala.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.4824, 80.35319
FROM users u WHERE u.email = 'kurunegala.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Lasith Perera (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Perera', '+94 79 141 3870', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Perera — 10 years experience in Kurunegala.', 10, TRUE, TRUE, 4.8, 80, 1000
FROM users u WHERE u.email = 'kurunegala.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'kurunegala.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.475457, 80.369272
FROM users u WHERE u.email = 'kurunegala.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Gayan Wijesinghe (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Gayan Wijesinghe', '+94 75 518 6460', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Gayan Wijesinghe — 17 years experience in Kurunegala.', 17, TRUE, TRUE, 4.6, 67, 1000
FROM users u WHERE u.email = 'kurunegala.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'kurunegala.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.47356, 80.365713
FROM users u WHERE u.email = 'kurunegala.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Harsha Bandara (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Bandara', '+94 77 190 6153', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Bandara — 3 years experience in Kurunegala.', 3, TRUE, TRUE, 4.4, 56, 2000
FROM users u WHERE u.email = 'kurunegala.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'kurunegala.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.472733, 80.358766
FROM users u WHERE u.email = 'kurunegala.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Kasun Bandara (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kasun Bandara', '+94 70 292 9494', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kasun Bandara — 15 years experience in Puttalam.', 15, TRUE, TRUE, 5.0, 74, 1800
FROM users u WHERE u.email = 'puttalam.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'puttalam.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.032367, 79.828884
FROM users u WHERE u.email = 'puttalam.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Chathura Ratnayake (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Ratnayake', '+94 77 224 1472', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Ratnayake — 16 years experience in Puttalam.', 16, TRUE, TRUE, 4.1, 21, 1500
FROM users u WHERE u.email = 'puttalam.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'puttalam.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.033882, 79.810364
FROM users u WHERE u.email = 'puttalam.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Chathura Gunawardena (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Gunawardena', '+94 77 220 3522', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Gunawardena — 5 years experience in Puttalam.', 5, TRUE, TRUE, 4.5, 16, 1200
FROM users u WHERE u.email = 'puttalam.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'puttalam.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.022535, 79.830334
FROM users u WHERE u.email = 'puttalam.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Nadeeka Ekanayake (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nadeeka Ekanayake', '+94 78 248 7284', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nadeeka Ekanayake — 16 years experience in Puttalam.', 16, TRUE, TRUE, 4.4, 65, 1200
FROM users u WHERE u.email = 'puttalam.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'puttalam.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.044416, 79.82492
FROM users u WHERE u.email = 'puttalam.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Chathura Jayawardena (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Jayawardena', '+94 70 389 5891', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Jayawardena — 10 years experience in Anuradhapura.', 10, TRUE, TRUE, 4.8, 48, 2000
FROM users u WHERE u.email = 'anuradhapura.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'anuradhapura.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.294192, 80.414607
FROM users u WHERE u.email = 'anuradhapura.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Malith Ratnayake (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Malith Ratnayake', '+94 77 429 4090', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Malith Ratnayake — 14 years experience in Anuradhapura.', 14, TRUE, TRUE, 4.2, 75, 2000
FROM users u WHERE u.email = 'anuradhapura.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'anuradhapura.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.297344, 80.405243
FROM users u WHERE u.email = 'anuradhapura.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Ajith Senanayake (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ajith Senanayake', '+94 76 779 3492', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ajith Senanayake — 14 years experience in Anuradhapura.', 14, TRUE, TRUE, 4.2, 65, 2500
FROM users u WHERE u.email = 'anuradhapura.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'anuradhapura.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.325641, 80.400131
FROM users u WHERE u.email = 'anuradhapura.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Sunil Jayawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sunil Jayawardena', '+94 77 115 3361', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sunil Jayawardena — 18 years experience in Anuradhapura.', 18, TRUE, TRUE, 3.9, 61, 1000
FROM users u WHERE u.email = 'anuradhapura.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 4
FROM users u WHERE u.email = 'anuradhapura.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.330014, 80.39698
FROM users u WHERE u.email = 'anuradhapura.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Nilanthi Jayawardena (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nilanthi Jayawardena', '+94 75 972 9742', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nilanthi Jayawardena — 4 years experience in Polonnaruwa.', 4, TRUE, TRUE, 4.2, 55, 2500
FROM users u WHERE u.email = 'polonnaruwa.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'polonnaruwa.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.93908, 81.037568
FROM users u WHERE u.email = 'polonnaruwa.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Kasun Ratnayake (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kasun Ratnayake', '+94 76 200 2646', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kasun Ratnayake — 4 years experience in Polonnaruwa.', 4, TRUE, TRUE, 4.1, 41, 1200
FROM users u WHERE u.email = 'polonnaruwa.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'polonnaruwa.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.941941, 81.023498
FROM users u WHERE u.email = 'polonnaruwa.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Pradeep Ekanayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Pradeep Ekanayake', '+94 73 643 7751', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Pradeep Ekanayake — 6 years experience in Polonnaruwa.', 6, TRUE, TRUE, 4.2, 52, 1800
FROM users u WHERE u.email = 'polonnaruwa.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'polonnaruwa.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.92214, 81.030646
FROM users u WHERE u.email = 'polonnaruwa.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Harsha Rajapaksha (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Rajapaksha', '+94 72 337 8555', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Rajapaksha — 20 years experience in Polonnaruwa.', 20, TRUE, TRUE, 4.3, 35, 1800
FROM users u WHERE u.email = 'polonnaruwa.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'polonnaruwa.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.927303, 81.02318
FROM users u WHERE u.email = 'polonnaruwa.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Lasith Wijesinghe (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Wijesinghe', '+94 72 175 8237', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Wijesinghe — 19 years experience in Badulla.', 19, TRUE, TRUE, 4.4, 41, 2500
FROM users u WHERE u.email = 'badulla.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'badulla.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.000074, 81.070956
FROM users u WHERE u.email = 'badulla.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Malith Ekanayake (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Malith Ekanayake', '+94 77 209 4886', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Malith Ekanayake — 14 years experience in Badulla.', 14, TRUE, TRUE, 4.3, 43, 1200
FROM users u WHERE u.email = 'badulla.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'badulla.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.011881, 81.062613
FROM users u WHERE u.email = 'badulla.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Malith Weerasinghe (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Malith Weerasinghe', '+94 79 985 1803', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Malith Weerasinghe — 2 years experience in Badulla.', 2, TRUE, TRUE, 3.8, 55, 1500
FROM users u WHERE u.email = 'badulla.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'badulla.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.985235, 81.062971
FROM users u WHERE u.email = 'badulla.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Kumari Ratnayake (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kumari Ratnayake', '+94 79 356 3240', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kumari Ratnayake — 8 years experience in Badulla.', 8, TRUE, TRUE, 4.8, 50, 1200
FROM users u WHERE u.email = 'badulla.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'badulla.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.009566, 81.046448
FROM users u WHERE u.email = 'badulla.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Ruwan Silva (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ruwan Silva', '+94 75 865 7807', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ruwan Silva — 11 years experience in Monaragala.', 11, TRUE, TRUE, 4.2, 21, 1000
FROM users u WHERE u.email = 'monaragala.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'monaragala.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.882944, 81.330035
FROM users u WHERE u.email = 'monaragala.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Saman Jayawardena (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Saman Jayawardena', '+94 77 925 5835', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Saman Jayawardena — 10 years experience in Monaragala.', 10, TRUE, TRUE, 4.4, 39, 1200
FROM users u WHERE u.email = 'monaragala.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'monaragala.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.872976, 81.36756
FROM users u WHERE u.email = 'monaragala.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Nilanthi Herath (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nilanthi Herath', '+94 78 474 2479', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nilanthi Herath — 14 years experience in Monaragala.', 14, TRUE, TRUE, 4.0, 33, 2500
FROM users u WHERE u.email = 'monaragala.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'monaragala.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.856007, 81.367216
FROM users u WHERE u.email = 'monaragala.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Nimal Dissanayake (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Dissanayake', '+94 75 210 4830', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Dissanayake — 14 years experience in Monaragala.', 14, TRUE, TRUE, 4.7, 38, 2000
FROM users u WHERE u.email = 'monaragala.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 4
FROM users u WHERE u.email = 'monaragala.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.856344, 81.343443
FROM users u WHERE u.email = 'monaragala.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Nimal Herath (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Herath', '+94 71 243 1742', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Herath — 15 years experience in Ratnapura.', 15, TRUE, TRUE, 4.8, 43, 2500
FROM users u WHERE u.email = 'ratnapura.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'ratnapura.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.671655, 80.381729
FROM users u WHERE u.email = 'ratnapura.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Dinesh Ratnayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Ratnayake', '+94 76 701 3531', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Ratnayake — 19 years experience in Ratnapura.', 19, TRUE, TRUE, 4.0, 63, 1500
FROM users u WHERE u.email = 'ratnapura.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'ratnapura.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.666688, 80.41469
FROM users u WHERE u.email = 'ratnapura.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Dilan Bandara (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Bandara', '+94 73 554 8285', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Bandara — 13 years experience in Ratnapura.', 13, TRUE, TRUE, 4.9, 9, 2500
FROM users u WHERE u.email = 'ratnapura.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'ratnapura.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.682374, 80.395525
FROM users u WHERE u.email = 'ratnapura.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Nilanthi Weerasinghe (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nilanthi Weerasinghe', '+94 74 294 3001', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nilanthi Weerasinghe — 14 years experience in Ratnapura.', 14, TRUE, TRUE, 4.9, 50, 1000
FROM users u WHERE u.email = 'ratnapura.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'ratnapura.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.702037, 80.393893
FROM users u WHERE u.email = 'ratnapura.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Kamal Wickramasinghe (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.worker1@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kamal Wickramasinghe', '+94 79 310 2124', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.worker1@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kamal Wickramasinghe — 6 years experience in Kegalle.', 6, TRUE, TRUE, 3.9, 47, 1200
FROM users u WHERE u.email = 'kegalle.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'kegalle.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.25688, 80.365244
FROM users u WHERE u.email = 'kegalle.worker1@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Saman Wickramasinghe (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.worker2@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Saman Wickramasinghe', '+94 72 653 5106', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.worker2@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Saman Wickramasinghe — 6 years experience in Kegalle.', 6, TRUE, TRUE, 4.0, 5, 1500
FROM users u WHERE u.email = 'kegalle.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'kegalle.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.266088, 80.339542
FROM users u WHERE u.email = 'kegalle.worker2@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Ruwan Perera (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.worker3@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ruwan Perera', '+94 74 153 3076', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.worker3@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ruwan Perera — 7 years experience in Kegalle.', 7, TRUE, TRUE, 4.1, 46, 1000
FROM users u WHERE u.email = 'kegalle.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'kegalle.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.231894, 80.357999
FROM users u WHERE u.email = 'kegalle.worker3@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Roshan Bandara (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.worker4@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Bandara', '+94 78 326 1710', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.worker4@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Bandara — 16 years experience in Kegalle.', 16, TRUE, TRUE, 4.2, 80, 1000
FROM users u WHERE u.email = 'kegalle.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'kegalle.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.233842, 80.344331
FROM users u WHERE u.email = 'kegalle.worker4@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);
