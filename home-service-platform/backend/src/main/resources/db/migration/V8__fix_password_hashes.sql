-- Fix: the seed hash used in V4-V7 was an invalid BCrypt string, so those
-- seeded accounts (workers + admin) could never log in. This updates every
-- seeded account to a valid BCrypt hash for the password: password123
UPDATE users
SET password_hash = '$2b$12$XqzKxoeML3uRnhrw6ekNIeYyHgWFYEqDQQwDgLl4jiSWX82TkW/Z6'
WHERE password_hash = '$2a$12$eImiTXuWVxfM37uY4JANjQ.J1QaZ8n8yAxq8gG7q5Y5F0.p6vXhBu';
