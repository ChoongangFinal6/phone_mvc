drop table sms;
delete sms;

create table sms (
	smsNo number(38) PRIMARY KEY,
	sendId VARCHAR(20) NULL, 		
	recvId VARCHAR(20) NULL,		
	content VARCHAR(200) NOT NULL,
	sendDate DATE default sysdate NOT NULL,
	read VARCHAR(1) default '0',
	deleted VARCHAR(1) default '0'
);

CREATE SEQUENCE seq_sms	START WITH 1 INCREMENT BY 1 nocache;

DROP SEQUENCE seq_sms;	
	
INSERT INTO sms (smsNo, sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '1588-0882','010-0000-2222','안녕하세요. 전화한통화로 대출가능여부 조회 가능!', '0', '2015-06-01');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '1588-0882','010-0000-2222','대출 상담 안내 1588-0882', '0', '2015-06-02');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-5432-1234','010-0000-2222','abcdefghijklmnop', '1', '2015-06-03');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-5432-1234','010-0000-2222','message send test!', '1', '2015-06-04');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '070-5651-8282','010-0000-2222','무료 샘플을 신청해 사용해보세요!', '0', '2015-06-05');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-2222','010-5432-1234','msg from 2222 to 1111 abcdefg', '1', '2015-06-06');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-2222','010-5432-1234','msg from 2222 to 3333 abcdefg', '0', '2015-06-07');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-2222','010-0000-3333','msg from 2222 to 3333 abcdefg', '1', '2015-06-08');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-3333','010-0000-2222','msg from 3333 to 2222 abcdefg', '0', '2015-06-09');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-3333','010-0000-2222','msg test qwerttyrtyertyeruter', '1', '2015-06-10');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-4444','010-0000-2222','msg test qwerttyrtyertyeruter', '0', '2015-06-11');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-5555','010-0000-2222','msg test qwerttyrtyertyeruter', '0', '2015-06-12');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-6666','010-0000-2222','msg test qwerttyrtyertyeruter', '0', '2015-06-13');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-7777','010-0000-2222','msg test qwerttyrtyertyeruter', '1', '2015-06-14');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-8888','010-0000-2222','msg test qwerttyrtyertyeruter', '1', '2015-06-15');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-9999','010-0000-2222','msg test qwerttyrtyertyeruter', '1', '2015-06-16');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-0000','010-0000-2222','msg test qwerttyrtyertyeruter', '1', '2015-06-17');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-1111-2222','010-0000-2222','msg test qwerttyrtyertyeruter', '0', '2015-06-18');
INSERT INTO sms (smsNo,sendId, recvId, content, read, sendDate) values (seq_sms.NEXTVAL, '010-0000-2222','010-2222-2222','msg test qwerttyrtyertyeruter', '0', '2015-05-30');

select * from sms;

select * from sms where (recvId='010-0000-2222' and sendId='010-0000-6666') or (recvId='010-0000-6666' and sendId='010-0000-2222');
select count(*) from SMS;
select count(*) from SMS where recvId='010-0000-2222' and read='0';
select distinct sendId from SMS where recvId='010-0000-2222' and read='0';
select * from SMS where recvId='010-0000-2222' and deleted='0' and read='0';
update SMS
	set read='1'
	where recvId='010-0000-2222' and sendId='010-0000-1111';
	
select * from SMS where (recvId='010-0000-2222' or sendId='010-0000-2222') and deleted='0' ORDER BY sendDate desc;

select recvId, sendDate from SMS where sendId='010-0000-2222' and deleted='0'
union
select sendId, sendDate from SMS where recvId='010-0000-2222' and deleted='0'
	
SELECT * FROM (SELECT content, sendDate FROM sms order by sendDate desc) WHERE ROWNUM=1;

SELECT *
	FROM (	SELECT content,sendDate 
				FROM sms 
				WHERE (sendId='010-0000-2222' AND recvId='010-0000-1111') OR (sendId='010-0000-1111' AND recvId='010-0000-2222')
				order by sendDate desc )
	WHERE ROWNUM=1;
	
SELECT COUNT(*) FROM sms WHERE recvId='010-0000-2222' AND sendId='010-0000-1111' AND read='0'
	
	
	



