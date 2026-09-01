# Phase 2 — Docker Containerization

## Objective

Containerize the frontend, backend, and PostgreSQL database
using Docker and Docker Compose.

## Architecture

Browser
    |
    | localhost:3000
    v
Frontend Container
    |
    | localhost:8000
    v
Backend Container
    |
    | postgres:5432
    v
PostgreSQL Container

## Containers

### Frontend

Container:
devops-frontend

Port:
3000

### Backend

Container:
devops-backend

Port:
8000

### PostgreSQL

Container:
devops-postgres

Container Port:
5432

Host Port:
5433

## Important Networking Concept

The backend does NOT use localhost to connect to PostgreSQL.

Backend:

host = postgres
port = 5432

The PostgreSQL service name "postgres" is resolved
through Docker Compose DNS.

The host mapping:

5433:5432

means:

Mac port 5433 -> PostgreSQL container port 5432.

## Docker Commands

Build:

docker compose build

Start:

docker compose up -d

Stop:

docker compose down

Status:

docker compose ps

Logs:

docker compose logs

Backend logs:

docker compose logs backend

Database logs:

docker compose logs postgres

## Tests

Frontend:

curl -I http://localhost:3000

Backend:

curl http://localhost:8000/health

Products:

curl http://localhost:8000/products

## Result

Frontend, backend and PostgreSQL are successfully
running as Docker containers.