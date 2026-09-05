CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO products (name, price)
SELECT 'Laptop', 1200.00
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE name = 'Laptop'
);

INSERT INTO products (name, price)
SELECT 'Keyboard', 75.00
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE name = 'Keyboard'
);

INSERT INTO products (name, price)
SELECT 'Mouse', 35.00
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE name = 'Mouse'
);

INSERT INTO products (name, price)
SELECT 'Monitor', 300.00
WHERE NOT EXISTS (
    SELECT 1 FROM products WHERE name = 'Monitor'
);



