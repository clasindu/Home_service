-- Phase 5 (admin): seed an ADMIN account so worker verification can be done in-app.
-- Login:  admin@homeserve.lk  /  password123
-- Idempotent: only inserts if the account doesn't already exist.

INSERT INTO users (id, email, password_hash, full_name, phone, role)
SELECT gen_random_uuid(),
       'admin@homeserve.lk',
       '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu',  -- password123
       'Platform Admin',
       NULL,
       'ADMIN'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'admin@homeserve.lk');
