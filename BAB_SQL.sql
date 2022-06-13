-- DROP TABLE
DROP TABLE "EMPLOYEE";
DROP TABLE "DEPT";
DROP TABLE "JOB";
DROP TABLE "CALENDAR";
DROP TABLE "ELECTRONIC_APPROVAL";
DROP TABLE "ATTENDANCE";
DROP TABLE "DOCUMENT_FORM";
DROP TABLE "BOARD";
DROP TABLE "FILE";
DROP TABLE "SEND_MAIL";
DROP TABLE "MESSAGE";
DROP TABLE "ROOM";
DROP TABLE "CHATTING";
DROP TABLE "HOLIDAY";
DROP TABLE "RECEIVE_MAIL";
DROP TABLE "SPENDING";

-- DROP SEQUENCE
DROP SEQUENCE BOARD_SEQ;
DROP SEQUENCE HOLIDAY_SEQ;
DROP SEQUENCE ATTENDANCE_SEQ;
DROP SEQUENCE RECEIVE_MAIL_SEQ;
DROP SEQUENCE SEND_MAIL_SEQ;
DROP SEQUENCE FILE_SEQ;
DROP SEQUENCE EAP_SEQ;
DROP SEQUENCE DOCUMENT_FORM_SEQ;
DROP SEQUENCE ROOM_SEQ;
DROP SEQUENCE CHATTING_SEQ;
DROP SEQUENCE MESSAGE_SEQ;
DROP SEQUENCE CALENDAR_SEQ;
DROP SEQUENCE SPENDING_SEQ;

-- CREATE SEQUENCE
CREATE SEQUENCE BOARD_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE HOLIDAY_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE ATTENDANCE_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE RECEIVE_MAIL_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SEND_MAIL_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE FILE_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE EAP_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE DOCUMENT_FORM_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE ROOM_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE CHATTING_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE MESSAGE_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE CALENDAR_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE SPENDING_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;﻿

