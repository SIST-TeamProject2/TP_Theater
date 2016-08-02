
select * from TP2_THEATER
select * from TP2_THEATER_ROOM 
select * from tp2_movie

SELECT *
FROM TP2_THEATER
INNER JOIN TP2_THEATER_ROOM
ON T_CODE=TR_CODE
WHERE TR_MOVIE_NAME = '나의 산티아고'

 SELECT T_ROOM_NUM, TR_TIME, TR_MOVIE_NAME, TR_START_DATE, TR_END_DATE FROM TP2_THEATER  INNER JOIN TP2_THEATER_ROOM  ON T_CODE=TR_CODE WHERE T_NAME = '의정부'
 
 SELECT T_ROOM_NUM, TR_TIME, TR_MOVIE_NAME, TR_START_DATE, TR_END_DATE FROM TP2_THEATER  INNER JOIN TP2_THEATER_ROOM  ON T_CODE=TR_CODE WHERE T_NAME = '김포'
 SELECT T_ROOM_NUM, TR_TIME, TR_MOVIE_NAME, TR_START_DATE, TR_END_DATE FROM TP2_THEATER  INNER JOIN TP2_THEATER_ROOM  ON T_CODE=TR_CODE WHERE T_NAME = '일산'
 
 SELECT MV_NAME, MV_GRADE  FROM TP2_MOVIE WHERE MV_NAME='"+mv_name+"'";
 
 drop table TP2_MEMBER
 CREATE TABLE TP2_MEMBER(
	M_SEQ			NUMBER,
	M_ID			NVARCHAR2(20),
	M_PW			NVARCHAR2(20),
	M_NAME			NVARCHAR2(40),
	M_NICK			NVARCHAR2(40),
	M_FACE_NAME		NVARCHAR2(20),
	M_BIRTHDAY		NVARCHAR2(20),
	M_EMAIL			NVARCHAR2(400),
	M_PHONE			NVARCHAR2(20),
	M_POINT			NUMBER,
	M_GRADE			NUMBER(1),
	M_VIEW_COUNT	NUMBER
);


//////////////TEST/////////////////////////
///////완료/////////////
SELECT R_SEAT FROM TP2_THEATER A INNER JOIN TP2_RESERVATION B ON A.T_NAME =B.R_THEATER_NAME
WHERE A.T_NAME='의정부' AND B.R_MOVIE_NAME='도리를 찾아서'  AND B.R_SEE_DATE='2016.08.09'AND A.T_ROOM_NUM='1'
///////완료/////////////

SELECT *
FROM TP2_THEATER A
INNER JOIN TP2_RESERVATION B
ON A.T_NAME =B.R_THEATER_NAME
WHERE A.T_NAME='의정부' AND B.R_SEE_DATE='2016.08.04'AND A.T_ROOM_NUM='1'


//////////////////////////////////////////
SELECT *
FROM TP2_THEATER A
INNER JOIN TP2_THEATER_ROOM B
ON A.T_CODE=B.TR_CODE
INNER JOIN TP2_THEATER_ROOM_2 C
ON A.T_NAME=C.TR2_THEATER_NAME
WHERE A.T_NAME='의정부' AND B.TR_MOVIE_NAME='도리를 찾아서'


SELECT * FROM TP2_THEATER_ROOM_2
DROP TABLE TP2_THEATER_ROOM_2

CREATE TABLE TP2_THEATER_ROOM_2 (
	TR2_THEATER_NAME 		NVARCHAR2(100),
	TR2_SEE_MV_NAME		NVARCHAR2(100),
	TR2_SEE_ROOM		NVARCHAR2(50),
	TR2_SEE_DATE 		NVARCHAR2(50),
	TR2_SEE_TIME		NVARCHAR2(50),
	TR2_SEE_SEAT 		NVARCHAR2(100),
	TR2_SEE_TOTAL		NUMBER
)


// 조건 : TR2_SEE_DATE 
INSERT INTO TP2_THEATER_ROOM_2(TR2_THEATER_NAME,TR2_SEE_MV_NAME,TR2_SEE_ROOM,TR2_SEE_DATE,TR2_SEE_TIME,TR2_SEE_SEAT,TR2_SEE_TOTAL)
VALUES('김포','나의 산티아고','2','2016.08.05','7:30','C열 5. C열 6. B열 7.',3)

