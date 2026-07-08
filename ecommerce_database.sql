
-- ==========================================
-- E-COMMERCE DATABASE MANAGEMENT SYSTEM
-- ==========================================

CREATE DATABASE IF NOT EXISTS ecommerce_db;

USE ecommerce_db;
-- ==========================================
-- USERS TABLE
-- ==========================================

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- ==========================================
-- CATEGORIES TABLE
-- ==========================================

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);
-- ==========================================
-- SAMPLE USERS
-- ==========================================

INSERT INTO users
(first_name, last_name, email, password, phone, city)
VALUES
('Darshan','Makwana','darshan@example.com','password123','9876543210','Ahmedabad'),
('Rahul','Patel','rahul@example.com','password123','9876501234','Surat'),
('Priya','Shah','priya@example.com','password123','9876512345','Vadodara');

-- ==========================================
-- SAMPLE CATEGORIES
-- ==========================================

INSERT INTO categories
(category_name, description)
VALUES
('Electronics','Electronic gadgets and accessories'),
('Fashion','Clothing and fashion products'),
('Books','Books and study materials'),
('Home Appliances','Home and kitchen appliances');

-- ==========================================
-- BRANDS TABLE
-- ==========================================

CREATE TABLE brands (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL UNIQUE,
    country_of_origin VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- SAMPLE BRAND DATA
-- ==========================================

INSERT INTO brands (brand_name, country_of_origin)
VALUES
('Apple', 'USA'),
('Samsung', 'South Korea'),
('Nike', 'USA'),
('Adidas', 'Germany'),
('Sony', 'Japan');
-- ==========================================
-- SUPPLIERS TABLE
-- ==========================================

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- SAMPLE SUPPLIER DATA
-- ==========================================

INSERT INTO suppliers
(supplier_name, contact_person, email, phone, city)
VALUES
('Tech Distributors', 'Raj Mehta', 'raj@techdist.com', '9876543211', 'Mumbai'),
('Fashion World', 'Neha Shah', 'neha@fashionworld.com', '9876543212', 'Delhi'),
('Book Planet', 'Amit Patel', 'amit@bookplanet.com', '9876543213', 'Ahmedabad');
-- ==========================================
-- INDEXES
-- ==========================================

CREATE INDEX idx_user_email
ON users(email);

CREATE INDEX idx_category_name
ON categories(category_name);

CREATE INDEX idx_brand_name
ON brands(brand_name);

CREATE INDEX idx_supplier_name
ON suppliers(supplier_name);
-- ==========================================
-- PRODUCTS TABLE
-- ==========================================

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    brand_id INT NOT NULL,
    supplier_id INT NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    sku VARCHAR(50) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id),

    FOREIGN KEY (brand_id)
        REFERENCES brands(brand_id),

    FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id)
);
-- ==========================================
-- SAMPLE PRODUCTS
-- ==========================================

INSERT INTO products
(category_id, brand_id, supplier_id, product_name, description, price, stock_quantity, sku)
VALUES
(1, 1, 1, 'iPhone 16', 'Latest Apple smartphone', 89999.00, 25, 'APL-IP16-001'),

(1, 2, 1, 'Samsung Galaxy S25', 'Flagship Android smartphone', 79999.00, 30, 'SMS-S25-002'),

(2, 3, 2, 'Nike Air Max', 'Premium running shoes', 6999.00, 50, 'NK-AM-003'),

(2, 4, 2, 'Adidas Ultraboost', 'Comfort sports shoes', 8499.00, 35, 'AD-UB-004'),

(3, 5, 3, 'SQL Mastery Book', 'Comprehensive SQL learning guide', 799.00, 100, 'BK-SQL-005');

-- ==========================================
-- PRODUCT INVENTORY TABLE
-- ==========================================

CREATE TABLE product_inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity_available INT NOT NULL DEFAULT 0,
    quantity_reserved INT DEFAULT 0,
    warehouse_location VARCHAR(100),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- ==========================================
-- SAMPLE INVENTORY DATA
-- ==========================================

INSERT INTO product_inventory
(product_id, quantity_available, quantity_reserved, warehouse_location)
VALUES
(1, 50, 5, 'Warehouse A'),
(2, 35, 3, 'Warehouse A'),
(3, 80, 10, 'Warehouse B'),
(4, 60, 8, 'Warehouse B'),
(5, 120, 15, 'Warehouse C');


-- ==========================================
-- PRODUCT IMAGES TABLE
-- ==========================================

CREATE TABLE product_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- ==========================================
-- SAMPLE IMAGE DATA
-- ==========================================

INSERT INTO product_images
(product_id, image_url, is_primary)
VALUES
(1, 'images/iphone16_front.jpg', TRUE),
(1, 'images/iphone16_back.jpg', FALSE),
(2, 'images/galaxy_s25.jpg', TRUE),
(3, 'images/nike_airmax.jpg', TRUE),
(5, 'images/sql_book.jpg', TRUE);
