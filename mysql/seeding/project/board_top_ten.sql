CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8;
USE `project`;

CREATE TABLE `board` (
  `top_ten_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Top PK',
  `date` DATE NOT NULL COMMENT '날짜',
  `board_id_json` VARCHAR(255) NOT NULL COMMENT '게시판 PK (Json)',
  `created_datetime` DATETIME DEFAULT current_timestamp() COMMENT '등록일시',
  PRIMARY KEY (`top_ten_id`),
  UNIQUE KEY `UNIQUE_IDX_DATE` (`date`)/*,
  CONSTRAINT `FK_BOARD_TO_MEMBER` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판 Top 10';
