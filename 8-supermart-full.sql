-- Guess who lost their SQL and had to dump a database
-- This is machine-written SQL.  It's a bit gross, sorry.

-- Dumping database structure for supermart
CREATE DATABASE IF NOT EXISTS `supermart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `supermart`;

-- Dumping structure for table supermart.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age_restricted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table supermart.categories: ~7 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `age_restricted`) VALUES
	(2, 'homewares', 0),
	(3, 'games', 0),
	(4, 'produce', 0),
	(5, 'alcohol', 1),
	(6, 'clothing', 0),
	(7, 'books', 0);

-- Dumping structure for table supermart.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `suburb` varchar(15) DEFAULT NULL,
  `post_code` varchar(4) DEFAULT NULL,
  `state` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Dumping structure for table supermart.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int unsigned NOT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table supermart.orders: ~0 rows (approximately)

-- Dumping structure for table supermart.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table supermart.products: ~6 rows (approximately)
INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`) VALUES
	(1, 2, 'Couch', 'A stylish mid-century modern couch', 13501),
	(2, 4, 'Cabbage', 'Cruciform vegetable, extremely fresh', 6528),
	(3, 4, 'Potato', 'I am culturally obliged not to joke about these', 12139),
	(4, 3, 'CotL', 'Totally normal roguelike game', 1113),
	(10, 4, 'Fans', 'it windy', 123);


-- Dumping structure for table supermart.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `branding_color` char(6) DEFAULT NULL,
  `type_of_shop` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table supermart.shops: ~0 rows (approximately)

-- Dumping structure for table supermart.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int unsigned NOT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `shop_id` int unsigned DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table supermart.stock: ~0 rows (approximately)

-- Dumping structure for view supermart.c_products
-- Removing temporary table and create final VIEW structure

CREATE VIEW `c_products` AS 
select `products`.`name` AS `name`,`products`.`category_id` AS `category_id`,`products`.`description` AS `description`,`products`.`price` AS `price` from `products` 
where (`products`.`name` like 'c%');

CREATE VIEW `readable_products` AS select `categories`.`name` AS `category`,`products`.`name` AS `product`,`products`.`price` AS `price`,`products`.`description` AS `description` from (`products` join `categories` on((`products`.`category_id` = `categories`.`id`)));

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
