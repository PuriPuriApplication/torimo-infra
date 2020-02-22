CREATE TABLE `ArticleTags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `create_user` int NOT NULL DEFAULT 0,
  `is_deleted` boolean DEFAULT 0,
  `create_at` datetime,
  `delete_at` datetime,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8