CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO products (name, price)
VALUES
('Laptop', 1200.00),
('Keyboard', 75.00),
('Mouse', 35.00),
('Monitor', 300.00);




