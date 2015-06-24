create table person_info(
name varchar2(10),
birthDate date,
gender varchar2(5)
);

select * from person_info;
drop table person_info;
insert into person_info  values('윤동혁','1984-12-06','1');
insert into person_info  values('윤동혁','1989-12-06','1');
insert into person_info  values('장우진','1981-06-13','1');
insert into person_info  values('장우진','1985-03-13','1');
insert into person_info  values('장우진','1986-05-13','1');
insert into person_info  values('장우진','1987-06-13','1');
insert into person_info  values('장우진','1994-07-13','1');

insert into person_info  values('강희욱','1987-11-03','1');
insert into person_info  values('강민수','1987-11-03','1');
insert into person_info  values('최민수','1987-11-03','1');
insert into person_info  values('최성훈','1987-11-03','1');
insert into person_info  values('유경포','1987-11-03','1');
insert into person_info  values('홍성현','1987-11-03','1');

insert into person_info  values('이연희','1989-12-06','2');
insert into person_info  values('장예원','1990-12-06','2');
insert into person_info  values('장예원','1994-12-06','2');
insert into person_info  values('장예원','1995-12-06','2');


create table HMember (
id varchar2(20) primary key,
hNo number not null,
password varchar2(20) not null,
name varchar2(20) not null,
birthDate date not null,
gender varchar2(5) not null,
address varchar2(150) not null
);
insert into HMember  values('010-1111-1111','1','1q2w3e','윤동혁',sysdate,'1','강남');
drop table HMember;
select * from HMember;
select password from HMember where id='010-1111-1111';

CREATE SEQUENCE hNo start with 1;
drop sequence hNo;


select NVL(max(hNo),0) from HMember; 