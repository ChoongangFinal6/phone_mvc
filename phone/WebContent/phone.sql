drop table sms;

create table sms (
	sendId INTEGER NOT NULL, 		
	recvId INTEGER NOT NULL,		
	content VARCHAR(100) NOT NULL,
	sendDate DATE default sysdate NOT NULL,
	read VARCHAR(1) default '0',
	deleted VARCHAR(1) default '0'
);

INSERT INTO sms (sendId, recvId, content, read) values (1111,2222,'content 1111,2222', '0');
INSERT INTO sms (sendId, recvId, content, read) values (1111,2222,'content 1111,2222', '1');
INSERT INTO sms (sendId, recvId, content, read) values (1111,2222,'content 1111,2222', '0');
INSERT INTO sms (sendId, recvId, content, read) values (2222,3333,'content 2222,3333', '0');
INSERT INTO sms (sendId, recvId, content, read) values (2222,3333,'content 2222,3333', '0');
INSERT INTO sms (sendId, recvId, content, read) values (2222,1111,'content 2222,1111', '0');
INSERT INTO sms (sendId, recvId, content, read) values (3333,2222,'content 3333,2222', '0');
INSERT INTO sms (sendId, recvId, content, read) values (3333,2222,'content 3333,2222', '1');


select * from sms;
select * from sms where (recvId=2222 and sendId=1111) or (recvId=1111 and sendId=2222);
select count(*) from SMS;
select count(*) from SMS where recvId=2222 and read='0';
select distinct sendId from SMS where recvId=2222 and read='0';
select * from SMS where recvId=2222 and deleted='0' and read='0';
update SMS
	set read='1'
	where recvId=2222 and sendId=1111;