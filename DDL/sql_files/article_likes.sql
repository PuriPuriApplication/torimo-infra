CREATE TABLE IF NOT EXISTS `article_likes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `article_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT IGNORE INTO article_likes VALUES ('1', '1', '1');