CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8;
USE `project`;

CREATE TABLE `board_watched` (
  `watched_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '시청 이력 PK',
  `watcher_id` VARCHAR(50) NOT NULL COMMENT '시청자 PK(cookie_id)',
  `board_id` INT NOT NULL COMMENT '게시판 PK',
  `created_datetime` DATETIME DEFAULT current_timestamp() COMMENT '등록일시',
  PRIMARY KEY (`watched_id`),
  UNIQUE KEY `UNIQUE_IDX_WATCHER_ID_BOARD_ID` (`watcher_id`,`board_id`)/*,
  CONSTRAINT `FK_BOARD_WATCHED_TO_BOARD` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판 시청 이력';
