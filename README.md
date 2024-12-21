## Spring Framework 회원 프로젝트

## 개발환경
-인텔리제이
-mysql 8
-JSP
-tomcat 9

### 주요기능
회원가입
로그인
회원목록 출력
상세조회
수정
삭제


### DB sql
```
-- 계정 생성하기
create database db_codingrecipe;
create user user_codingrecipe@localhost identified by '1234';
grant all privileges on db_codingrecipe.* to user_codingrecipe@localhost;

-- 회원 테이블
drop table if exists member_table;
create table member_table(
id bigint primary key auto_increment,
email varchar(50) unique,
password varchar(20),
name varchar(50),
phone_number bigint
); 