CREATE TABLE "EMPLOYEE" (
	"EMP_NO"	VARCHAR2(30)		NOT NULL,
	"EMP_NAME"	VARCHAR2(30)		NOT NULL,
	"EMP_ID"	VARCHAR2(30)		NOT NULL,
	"EMP_PWD"	VARCHAR2(30)		NOT NULL,
	"EMP_PHONE"	VARCHAR2(30)		NOT NULL,
	"EMP_EMAIL"	VARCHAR2(100)		NOT NULL,
	"EMP_ZIPCODE"	VARCHAR2(30)		NULL,
	"EMP_ADDRESS"	VARCHAR2(300)		NOT NULL,
	"EMP_DADDRESS"	VARCHAR2(100)		NULL,
	"EMP_RNUM"	VARCHAR2(30)		NOT NULL,
	"EMP_DESKPHONE"	NUMBER(4)		NULL,
	"EMP_HIREDATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"DEPT_CODE"	VARCHAR2(30)		NOT NULL,
	"JOB_CODE"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "EMPLOYEE"."EMP_NO" IS '7자리(입사일+순번)';
COMMENT ON COLUMN "EMPLOYEE"."EMP_ID" IS '10자 미만(영어+숫자)';
COMMENT ON COLUMN "EMPLOYEE"."EMP_PWD" IS '15자 미만(영어+숫자+특수문자)';
COMMENT ON COLUMN "EMPLOYEE"."EMP_PHONE" IS '010-0000-0000';
COMMENT ON COLUMN "EMPLOYEE"."EMP_EMAIL" IS 'xxx@naver.com';
COMMENT ON COLUMN "EMPLOYEE"."EMP_RNUM" IS '000000-0000000';
COMMENT ON COLUMN "EMPLOYEE"."EMP_DESKPHONE" IS '4자리';
COMMENT ON COLUMN "EMPLOYEE"."EMP_HIREDATE" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "EMPLOYEE"."DEPT_CODE" IS 'D10, D20, D30, D40, D50, D60';
COMMENT ON COLUMN "EMPLOYEE"."JOB_CODE" IS 'J10, J20, J30, J40, J50, J60, J70, J80';

CREATE TABLE "DEPT" (
	"DEPT_CODE"	VARCHAR2(30)		NOT NULL,
	"DEPT_NAME"	VARCHAR2(30)		NULL
);

COMMENT ON COLUMN "DEPT"."DEPT_CODE" IS 'D10, D20, D30, D40, D50, D60';
COMMENT ON COLUMN "DEPT"."DEPT_NAME" IS '개발팀, 기획팀, 영업팀, 인사팀, 임원, 회계팀';

CREATE TABLE "JOB" (
	"JOB_CODE"	VARCHAR2(30)		NOT NULL,
	"JOB_TITLE"	VARCHAR2(30)		NULL
);

COMMENT ON COLUMN "JOB"."JOB_CODE" IS 'J10, J20, J30, J40, J50, J60, J70, J80';
COMMENT ON COLUMN "JOB"."JOB_TITLE" IS '사장, 부사장, 이사, 부장, 차장, 과장, 대리, 사원';

CREATE TABLE "CALENDAR" (
	"CAL_NO"	VARCHAR2(30)		NOT NULL,
	"CAL_TITLE"	VARCHAR2(100)		NOT NULL,
	"CAL_START"	TIMESTAMP		NOT NULL,
	"CAL_END"	TIMESTAMP		NOT NULL,
	"CAL_CONTENT"	VARCHAR2(500)		NULL,
	"EMP_NO"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "CALENDAR"."CAL_NO" IS 'SEQ';
COMMENT ON COLUMN "CALENDAR"."CAL_START" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "CALENDAR"."CAL_END" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "CALENDAR"."EMP_NO" IS '7자리(입사일+순번)';

CREATE TABLE "ELECTRONIC_APPROVAL" (
	"EAP_NO"	NUMBER		NOT NULL,
	"EAP_STEP"	NUMBER		NULL,
	"EAP_TITLE"	VARCHAR2(150)		NOT NULL,
	"EAP_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"EAP_STA_CODE"	VARCHAR2(1)	DEFAULT 'S'	NOT NULL,
	"EAP_RES_CODE"	VARCHAR2(1)		NULL,
	"EAP_REJECT"	VARCHAR2(500)		NULL,
	"EAP_FIRST_AP"	VARCHAR2(30)		NULL,
	"EAP_MID_AP"	VARCHAR2(30)		NULL,
	"EAP_FINAL_AP"	VARCHAR2(30)		NULL,
	"EAP_DRAFT_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"EAP_RESULT_DATE"	TIMESTAMP		NULL,
	"EAP_UPDATE_DATE"	TIMESTAMP		NULL,
	"EMP_NO"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "ELECTRONIC_APPROVAL"."EAP_NO" IS 'SEQ';
COMMENT ON COLUMN "ELECTRONIC_APPROVAL"."EAP_STEP" IS '1 / 2 / 3';
COMMENT ON COLUMN "ELECTRONIC_APPROVAL"."EAP_STA_CODE" IS 'C : 회수 / S : 대기 / O : 진행중 / F : 결재완료';
COMMENT ON COLUMN "ELECTRONIC_APPROVAL"."EAP_RES_CODE" IS 'A : 승인 / R : 반려';
COMMENT ON COLUMN "ELECTRONIC_APPROVAL"."EAP_DRAFT_DATE" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "ELECTRONIC_APPROVAL"."EAP_RESULT_DATE" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "ELECTRONIC_APPROVAL"."EAP_UPDATE_DATE" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "ELECTRONIC_APPROVAL"."EMP_NO" IS '7자리(입사일+순번)';

CREATE TABLE "ATTENDANCE" (
	"ATT_NO"	NUMBER		NOT NULL,
	"ATT_START"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"ATT_END"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"EMP_NO"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "ATTENDANCE"."ATT_NO" IS 'SEQ';
COMMENT ON COLUMN "ATTENDANCE"."ATT_START" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "ATTENDANCE"."ATT_END" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "ATTENDANCE"."EMP_NO" IS '7자리(입사일+순번)';

CREATE TABLE "DOCUMENT_FORM" (
	"DF_NO"	VARCHAR2(30)		NOT NULL,
	"DF_TITLE"	VARCHAR2(150)		NOT NULL,
	"DF_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"DF_CODE"	VARCHAR2(1)		NOT NULL,
	"EAP_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "DOCUMENT_FORM"."DF_NO" IS '현재년도-문서양식구분코드-순번(2022-A-001)';
COMMENT ON COLUMN "DOCUMENT_FORM"."DF_CODE" IS 'A : 휴가신청서 / B : 지출결의서';
COMMENT ON COLUMN "DOCUMENT_FORM"."EAP_NO" IS 'SEQ';

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(150)		NOT NULL,
	"BOARD_WRITER"	VARCHAR2(30)		NOT NULL,
	"BOARD_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"EMP_NO"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS 'SEQ';
COMMENT ON COLUMN "BOARD"."BOARD_DATE" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "BOARD"."EMP_NO" IS '7자리(입사일+순번)';

CREATE TABLE "FILE" (
	"BOARD_FILE_NO"	NUMBER		NOT NULL,
	"FILE_NAME"	VARCHAR2(300)		NOT NULL,
	"FILE_PATH"	VARCHAR2(4000)		NOT NULL,
	"FILE_CODE"	NUMBER		NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"EAP_NO"	NUMBER		NOT NULL,
	"REC_NO"	NUMBER		NOT NULL,
	"SEND_NO"	NUMBER		NOT NULL,
	"EMP_NO"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "FILE"."BOARD_FILE_NO" IS 'SEQ';
COMMENT ON COLUMN "FILE"."FILE_CODE" IS '1 : 프로필 사진 / 2 : 전자결재 / 3 : 공지사항 / 4 : 보낸메일함 / 5 : 받은메일함';
COMMENT ON COLUMN "FILE"."BOARD_NO" IS 'SEQ';
COMMENT ON COLUMN "FILE"."EAP_NO" IS 'SEQ';
COMMENT ON COLUMN "FILE"."REC_NO" IS 'SEQ';
COMMENT ON COLUMN "FILE"."SEND_NO" IS 'SEQ';
COMMENT ON COLUMN "FILE"."EMP_NO" IS '7자리(입사일+순번)';

CREATE TABLE "SEND_MAIL" (
	"SEND_NO"	NUMBER		NOT NULL,
	"SEND_TITLE"	VARCHAR2(150)		NOT NULL,
	"SEND_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"SEND_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"SEND_RECEVIER"	VARCHAR2(30)		NOT NULL,
	"SEND_SENDER"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "SEND_MAIL"."SEND_NO" IS 'SEQ';
COMMENT ON COLUMN "SEND_MAIL"."SEND_DATE" IS 'YYYY/MM/DD HH24:MI';

CREATE TABLE "MESSAGE" (
	"MSG_NO"	NUMBER		NOT NULL,
	"MSG_TITLE"	VARCHAR2(150)		NULL,
	"MSG_CONTENT"	VARCHAR2(500)		NULL,
	"MSG_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"MSG_RECEVIER"	VARCHAR2(30)		NULL,
	"MSG_SENDER"	VARCHAR2(30)		NULL,
	"EMP_NO"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "MESSAGE"."MSG_NO" IS 'SEQ';
COMMENT ON COLUMN "MESSAGE"."MSG_DATE" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "MESSAGE"."EMP_NO" IS '7자리(입사일+순번)';

CREATE TABLE "ROOM" (
	"ROOM_NO"	NUMBER		NOT NULL,
	"ROOM_TITLE"	VARCHAR2(150)		NULL,
	"ROOM_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL
);

COMMENT ON COLUMN "ROOM"."ROOM_NO" IS 'SEQ';
COMMENT ON COLUMN "ROOM"."ROOM_DATE" IS 'YYYY/MM/DD HH24:MI';

CREATE TABLE "CHATTING" (
	"CH_NO"	NUMBER		NOT NULL,
	"CH_CONTENT"	VARCHAR2(4000)		NULL,
	"CH_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"ROOM_NO"	NUMBER		NOT NULL,
	"EMP_NO"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "CHATTING"."CH_NO" IS 'SEQ';
COMMENT ON COLUMN "CHATTING"."CH_DATE" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "CHATTING"."ROOM_NO" IS 'SEQ';
COMMENT ON COLUMN "CHATTING"."EMP_NO" IS '7자리(입사일+순번)';

CREATE TABLE "HOLIDAY" (
	"HO_NO"	NUMBER		NOT NULL,
	"HO_CODE"	VARCHAR2(1)		NULL,
	"HO_START"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"HO_END"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"HO_CR_COUNT"	NUMBER		NULL,
	"HO_RM_COUNT"	NUMBER		NULL,
	"HO_USE_COUNT"	NUMBER		NULL,
	"EMP_NO"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "HOLIDAY"."HO_NO" IS 'SEQ';
COMMENT ON COLUMN "HOLIDAY"."HO_CODE" IS 'A : 연차 / H : 반차';
COMMENT ON COLUMN "HOLIDAY"."HO_START" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "HOLIDAY"."HO_END" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "HOLIDAY"."EMP_NO" IS '7자리(입사일+순번)';

CREATE TABLE "RECEIVE_MAIL" (
	"REC_NO"	NUMBER		NOT NULL,
	"REC_TITLE"	VARCHAR2(150)		NOT NULL,
	"REC_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"REC_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"REC_RECEVIER"	VARCHAR2(30)		NOT NULL,
	"REC_SENDER"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "RECEIVE_MAIL"."REC_NO" IS 'SEQ';
COMMENT ON COLUMN "RECEIVE_MAIL"."REC_DATE" IS 'YYYY/MM/DD HH24:MI';

CREATE TABLE "SPENDING" (
	"SP_NO"	NUMBER		NOT NULL,
	"SP_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"SP_DETAIL"	VARCHAR2(4000)		NULL,
	"SP_COUNT"	NUMBER		NULL,
	"SP_AMOUNT"	NUMBER		NULL,
	"SP_PAY_CODE"	VARCHAR2(1)		NULL,
	"EAP_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SPENDING"."SP_NO" IS 'SEQ';
COMMENT ON COLUMN "SPENDING"."SP_DATE" IS 'YYYY/MM/DD HH24:MI';
COMMENT ON COLUMN "SPENDING"."SP_PAY_CODE" IS 'C : 신용카드 / A : 계좌이체';
COMMENT ON COLUMN "SPENDING"."EAP_NO" IS 'SEQ';

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "PK_EMPLOYEE" PRIMARY KEY (
	"EMP_NO"
);

ALTER TABLE "DEPT" ADD CONSTRAINT "PK_DEPT" PRIMARY KEY (
	"DEPT_CODE"
);

ALTER TABLE "JOB" ADD CONSTRAINT "PK_JOB" PRIMARY KEY (
	"JOB_CODE"
);

ALTER TABLE "CALENDAR" ADD CONSTRAINT "PK_CALENDAR" PRIMARY KEY (
	"CAL_NO"
);

ALTER TABLE "ELECTRONIC_APPROVAL" ADD CONSTRAINT "PK_EAP" PRIMARY KEY (
	"EAP_NO"
);

ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "PK_ATTENDANCE" PRIMARY KEY (
	"ATT_NO"
);

ALTER TABLE "DOCUMENT_FORM" ADD CONSTRAINT "PK_DOCUMENT_FORM" PRIMARY KEY (
	"DF_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "FILE" ADD CONSTRAINT "PK_FILE" PRIMARY KEY (
	"BOARD_FILE_NO"
);

ALTER TABLE "SEND_MAIL" ADD CONSTRAINT "PK_SEND_MAIL" PRIMARY KEY (
	"SEND_NO"
);

ALTER TABLE "MESSAGE" ADD CONSTRAINT "PK_MESSAGE" PRIMARY KEY (
	"MSG_NO"
);

ALTER TABLE "ROOM" ADD CONSTRAINT "PK_ROOM" PRIMARY KEY (
	"ROOM_NO"
);

ALTER TABLE "CHATTING" ADD CONSTRAINT "PK_CHATTING" PRIMARY KEY (
	"CH_NO"
);

ALTER TABLE "HOLIDAY" ADD CONSTRAINT "PK_HOLIDAY" PRIMARY KEY (
	"HO_NO"
);

ALTER TABLE "RECEIVE_MAIL" ADD CONSTRAINT "PK_RECEIVE_MAIL" PRIMARY KEY (
	"REC_NO"
);

ALTER TABLE "SPENDING" ADD CONSTRAINT "PK_SPENDING" PRIMARY KEY (
	"SP_NO"
);

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "FK_DEPT_TO_EMPLOYEE_1" FOREIGN KEY (
	"DEPT_CODE"
)
REFERENCES "DEPT" (
	"DEPT_CODE"
);

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "FK_JOB_TO_EMPLOYEE_1" FOREIGN KEY (
	"JOB_CODE"
)
REFERENCES "JOB" (
	"JOB_CODE"
);

ALTER TABLE "CALENDAR" ADD CONSTRAINT "FK_EMPLOYEE_TO_CALENDAR_1" FOREIGN KEY (
	"EMP_NO"
)
REFERENCES "EMPLOYEE" (
	"EMP_NO"
);

ALTER TABLE "ELECTRONIC_APPROVAL" ADD CONSTRAINT "FK_EMPLOYEE_TO_EAP_1" FOREIGN KEY (
	"EMP_NO"
)
REFERENCES "EMPLOYEE" (
	"EMP_NO"
);

ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "FK_EMPLOYEE_TO_ATTENDANCE_1" FOREIGN KEY (
	"EMP_NO"
)
REFERENCES "EMPLOYEE" (
	"EMP_NO"
);

ALTER TABLE "DOCUMENT_FORM" ADD CONSTRAINT "FK_EAP_TO_DOCUMENT_FORM_1" FOREIGN KEY (
	"EAP_NO"
)
REFERENCES "ELECTRONIC_APPROVAL" (
	"EAP_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_EMPLOYEE_TO_BOARD_1" FOREIGN KEY (
	"EMP_NO"
)
REFERENCES "EMPLOYEE" (
	"EMP_NO"
);

ALTER TABLE "FILE" ADD CONSTRAINT "FK_BOARD_TO_FILE_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "FILE" ADD CONSTRAINT "FK_EAP_TO_FILE_1" FOREIGN KEY (
	"EAP_NO"
)
REFERENCES "ELECTRONIC_APPROVAL" (
	"EAP_NO"
);

ALTER TABLE "FILE" ADD CONSTRAINT "FK_RECEIVE_MAIL_TO_FILE_1" FOREIGN KEY (
	"REC_NO"
)
REFERENCES "RECEIVE_MAIL" (
	"REC_NO"
);

ALTER TABLE "FILE" ADD CONSTRAINT "FK_SEND_MAIL_TO_FILE_1" FOREIGN KEY (
	"SEND_NO"
)
REFERENCES "SEND_MAIL" (
	"SEND_NO"
);

ALTER TABLE "FILE" ADD CONSTRAINT "FK_EMPLOYEE_TO_FILE_1" FOREIGN KEY (
	"EMP_NO"
)
REFERENCES "EMPLOYEE" (
	"EMP_NO"
);

ALTER TABLE "MESSAGE" ADD CONSTRAINT "FK_EMPLOYEE_TO_MESSAGE_1" FOREIGN KEY (
	"EMP_NO"
)
REFERENCES "EMPLOYEE" (
	"EMP_NO"
);

ALTER TABLE "CHATTING" ADD CONSTRAINT "FK_ROOM_TO_CHATTING_1" FOREIGN KEY (
	"ROOM_NO"
)
REFERENCES "ROOM" (
	"ROOM_NO"
);

ALTER TABLE "CHATTING" ADD CONSTRAINT "FK_EMPLOYEE_TO_CHATTING_1" FOREIGN KEY (
	"EMP_NO"
)
REFERENCES "EMPLOYEE" (
	"EMP_NO"
);

ALTER TABLE "HOLIDAY" ADD CONSTRAINT "FK_EMPLOYEE_TO_HOLIDAY_1" FOREIGN KEY (
	"EMP_NO"
)
REFERENCES "EMPLOYEE" (
	"EMP_NO"
);

ALTER TABLE "SPENDING" ADD CONSTRAINT "FK_EAP_TO_SPENDING_1" FOREIGN KEY (
	"EAP_NO"
)
REFERENCES "ELECTRONIC_APPROVAL" (
	"EAP_NO"
);
