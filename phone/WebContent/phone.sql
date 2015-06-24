drop table sms;

create table sms (
	sendId VARCHAR(20) NULL, 		
	recvId VARCHAR(20) NULL,		
	content VARCHAR(200) NOT NULL,
	sendDate DATE default sysdate NOT NULL,
	read VARCHAR(1) default '0',
	deleted VARCHAR(1) default '0'
);

INSERT INTO sms (sendId, recvId, content, read, sendDate) values ('010-0000-1111','010-0000-2222','msg from 1111 to 2222 abcdefg', '0', '2015-06-01');
INSERT INTO sms (sendId, recvId, content, read, sendDate) values ('010-0000-1111','010-0000-2222','msg from 1111 to 2222 abcdefg', '0', '2015-06-02');
INSERT INTO sms (sendId, recvId, content, read, sendDate) values ('010-0000-1111','010-0000-2222','msg from 1111 to 2222 abcdefg', '1', '2015-06-03');
INSERT INTO sms (sendId, recvId, content, read, sendDate) values ('010-0000-1111','010-0000-2222','msg from 1111 to 2222 abcdefg', '1', '2015-06-04');
INSERT INTO sms (sendId, recvId, content, read, sendDate) values ('010-0000-2222','010-0000-1111','msg from 2222 to 1111 abcdefg', '0', '2015-06-05');
INSERT INTO sms (sendId, recvId, content, read, sendDate) values ('010-0000-2222','010-0000-1111','msg from 2222 to 1111 abcdefg', '1', '2015-06-06');
INSERT INTO sms (sendId, recvId, content, read, sendDate) values ('010-0000-2222','010-0000-3333','msg from 2222 to 3333 abcdefg', '0', '2015-06-07');
INSERT INTO sms (sendId, recvId, content, read, sendDate) values ('010-0000-2222','010-0000-3333','msg from 2222 to 3333 abcdefg', '1', '2015-06-08');
INSERT INTO sms (sendId, recvId, content, read, sendDate) values ('010-0000-3333','010-0000-2222','msg from 3333 to 2222 abcdefg', '0', '2015-06-09');
INSERT INTO sms (sendId, recvId, content, read, sendDate) values ('010-0000-3333','010-0000-2222','msg from 3333 to 2222 abcdefg', '1', '2015-06-10');

select * from sms;
select * from sms where (recvId='010-0000-2222' and sendId='010-0000-1111') or (recvId='010-0000-1111' and sendId='010-0000-2222');
select count(*) from SMS;
select count(*) from SMS where recvId='010-0000-2222' and read='0';
select distinct sendId from SMS where recvId='010-0000-2222' and read='0';
select * from SMS where recvId='010-0000-2222' and deleted='0' and read='0';
update SMS
	set read='1'
	where recvId='010-0000-2222' and sendId='010-0000-1111';