drop table sms;

create table sms (
	sendId INTEGER NOT NULL, 		
	recvId INTEGER NOT NULL,		
	content VARCHAR(100) NOT NULL,
	sendDate DATE default sysdate NOT NULL,
	read VARCHAR(1) default 0
);

INSERT INTO sms (sendId, recvId, content) values (1111,2222,'ABCD');

select * from sms;
select * from SMS where read='0'