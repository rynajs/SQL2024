
CREATE TABLE employees (
    empl_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL CHECK (empl_id <= 2147483647),
    fname NVARCHAR(50) NOT NULL,
    lname NVARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    hire_date DATETIME NOT NULL,
    hire_date_ltz DATETIMEOFFSET NOT NULL
);

CREATE TABLE products (
    prod_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL CHECK (prod_id <= 2147483647),
    [description] NVARCHAR(50),
    qty_on_hand SMALLINT NOT NULL CHECK (qty_on_hand <= 32767),
    price DECIMAL(15, 2) NOT NULL CHECK (price > 0)
);


CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL CHECK (order_id <= 2147483647),
    order_date DATETIME NOT NULL,
    order_date_ltz DATETIMEOFFSET NOT NULL, 
    empl_id INT NOT NULL CHECK (empl_id <= 2147483647),
    prod_id INT NOT NULL CHECK (prod_id <= 2147483647),
    qty SMALLINT NOT NULL CHECK (qty > 0 AND qty <= 32767),
    amount DECIMAL(15, 2) NOT NULL CHECK (amount > 0),
    FOREIGN KEY (empl_id) REFERENCES employees(empl_id),
    FOREIGN KEY (prod_id) REFERENCES products(prod_id)
);

INSERT INTO products ([description], qty_on_hand, price) VALUES
('Lenovo', 250, 1200.00),
('Asus', 200, 1250.00),
('Dell', 150, 1000.00);


INSERT INTO employees (fname, lname, birthday, hire_date, hire_date_ltz) VALUES
('John', 'Doe', '1982-05-15', '2020-01-15 08:00:00', '2020-01-15 09:00:00'),
('Jane', 'Doe', '1990-10-25', '2020-02-20 14:30:00', '2020-02-20 15:30:00'),
('Jonh', 'Snow', '1985-03-09', '2020-03-10 12:00:00', '2020-03-10 13:00:00');


INSERT INTO orders (order_date, order_date_ltz, empl_id, prod_id, qty, amount) VALUES
('2024-07-31 10:00:00', '2024-07-31 11:00:00', 1, 1, 2, 2400.00),
('2024-08-01 12:00:00', '2024-08-01 13:00:00', 2, 2, 2, 2500.00),
('2024-08-02 18:00:00', '2024-08-02 19:00:00', 3, 3, 2, 2000.00);


SELECT * FROM products;