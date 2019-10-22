/*create database pramatikart;*/
use pramatikart;

/*DROP TABLE  pramatikart_sale,   pramatikart_offers,pramatikart_payment,pramatikart_orders,  pramatikart_cart ,pramatikart_product, pramatikart_product_category,pramatikart_user, pramatikart_address ;*/

DROP TABLE  sale, offers,payment,orders,  cart ,product, product_category,user, address ;

CREATE TABLE `address` (
  `id` bigint(20)  Primary Key AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `state_name` varchar(200) DEFAULT NULL,
  `delete_status` int(10) DEFAULT '0'
) ;




CREATE TABLE `user` (
  `id` bigint(20) Primary Key AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
   `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
   `billing_address_id` bigint(20) DEFAULT NULL,
  `shipping_address_id` bigint(20) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `delete_status` int(10) DEFAULT '0',
  FOREIGN KEY (`billing_address_id`) REFERENCES address(id),
  FOREIGN KEY (`shipping_address_id`) REFERENCES address(id)
) ;

CREATE TABLE `product_category` (
  `id` bigint(20) NOT NULL Primary Key AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `delete_status` int(10) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL
) ;




CREATE TABLE `product` (
  `id` bigint(20)  NOT NULL Primary Key AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `price` float(20,3) DEFAULT 0,
  `discount` float(20,3) DEFAULT 0,
  `quantity` bigint(20) DEFAULT 0,
  `delete_status` int(10) DEFAULT '0',
   FOREIGN KEY (`category_id`) REFERENCES product_category(id)
) ;


CREATE TABLE `orders` (
  `id` bigint(20)  NOT NULL Primary Key AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `customer_id` bigint(20) DEFAULT NULL,
  `date_of_purchase` datetime DEFAULT CURRENT_TIMESTAMP,
   `shipping_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `amount` float(20,3) DEFAULT 0,
  `order_status` varchar(255) DEFAULT 0,
  `product_id`  bigint(20) DEFAULT NULL,
  `delete_status` int(10) DEFAULT '0',
  FOREIGN KEY (`customer_id`) REFERENCES user(id),
FOREIGN KEY (`product_id`) REFERENCES product(id)
) ;



CREATE TABLE `payment` (
  `id` bigint(20)  NOT NULL Primary Key AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `transaction_number` varchar(255) DEFAULT NULL,
  `mode_of_payment` varchar(255) DEFAULT NULL,
  `amount` float(20,3) DEFAULT 0,
  `date_of_payment`  datetime DEFAULT CURRENT_TIMESTAMP,
  `delete_status` int(10) DEFAULT '0',
  `order_id`  bigint(20)  DEFAULT NULL,
  FOREIGN KEY (`order_id`) REFERENCES orders(id)
) ;



CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL Primary Key AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `customer_id` bigint(20) DEFAULT NULL,
  `product_id`  bigint(20) DEFAULT NULL,
  `quantity` bigint(20)  DEFAULT 0,
  `total_price` float(20,3) DEFAULT 0,
  FOREIGN KEY (`customer_id`) REFERENCES user(id),
    FOREIGN KEY (`product_id`) REFERENCES product(id)
) ;



CREATE TABLE `offers` (
  `id` bigint(20) NOT NULL Primary Key AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `category_id`  bigint(20) DEFAULT NULL,
  `discount` float(20,3) DEFAULT 0,
  FOREIGN KEY (`category_id`) REFERENCES product_category(id)
) ;



CREATE TABLE `sale` (
  `id` bigint(20)  NOT NULL Primary Key AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) DEFAULT 'admin@pramatikart.com',
  `last_modified_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `product_id`  bigint(20) DEFAULT NULL,
   `discount` float(20,3) DEFAULT 0,
  FOREIGN KEY (`product_id`) REFERENCES product(id)
) ;

select * from user;
