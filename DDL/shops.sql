CREATE TABLE `shops` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `station_id` bigint DEFAULT 0,
  `create_user` bigint NOT NULL DEFAULT 1,
  `is_deleted` boolean DEFAULT 0,
  `create_at` datetime NOT NULL,
  `delete_at` datetime,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
shops
(`name`,
 `create_user`,
 `create_at`)
VALUES
('test_shop', '1', now());