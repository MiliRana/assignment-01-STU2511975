-- Dimension Table: Date

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    year INT,
    month INT,
    day INT
);


-- Dimension Table: Store

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50),
    region VARCHAR(50)
);


-- Dimension Table: Product

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);


-- Fact Table: Sales

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    sales_amount DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-- Insert cleaned data into dim_date

INSERT INTO dim_date VALUES
(1,'2024-01-01',2024,1,1),
(2,'2024-01-02',2024,1,2),
(3,'2024-01-03',2024,1,3);


-- Insert cleaned data into dim_store

INSERT INTO dim_store VALUES
(101,'Central Store','Mumbai','West'),
(102,'City Mall','Delhi','North'),
(103,'Tech Plaza','Bangalore','South');


-- Insert cleaned data into dim_product

INSERT INTO dim_product VALUES
(201,'Laptop','Electronics'),
(202,'T-Shirt','Clothing'),
(203,'Rice Pack','Groceries');


-- Insert cleaned sample fact data

INSERT INTO fact_sales VALUES
(1,1,101,201,2,120000),
(2,1,101,202,5,5000),
(3,1,102,203,10,4000),
(4,2,103,201,1,60000),
(5,2,102,202,3,3000),
(6,2,101,203,8,3200),
(7,3,103,201,2,120000),
(8,3,101,202,4,4000),
(9,3,102,203,6,2400),
(10,3,103,202,2,2000);
