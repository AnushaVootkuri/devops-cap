# Phase 3 — Environment Variables

## Objective

Remove hardcoded database configuration from the application
and use environment variables managed through Docker Compose.

## Configuration Flow

.env
 |
 v
Docker Compose
 |
 +-------------------+
 |                   |
 v                   v
Backend           PostgreSQL
 |
 v
os.getenv()
 |
 v
Python application

## Environment Variables

POSTGRES_DB
POSTGRES_USER
POSTGRES_PASSWORD
POSTGRES_HOST
POSTGRES_PORT

## Backend Database Configuration

The backend reads database configuration using:

os.getenv()

The backend connects using:

host = postgres
port = 5432

## Important Docker Networking Concept

The backend connects to PostgreSQL using:

postgres:5432

It does not use:

localhost:5433

5433 is the host port.

5432 is the PostgreSQL container port.

## Security

.env is excluded from Git using .gitignore.

Database passwords should not be committed to GitHub.

## Testing

Frontend:

curl -I http://localhost:3000

Backend:

curl http://localhost:8000/health

Database/API:

curl http://localhost:8000/products

Environment variables:

docker exec devops-backend env | grep POSTGRES

## Troubleshooting

Incorrect database password causes PostgreSQL authentication failure.

Incorrect POSTGRES_HOST causes Docker DNS/connection failure.

## Result

Application successfully uses environment variables
instead of hardcoded database configuration.