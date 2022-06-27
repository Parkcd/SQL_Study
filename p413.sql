DROP TABLE member;

CREATE TABLE member (
    name VARCHAR2(10),
    userid VARCHAR2(10),
    pwd VARCHAR2(10),
    email VARCHAR2(20),
    phone CHAR(13),
    admin NUMBER(1) DEFAULT 0,
    primary key(userid)
);

INSERT INTO member VALUES('ÀÌ¼Ò¹Ì', 'somi', '1234', 'gmd@naver.com', '010-2362-5157', 0);
INSERT INTO member VALUES('ÇÏ»ó¿ì', 'sang12', '1234', 'ha12@naver.com', '010-5629-8888', 1);
INSERT INTO member VALUES('±èÀ±½Â', 'light', '1234', 'youn1004@naver.com', '010-9999-8282', 0);

commit;

SELECT
    *
FROM member;