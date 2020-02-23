CREATE TABLE `article_categories` (
  `article_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`article_id`, `category_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO article_categories VALUES ('1', '1');