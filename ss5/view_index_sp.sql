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
create unique index idx_productcode on products(product_code);
create index cpidx_product on products(product_name, product_price);
explain select * from products where product_code = 'P004';
explain select * from products where product_name = 'Samsung QLED TV' and product_price = 750000;
create view vw_product as
    select
        products.product_code as product_code,
        products.product_name as product_name,
        products.product_price as product_price,
        products.product_status as product_status
from products;
update vw_product
set product_name = 'Apple iPhone 15'
where product_code= 'P001';
drop view vw_product;
DELIMITER //
CREATE PROCEDURE get_all_products()
BEGIN
    SELECT * FROM products;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE add_product(
    IN p_product_code VARCHAR(10),
    IN p_product_name VARCHAR(50),
    IN p_product_price INT,
    IN p_product_amount VARCHAR(50),
    IN p_product_description VARCHAR(255),
    IN p_product_status BIT
)
BEGIN
    INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
    VALUES (p_product_code, p_product_name, p_product_price, p_product_amount, p_product_description, p_product_status);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE update_product(
    IN p_id INT,
    IN p_product_code VARCHAR(10),
    IN p_product_name VARCHAR(50),
    IN p_product_price INT,
    IN p_product_amount VARCHAR(50),
    IN p_product_description VARCHAR(255),
    IN p_product_status BIT
)
BEGIN
    UPDATE products
    SET
        product_code = p_product_code,
        product_name = p_product_name,
        product_price = p_product_price,
        product_amount = p_product_amount,
        product_description = p_product_description,
        product_status = p_product_status
    WHERE id = p_id;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE delete_product(
    IN p_id INT
)
BEGIN
    DELETE FROM products WHERE id = p_id;
END //
DELIMITER ;
call add_product('P011', 'Apple Watch Series 7', 450000, '20', 'Smartwatch with advanced health monitoring features.', 1)

