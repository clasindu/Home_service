# 🏠 HomeServe — AI-Powered Home Service Platform

> Connect homeowners with verified local professionals — starting with an AI diagnosis agent that assesses the problem before you book.

HomeServe is a full-stack marketplace where a homeowner describes a household problem in plain language, an AI agent diagnoses it (with a built-in safety layer), and the platform matches them with a nearby, verified professional ranked by distance and rating.

---

## ✨ Features

- 🤖 **AI Diagnosis Agent** — describe a problem in natural language; the agent classifies it, assesses severity, and recommends DIY or a professional.
- 🛡️ **Hazard-override safety layer** — a deterministic rule layer that can only *escalate* severity (never lower it), forcing a professional referral for dangerous issues like gas leaks or live wiring.
- 📍 **Location-based worker search** — finds nearby verified workers using the browser's geolocation and the Haversine distance formula, ranked by distance and rating.
- 📅 **Booking system** — full booking lifecycle managed by a state machine (Pending → Confirmed → In Progress → Completed).
- 👷 **Worker profiles** — professionals register, set their skills, hourly rate, and service location.
- ✅ **Admin verification** — an admin approves workers before they appear in searches (marketplace trust gate).
- ⭐ **Ratings & reviews** — homeowners rate workers after completed jobs; averages update automatically.
- 🔐 **Secure authentication** — JWT with refresh-token rotation, BCrypt password hashing, and role-based access control.

---

## 🛠️ Tech Stack

**Frontend**
- React 19 + Vite
- Tailwind CSS
- React Router
- Axios
- lucide-react (icons)

**Backend**
- Java 21
- Spring Boot 3
- Spring Security (JWT)
- Spring Data JPA / Hibernate
- Flyway (database migrations)

**Database**
- PostgreSQL

**AI**
- Groq API (LLaMA 3.3 70B) via an Adapter layer

---

## 🏗️ Architecture

A layered (n-tier) architecture with a clear separation of concerns:

```
React (browser)  ──HTTP/JSON──►  Spring Boot API  ──SQL──►  PostgreSQL
                                       │
                                       └──► Groq AI (diagnosis)

Backend layers:
Controller  →  Service  →  Repository  →  Entity
(HTTP)         (logic)      (data)         (model)
```

**Key design choices**
- **Adapter pattern** isolates the AI provider — swapping providers means changing one class.
- **Repository pattern** (Spring Data JPA) keeps SQL out of business logic.
- **DTO pattern** controls exactly what data the API exposes.
- **State machine** enforces valid booking transitions.
- **Hybrid AI + deterministic safety** for reliable severity assessment.

---

## 🚀 Getting Started

### Prerequisites
- Java 21
- Node.js 18+
- PostgreSQL 14+
- A free [Groq API key](https://console.groq.com)

### 1. Clone the repository
```bash
git clone https://github.com/clasindu/Home_service.git
cd Home_service
```

### 2. Set up the database
Create a PostgreSQL database named `home_service`:
```sql
CREATE DATABASE home_service;
```

### 3. Run the backend
```bash
cd backend

# Set environment variables (PowerShell)
$env:DB_PASSWORD="your_postgres_password"
$env:GROQ_API_KEY="your_groq_api_key"

# macOS/Linux
# export DB_PASSWORD="your_postgres_password"
# export GROQ_API_KEY="your_groq_api_key"

mvn spring-boot:run
```
The API starts on **http://localhost:8081**. Flyway runs the migrations automatically on first start (creating tables and seed data).

### 4. Run the frontend
```bash
cd frontend
npm install
npm run dev
```
The app opens on **http://localhost:5173**.

---

## 📁 Project Structure

```
Home_service/
├── backend/
│   └── src/main/
│       ├── java/com/homeservice/
│       │   ├── auth/         # JWT, login, registration, security
│       │   ├── ai/           # diagnosis agent + hazard-override safety layer
│       │   ├── booking/      # booking state machine
│       │   ├── worker/       # worker profiles + location search
│       │   ├── review/       # ratings & reviews
│       │   ├── admin/        # worker verification
│       │   ├── category/     # service categories
│       │   ├── user/         # user model
│       │   └── common/       # config, security, exceptions
│       └── resources/
│           ├── application.yml
│           └── db/migration/ # Flyway SQL migrations (V1–V9)
└── frontend/
    └── src/
        ├── features/
        │   ├── auth/         # login, register, dashboard
        │   ├── diagnosis/    # AI chat
        │   ├── search/       # find a professional
        │   ├── booking/      # bookings & ratings
        │   ├── worker/       # worker profile
        │   └── admin/        # verification queue
        ├── components/       # shared UI (TopNav, etc.)
        ├── context/          # AuthContext
        └── lib/              # Axios API client
```

---

## 🔒 Security Highlights

- **JWT authentication** — short-lived access tokens (15 min), stateless verification.
- **Refresh-token rotation** — only the SHA-256 hash is stored, so a database leak can't be replayed.
- **BCrypt** password hashing (cost factor 12).
- **Role-based access control** via `@PreAuthorize`.
- **Input validation** with Jakarta Validation.
- **Parameterized queries** (JPA) to prevent SQL injection.

---

## 🧠 The AI Safety Layer

The diagnosis agent combines the flexibility of a language model with the reliability of deterministic rules:

1. The **LLM** classifies the problem and assesses severity.
2. A **deterministic hazard-override** scans the conversation for danger keywords (gas, sparking, live wire, etc.).
3. This layer can **only escalate** severity — never reduce it — so a dangerous issue always triggers a professional referral, even if the model downplays it.

This one-directional safety design ensures the system never trades safety for the model's convenience.

---

## 🗺️ Roadmap

- [ ] Image-based diagnosis (upload a photo of the problem — requires a vision model)
- [ ] Real-time booking notifications
- [ ] In-app messaging between homeowner and worker
- [ ] Payment integration
- [ ] Map view of nearby workers

---

## 👤 Author

**Chamath Lasindu Rajapaksha**
Software Engineering undergraduate — SLTC


---

## 📄 License

This project is for educational purposes.
