CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int,
  `body` text,
  `status` varchar(16) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
articles
(`title`,
 `user_id`,
 `shop_id`,
 `body`,
 `status`,
 `create_at`)
VALUES
('test_title', '1', '1', 'このお店おいしい！！', 'publish', now());