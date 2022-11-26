CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8;
USE `project`;

CREATE TABLE `file` (
  `file_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '파일 PK',
  `file_upload_path` VARCHAR(255) NOT NULL COMMENT '경로',
  `file_upload_name` VARCHAR(128) NOT NULL COMMENT '파일명',
  `file_origin_name` VARCHAR(128) NOT NULL COMMENT '원본명',
  `file_upload_ext` VARCHAR(10) NOT NULL COMMENT '파일 확장자',
  `file_upload_size` DECIMAL(15,2) UNSIGNED NOT NULL COMMENT '파일 크기 (Byte)',
  `created_datetime` DATETIME DEFAULT current_timestamp() COMMENT '등록일시',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='파일';