INSERT INTO TP2_THEATER_ROOM_2(TR2_THEATER_NAME,TR2_SEE_MV_NAME,TR2_SEE_ROOM,TR2_SEE_DATE,TR2_SEE_TIME,TR2_SEE_SEAT,TR2_SEE_TOTAL)
VALUES('김포','나의 산티아고','2','2016.08.06','7:30','C열 5. C열 6. B열 7.',3)





select * from TP2_MEMBER
insert into TP2_MEMBER(M_SEQ,M_ID,M_PW,M_NAME,M_NICK,M_FACE_NAME,M_BIRTHDAY,M_EMAIL,M_PHONE,M_POINT,M_GRADE,M_VIEW_COUNT)
values(1,'a','a','영선','닉네임','페이스네임','0302','a@naver.com','010-0000-0000',900000,1,0)


SELECT * FROM TP2_COUPON

CREATE TABLE TP2_COUPON_RECEIPT(
	CR_MEMBER_ID		NVARCHAR2(20),
	CR_COUPON_SERIAL	NUMBER(12)
);

INSERT INTO TP2_COUPON_RECEIPT(CR_MEMBER_ID,CR_COUPON_SERIAL)
VALUES('a',123412341234);

SELECT * FROM TP2_COUPON
DROP TABLE TP2_COUPON
CREATE TABLE TP2_COUPON(
	CP_USER_ID	NVARCHAR2(20),
	CP_SERIAL	NUMBER(12),
	CP_DISCOUNT_PRICE NUMBER(12)
);

INSERT INTO TP2_COUPON(CP_USER_ID,CP_SERIAL,CP_DISCOUNT_PRICE)
VALUES('a',12341234, 8000);

INSERT INTO TP2_COUPON(CP_USER_ID,CP_SERIAL,CP_DISCOUNT_PRICE)
VALUES('a',43214321, 5000);


SELECT *
FROM TP2_RESERVATION
INNER JOIN TP2_COUPON
ON CR_COUPON_SERIAL=CP_SERIAL


drop table TP2_RESERVATION
CREATE TABLE TP2_RESERVATION(
	R_SEQ					NUMBER,
	R_MEMBER_ID				NVARCHAR2(20),
	R_PAY					NUMBER(30),
	R_PAY_TYPE				NUMBER(30),
	R_PAY_DATE				DATE,
	R_SEE_DATE				VARCHAR2(20),
	R_MOVIE_NAME			NVARCHAR2(50),
	R_THEATER_NAME			NVARCHAR2(10),
	R_THEATER_ROOM_NUM		NUMBER(30),
	R_THEATER_ROOM_TIME		NVARCHAR2(50),
	R_SEAT			NVARCHAR2(100),
	R_SEE_PEOPLE		NUMBER
);

select * from TP2_RESERVATION
where R_THEATER_NAME = '강남' and R_SEE_DATE = '2016.08.02'




create sequence seq_reservation
start with 1 increment by 1


INSERT INTO TP2_RESERVATION ( R_SEQ, R_MEMBER_ID, R_PAY, R_PAY_TYPE, R_PAY_DATE, R_SEE_DATE, R_MOVIE_NAME,  R_THEATER_NAME, R_THEATER_ROOM_NUM, R_THEATER_ROOM_TIME, R_SEAT, R_SEE_PEOPLE)
VALUES(seq_reservation.NEXTVAL,'a',44000,0,SYSDATE,'2016.08.02','부산행','왕십리',2,'13:30','D,3',3)

INSERT INTO TP2_RESERVATION ( R_SEQ, R_MEMBER_ID, R_PAY, R_PAY_TYPE, R_PAY_DATE, R_SEE_DATE, R_MOVIE_NAME,  R_THEATER_NAME, R_THEATER_ROOM_NUM, R_THEATER_ROOM_TIME, R_SEAT, R_SEE_PEOPLE) 
VALUES ( seq_reservation.NEXTVAL , 'a' , 44000, ,0, SYSDATE ,'2016.08.02','부산행', '왕십리', 1, '15:30', 'f,2',3 )


 INSERT INTO TP2_RESERVATION ( R_SEQ, R_MEMBER_ID, R_PAY, R_PAY_TYPE, R_PAY_DATE, R_MOVIE_NAME,  R_THEATER_NAME, R_THEATER_ROOM_NUM, R_THEATER_ROOM_TIME, R_SEAT_NUM )  
 VALUES ( seq_reservation.NEXTVAL , 'a', 0000, 0, SYSDATE , 'a', 'a', 0, 'a', 0) 


