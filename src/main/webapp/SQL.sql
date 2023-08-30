-- SEQUENCE
CREATE SEQUENCE MEMBER_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999 NOCACHE;
CREATE SEQUENCE ACCOUNTBOOK_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999 NOCACHE;
CREATE SEQUENCE MONTH_SEQ INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999 NOCACHE;

-- CREATE
CREATE TABLE AC_MEMBER(
                          M_ID NUMBER(10) NOT NULL PRIMARY KEY,
                          M_EMAIL VARCHAR2(50) NOT NULL,
                          M_PWD VARCHAR2(50) NOT NULL,
                          M_NAME VARCHAR2(10) NOT NULL
);

CREATE TABLE AC_CATEGORY( -- 카테고리는 어느 회원이든 같은 카테고리명을 사용해야한다.
                            C_CODE VARCHAR2(10) NOT NULL PRIMARY KEY,
                            C_NAME VARCHAR2(20) NOT NULL
);

CREATE TABLE AC_ACCOUNTBOOK(
                               A_ID NUMBER(10) NOT NULL,
                               A_CODE NUMBER(6) NOT NULL,
                               M_ID NUMBER(10) NOT NULL,
                               PRIMARY KEY(A_ID, A_CODE),
                               FOREIGN KEY(M_ID) REFERENCES AC_MEMBER(M_ID) -- 회원이 등록한 가계부 월별 아이디를 구분하기 위한 고유 식별키를 지정한다.
);

CREATE TABLE AC_DATE(
                        D_DATE DATE NOT NULL PRIMARY KEY,
                        M_ID NUMBER(10) NOT NULL,
                        FOREIGN KEY(M_ID) REFERENCES AC_MEMBER(M_ID) -- 회원이 등록한 가계부 년월일자를 구분하기 위한 고유 식별키를 지정한다.
);

CREATE TABLE AC_MONTH( -- JOIN TABLE로 가계부의 핵심 테이블이다.
                         M_ID NUMBER(10) NOT NULL PRIMARY KEY, -- SEQUENCE
                         ME_ID NUMBER(10) NOT NULL,
                         A_ID NUMBER(6) NOT NULL,
                         A_CODE NUMBER(6) NOT NULL,
                         C_CODE VARCHAR2(10) NOT NULL,
                         D_DATE DATE NOT NULL,
                         M_AMOUNT NUMBER(20) NOT NULL,
                         M_MEMO VARCHAR2(50), -- 메모는 생략 가능하다.
                         M_CREATE_DATE DATE, -- SYSTEM LOG
                         M_UPDATE_DATE DATE, -- SYSTEM LOG
                         FOREIGN KEY(ME_ID) REFERENCES AC_MEMBER(M_ID),
                         FOREIGN KEY(A_ID, A_CODE) REFERENCES AC_ACCOUNTBOOK(A_ID, A_CODE), -- 회원이 등록한 월별 가계부의 아이디를 구분하기 위한 고유 식별키를 지정한다.
                         FOREIGN KEY(C_CODE) REFERENCES AC_CATEGORY(C_CODE), -- 가계부 카테고리 목록을 불러오기 위한 고유 식별키를 지정한다.
                         FOREIGN KEY(D_DATE) REFERENCES AC_DATE(D_DATE) -- 회원이 등록한 월별 가계부의 년월일자를 불러오기 위한 고유 식별키를 지정한다.
);

-- SELECT
SELECT M.M_ID, M.ME_ID, M.A_ID, M.A_CODE, C.C_CODE, C.C_NAME, M.D_DATE, M.M_AMOUNT, M.M_MEMO
FROM AC_MONTH M, AC_CATEGORY C
WHERE M.C_CODE = C.C_CODE AND M.ME_ID = 1 AND M.A_CODE = '202309'
GROUP BY M.M_ID, M.ME_ID, M.A_ID, M.A_CODE, C.C_CODE, C.C_NAME, M.D_DATE, M.M_AMOUNT, M.M_MEMO
ORDER BY M.D_DATE;

SELECT * FROM AC_ACCOUNTBOOK WHERE A_CODE = 202308 AND M_ID = 1;

-- 1. 수입
SELECT C.C_NAME 카테고리명, SUM(M.M_AMOUNT) 가격, COUNT(C.C_NAME) 등록_횟수
FROM AC_CATEGORY C, AC_MONTH M
WHERE C.C_CODE = M.C_CODE AND C.C_CODE LIKE 'A%'
GROUP BY ROLLUP(C.C_NAME);

-- 2. 고정지출
SELECT C.C_NAME 카테고리명, SUM(M.M_AMOUNT) 가격, COUNT(C.C_NAME) 등록_횟수
FROM AC_CATEGORY C, AC_MONTH M
WHERE C.C_CODE = M.C_CODE AND C.C_CODE LIKE 'B%'
GROUP BY ROLLUP(C.C_NAME);

-- 3. 비고정지출
SELECT C.C_NAME 카테고리명, SUM(M.M_AMOUNT) 가격, COUNT(C.C_NAME) 등록_횟수
FROM AC_CATEGORY C, AC_MONTH M
WHERE C.C_CODE = M.C_CODE AND C.C_CODE LIKE 'C%'
GROUP BY ROLLUP(C.C_NAME);

-- DATE MERGE
MERGE INTO AC_DATE
USING DUAL ON (D_DATE = '20230825')
WHEN NOT MATCHED THEN INSERT(D_DATE, M_ID) VALUES(TO_DATE('20230825', 'YY/MM/DD'), 1);