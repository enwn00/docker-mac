CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8;
USE `project`;

CREATE TABLE `member` (
  `member_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '회원 PK',
  `name` VARCHAR(20) NOT NULL COMMENT '회원명',
  `nickname` VARCHAR(20) NOT NULL COMMENT '회원 닉네임',
  `login_id` VARCHAR(20) NOT NULL COMMENT '로그인 ID',
  `login_password` VARCHAR(20) NOT NULL COMMENT '로그인 패스워드',
  `email` VARCHAR(50) NOT NULL COMMENT '이메일',
  `tel` VARCHAR(13) NOT NULL COMMENT '전화번호',
  `sex` CHAR(1) NOT NULL COMMENT '성별(1:남성, 2:여성)',
  `birthday` VARCHAR(10) NOT NULL COMMENT '생년월일',
  `birthday_type` CHAR(1) NOT NULL DEFAULT 'T' COMMENT '윤달(T:양력, F:음력)',
  `member_status` CHAR(1) NOT NULL DEFAULT '1' COMMENT '회원 상태(1:일반, 2:차단, 3:정지, 4:탈퇴)',
  `created_datetime` DATETIME DEFAULT current_timestamp() COMMENT '등록일시',
 PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원';


INSERT INTO member (member_id, name, nickname, login_id, login_password, email, tel, sex, birthday)
VALUES (1, '이름1', '닉네임1', 'test_id', 'test1234!@', 'test@test.co', '010-0000-0000', 1, '1989-12-23'),
       (2, '이름2', '닉네임2', 'test_id', 'test1234!@', 'test@test.co', '010-0000-0000', 1, '1989-12-23'),
       (3, '이름3', '닉네임3', 'test_id', 'test1234!@', 'test@test.co', '010-0000-0000', 1, '1989-12-23'),
       (4, '이름4', '닉네임4', 'test_id', 'test1234!@', 'test@test.co', '010-0000-0000', 1, '1989-12-23'),
       (5, '이름5', '닉네임5', 'test_id', 'test1234!@', 'test@test.co', '010-0000-0000', 1, '1989-12-23'),
       (6, '이름6', '닉네임6', 'test_id', 'test1234!@', 'test@test.co', '010-0000-0000', 1, '1989-12-23'),
       (7, '이름7', '닉네임7', 'test_id', 'test1234!@', 'test@test.co', '010-0000-0000', 1, '1989-12-23'),
       (8, '이름8', '닉네임8', 'test_id', 'test1234!@', 'test@test.co', '010-0000-0000', 1, '1989-12-23'),
       (9, '이름9', '닉네임9', 'test_id', 'test1234!@', 'test@test.co', '010-0000-0000', 1, '1989-12-23'),
       (10, '이름10', '닉네임10', 'test_id', 'test1234!@', 'test@test.co', '010-0000-0000', 1, '1989-12-23');
