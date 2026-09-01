# DevOps Capstone - Phase 1 Architecture

## Architecture

```text
                     Browser
                        |
                        | HTTP :3000
                        v
                +----------------+
                |    Frontend    |
                |    index.html  |
                | Python Server  |
                +-------+--------+
                        |
                        | HTTP :8000
                        | /health
                        | /products
                        v
                +----------------+
                |    Backend     |
                |    FastAPI     |
                |    Uvicorn     |
                +-------+--------+
                        |
                        | PostgreSQL :5432
                        v
                +----------------+
                |   PostgreSQL   |
                |    devopsdb    |
                +-------+--------+
                        |
                        v
                   products
                    tableComponents
Frontend

Technology: HTML / JavaScript
Server: Python HTTP Server
Port: 3000

Backend

Technology: Python / FastAPI
Server: Uvicorn
Port: 8000

Database

Technology: PostgreSQL
Port: 5432
Database: devopsdb
Table: produCommunication

Browser → Frontend: HTTP

Frontend → Backend: HTTP REST API

Backend → Database: PostgreSQL

API Endpoints

GET /health

GET /products
