-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `1StopShop_db`;
USE `1StopShop_db`;

-- --------------------------------------------------------
-- Table structure for `Customers`
--
-- This table stores information about each customer.
-- `customer_id` is the primary key.
-- `email` is unique to prevent duplicate customer accounts.
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customers` (
  `customer_id` INT AUTO_INCREMENT PRIMARY KEY,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `registration_date` DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table structure for `Products`
--
-- This table stores details about each product for sale.
-- `product_id` is the primary key.
-- `product_name` is unique to ensure no two products have the same name.
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Products` (
  `product_id` INT AUTO_INCREMENT PRIMARY KEY,
  `product_name` VARCHAR(255) NOT NULL UNIQUE,
  `description` TEXT,
  `price` DECIMAL(10, 2) NOT NULL,
  `stock_quantity` INT NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table structure for `Orders`
--
-- This table stores information about customer orders.
-- `order_id` is the primary key.
-- `customer_id` is a foreign key to link an order to a customer.
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Orders` (
  `order_id` INT AUTO_INCREMENT PRIMARY KEY,
  `customer_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  `status` ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL DEFAULT 'Pending',
  FOREIGN KEY (`customer_id`) REFERENCES `Customers`(`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table structure for `Order_Items`
--
-- This is a junction table to resolve the many-to-many relationship
-- between Orders and Products.
-- `order_item_id` is the primary key.
-- `order_id` and `product_id` are foreign keys.
-- The combination of `order_id` and `product_id` could also be a unique index
-- to prevent duplicate items in the same order.
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Order_Items` (
  `order_item_id` INT AUTO_INCREMENT PRIMARY KEY,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `price_at_purchase` DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (`order_id`) REFERENCES `Orders`(`order_id`),
  FOREIGN KEY (`product_id`) REFERENCES `Products`(`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
