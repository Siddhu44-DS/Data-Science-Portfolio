CREATE DATABASE TARGET
use target

#create Tables
CREATE TABLE customers (
    customer_id VARCHAR(255) NOT NULL,
    customer_unique_id VARCHAR(255) NOT NULL,
    customer_zip_code_prefix INT,
    customer_city VARCHAR(255),
    customer_state VARCHAR(255),
    PRIMARY KEY (customer_id)
);

CREATE TABLE sellers (
    seller_id VARCHAR(255) NOT NULL,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(255),
    seller_state VARCHAR(255),
    PRIMARY KEY (seller_id)
);

CREATE TABLE order_items (
    order_id VARCHAR(255) NOT NULL,
    order_item_id INT NOT NULL,
    product_id VARCHAR(255),
    seller_id VARCHAR(255),
    shipping_limit_date DATETIME,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, order_item_id)
);

CREATE TABLE geolocations (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(10, 6),
    geolocation_lng DECIMAL(10, 6),
    geolocation_city VARCHAR(255),
    geolocation_state VARCHAR(255)
);

CREATE TABLE payments (
    order_id VARCHAR(255) NOT NULL,
    payment_sequential INT NOT NULL,
    payment_type VARCHAR(255),
    payment_installments INT,
    payment_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, payment_sequential)
);

CREATE TABLE orders (
    order_id VARCHAR(255) NOT NULL,
    customer_id VARCHAR(255),
    order_status VARCHAR(255),
    order_purchase_timestamp DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,
    PRIMARY KEY (order_id)
);

CREATE TABLE reviews (
    review_id VARCHAR(255) NOT NULL,
    order_id VARCHAR(255),
    review_score INT,
    review_comment_title VARCHAR(255),
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME,
    PRIMARY KEY (review_id)
);

CREATE TABLE products (
    product_id VARCHAR(255) NOT NULL,
    product_category_name VARCHAR(255),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT,
    PRIMARY KEY (product_id)
);

select * from customers
limit 5

select * from geolocation
limit 5

select * from order_items
limit 5

select * from order_reviews
limit 5

select * from orders
limit 5

select * from payments
limit 5

select * from products
limit 5

select * from sellers
limit 5


