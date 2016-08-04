




drop table TP2_MOVIE

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


===============================================================================
DROP TABLE TP2_MOVIE_REVIEW

CREATE TABLE TP2_MOVIE_REVIEW(
MVR_SEQ NUMBER,
MVR_ID NVARCHAR2(50),
MVR_MOVIE_SEQ NUMBER,
MVR_CONTENT NVARCHAR2(100),
MVR_LIKE_SCORE NUMBER,
MVR_LIKE_COUNT NUMBER,
MVR_DATE DATE
);

drop SEQUENCE REVIEW_SEQUENCE

CREATE SEQUENCE REVIEW_SEQUENCE START WITH 1 INCREMENT BY 1

SELECT * FROM TP2_MOVIE_REVIEW WHERE MVR_SEQ=? AND MVR_ID=?


==============================================================================

==============================================================================

ALTER TABLE TP2_MOVIE_REVIEW
ADD (MVR_DATE DATE);
테이블에 컬럼 추가 시간
=============================================================================
ALTER TABLE TP2_MOVIE
ADD (MV_STORY NVARCHAR2(800));

=======================================================================================================================================

CREATE TABLE TP2_THEATER(
T_CODE NUMBER,
T_FIELD NVARCHAR2(50),
T_NAME NVARCHAR2(50),
T_ROOM_NUM NVARCHAR2(50),
T_TOTAL_SEAT NUMBER
);

INSERT INTO TP2_THEATER (T_SEQ,AREA,T_NAME,TS_NAME,TOTAL_SEAT)
VALUES (6,'경기','남양주','1관', 150)	

drop table TP2_THEATER

SELECT * FROM TP2_THEATER
SELECT * FROM TP2_THEATER_ROOM
drop table TP2_THEATER_ROOM


CREATE TABLE TP2_THEATER_ROOM(
TR_CODE NUMBER,
TR_TIME NVARCHAR2(100),
TR_MOVIE_NAME NVARCHAR2(100),
TR_START_DATE NVARCHAR2(100),
TR_END_DATE NVARCHAR2(100),
TR_OUT_SEAT NUMBER
);




=================================================================
CREATE TABLE TP2_RESERVATION(
   R_SEQ               NUMBER,
   R_MEMBER_ID            NVARCHAR2(20),
   R_PAY               NUMBER(30),
   R_PAY_TYPE            NUMBER(30),
   R_PAY_DATE            DATE,
   R_SEE_DATE            VARCHAR2(20),
   R_MOVIE_NAME         NVARCHAR2(50),
   R_THEATER_NAME         NVARCHAR2(10),
   R_THEATER_ROOM_NUM      NUMBER(30),
   R_THEATER_ROOM_TIME      NVARCHAR2(50),
   R_SEAT         NVARCHAR2(100),
   R_SEE_PEOPLE      NUMBER
);

SELECT * FROM TP2_RESERVATION

create sequence seq_reservation
start with 1 increment by 1

================================================================
--여기는 그래프 
CREATE TABLE TP2_MEMBER(
   M_SEQ         NUMBER,
   M_ID         NVARCHAR2(20),
   M_PW         NVARCHAR2(20),
   M_NAME         NVARCHAR2(40),
   M_BIRTHDAY      NVARCHAR2(8),
   M_RECEIVE_EMAIL   NUMBER(1),
   M_RECEIVE_SMS   NUMBER(1),
   M_RECEIVE_PHONE   NUMBER(1),
   M_EMAIL         NVARCHAR2(400),
   M_PHONE         NVARCHAR2(20),
   M_POINT         NUMBER,
   M_GRADE         NUMBER(1),
   M_VIEW_COUNT   NUMBER,
   M_JOIN_DATE      DATE
);


CREATE TABLE TP2_MOVIE_LIKE(
MVR_SEQ NUMBER,
MVR_ID NVARCHAR2(20)
);

SELECT * FROM TP2_MOVIE 

