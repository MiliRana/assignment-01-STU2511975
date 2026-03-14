CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address TEXT
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

CREATE TABLE order_items (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
('C001','Rahul Sharma','rahul@email.com','Mumbai'),
('C002','Anita Mehta','anita@email.com','Delhi'),
('C003','Amit Patel','amit@email.com','Mumbai'),
('C004','Neha Singh','neha@email.com','Bangalore'),
('C005','Ravi Kumar','ravi@email.com','Chennai');

INSERT INTO products VALUES
('P001','Laptop','Electronics',55000),
('P002','Mouse','Electronics',500),
('P003','Keyboard','Electronics',1200),
('P004','Notebook','Stationery',120),
('P005','Pen','Stationery',20);

INSERT INTO sales_reps VALUES
('S001','Arjun Verma','arjun@company.com','Mumbai Office'),
('S002','Priya Nair','priya@company.com','Delhi Office'),
('S003','Rohan Kapoor','rohan@company.com','Bangalore Office'),
('S004','Sneha Iyer','sneha@company.com','Chennai Office'),
('S005','Karan Shah','karan@company.com','Mumbai Office');

INSERT INTO orders VALUES
('O001','C001','S001','2024-01-10'),
('O002','C002','S002','2024-01-12'),
('O003','C003','S001','2024-01-15'),
('O004','C004','S003','2024-01-18'),
('O005','C005','S002','2024-01-20');

INSERT INTO order_items VALUES
('O001','P001',1),
('O001','P002',2),
('O002','P003',1),
('O003','P004',5),
('O004','P005',10);
