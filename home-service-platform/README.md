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

---

# Phase 3 — Marketplace & Booking (added)

Builds on the Phase 1/2 auth foundation. Migration **V2** adds categories,
worker skills, worker locations, and bookings, and seeds the 7 service categories.

## New capabilities

**Categories**
- `GET /api/v1/categories` — list service categories (public reference data)

**Worker profile & marketplace** (worker self-service is `WORKER`-role-gated)
- `GET  /api/v1/workers/me` — my worker profile + skills
- `PATCH /api/v1/workers/me` — update bio, experience, hourly rate, availability
- `POST /api/v1/workers/me/skills` — add a skill category (1–5 proficiency)
- `PUT  /api/v1/workers/me/location` — set my current lat/lng
- `GET  /api/v1/workers/{id}` — view any worker's public profile
- `GET  /api/v1/workers/search?category=1&lat=..&lng=..&radiusKm=25` — ranked nearby workers

**Bookings** (state machine enforced)
- `POST   /api/v1/bookings` — create (optionally pre-assign a worker)
- `GET    /api/v1/bookings` — my bookings (homeowner or worker view, auto-detected by role)
- `GET    /api/v1/bookings/{id}` — booking detail (participants only)
- `PATCH  /api/v1/bookings/{id}/accept` — worker accepts (PENDING → CONFIRMED)
- `PATCH  /api/v1/bookings/{id}/start` — (CONFIRMED/EN_ROUTE → IN_PROGRESS)
- `PATCH  /api/v1/bookings/{id}/complete` — (IN_PROGRESS → COMPLETED)
- `PATCH  /api/v1/bookings/{id}/cancel` — cancel with reason

## Booking state machine
```
PENDING ──accept──► CONFIRMED ──► EN_ROUTE ──► IN_PROGRESS ──► COMPLETED
   │                    │             │              │
   └──── cancel ────────┴─────────────┴──────────────┴──► CANCELLED
                                                    (or DISPUTED from IN_PROGRESS)
```
Transitions are validated on the `Booking` entity itself — an illegal move (e.g.
completing a PENDING booking) throws and surfaces as HTTP 409 Conflict.

## Worker search ranking
Available + verified workers with the requested skill are pulled, distance is
computed via Haversine from the requester's coordinates, and each is scored by a
weighted blend: `score = 2.0*rating − 1.0*distanceKm`, sorted high-to-low,
filtered to `radiusKm`. Linear scan (MVP-first); KD-Tree is the documented
scale-up path.

## Testing Phase 3 (after logging in as a worker)
```bash
# Worker sets availability + a skill + location so they're searchable.
# (Workers must be is_verified=TRUE to appear in search — flip that in the DB
#  for testing, since admin verification isn't built yet:)
#   UPDATE workers SET is_verified = TRUE WHERE id = '<worker-uuid>';

curl -X POST http://localhost:8081/api/v1/workers/me/skills \
  -H "Authorization: Bearer <workerToken>" -H "Content-Type: application/json" \
  -d '{"categoryId":1,"proficiencyLevel":4}'

curl -X PUT http://localhost:8081/api/v1/workers/me/location \
  -H "Authorization: Bearer <workerToken>" -H "Content-Type: application/json" \
  -d '{"latitude":8.033,"longitude":79.828}'

# Homeowner searches for plumbers (category 1) nearby:
curl "http://localhost:8081/api/v1/workers/search?category=1&lat=8.03&lng=79.83&radiusKm=25" \
  -H "Authorization: Bearer <homeownerToken>"
```

## Note on worker verification
`is_verified` defaults to FALSE and search only returns verified workers. Admin
verification endpoints aren't built yet — for now, set the flag directly in the
DB when testing. That's a natural early item for a later phase.
