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
