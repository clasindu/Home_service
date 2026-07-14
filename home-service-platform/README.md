# AI-Powered Home Service Platform — Phase 1 & 2

This is the initial scaffold: **project setup (Phase 1)** and **JWT authentication (Phase 2)**.
Everything here matches the architecture document (layered structure, folder layout, DB schema).

## What's included

**Backend (Spring Boot 3, Java 21)**
- User + Worker entities (Worker is a 1:1 role extension of User)
- Register / Login / Refresh (with rotation) / Logout endpoints
- BCrypt password hashing (strength 12)
- Stateless JWT access tokens (15 min) + hashed, revocable refresh tokens (7 days)
- Spring Security filter chain, RBAC-ready (ROLE_HOMEOWNER / ROLE_WORKER / ROLE_ADMIN)
- Global RFC 7807 exception handling + Bean Validation
- Flyway migration V1 (users, workers, refresh_tokens)
- Integration test covering register → protected endpoint → auth failure

**Frontend (React 19 + Vite)**
- Login / Register / Dashboard pages
- AuthContext (silent session restore on load, in-memory access token)
- Axios instance with auto-refresh-on-401 interceptor
- Protected route guard
- Tailwind CSS styling

## Prerequisites
- Java 21, Maven
- Node.js 18+ and npm
- PostgreSQL running locally

## Setup

### 1. Database
Create the database (Flyway creates the tables on first run):
```bash
createdb home_service
# or: psql -U postgres -c "CREATE DATABASE home_service;"
```

### 2. Backend
Set env vars to match your local Postgres (or edit application.yml defaults):
```bash
export DB_USERNAME=postgres
export DB_PASSWORD=yourpassword
export JWT_SECRET=some-long-random-string-at-least-32-chars
cd backend
mvn spring-boot:run
```
Backend starts on **http://localhost:8081**.

### 3. Frontend
```bash
cd frontend
npm install
npm run dev
```
Frontend starts on **http://localhost:5173** (proxies /api to :8081).

## Quick API test (curl)
```bash
# Register
curl -X POST http://localhost:8081/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"jane@test.com","password":"password123","fullName":"Jane","role":"HOMEOWNER"}'

# Use the returned accessToken:
curl http://localhost:8081/api/v1/users/me \
  -H "Authorization: Bearer <accessToken>"
```

## Design decisions worth noting for your viva
- **VARCHAR + CHECK instead of native Postgres ENUM** for `role` — avoids Hibernate's
  enum-mapping mismatch (the "column is of type role_type but expression is character varying"
  error) while behaving identically. Fully portable.
- **Refresh tokens are stored hashed (SHA-256)**, never in plaintext — a leaked DB dump
  can't be replayed. Access tokens are stateless JWTs, so they aren't stored at all.
- **Refresh rotation**: each refresh revokes the used token and issues a fresh pair.
- **Access token kept in memory on the frontend** (not localStorage) to reduce XSS token
  theft; only the refresh token is persisted.

## Next: Phase 3
Worker profile CRUD, worker search, and the booking state machine — building on this
authenticated foundation.
