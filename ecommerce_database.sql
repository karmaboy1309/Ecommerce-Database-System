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
