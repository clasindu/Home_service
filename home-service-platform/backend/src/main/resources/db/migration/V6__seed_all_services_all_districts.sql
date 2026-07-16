-- Phase 4 (demo data): one worker for EVERY service in EVERY district (25 x 7 = 175).
-- Each worker sits within ~3km of the district capital so a 5km search finds them.
-- Idempotent: guarded by WHERE NOT EXISTS on a stable email per worker.

-- Colombo: Kasun Jayawardena (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kasun Jayawardena', '+94 70 619 4517', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kasun Jayawardena — plumbing specialist, 20 yrs in Colombo.', 20, TRUE, TRUE, 4.8, 17, 1500
FROM users u WHERE u.email = 'colombo.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'colombo.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.923314, 79.844938
FROM users u WHERE u.email = 'colombo.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Colombo: Kamal Kumara (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kamal Kumara', '+94 73 745 2013', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kamal Kumara — electrical specialist, 5 yrs in Colombo.', 5, TRUE, TRUE, 4.5, 12, 2000
FROM users u WHERE u.email = 'colombo.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'colombo.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.924154, 79.851864
FROM users u WHERE u.email = 'colombo.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Colombo: Malith Senanayake (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Malith Senanayake', '+94 72 653 2929', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Malith Senanayake — carpentry specialist, 15 yrs in Colombo.', 15, TRUE, TRUE, 4.5, 22, 1500
FROM users u WHERE u.email = 'colombo.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'colombo.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.910885, 79.851159
FROM users u WHERE u.email = 'colombo.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Colombo: Dinesh Rajapaksha (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Rajapaksha', '+94 79 161 4374', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Rajapaksha — painting specialist, 4 yrs in Colombo.', 4, TRUE, TRUE, 4.0, 17, 2000
FROM users u WHERE u.email = 'colombo.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 4
FROM users u WHERE u.email = 'colombo.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.91281, 79.863763
FROM users u WHERE u.email = 'colombo.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Colombo: Harsha Kumara (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Kumara', '+94 72 815 4999', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Kumara — appliance repair specialist, 9 yrs in Colombo.', 9, TRUE, TRUE, 4.9, 51, 1500
FROM users u WHERE u.email = 'colombo.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'colombo.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.93708, 79.859962
FROM users u WHERE u.email = 'colombo.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Colombo: Malith Ekanayake (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Malith Ekanayake', '+94 71 624 7850', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Malith Ekanayake — cleaning specialist, 4 yrs in Colombo.', 4, TRUE, TRUE, 4.7, 41, 2000
FROM users u WHERE u.email = 'colombo.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 3
FROM users u WHERE u.email = 'colombo.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.928007, 79.874705
FROM users u WHERE u.email = 'colombo.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Colombo: Manoj Herath (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'colombo.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Manoj Herath', '+94 75 448 6737', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'colombo.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Manoj Herath — gardening specialist, 20 yrs in Colombo.', 20, TRUE, TRUE, 3.8, 14, 2000
FROM users u WHERE u.email = 'colombo.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'colombo.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.914571, 79.860803
FROM users u WHERE u.email = 'colombo.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Sanjeewa Wijesinghe (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Wijesinghe', '+94 79 797 8301', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Wijesinghe — plumbing specialist, 11 yrs in Gampaha.', 11, TRUE, TRUE, 4.1, 13, 1000
FROM users u WHERE u.email = 'gampaha.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'gampaha.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.076175, 79.985069
FROM users u WHERE u.email = 'gampaha.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Sandun Senanayake (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sandun Senanayake', '+94 77 160 4575', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sandun Senanayake — electrical specialist, 5 yrs in Gampaha.', 5, TRUE, TRUE, 4.9, 50, 1200
FROM users u WHERE u.email = 'gampaha.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'gampaha.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.105633, 79.994192
FROM users u WHERE u.email = 'gampaha.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Chaminda Gunawardena (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Gunawardena', '+94 78 384 3243', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Gunawardena — carpentry specialist, 14 yrs in Gampaha.', 14, TRUE, TRUE, 4.4, 26, 1800
FROM users u WHERE u.email = 'gampaha.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'gampaha.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.088024, 80.014705
FROM users u WHERE u.email = 'gampaha.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Charith Dissanayake (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Charith Dissanayake', '+94 71 280 3478', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Charith Dissanayake — painting specialist, 6 yrs in Gampaha.', 6, TRUE, TRUE, 4.6, 53, 1200
FROM users u WHERE u.email = 'gampaha.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'gampaha.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.09913, 80.017213
FROM users u WHERE u.email = 'gampaha.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Harsha Gunawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Gunawardena', '+94 76 647 7049', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Gunawardena — appliance repair specialist, 6 yrs in Gampaha.', 6, TRUE, TRUE, 4.0, 41, 1000
FROM users u WHERE u.email = 'gampaha.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'gampaha.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.074134, 80.011619
FROM users u WHERE u.email = 'gampaha.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Malith Herath (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Malith Herath', '+94 76 507 7536', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Malith Herath — cleaning specialist, 19 yrs in Gampaha.', 19, TRUE, TRUE, 4.4, 11, 1800
FROM users u WHERE u.email = 'gampaha.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'gampaha.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.108012, 80.006558
FROM users u WHERE u.email = 'gampaha.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Gampaha: Ruwan Ratnayake (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'gampaha.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ruwan Ratnayake', '+94 71 448 1861', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'gampaha.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ruwan Ratnayake — gardening specialist, 7 yrs in Gampaha.', 7, TRUE, TRUE, 3.9, 31, 1800
FROM users u WHERE u.email = 'gampaha.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'gampaha.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.096534, 79.983941
FROM users u WHERE u.email = 'gampaha.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Nimal Jayawardena (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Jayawardena', '+94 72 749 5132', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Jayawardena — plumbing specialist, 14 yrs in Kalutara.', 14, TRUE, TRUE, 4.5, 14, 1200
FROM users u WHERE u.email = 'kalutara.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'kalutara.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.586718, 79.976862
FROM users u WHERE u.email = 'kalutara.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Chathura Weerasinghe (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Weerasinghe', '+94 74 187 3361', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Weerasinghe — electrical specialist, 17 yrs in Kalutara.', 17, TRUE, TRUE, 4.4, 64, 1800
FROM users u WHERE u.email = 'kalutara.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'kalutara.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.584469, 79.946853
FROM users u WHERE u.email = 'kalutara.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Thilina Herath (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Thilina Herath', '+94 78 470 3401', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Thilina Herath — carpentry specialist, 8 yrs in Kalutara.', 8, TRUE, TRUE, 4.6, 71, 1000
FROM users u WHERE u.email = 'kalutara.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'kalutara.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.594053, 79.95993
FROM users u WHERE u.email = 'kalutara.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Isuru Perera (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Isuru Perera', '+94 78 475 3736', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Isuru Perera — painting specialist, 10 yrs in Kalutara.', 10, TRUE, TRUE, 4.6, 16, 2500
FROM users u WHERE u.email = 'kalutara.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 4
FROM users u WHERE u.email = 'kalutara.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.594693, 79.953431
FROM users u WHERE u.email = 'kalutara.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Manoj Gunawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Manoj Gunawardena', '+94 73 937 7564', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Manoj Gunawardena — appliance repair specialist, 8 yrs in Kalutara.', 8, TRUE, TRUE, 4.2, 33, 2000
FROM users u WHERE u.email = 'kalutara.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'kalutara.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.586573, 79.970746
FROM users u WHERE u.email = 'kalutara.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Rukshan Gunawardena (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Rukshan Gunawardena', '+94 74 298 6640', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Rukshan Gunawardena — cleaning specialist, 17 yrs in Kalutara.', 17, TRUE, TRUE, 4.7, 8, 1500
FROM users u WHERE u.email = 'kalutara.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'kalutara.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.574597, 79.96044
FROM users u WHERE u.email = 'kalutara.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kalutara: Rukshan Weerasinghe (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kalutara.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Rukshan Weerasinghe', '+94 75 309 8907', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kalutara.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Rukshan Weerasinghe — gardening specialist, 8 yrs in Kalutara.', 8, TRUE, TRUE, 4.1, 34, 1800
FROM users u WHERE u.email = 'kalutara.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'kalutara.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.60178, 79.955827
FROM users u WHERE u.email = 'kalutara.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Chathura Perera (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Perera', '+94 76 901 4265', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Perera — plumbing specialist, 5 yrs in Kandy.', 5, TRUE, TRUE, 4.8, 15, 2500
FROM users u WHERE u.email = 'kandy.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'kandy.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.289861, 80.639207
FROM users u WHERE u.email = 'kandy.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Pradeep Kumara (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Pradeep Kumara', '+94 71 842 3602', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Pradeep Kumara — electrical specialist, 14 yrs in Kandy.', 14, TRUE, TRUE, 4.8, 55, 1800
FROM users u WHERE u.email = 'kandy.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'kandy.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.301009, 80.627671
FROM users u WHERE u.email = 'kandy.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Chaminda Perera (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Perera', '+94 75 259 9989', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Perera — carpentry specialist, 17 yrs in Kandy.', 17, TRUE, TRUE, 4.8, 23, 2000
FROM users u WHERE u.email = 'kandy.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'kandy.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.278041, 80.648275
FROM users u WHERE u.email = 'kandy.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Chaminda Perera (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Perera', '+94 76 992 4191', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Perera — painting specialist, 6 yrs in Kandy.', 6, TRUE, TRUE, 4.6, 72, 2500
FROM users u WHERE u.email = 'kandy.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'kandy.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.273113, 80.650652
FROM users u WHERE u.email = 'kandy.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Nimal Dissanayake (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Dissanayake', '+94 76 954 3147', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Dissanayake — appliance repair specialist, 19 yrs in Kandy.', 19, TRUE, TRUE, 4.7, 46, 1500
FROM users u WHERE u.email = 'kandy.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'kandy.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.28026, 80.633742
FROM users u WHERE u.email = 'kandy.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Thilina Weerasinghe (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Thilina Weerasinghe', '+94 72 644 3487', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Thilina Weerasinghe — cleaning specialist, 18 yrs in Kandy.', 18, TRUE, TRUE, 4.8, 71, 1800
FROM users u WHERE u.email = 'kandy.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'kandy.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.304917, 80.639549
FROM users u WHERE u.email = 'kandy.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kandy: Gayan Perera (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kandy.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Gayan Perera', '+94 77 733 2971', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kandy.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Gayan Perera — gardening specialist, 6 yrs in Kandy.', 6, TRUE, TRUE, 4.5, 24, 1200
FROM users u WHERE u.email = 'kandy.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'kandy.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.304021, 80.643654
FROM users u WHERE u.email = 'kandy.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Sunil Herath (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sunil Herath', '+94 73 295 5537', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sunil Herath — plumbing specialist, 3 yrs in Matale.', 3, TRUE, TRUE, 4.4, 18, 2000
FROM users u WHERE u.email = 'matale.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'matale.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.474064, 80.624506
FROM users u WHERE u.email = 'matale.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Manoj Bandara (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Manoj Bandara', '+94 79 617 9391', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Manoj Bandara — electrical specialist, 12 yrs in Matale.', 12, TRUE, TRUE, 4.7, 13, 1800
FROM users u WHERE u.email = 'matale.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'matale.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.467778, 80.625622
FROM users u WHERE u.email = 'matale.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Sandun Dissanayake (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sandun Dissanayake', '+94 74 672 4319', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sandun Dissanayake — carpentry specialist, 18 yrs in Matale.', 18, TRUE, TRUE, 4.4, 36, 2500
FROM users u WHERE u.email = 'matale.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'matale.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.465784, 80.624598
FROM users u WHERE u.email = 'matale.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Chaminda Kumara (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Kumara', '+94 73 785 5960', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Kumara — painting specialist, 4 yrs in Matale.', 4, TRUE, TRUE, 3.9, 35, 1800
FROM users u WHERE u.email = 'matale.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'matale.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.453878, 80.621316
FROM users u WHERE u.email = 'matale.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Manoj Jayawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Manoj Jayawardena', '+94 73 864 2542', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Manoj Jayawardena — appliance repair specialist, 16 yrs in Matale.', 16, TRUE, TRUE, 4.2, 37, 1200
FROM users u WHERE u.email = 'matale.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 4
FROM users u WHERE u.email = 'matale.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.483322, 80.628564
FROM users u WHERE u.email = 'matale.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Sanjeewa Rajapaksha (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Rajapaksha', '+94 75 531 4207', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Rajapaksha — cleaning specialist, 14 yrs in Matale.', 14, TRUE, TRUE, 4.0, 60, 2000
FROM users u WHERE u.email = 'matale.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'matale.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.485135, 80.635368
FROM users u WHERE u.email = 'matale.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matale: Kasun Fernando (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matale.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kasun Fernando', '+94 76 439 9477', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matale.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kasun Fernando — gardening specialist, 2 yrs in Matale.', 2, TRUE, TRUE, 4.5, 61, 2500
FROM users u WHERE u.email = 'matale.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'matale.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.475497, 80.606101
FROM users u WHERE u.email = 'matale.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Dinesh Fernando (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Fernando', '+94 74 140 3974', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Fernando — plumbing specialist, 10 yrs in Nuwara Eliya.', 10, TRUE, TRUE, 4.1, 18, 1000
FROM users u WHERE u.email = 'nuwaraeliya.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'nuwaraeliya.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.935763, 80.804168
FROM users u WHERE u.email = 'nuwaraeliya.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Manoj Jayawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Manoj Jayawardena', '+94 78 627 9103', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Manoj Jayawardena — electrical specialist, 6 yrs in Nuwara Eliya.', 6, TRUE, TRUE, 4.6, 38, 1800
FROM users u WHERE u.email = 'nuwaraeliya.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'nuwaraeliya.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.961212, 80.801685
FROM users u WHERE u.email = 'nuwaraeliya.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Kasun Fernando (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kasun Fernando', '+94 71 920 5268', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kasun Fernando — carpentry specialist, 2 yrs in Nuwara Eliya.', 2, TRUE, TRUE, 4.0, 14, 1500
FROM users u WHERE u.email = 'nuwaraeliya.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'nuwaraeliya.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.941746, 80.799885
FROM users u WHERE u.email = 'nuwaraeliya.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Chathura Gunawardena (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Gunawardena', '+94 74 736 3117', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Gunawardena — painting specialist, 15 yrs in Nuwara Eliya.', 15, TRUE, TRUE, 4.3, 48, 2000
FROM users u WHERE u.email = 'nuwaraeliya.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'nuwaraeliya.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.934098, 80.80216
FROM users u WHERE u.email = 'nuwaraeliya.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Gayan Gunawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Gayan Gunawardena', '+94 74 643 4372', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Gayan Gunawardena — appliance repair specialist, 11 yrs in Nuwara Eliya.', 11, TRUE, TRUE, 4.1, 28, 1200
FROM users u WHERE u.email = 'nuwaraeliya.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 4
FROM users u WHERE u.email = 'nuwaraeliya.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.965473, 80.805992
FROM users u WHERE u.email = 'nuwaraeliya.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Buddhika Rajapaksha (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Buddhika Rajapaksha', '+94 78 664 4104', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Buddhika Rajapaksha — cleaning specialist, 2 yrs in Nuwara Eliya.', 2, TRUE, TRUE, 5.0, 9, 1000
FROM users u WHERE u.email = 'nuwaraeliya.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'nuwaraeliya.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.941439, 80.800032
FROM users u WHERE u.email = 'nuwaraeliya.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Nuwara Eliya: Sanjeewa Gunawardena (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'nuwaraeliya.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Gunawardena', '+94 78 954 7440', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'nuwaraeliya.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Gunawardena — gardening specialist, 17 yrs in Nuwara Eliya.', 17, TRUE, TRUE, 4.8, 60, 2500
FROM users u WHERE u.email = 'nuwaraeliya.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'nuwaraeliya.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.965347, 80.774926
FROM users u WHERE u.email = 'nuwaraeliya.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Dinesh Wickramasinghe (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Wickramasinghe', '+94 70 957 3126', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Wickramasinghe — plumbing specialist, 13 yrs in Galle.', 13, TRUE, TRUE, 4.8, 22, 1800
FROM users u WHERE u.email = 'galle.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'galle.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.070868, 80.215337
FROM users u WHERE u.email = 'galle.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Kamal Dissanayake (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kamal Dissanayake', '+94 79 348 5801', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kamal Dissanayake — electrical specialist, 11 yrs in Galle.', 11, TRUE, TRUE, 4.6, 53, 2000
FROM users u WHERE u.email = 'galle.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'galle.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.051007, 80.204994
FROM users u WHERE u.email = 'galle.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Buddhika Rajapaksha (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Buddhika Rajapaksha', '+94 73 135 6071', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Buddhika Rajapaksha — carpentry specialist, 12 yrs in Galle.', 12, TRUE, TRUE, 4.1, 47, 2000
FROM users u WHERE u.email = 'galle.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'galle.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.041171, 80.21905
FROM users u WHERE u.email = 'galle.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Tharindu Rajapaksha (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Tharindu Rajapaksha', '+94 73 616 1081', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Tharindu Rajapaksha — painting specialist, 8 yrs in Galle.', 8, TRUE, TRUE, 4.4, 69, 2500
FROM users u WHERE u.email = 'galle.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'galle.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.035538, 80.216739
FROM users u WHERE u.email = 'galle.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Lasith Fernando (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Fernando', '+94 71 699 9670', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Fernando — appliance repair specialist, 9 yrs in Galle.', 9, TRUE, TRUE, 4.3, 43, 1500
FROM users u WHERE u.email = 'galle.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'galle.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.040679, 80.224125
FROM users u WHERE u.email = 'galle.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Harsha Senanayake (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Senanayake', '+94 70 944 9404', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Senanayake — cleaning specialist, 6 yrs in Galle.', 6, TRUE, TRUE, 4.4, 41, 2500
FROM users u WHERE u.email = 'galle.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'galle.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.063015, 80.228944
FROM users u WHERE u.email = 'galle.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Galle: Roshan Jayawardena (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'galle.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Jayawardena', '+94 73 187 1510', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'galle.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Jayawardena — gardening specialist, 20 yrs in Galle.', 20, TRUE, TRUE, 4.5, 7, 2500
FROM users u WHERE u.email = 'galle.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'galle.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.068256, 80.230103
FROM users u WHERE u.email = 'galle.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Chaminda Weerasinghe (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Weerasinghe', '+94 78 797 5006', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Weerasinghe — plumbing specialist, 2 yrs in Matara.', 2, TRUE, TRUE, 4.3, 11, 2500
FROM users u WHERE u.email = 'matara.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'matara.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.971443, 80.550558
FROM users u WHERE u.email = 'matara.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Lasith Perera (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Perera', '+94 71 863 8763', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Perera — electrical specialist, 18 yrs in Matara.', 18, TRUE, TRUE, 4.9, 73, 1000
FROM users u WHERE u.email = 'matara.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'matara.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.95335, 80.539524
FROM users u WHERE u.email = 'matara.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Rukshan Fernando (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Rukshan Fernando', '+94 77 965 7267', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Rukshan Fernando — carpentry specialist, 16 yrs in Matara.', 16, TRUE, TRUE, 4.7, 34, 2500
FROM users u WHERE u.email = 'matara.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'matara.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.967361, 80.545452
FROM users u WHERE u.email = 'matara.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Sanjeewa Ekanayake (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Ekanayake', '+94 75 360 5987', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Ekanayake — painting specialist, 6 yrs in Matara.', 6, TRUE, TRUE, 4.6, 14, 2000
FROM users u WHERE u.email = 'matara.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 5
FROM users u WHERE u.email = 'matara.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.964511, 80.559211
FROM users u WHERE u.email = 'matara.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Malith Jayawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Malith Jayawardena', '+94 77 397 9462', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Malith Jayawardena — appliance repair specialist, 8 yrs in Matara.', 8, TRUE, TRUE, 4.1, 17, 2500
FROM users u WHERE u.email = 'matara.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 4
FROM users u WHERE u.email = 'matara.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.937349, 80.539184
FROM users u WHERE u.email = 'matara.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Buddhika Wijesinghe (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Buddhika Wijesinghe', '+94 77 117 5744', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Buddhika Wijesinghe — cleaning specialist, 4 yrs in Matara.', 4, TRUE, TRUE, 4.9, 30, 1500
FROM users u WHERE u.email = 'matara.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'matara.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.953688, 80.541266
FROM users u WHERE u.email = 'matara.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Matara: Kamal Wijesinghe (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'matara.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kamal Wijesinghe', '+94 71 245 9586', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'matara.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kamal Wijesinghe — gardening specialist, 20 yrs in Matara.', 20, TRUE, TRUE, 4.9, 31, 1000
FROM users u WHERE u.email = 'matara.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'matara.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 5.972683, 80.550927
FROM users u WHERE u.email = 'matara.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Tharindu Jayawardena (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Tharindu Jayawardena', '+94 73 609 8964', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Tharindu Jayawardena — plumbing specialist, 13 yrs in Hambantota.', 13, TRUE, TRUE, 4.1, 19, 2500
FROM users u WHERE u.email = 'hambantota.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'hambantota.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.127821, 81.12324
FROM users u WHERE u.email = 'hambantota.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Nimal Rajapaksha (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Rajapaksha', '+94 76 452 7162', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Rajapaksha — electrical specialist, 6 yrs in Hambantota.', 6, TRUE, TRUE, 4.3, 43, 2500
FROM users u WHERE u.email = 'hambantota.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'hambantota.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.106229, 81.118201
FROM users u WHERE u.email = 'hambantota.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Ruwan Herath (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ruwan Herath', '+94 74 359 7098', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ruwan Herath — carpentry specialist, 2 yrs in Hambantota.', 2, TRUE, TRUE, 4.8, 20, 1200
FROM users u WHERE u.email = 'hambantota.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'hambantota.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.106163, 81.127526
FROM users u WHERE u.email = 'hambantota.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Nuwan Senanayake (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Senanayake', '+94 74 204 1845', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Senanayake — painting specialist, 3 yrs in Hambantota.', 3, TRUE, TRUE, 4.2, 59, 1500
FROM users u WHERE u.email = 'hambantota.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 5
FROM users u WHERE u.email = 'hambantota.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.142057, 81.12171
FROM users u WHERE u.email = 'hambantota.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Dinesh Jayawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Jayawardena', '+94 70 931 7554', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Jayawardena — appliance repair specialist, 15 yrs in Hambantota.', 15, TRUE, TRUE, 4.4, 29, 1500
FROM users u WHERE u.email = 'hambantota.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'hambantota.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.115076, 81.110066
FROM users u WHERE u.email = 'hambantota.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Isuru Wickramasinghe (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Isuru Wickramasinghe', '+94 74 597 1802', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Isuru Wickramasinghe — cleaning specialist, 6 yrs in Hambantota.', 6, TRUE, TRUE, 4.7, 62, 2000
FROM users u WHERE u.email = 'hambantota.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'hambantota.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.132005, 81.102281
FROM users u WHERE u.email = 'hambantota.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Hambantota: Chaminda Rajapaksha (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'hambantota.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Rajapaksha', '+94 74 594 7461', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'hambantota.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Rajapaksha — gardening specialist, 9 yrs in Hambantota.', 9, TRUE, TRUE, 4.2, 38, 1800
FROM users u WHERE u.email = 'hambantota.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'hambantota.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.123099, 81.112872
FROM users u WHERE u.email = 'hambantota.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Pradeep Rajapaksha (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Pradeep Rajapaksha', '+94 75 877 8372', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Pradeep Rajapaksha — plumbing specialist, 16 yrs in Jaffna.', 16, TRUE, TRUE, 4.8, 75, 1200
FROM users u WHERE u.email = 'jaffna.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'jaffna.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.646206, 80.025522
FROM users u WHERE u.email = 'jaffna.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Chaminda Wickramasinghe (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Wickramasinghe', '+94 74 928 4311', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Wickramasinghe — electrical specialist, 13 yrs in Jaffna.', 13, TRUE, TRUE, 4.5, 45, 1200
FROM users u WHERE u.email = 'jaffna.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'jaffna.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.652287, 80.013789
FROM users u WHERE u.email = 'jaffna.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Thilina Kumara (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Thilina Kumara', '+94 77 384 6900', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Thilina Kumara — carpentry specialist, 3 yrs in Jaffna.', 3, TRUE, TRUE, 4.1, 39, 1500
FROM users u WHERE u.email = 'jaffna.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'jaffna.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.657282, 80.03435
FROM users u WHERE u.email = 'jaffna.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Harsha Wickramasinghe (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Wickramasinghe', '+94 70 230 1528', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Wickramasinghe — painting specialist, 11 yrs in Jaffna.', 11, TRUE, TRUE, 4.3, 62, 1800
FROM users u WHERE u.email = 'jaffna.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 4
FROM users u WHERE u.email = 'jaffna.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.646834, 80.039784
FROM users u WHERE u.email = 'jaffna.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Sandun Ratnayake (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sandun Ratnayake', '+94 73 901 2786', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sandun Ratnayake — appliance repair specialist, 16 yrs in Jaffna.', 16, TRUE, TRUE, 3.9, 72, 1800
FROM users u WHERE u.email = 'jaffna.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'jaffna.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.678358, 80.025134
FROM users u WHERE u.email = 'jaffna.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Chaminda Jayawardena (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Jayawardena', '+94 70 101 3058', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Jayawardena — cleaning specialist, 19 yrs in Jaffna.', 19, TRUE, TRUE, 4.9, 63, 1000
FROM users u WHERE u.email = 'jaffna.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 3
FROM users u WHERE u.email = 'jaffna.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.662305, 80.032055
FROM users u WHERE u.email = 'jaffna.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Jaffna: Malith Silva (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'jaffna.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Malith Silva', '+94 71 201 2152', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'jaffna.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Malith Silva — gardening specialist, 15 yrs in Jaffna.', 15, TRUE, TRUE, 4.0, 37, 2000
FROM users u WHERE u.email = 'jaffna.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'jaffna.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.666738, 80.018436
FROM users u WHERE u.email = 'jaffna.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Gayan Wickramasinghe (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Gayan Wickramasinghe', '+94 77 385 6183', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Gayan Wickramasinghe — plumbing specialist, 11 yrs in Kilinochchi.', 11, TRUE, TRUE, 4.5, 6, 2000
FROM users u WHERE u.email = 'kilinochchi.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'kilinochchi.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.376271, 80.367049
FROM users u WHERE u.email = 'kilinochchi.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Asela Gunawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Asela Gunawardena', '+94 70 122 4180', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Asela Gunawardena — electrical specialist, 11 yrs in Kilinochchi.', 11, TRUE, TRUE, 4.1, 57, 2500
FROM users u WHERE u.email = 'kilinochchi.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'kilinochchi.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.379411, 80.367452
FROM users u WHERE u.email = 'kilinochchi.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Harsha Kumara (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Kumara', '+94 70 812 6538', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Kumara — carpentry specialist, 17 yrs in Kilinochchi.', 17, TRUE, TRUE, 4.3, 52, 1200
FROM users u WHERE u.email = 'kilinochchi.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'kilinochchi.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.365219, 80.367202
FROM users u WHERE u.email = 'kilinochchi.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Roshan Weerasinghe (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Weerasinghe', '+94 77 305 6107', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Weerasinghe — painting specialist, 8 yrs in Kilinochchi.', 8, TRUE, TRUE, 4.8, 69, 1000
FROM users u WHERE u.email = 'kilinochchi.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'kilinochchi.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.386872, 80.366131
FROM users u WHERE u.email = 'kilinochchi.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Ajith Wijesinghe (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ajith Wijesinghe', '+94 73 596 7832', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ajith Wijesinghe — appliance repair specialist, 7 yrs in Kilinochchi.', 7, TRUE, TRUE, 4.2, 68, 2000
FROM users u WHERE u.email = 'kilinochchi.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'kilinochchi.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.370272, 80.386377
FROM users u WHERE u.email = 'kilinochchi.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Sunil Jayawardena (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sunil Jayawardena', '+94 70 288 7444', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sunil Jayawardena — cleaning specialist, 3 yrs in Kilinochchi.', 3, TRUE, TRUE, 3.8, 23, 1800
FROM users u WHERE u.email = 'kilinochchi.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'kilinochchi.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.395489, 80.360957
FROM users u WHERE u.email = 'kilinochchi.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kilinochchi: Sandun Herath (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kilinochchi.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sandun Herath', '+94 78 864 8661', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kilinochchi.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sandun Herath — gardening specialist, 7 yrs in Kilinochchi.', 7, TRUE, TRUE, 4.9, 47, 1200
FROM users u WHERE u.email = 'kilinochchi.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'kilinochchi.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.388678, 80.394911
FROM users u WHERE u.email = 'kilinochchi.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Dinesh Senanayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Senanayake', '+94 74 182 6758', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Senanayake — plumbing specialist, 4 yrs in Mannar.', 4, TRUE, TRUE, 4.3, 18, 1000
FROM users u WHERE u.email = 'mannar.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'mannar.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.993209, 79.921859
FROM users u WHERE u.email = 'mannar.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Ruwan Wickramasinghe (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ruwan Wickramasinghe', '+94 77 300 7106', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ruwan Wickramasinghe — electrical specialist, 3 yrs in Mannar.', 3, TRUE, TRUE, 4.2, 60, 1000
FROM users u WHERE u.email = 'mannar.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'mannar.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.976685, 79.914074
FROM users u WHERE u.email = 'mannar.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Buddhika Wickramasinghe (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Buddhika Wickramasinghe', '+94 70 484 1571', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Buddhika Wickramasinghe — carpentry specialist, 14 yrs in Mannar.', 14, TRUE, TRUE, 4.4, 57, 1200
FROM users u WHERE u.email = 'mannar.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'mannar.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.974639, 79.912944
FROM users u WHERE u.email = 'mannar.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Kamal Silva (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kamal Silva', '+94 75 731 1714', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kamal Silva — painting specialist, 10 yrs in Mannar.', 10, TRUE, TRUE, 4.9, 48, 1500
FROM users u WHERE u.email = 'mannar.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 4
FROM users u WHERE u.email = 'mannar.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.972253, 79.913302
FROM users u WHERE u.email = 'mannar.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Thilina Herath (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Thilina Herath', '+94 71 586 8630', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Thilina Herath — appliance repair specialist, 9 yrs in Mannar.', 9, TRUE, TRUE, 4.7, 13, 1000
FROM users u WHERE u.email = 'mannar.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 4
FROM users u WHERE u.email = 'mannar.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.996272, 79.897107
FROM users u WHERE u.email = 'mannar.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Rukshan Dissanayake (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Rukshan Dissanayake', '+94 74 942 3479', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Rukshan Dissanayake — cleaning specialist, 2 yrs in Mannar.', 2, TRUE, TRUE, 4.0, 68, 1200
FROM users u WHERE u.email = 'mannar.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'mannar.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.995888, 79.915733
FROM users u WHERE u.email = 'mannar.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mannar: Ajith Herath (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mannar.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ajith Herath', '+94 76 870 3620', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mannar.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ajith Herath — gardening specialist, 8 yrs in Mannar.', 8, TRUE, TRUE, 4.7, 15, 2000
FROM users u WHERE u.email = 'mannar.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'mannar.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.994005, 79.902988
FROM users u WHERE u.email = 'mannar.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Roshan Fernando (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Fernando', '+94 71 371 2377', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Fernando — plumbing specialist, 5 yrs in Vavuniya.', 5, TRUE, TRUE, 4.5, 25, 1800
FROM users u WHERE u.email = 'vavuniya.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'vavuniya.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.756784, 80.496441
FROM users u WHERE u.email = 'vavuniya.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Ruwan Kumara (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ruwan Kumara', '+94 77 735 4849', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ruwan Kumara — electrical specialist, 15 yrs in Vavuniya.', 15, TRUE, TRUE, 4.3, 34, 1200
FROM users u WHERE u.email = 'vavuniya.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'vavuniya.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.751345, 80.504652
FROM users u WHERE u.email = 'vavuniya.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Isuru Bandara (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Isuru Bandara', '+94 74 303 8199', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Isuru Bandara — carpentry specialist, 10 yrs in Vavuniya.', 10, TRUE, TRUE, 4.1, 39, 1500
FROM users u WHERE u.email = 'vavuniya.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'vavuniya.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.761471, 80.489681
FROM users u WHERE u.email = 'vavuniya.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Pradeep Gunawardena (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Pradeep Gunawardena', '+94 76 357 5029', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Pradeep Gunawardena — painting specialist, 4 yrs in Vavuniya.', 4, TRUE, TRUE, 4.9, 29, 1500
FROM users u WHERE u.email = 'vavuniya.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 5
FROM users u WHERE u.email = 'vavuniya.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.741878, 80.489229
FROM users u WHERE u.email = 'vavuniya.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Gayan Gunawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Gayan Gunawardena', '+94 77 938 4786', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Gayan Gunawardena — appliance repair specialist, 2 yrs in Vavuniya.', 2, TRUE, TRUE, 4.4, 9, 1000
FROM users u WHERE u.email = 'vavuniya.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 4
FROM users u WHERE u.email = 'vavuniya.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.756787, 80.48272
FROM users u WHERE u.email = 'vavuniya.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Tharindu Silva (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Tharindu Silva', '+94 75 624 3912', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Tharindu Silva — cleaning specialist, 4 yrs in Vavuniya.', 4, TRUE, TRUE, 3.9, 79, 1200
FROM users u WHERE u.email = 'vavuniya.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'vavuniya.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.764968, 80.487484
FROM users u WHERE u.email = 'vavuniya.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Vavuniya: Chathura Dissanayake (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'vavuniya.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Dissanayake', '+94 75 448 3316', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'vavuniya.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Dissanayake — gardening specialist, 3 yrs in Vavuniya.', 3, TRUE, TRUE, 3.8, 49, 1200
FROM users u WHERE u.email = 'vavuniya.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'vavuniya.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.7613, 80.503031
FROM users u WHERE u.email = 'vavuniya.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Saman Dissanayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Saman Dissanayake', '+94 75 289 6115', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Saman Dissanayake — plumbing specialist, 15 yrs in Mullaitivu.', 15, TRUE, TRUE, 4.9, 6, 1500
FROM users u WHERE u.email = 'mullaitivu.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'mullaitivu.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.250376, 80.82256
FROM users u WHERE u.email = 'mullaitivu.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Saman Silva (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Saman Silva', '+94 72 754 9749', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Saman Silva — electrical specialist, 19 yrs in Mullaitivu.', 19, TRUE, TRUE, 3.9, 17, 1800
FROM users u WHERE u.email = 'mullaitivu.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'mullaitivu.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.27763, 80.81593
FROM users u WHERE u.email = 'mullaitivu.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Dilan Rajapaksha (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Rajapaksha', '+94 74 863 6852', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Rajapaksha — carpentry specialist, 3 yrs in Mullaitivu.', 3, TRUE, TRUE, 5.0, 44, 1800
FROM users u WHERE u.email = 'mullaitivu.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'mullaitivu.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.26332, 80.805962
FROM users u WHERE u.email = 'mullaitivu.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Roshan Perera (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Perera', '+94 73 106 8113', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Perera — painting specialist, 14 yrs in Mullaitivu.', 14, TRUE, TRUE, 4.2, 30, 1800
FROM users u WHERE u.email = 'mullaitivu.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'mullaitivu.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.280113, 80.832078
FROM users u WHERE u.email = 'mullaitivu.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Roshan Bandara (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Bandara', '+94 70 152 3334', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Bandara — appliance repair specialist, 6 yrs in Mullaitivu.', 6, TRUE, TRUE, 4.9, 63, 1200
FROM users u WHERE u.email = 'mullaitivu.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'mullaitivu.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.278533, 80.810824
FROM users u WHERE u.email = 'mullaitivu.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Rukshan Senanayake (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Rukshan Senanayake', '+94 75 390 3651', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Rukshan Senanayake — cleaning specialist, 6 yrs in Mullaitivu.', 6, TRUE, TRUE, 4.2, 69, 1200
FROM users u WHERE u.email = 'mullaitivu.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'mullaitivu.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.252205, 80.818599
FROM users u WHERE u.email = 'mullaitivu.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Mullaitivu: Pradeep Fernando (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'mullaitivu.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Pradeep Fernando', '+94 70 594 6153', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'mullaitivu.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Pradeep Fernando — gardening specialist, 6 yrs in Mullaitivu.', 6, TRUE, TRUE, 4.8, 30, 1500
FROM users u WHERE u.email = 'mullaitivu.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'mullaitivu.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 9.252917, 80.813858
FROM users u WHERE u.email = 'mullaitivu.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Chathura Senanayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Senanayake', '+94 79 514 4213', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Senanayake — plumbing specialist, 9 yrs in Batticaloa.', 9, TRUE, TRUE, 4.6, 25, 2500
FROM users u WHERE u.email = 'batticaloa.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'batticaloa.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.702107, 81.707643
FROM users u WHERE u.email = 'batticaloa.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Pradeep Wickramasinghe (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Pradeep Wickramasinghe', '+94 73 842 4155', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Pradeep Wickramasinghe — electrical specialist, 6 yrs in Batticaloa.', 6, TRUE, TRUE, 4.0, 50, 1000
FROM users u WHERE u.email = 'batticaloa.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'batticaloa.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.700502, 81.715788
FROM users u WHERE u.email = 'batticaloa.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Isuru Silva (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Isuru Silva', '+94 76 415 5083', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Isuru Silva — carpentry specialist, 11 yrs in Batticaloa.', 11, TRUE, TRUE, 4.3, 63, 2000
FROM users u WHERE u.email = 'batticaloa.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'batticaloa.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.723044, 81.693671
FROM users u WHERE u.email = 'batticaloa.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Nuwan Weerasinghe (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Weerasinghe', '+94 77 881 8508', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Weerasinghe — painting specialist, 9 yrs in Batticaloa.', 9, TRUE, TRUE, 3.8, 67, 1800
FROM users u WHERE u.email = 'batticaloa.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'batticaloa.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.715084, 81.697781
FROM users u WHERE u.email = 'batticaloa.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Rukshan Ratnayake (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Rukshan Ratnayake', '+94 78 622 1667', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Rukshan Ratnayake — appliance repair specialist, 16 yrs in Batticaloa.', 16, TRUE, TRUE, 4.2, 51, 1000
FROM users u WHERE u.email = 'batticaloa.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'batticaloa.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.713412, 81.684416
FROM users u WHERE u.email = 'batticaloa.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Dilan Jayawardena (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Jayawardena', '+94 78 486 3231', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Jayawardena — cleaning specialist, 3 yrs in Batticaloa.', 3, TRUE, TRUE, 4.7, 70, 1000
FROM users u WHERE u.email = 'batticaloa.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 3
FROM users u WHERE u.email = 'batticaloa.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.701961, 81.708405
FROM users u WHERE u.email = 'batticaloa.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Batticaloa: Charith Fernando (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'batticaloa.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Charith Fernando', '+94 74 930 3705', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'batticaloa.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Charith Fernando — gardening specialist, 17 yrs in Batticaloa.', 17, TRUE, TRUE, 4.8, 29, 1200
FROM users u WHERE u.email = 'batticaloa.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'batticaloa.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.73486, 81.708355
FROM users u WHERE u.email = 'batticaloa.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Rukshan Gunawardena (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Rukshan Gunawardena', '+94 77 247 5164', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Rukshan Gunawardena — plumbing specialist, 10 yrs in Ampara.', 10, TRUE, TRUE, 4.7, 25, 1500
FROM users u WHERE u.email = 'ampara.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'ampara.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.276059, 81.669332
FROM users u WHERE u.email = 'ampara.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Sanjeewa Wickramasinghe (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Wickramasinghe', '+94 72 513 3641', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Wickramasinghe — electrical specialist, 8 yrs in Ampara.', 8, TRUE, TRUE, 4.1, 52, 1000
FROM users u WHERE u.email = 'ampara.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'ampara.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.295008, 81.678871
FROM users u WHERE u.email = 'ampara.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Lasith Herath (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Herath', '+94 75 993 8422', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Herath — carpentry specialist, 3 yrs in Ampara.', 3, TRUE, TRUE, 4.7, 19, 2000
FROM users u WHERE u.email = 'ampara.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'ampara.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.305935, 81.662775
FROM users u WHERE u.email = 'ampara.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Gayan Bandara (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Gayan Bandara', '+94 75 691 3395', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Gayan Bandara — painting specialist, 14 yrs in Ampara.', 14, TRUE, TRUE, 4.8, 52, 1500
FROM users u WHERE u.email = 'ampara.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 4
FROM users u WHERE u.email = 'ampara.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.282773, 81.675985
FROM users u WHERE u.email = 'ampara.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Kasun Fernando (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kasun Fernando', '+94 74 417 6122', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kasun Fernando — appliance repair specialist, 18 yrs in Ampara.', 18, TRUE, TRUE, 4.7, 11, 1500
FROM users u WHERE u.email = 'ampara.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'ampara.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.289622, 81.663063
FROM users u WHERE u.email = 'ampara.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Nimal Silva (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Silva', '+94 70 235 9001', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Silva — cleaning specialist, 13 yrs in Ampara.', 13, TRUE, TRUE, 4.6, 58, 2000
FROM users u WHERE u.email = 'ampara.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 3
FROM users u WHERE u.email = 'ampara.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.281679, 81.667175
FROM users u WHERE u.email = 'ampara.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ampara: Chathura Silva (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ampara.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Silva', '+94 78 329 7770', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ampara.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Silva — gardening specialist, 13 yrs in Ampara.', 13, TRUE, TRUE, 4.2, 18, 2000
FROM users u WHERE u.email = 'ampara.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'ampara.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.274502, 81.656794
FROM users u WHERE u.email = 'ampara.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Dinesh Jayawardena (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dinesh Jayawardena', '+94 72 561 2569', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dinesh Jayawardena — plumbing specialist, 9 yrs in Trincomalee.', 9, TRUE, TRUE, 4.4, 22, 1000
FROM users u WHERE u.email = 'trincomalee.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 3
FROM users u WHERE u.email = 'trincomalee.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.576751, 81.219661
FROM users u WHERE u.email = 'trincomalee.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Dilan Jayawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Jayawardena', '+94 78 458 8270', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Jayawardena — electrical specialist, 3 yrs in Trincomalee.', 3, TRUE, TRUE, 4.3, 38, 1000
FROM users u WHERE u.email = 'trincomalee.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'trincomalee.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.600766, 81.225358
FROM users u WHERE u.email = 'trincomalee.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Gayan Ratnayake (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Gayan Ratnayake', '+94 72 343 3608', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Gayan Ratnayake — carpentry specialist, 14 yrs in Trincomalee.', 14, TRUE, TRUE, 3.9, 73, 1000
FROM users u WHERE u.email = 'trincomalee.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'trincomalee.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.578346, 81.229726
FROM users u WHERE u.email = 'trincomalee.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Manoj Bandara (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Manoj Bandara', '+94 78 722 9305', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Manoj Bandara — painting specialist, 8 yrs in Trincomalee.', 8, TRUE, TRUE, 4.9, 23, 1800
FROM users u WHERE u.email = 'trincomalee.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 5
FROM users u WHERE u.email = 'trincomalee.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.569845, 81.217033
FROM users u WHERE u.email = 'trincomalee.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Dilan Kumara (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Kumara', '+94 77 832 9821', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Kumara — appliance repair specialist, 3 yrs in Trincomalee.', 3, TRUE, TRUE, 4.2, 43, 2500
FROM users u WHERE u.email = 'trincomalee.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'trincomalee.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.598682, 81.203487
FROM users u WHERE u.email = 'trincomalee.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Nuwan Kumara (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Kumara', '+94 71 367 4805', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Kumara — cleaning specialist, 9 yrs in Trincomalee.', 9, TRUE, TRUE, 4.7, 62, 1200
FROM users u WHERE u.email = 'trincomalee.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'trincomalee.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.596227, 81.21395
FROM users u WHERE u.email = 'trincomalee.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Trincomalee: Sunil Bandara (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'trincomalee.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sunil Bandara', '+94 74 751 8144', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'trincomalee.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sunil Bandara — gardening specialist, 3 yrs in Trincomalee.', 3, TRUE, TRUE, 4.6, 38, 2500
FROM users u WHERE u.email = 'trincomalee.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'trincomalee.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.581479, 81.224188
FROM users u WHERE u.email = 'trincomalee.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Rukshan Dissanayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Rukshan Dissanayake', '+94 72 366 4868', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Rukshan Dissanayake — plumbing specialist, 2 yrs in Kurunegala.', 2, TRUE, TRUE, 4.9, 15, 2000
FROM users u WHERE u.email = 'kurunegala.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'kurunegala.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.478942, 80.377729
FROM users u WHERE u.email = 'kurunegala.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Saman Rajapaksha (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Saman Rajapaksha', '+94 76 972 9787', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Saman Rajapaksha — electrical specialist, 9 yrs in Kurunegala.', 9, TRUE, TRUE, 4.9, 47, 2000
FROM users u WHERE u.email = 'kurunegala.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'kurunegala.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.495161, 80.356067
FROM users u WHERE u.email = 'kurunegala.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Sanjeewa Perera (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Perera', '+94 76 737 2274', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Perera — carpentry specialist, 8 yrs in Kurunegala.', 8, TRUE, TRUE, 4.7, 78, 1500
FROM users u WHERE u.email = 'kurunegala.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'kurunegala.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.499171, 80.36004
FROM users u WHERE u.email = 'kurunegala.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Pradeep Jayawardena (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Pradeep Jayawardena', '+94 70 131 1682', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Pradeep Jayawardena — painting specialist, 6 yrs in Kurunegala.', 6, TRUE, TRUE, 4.5, 25, 1500
FROM users u WHERE u.email = 'kurunegala.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'kurunegala.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.469485, 80.348328
FROM users u WHERE u.email = 'kurunegala.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Sandun Silva (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sandun Silva', '+94 78 780 2080', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sandun Silva — appliance repair specialist, 8 yrs in Kurunegala.', 8, TRUE, TRUE, 3.9, 80, 1500
FROM users u WHERE u.email = 'kurunegala.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'kurunegala.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.493392, 80.370824
FROM users u WHERE u.email = 'kurunegala.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Nuwan Bandara (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Bandara', '+94 77 202 3173', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Bandara — cleaning specialist, 11 yrs in Kurunegala.', 11, TRUE, TRUE, 3.8, 16, 2500
FROM users u WHERE u.email = 'kurunegala.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 3
FROM users u WHERE u.email = 'kurunegala.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.477177, 80.351614
FROM users u WHERE u.email = 'kurunegala.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kurunegala: Rukshan Wickramasinghe (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kurunegala.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Rukshan Wickramasinghe', '+94 70 832 7029', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kurunegala.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Rukshan Wickramasinghe — gardening specialist, 11 yrs in Kurunegala.', 11, TRUE, TRUE, 4.1, 49, 1500
FROM users u WHERE u.email = 'kurunegala.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'kurunegala.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.478901, 80.356415
FROM users u WHERE u.email = 'kurunegala.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Manoj Ratnayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Manoj Ratnayake', '+94 78 891 2610', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Manoj Ratnayake — plumbing specialist, 15 yrs in Puttalam.', 15, TRUE, TRUE, 3.8, 57, 1000
FROM users u WHERE u.email = 'puttalam.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'puttalam.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.04885, 79.832558
FROM users u WHERE u.email = 'puttalam.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Sanjeewa Silva (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Silva', '+94 72 546 1021', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Silva — electrical specialist, 11 yrs in Puttalam.', 11, TRUE, TRUE, 4.8, 16, 2000
FROM users u WHERE u.email = 'puttalam.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'puttalam.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.037564, 79.818097
FROM users u WHERE u.email = 'puttalam.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Saman Ekanayake (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Saman Ekanayake', '+94 72 606 6688', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Saman Ekanayake — carpentry specialist, 17 yrs in Puttalam.', 17, TRUE, TRUE, 3.8, 67, 1000
FROM users u WHERE u.email = 'puttalam.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'puttalam.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.045639, 79.845503
FROM users u WHERE u.email = 'puttalam.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Lasith Rajapaksha (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Rajapaksha', '+94 71 602 2713', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Rajapaksha — painting specialist, 5 yrs in Puttalam.', 5, TRUE, TRUE, 4.6, 68, 1200
FROM users u WHERE u.email = 'puttalam.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 5
FROM users u WHERE u.email = 'puttalam.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.028414, 79.81803
FROM users u WHERE u.email = 'puttalam.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Kasun Weerasinghe (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kasun Weerasinghe', '+94 75 311 5966', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kasun Weerasinghe — appliance repair specialist, 2 yrs in Puttalam.', 2, TRUE, TRUE, 4.9, 16, 1800
FROM users u WHERE u.email = 'puttalam.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 4
FROM users u WHERE u.email = 'puttalam.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.021625, 79.843726
FROM users u WHERE u.email = 'puttalam.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Roshan Rajapaksha (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Rajapaksha', '+94 79 872 1555', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Rajapaksha — cleaning specialist, 19 yrs in Puttalam.', 19, TRUE, TRUE, 4.1, 63, 1200
FROM users u WHERE u.email = 'puttalam.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'puttalam.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.031855, 79.842123
FROM users u WHERE u.email = 'puttalam.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Puttalam: Malith Herath (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'puttalam.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Malith Herath', '+94 72 574 8189', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'puttalam.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Malith Herath — gardening specialist, 12 yrs in Puttalam.', 12, TRUE, TRUE, 4.3, 75, 2500
FROM users u WHERE u.email = 'puttalam.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'puttalam.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.036982, 79.841548
FROM users u WHERE u.email = 'puttalam.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Manoj Dissanayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Manoj Dissanayake', '+94 74 408 3532', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Manoj Dissanayake — plumbing specialist, 8 yrs in Anuradhapura.', 8, TRUE, TRUE, 4.4, 35, 2000
FROM users u WHERE u.email = 'anuradhapura.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'anuradhapura.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.31425, 80.390238
FROM users u WHERE u.email = 'anuradhapura.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Chaminda Gunawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Gunawardena', '+94 74 846 2667', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Gunawardena — electrical specialist, 8 yrs in Anuradhapura.', 8, TRUE, TRUE, 4.2, 35, 1500
FROM users u WHERE u.email = 'anuradhapura.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'anuradhapura.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.319434, 80.407404
FROM users u WHERE u.email = 'anuradhapura.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Harsha Bandara (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Bandara', '+94 76 380 4214', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Bandara — carpentry specialist, 11 yrs in Anuradhapura.', 11, TRUE, TRUE, 4.0, 43, 2500
FROM users u WHERE u.email = 'anuradhapura.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'anuradhapura.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.300436, 80.391135
FROM users u WHERE u.email = 'anuradhapura.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Dilan Bandara (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Dilan Bandara', '+94 73 612 5853', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Dilan Bandara — painting specialist, 15 yrs in Anuradhapura.', 15, TRUE, TRUE, 4.4, 6, 1800
FROM users u WHERE u.email = 'anuradhapura.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 4
FROM users u WHERE u.email = 'anuradhapura.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.303509, 80.417569
FROM users u WHERE u.email = 'anuradhapura.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Nimal Jayawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Jayawardena', '+94 79 867 7900', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Jayawardena — appliance repair specialist, 20 yrs in Anuradhapura.', 20, TRUE, TRUE, 3.8, 36, 1800
FROM users u WHERE u.email = 'anuradhapura.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'anuradhapura.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.30266, 80.412277
FROM users u WHERE u.email = 'anuradhapura.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Harsha Gunawardena (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Gunawardena', '+94 76 348 7555', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Gunawardena — cleaning specialist, 5 yrs in Anuradhapura.', 5, TRUE, TRUE, 4.3, 45, 1500
FROM users u WHERE u.email = 'anuradhapura.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'anuradhapura.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.317865, 80.408795
FROM users u WHERE u.email = 'anuradhapura.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Anuradhapura: Sandun Rajapaksha (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'anuradhapura.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sandun Rajapaksha', '+94 75 896 1174', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'anuradhapura.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sandun Rajapaksha — gardening specialist, 7 yrs in Anuradhapura.', 7, TRUE, TRUE, 4.3, 57, 2000
FROM users u WHERE u.email = 'anuradhapura.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'anuradhapura.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 8.302402, 80.400949
FROM users u WHERE u.email = 'anuradhapura.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Asela Ratnayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Asela Ratnayake', '+94 78 456 2656', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Asela Ratnayake — plumbing specialist, 8 yrs in Polonnaruwa.', 8, TRUE, TRUE, 4.1, 32, 1200
FROM users u WHERE u.email = 'polonnaruwa.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'polonnaruwa.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.954995, 81.00463
FROM users u WHERE u.email = 'polonnaruwa.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Buddhika Wickramasinghe (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Buddhika Wickramasinghe', '+94 76 859 8486', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Buddhika Wickramasinghe — electrical specialist, 12 yrs in Polonnaruwa.', 12, TRUE, TRUE, 4.6, 52, 2000
FROM users u WHERE u.email = 'polonnaruwa.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'polonnaruwa.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.948123, 81.019239
FROM users u WHERE u.email = 'polonnaruwa.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Harsha Rajapaksha (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Rajapaksha', '+94 74 380 7256', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Rajapaksha — carpentry specialist, 3 yrs in Polonnaruwa.', 3, TRUE, TRUE, 3.9, 50, 2500
FROM users u WHERE u.email = 'polonnaruwa.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'polonnaruwa.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.93643, 81.028257
FROM users u WHERE u.email = 'polonnaruwa.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Sunil Perera (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sunil Perera', '+94 71 329 5972', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sunil Perera — painting specialist, 10 yrs in Polonnaruwa.', 10, TRUE, TRUE, 4.6, 50, 2000
FROM users u WHERE u.email = 'polonnaruwa.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 5
FROM users u WHERE u.email = 'polonnaruwa.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.925007, 81.033756
FROM users u WHERE u.email = 'polonnaruwa.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Nuwan Gunawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Gunawardena', '+94 73 580 4702', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Gunawardena — appliance repair specialist, 4 yrs in Polonnaruwa.', 4, TRUE, TRUE, 4.4, 26, 1200
FROM users u WHERE u.email = 'polonnaruwa.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 3
FROM users u WHERE u.email = 'polonnaruwa.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.958092, 81.035391
FROM users u WHERE u.email = 'polonnaruwa.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Tharindu Kumara (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Tharindu Kumara', '+94 73 373 7162', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Tharindu Kumara — cleaning specialist, 13 yrs in Polonnaruwa.', 13, TRUE, TRUE, 4.5, 21, 1800
FROM users u WHERE u.email = 'polonnaruwa.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'polonnaruwa.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.939152, 81.011396
FROM users u WHERE u.email = 'polonnaruwa.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Polonnaruwa: Lasith Kumara (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'polonnaruwa.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Kumara', '+94 74 428 8856', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'polonnaruwa.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Kumara — gardening specialist, 9 yrs in Polonnaruwa.', 9, TRUE, TRUE, 4.8, 40, 1500
FROM users u WHERE u.email = 'polonnaruwa.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'polonnaruwa.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.946737, 81.018136
FROM users u WHERE u.email = 'polonnaruwa.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Roshan Fernando (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Fernando', '+94 79 432 3300', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Fernando — plumbing specialist, 4 yrs in Badulla.', 4, TRUE, TRUE, 4.9, 54, 1000
FROM users u WHERE u.email = 'badulla.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'badulla.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.999134, 81.050048
FROM users u WHERE u.email = 'badulla.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Asela Weerasinghe (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Asela Weerasinghe', '+94 74 722 2663', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Asela Weerasinghe — electrical specialist, 11 yrs in Badulla.', 11, TRUE, TRUE, 3.8, 14, 2500
FROM users u WHERE u.email = 'badulla.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 5
FROM users u WHERE u.email = 'badulla.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.998194, 81.037539
FROM users u WHERE u.email = 'badulla.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Chaminda Gunawardena (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chaminda Gunawardena', '+94 72 724 2481', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chaminda Gunawardena — carpentry specialist, 19 yrs in Badulla.', 19, TRUE, TRUE, 4.7, 31, 1800
FROM users u WHERE u.email = 'badulla.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'badulla.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.982084, 81.053271
FROM users u WHERE u.email = 'badulla.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Isuru Ekanayake (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Isuru Ekanayake', '+94 78 221 5333', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Isuru Ekanayake — painting specialist, 5 yrs in Badulla.', 5, TRUE, TRUE, 4.4, 61, 2500
FROM users u WHERE u.email = 'badulla.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 4
FROM users u WHERE u.email = 'badulla.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.982505, 81.061941
FROM users u WHERE u.email = 'badulla.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Ajith Jayawardena (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Ajith Jayawardena', '+94 73 610 3697', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Ajith Jayawardena — appliance repair specialist, 17 yrs in Badulla.', 17, TRUE, TRUE, 4.4, 23, 2500
FROM users u WHERE u.email = 'badulla.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'badulla.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.992437, 81.057059
FROM users u WHERE u.email = 'badulla.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Chathura Perera (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Perera', '+94 77 483 7976', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Perera — cleaning specialist, 11 yrs in Badulla.', 11, TRUE, TRUE, 4.6, 68, 2500
FROM users u WHERE u.email = 'badulla.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 4
FROM users u WHERE u.email = 'badulla.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.981173, 81.048545
FROM users u WHERE u.email = 'badulla.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Badulla: Harsha Fernando (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'badulla.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Fernando', '+94 75 928 2539', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'badulla.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Fernando — gardening specialist, 3 yrs in Badulla.', 3, TRUE, TRUE, 4.6, 7, 2000
FROM users u WHERE u.email = 'badulla.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 5
FROM users u WHERE u.email = 'badulla.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.981899, 81.049974
FROM users u WHERE u.email = 'badulla.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Sanjeewa Ratnayake (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Ratnayake', '+94 75 196 6999', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Ratnayake — plumbing specialist, 6 yrs in Monaragala.', 6, TRUE, TRUE, 4.1, 58, 2500
FROM users u WHERE u.email = 'monaragala.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 4
FROM users u WHERE u.email = 'monaragala.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.880658, 81.335902
FROM users u WHERE u.email = 'monaragala.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Sanjeewa Wickramasinghe (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Sanjeewa Wickramasinghe', '+94 75 947 9089', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Sanjeewa Wickramasinghe — electrical specialist, 11 yrs in Monaragala.', 11, TRUE, TRUE, 4.1, 11, 1500
FROM users u WHERE u.email = 'monaragala.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'monaragala.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.863629, 81.34301
FROM users u WHERE u.email = 'monaragala.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Kasun Dissanayake (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Kasun Dissanayake', '+94 73 424 5902', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Kasun Dissanayake — carpentry specialist, 12 yrs in Monaragala.', 12, TRUE, TRUE, 4.0, 68, 1000
FROM users u WHERE u.email = 'monaragala.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 3
FROM users u WHERE u.email = 'monaragala.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.884827, 81.343113
FROM users u WHERE u.email = 'monaragala.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Malith Fernando (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Malith Fernando', '+94 70 508 5921', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Malith Fernando — painting specialist, 20 yrs in Monaragala.', 20, TRUE, TRUE, 4.7, 56, 2000
FROM users u WHERE u.email = 'monaragala.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 3
FROM users u WHERE u.email = 'monaragala.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.881632, 81.332142
FROM users u WHERE u.email = 'monaragala.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Nimal Silva (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Silva', '+94 79 485 3409', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Silva — appliance repair specialist, 19 yrs in Monaragala.', 19, TRUE, TRUE, 4.5, 12, 2000
FROM users u WHERE u.email = 'monaragala.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'monaragala.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.860238, 81.363872
FROM users u WHERE u.email = 'monaragala.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Harsha Fernando (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Fernando', '+94 70 531 2648', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Fernando — cleaning specialist, 7 yrs in Monaragala.', 7, TRUE, TRUE, 4.3, 27, 1000
FROM users u WHERE u.email = 'monaragala.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 5
FROM users u WHERE u.email = 'monaragala.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.86105, 81.354712
FROM users u WHERE u.email = 'monaragala.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Monaragala: Nimal Weerasinghe (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'monaragala.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nimal Weerasinghe', '+94 76 135 6217', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'monaragala.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nimal Weerasinghe — gardening specialist, 7 yrs in Monaragala.', 7, TRUE, TRUE, 4.2, 38, 1500
FROM users u WHERE u.email = 'monaragala.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'monaragala.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.884789, 81.335693
FROM users u WHERE u.email = 'monaragala.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Roshan Silva (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Silva', '+94 77 168 1231', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Silva — plumbing specialist, 14 yrs in Ratnapura.', 14, TRUE, TRUE, 4.8, 58, 2000
FROM users u WHERE u.email = 'ratnapura.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'ratnapura.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.68272, 80.399998
FROM users u WHERE u.email = 'ratnapura.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Nuwan Jayawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Jayawardena', '+94 70 537 1078', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Jayawardena — electrical specialist, 6 yrs in Ratnapura.', 6, TRUE, TRUE, 3.9, 65, 1200
FROM users u WHERE u.email = 'ratnapura.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 3
FROM users u WHERE u.email = 'ratnapura.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.681916, 80.396047
FROM users u WHERE u.email = 'ratnapura.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Harsha Bandara (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Bandara', '+94 70 382 4969', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Bandara — carpentry specialist, 17 yrs in Ratnapura.', 17, TRUE, TRUE, 4.1, 20, 1200
FROM users u WHERE u.email = 'ratnapura.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 4
FROM users u WHERE u.email = 'ratnapura.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.700319, 80.412105
FROM users u WHERE u.email = 'ratnapura.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Thilina Rajapaksha (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Thilina Rajapaksha', '+94 74 743 9160', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Thilina Rajapaksha — painting specialist, 4 yrs in Ratnapura.', 4, TRUE, TRUE, 4.7, 23, 2500
FROM users u WHERE u.email = 'ratnapura.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 4
FROM users u WHERE u.email = 'ratnapura.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.698021, 80.394371
FROM users u WHERE u.email = 'ratnapura.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Harsha Dissanayake (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Dissanayake', '+94 76 418 6119', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Dissanayake — appliance repair specialist, 4 yrs in Ratnapura.', 4, TRUE, TRUE, 3.8, 12, 1000
FROM users u WHERE u.email = 'ratnapura.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 5
FROM users u WHERE u.email = 'ratnapura.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.697687, 80.383096
FROM users u WHERE u.email = 'ratnapura.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Chathura Rajapaksha (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Chathura Rajapaksha', '+94 77 581 3727', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Chathura Rajapaksha — cleaning specialist, 20 yrs in Ratnapura.', 20, TRUE, TRUE, 4.5, 45, 1500
FROM users u WHERE u.email = 'ratnapura.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 3
FROM users u WHERE u.email = 'ratnapura.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.699277, 80.411257
FROM users u WHERE u.email = 'ratnapura.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Ratnapura: Rukshan Bandara (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'ratnapura.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Rukshan Bandara', '+94 77 378 6470', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ratnapura.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Rukshan Bandara — gardening specialist, 14 yrs in Ratnapura.', 14, TRUE, TRUE, 4.6, 58, 1800
FROM users u WHERE u.email = 'ratnapura.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 4
FROM users u WHERE u.email = 'ratnapura.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 6.677878, 80.404416
FROM users u WHERE u.email = 'ratnapura.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Lasith Silva (PLUMBING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.plumbing@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Lasith Silva', '+94 72 715 6056', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.plumbing@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Lasith Silva — plumbing specialist, 2 yrs in Kegalle.', 2, TRUE, TRUE, 4.8, 47, 2000
FROM users u WHERE u.email = 'kegalle.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 1, 5
FROM users u WHERE u.email = 'kegalle.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 1);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.255687, 80.351834
FROM users u WHERE u.email = 'kegalle.plumbing@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Roshan Gunawardena (ELECTRICAL)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.electrical@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Gunawardena', '+94 70 429 5309', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.electrical@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Gunawardena — electrical specialist, 11 yrs in Kegalle.', 11, TRUE, TRUE, 4.5, 34, 1800
FROM users u WHERE u.email = 'kegalle.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 2, 4
FROM users u WHERE u.email = 'kegalle.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 2);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.24686, 80.353054
FROM users u WHERE u.email = 'kegalle.electrical@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Roshan Rajapaksha (CARPENTRY)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.carpentry@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Roshan Rajapaksha', '+94 79 250 5486', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.carpentry@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Roshan Rajapaksha — carpentry specialist, 6 yrs in Kegalle.', 6, TRUE, TRUE, 4.9, 10, 1500
FROM users u WHERE u.email = 'kegalle.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 3, 5
FROM users u WHERE u.email = 'kegalle.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 3);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.254419, 80.357776
FROM users u WHERE u.email = 'kegalle.carpentry@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Harsha Ratnayake (PAINTING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.painting@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Harsha Ratnayake', '+94 74 721 1943', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.painting@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Harsha Ratnayake — painting specialist, 9 yrs in Kegalle.', 9, TRUE, TRUE, 4.5, 53, 1200
FROM users u WHERE u.email = 'kegalle.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 4, 5
FROM users u WHERE u.email = 'kegalle.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 4);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.245787, 80.331462
FROM users u WHERE u.email = 'kegalle.painting@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Nuwan Wijesinghe (APPLIANCE_REPAIR)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.appliance_repair@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Nuwan Wijesinghe', '+94 78 189 9784', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.appliance_repair@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Nuwan Wijesinghe — appliance repair specialist, 16 yrs in Kegalle.', 16, TRUE, TRUE, 4.5, 6, 1800
FROM users u WHERE u.email = 'kegalle.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 5, 4
FROM users u WHERE u.email = 'kegalle.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 5);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.2588, 80.361736
FROM users u WHERE u.email = 'kegalle.appliance_repair@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Manoj Fernando (CLEANING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.cleaning@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Manoj Fernando', '+94 78 703 4307', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.cleaning@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Manoj Fernando — cleaning specialist, 17 yrs in Kegalle.', 17, TRUE, TRUE, 4.9, 71, 1500
FROM users u WHERE u.email = 'kegalle.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 6, 3
FROM users u WHERE u.email = 'kegalle.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 6);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.241683, 80.349265
FROM users u WHERE u.email = 'kegalle.cleaning@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);

-- Kegalle: Saman Wickramasinghe (GARDENING)
INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(), 'kegalle.gardening@homeserve.lk', '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu', 'Saman Wickramasinghe', '+94 76 898 9474', 'WORKER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'kegalle.gardening@homeserve.lk');
INSERT INTO workers (id, bio, years_experience, is_verified, is_available, avg_rating, rating_count, hourly_rate)
SELECT u.id, 'Saman Wickramasinghe — gardening specialist, 13 yrs in Kegalle.', 13, TRUE, TRUE, 4.1, 78, 2000
FROM users u WHERE u.email = 'kegalle.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM workers w WHERE w.id = u.id);
INSERT INTO worker_skills (id, worker_id, category_id, proficiency_level)
SELECT gen_random_uuid(), u.id, 7, 3
FROM users u WHERE u.email = 'kegalle.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_skills ws WHERE ws.worker_id = u.id AND ws.category_id = 7);
INSERT INTO worker_locations (worker_id, latitude, longitude)
SELECT u.id, 7.236619, 80.357411
FROM users u WHERE u.email = 'kegalle.gardening@homeserve.lk' AND NOT EXISTS (SELECT 1 FROM worker_locations wl WHERE wl.worker_id = u.id);
