CREATE TABLE IF NOT EXISTS `article_categories` (
  `article_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`article_id`, `category_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT IGNORE INTO article_categories VALUES ('1', '1');