
---------- 회원 ----------
-- 담당자: 김명호

CREATE TABLE TP2_MEMBER(
	M_SEQ			NUMBER,
	M_ID			NVARCHAR2(20),
	M_PW			NVARCHAR2(20),
	M_NAME			NVARCHAR2(40),
	M_BIRTHDAY		NVARCHAR2(8),
	M_RECEIVE_EMAIL	NUMBER(1),
	M_RECEIVE_SMS	NUMBER(1),
	M_RECEIVE_PHONE	NUMBER(1),
	M_EMAIL			NVARCHAR2(400),
	M_PHONE			NVARCHAR2(20),
	M_POINT			NUMBER,
	M_GRADE			NUMBER(1),
	M_VIEW_COUNT	NUMBER,
	M_JOIN_DATE		DATE
);

CREATE SEQUENCE TP2_MEMBER_SEQ
START WITH 1 INCREMENT BY 1;

-- 테스트용 --
SELECT * FROM TP2_MEMBER;

INSERT INTO TP2_MEMBER
VALUES(TP2_MEMBER_SEQ.NEXTVAL, 'q', 'q', 'test계정', '20020101', 0, 1, 0, 'test', 'naver.com', 1000000, 0, 0, SYSDATE);

DROP TABLE TP2_MEMBER
CASCADE CONSTRAINTS;

DROP SEQUENCE TP2_MEMBER_SEQ;



---------- 영화 ----------
-- 담당자: 조용호

CREATE TABLE TP2_MOVIE(
	   MV_SEQ            NUMBER,
	   MV_NAME            NVARCHAR2(50),
	   MV_VIEW_COUNT      NUMBER,
	   MV_GENRE         NVARCHAR2(50),
	   MV_FORMAT         NVARCHAR2(20),
	   MV_GRADE         NVARCHAR2(20),
	   MV_DIRETOR         NVARCHAR2(40),
	   MV_ACTOR         NVARCHAR2(100),
	   MV_RUNNING_TIME     NVARCHAR2(100),
	   MV_START_DATE    NVARCHAR2(100),
	   MV_POSTER         NVARCHAR2(800),
	   MV_VIDEO         NVARCHAR2(800),
	   MV_HEART         NUMBER,
	   MV_STORY			 NVARCHAR2(800)
);

select * from TP2_MOVIE;

drop table TP2_MOVIE;


CREATE TABLE TP2_MOVIE_REVIEW(
	MVR_SEQ NUMBER,
	MVR_ID NVARCHAR2(50),
	MVR_MOVIE_SEQ NUMBER,
	MVR_CONTENT NVARCHAR2(100),
	MVR_LIKE_SCORE NUMBER,
	MVR_LIKE_COUNT NUMBER,
	MVR_DATE DATE
);

CREATE SEQUENCE REVIEW_SEQUENCE START WITH 1 INCREMENT BY 1;

-- 테스트용 --
SELECT MVR_SEQ,MVR_ID,MVR_MOVIE_SEQ,MVR_CONTENT,MVR_LIKE_SCORE,MVR_LIKE_COUNT FROM TP2_MOVIE_REVIEW WHERE MVR_ID=1 AND MVR_MOVIE_SEQ=1;


CREATE TABLE TP2_THEATER(
	T_CODE NUMBER,
	T_FIELD NVARCHAR2(50),
	T_NAME NVARCHAR2(50),
	T_ROOM_NUM NVARCHAR2(50),
	T_TOTAL_SEAT NUMBER
);

 CREATE TABLE TP2_THEATER_ROOM(
	TR_CODE NUMBER,
	TR_TIME NVARCHAR2(100),
	TR_MOVIE_NAME NVARCHAR2(100),
	TR_START_DATE NVARCHAR2(100),
	TR_END_DATE NVARCHAR2(100),
	TR_OUT_SEAT NUMBER
);
	 
SELECT T_CODE, T_FIELD, T_NAME, T_ROOM_NUM, T_TOTAL_SEAT, TR_TIME, TR_MOVIE_NAME, TR_START_DATE, TR_END_DATE, TR_OUT_SEAT
FROM TP2_THEATER
INNER JOIN TP2_THEATER_ROOM
ON T_CODE=TR_CODE;
