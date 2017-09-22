drop table if exists member;
drop table if exists board;

create table member(
	memberid varchar(100) not null primary key,
	password varchar(100) not null,
	membername varchar(200) not null
);

create table board (
	bno bigint auto_increment not null primary key,
	writer varchar(100) not null, 
	title varchar(255) not null,
	content clob not null,
	reg_date date default sysdate,
	hit_cnt bigint default 0
);
