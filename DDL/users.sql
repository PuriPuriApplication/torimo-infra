CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `external_service_id` varchar(50) NOT NULL,
  `external_service_type` varchar(15) NOT NULL,
  `is_deleted` boolean DEFAULT 0,
  `create_at` datetime,
  `update_at` datetime,
  `delete_at` datetime,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8