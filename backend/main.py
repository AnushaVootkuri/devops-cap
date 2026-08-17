from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import psycopg2
import os

app = FastAPI()

# Allow our local frontend to communicate with the backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def root():
    return {
        "application": "DevOps Capstone",
        "message": "Backend is running"
    }


@app.get("/health")
def health():
    return {
        "status": "healthy"
    }


@app.get("/products")
def products():

    connection = psycopg2.connect(
        host=os.getenv("POSTGRES_HOST"),
        port=os.getenv("POSTGRES_PORT"),
        database=os.getenv("POSTGRES_DB"),
        user=os.getenv("POSTGRES_USER"),
        password=os.getenv("POSTGRES_PASSWORD")
    )

    cursor = connection.cursor()

    cursor.execute(
        "SELECT id, name, price FROM products"
    )

    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    return {
        "products"
        "": [
            {
                "id": row[0],
                "name": row[1],
                "price": float(row[2])
            }
            for row in rows
        ]
    }
