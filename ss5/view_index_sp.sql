create database demo;
use demo;
create table products(
    id int auto_increment primary key ,
    product_code varchar(10) not null unique ,
    product_name varchar(50),
    product_price int,
    product_amount varchar(50),
    product_description varchar(255),
    product_status bit
);
INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES
    ('P001', 'Apple iPhone 14', 1000000, '20', 'Latest Apple iPhone with A15 Bionic chip and advanced camera features.', 1),
    ('P002', 'Samsung Galaxy S22', 950000, '50', 'Newest Samsung Galaxy with AMOLED display and Exynos 2200 chipset.', 1),
    ('P003', 'Google Pixel 6', 800000, '10', 'Google\'s flagship phone with Tensor chip and pure Android experience.', 0),
    ('P004', 'OnePlus 10 Pro', 850000, '30', 'OnePlus phone with Snapdragon 8 Gen 1 and fluid AMOLED display.', 1),
    ('P005', 'Sony WH-1000XM4', 300000, '25', 'Noise-canceling over-ear headphones with superior sound quality.', 0),
    ('P006', 'Dell XPS 13', 1200000, '15', 'Ultra-thin laptop with Intel i7 processor and 4K display.', 1),
    ('P007', 'Apple MacBook Air M1', 1100000, '40', 'Lightweight laptop with Apple M1 chip and long battery life.', 0),
    ('P008', 'Samsung QLED TV', 750000, '10', '55-inch QLED TV with 4K resolution and smart TV features.', 1),
    ('P009', 'Bose SoundLink', 200000, '35', 'Portable Bluetooth speaker with rich sound and durable design.', 1),
    ('P010', 'Sony PlayStation 5', 1500000, '5', 'Next-gen gaming console with powerful GPU and SSD storage.', 0);