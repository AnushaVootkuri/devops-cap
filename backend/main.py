from fastapi import FastAPI
import psycopg2

app = FastAPI()


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
        host="localhost",
        database="devopsdb",
        user="devopsuser",
        password="devopspass"
    )

    cursor = connection.cursor()

    cursor.execute(
        "SELECT id, name, price FROM products"
    )

    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    return {
        "products": [
            {
                "id": row[0],
                "name": row[1],
                "price": float(row[2])
            }
            for row in rows
        ]
    }
