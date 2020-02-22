CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int,
  `body` varchar(500),
  `header_image` varchar(500),
  `is_deleted` boolean DEFAULT 0,
  `create_at` datetime,
  `update_at` datetime,
  `delete_at` datetime,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8