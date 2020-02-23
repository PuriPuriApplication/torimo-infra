CREATE TABLE `article_categories` (
  `article_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`article_id`, `category_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO article_categories VALUES ('1', '1');