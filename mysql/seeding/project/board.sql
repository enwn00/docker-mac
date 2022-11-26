CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8;
USE `project`;

CREATE TABLE `board` (
  `board_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '게시판 PK',
  `title` VARCHAR(125) NOT NULL COMMENT '제목',
  `content` VARCHAR(255) NOT NULL COMMENT '내용',
  `member_id` INT NOT NULL COMMENT '작성자 PK',
  `view_count` INT NOT NULL COMMENT '조회수',
  `like_count` INT NOT NULL COMMENT '추천수',
  `is_used` CHAR(1) NOT NULL DEFAULT 'Y' COMMENT '상태(Y:사용, N:미사용)',
  `created_datetime` DATETIME DEFAULT current_timestamp() COMMENT '등록일시',
  PRIMARY KEY (`board_id`)/*,
  CONSTRAINT `FK_BOARD_TO_MEMBER` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판';

INSERT INTO board (board_id, title, content, member_id, view_count, like_count)
VALUES (1, '테스트 제목1', '테스트 내용1', 1, 100, 1),
       (2, '테스트 제목2', '테스트 내용2', 2, 10, 10),
       (3, '테스트 제목3', '테스트 내용3', 3, 123, 32),
       (4, '테스트 제목4', '테스트 내용4', 4, 42, 10),
       (5, '테스트 제목5', '테스트 내용5', 5, 760, 10),
       (6, '테스트 제목6', '테스트 내용6', 6, 1060, 0),
       (7, '테스트 제목7', '테스트 내용7', 7, 120, 13),
       (8, '테스트 제목8', '테스트 내용8', 8, 150, 17),
       (9, '테스트 제목9', '테스트 내용9', 9, 400, 20),
       (10, '테스트 제목10', '테스트 내용10', 10, 0, 0),
       (11, '테스트 제목11', '테스트 내용11', 1, 0, 0),
       (12, '테스트 제목12', '테스트 내용12', 2, 0, 0),
       (13, '테스트 제목13', '테스트 내용13', 3, 0, 0),
       (14, '테스트 제목14', '테스트 내용14', 4, 0, 0),
       (15, '테스트 제목15', '테스트 내용15', 5, 0, 0),
       (16, '테스트 제목16', '테스트 내용16', 6, 0, 0),
       (17, '테스트 제목17', '테스트 내용17', 7, 0, 0),
       (18, '테스트 제목18', '테스트 내용18', 8, 0, 0),
       (19, '테스트 제목19', '테스트 내용19', 9, 0, 0),
       (20, '테스트 제목20', '테스트 내용20', 10, 0, 0),
       (21, '테스트 제목21', '테스트 내용21', 1, 0, 0),
       (22, '테스트 제목22', '테스트 내용22', 2, 0, 0),
       (23, '테스트 제목23', '테스트 내용23', 3, 0, 0),
       (24, '테스트 제목24', '테스트 내용24', 4, 0, 0),
       (25, '테스트 제목25', '테스트 내용25', 5, 0, 0),
       (26, '테스트 제목26', '테스트 내용26', 6, 0, 0),
       (27, '테스트 제목27', '테스트 내용27', 7, 0, 0),
       (28, '테스트 제목28', '테스트 내용28', 8, 0, 0),
       (29, '테스트 제목29', '테스트 내용29', 9, 0, 0),
       (30, '테스트 제목30', '테스트 내용30', 10, 0, 0);
