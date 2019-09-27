
CREATE TABLE USERS (
   U_NO   VARCHAR2(40)   CONSTRAINT PK_U_NO PRIMARY KEY,
   U_BNO   VARCHAR2(40)   CONSTRAINT UNQ_U_BNO UNIQUE,
   U_ID   VARCHAR2(100)   CONSTRAINT UNQ_U_ID UNIQUE  NOT NULL,
   U_NAME   VARCHAR2(100)   NOT NULL,
   U_PW   VARCHAR2(50)   NOT NULL,
   U_JOIN_DATE   DATE   DEFAULT SYSDATE NOT NULL,
   U_PHONE   VARCHAR2(30)   CONSTRAINT UNQ_U_PHONE UNIQUE  NOT NULL,
   U_PROFILE   VARCHAR2(250)   NULL,
   U_INTRO   VARCHAR2(500)   NULL,
   U_ADDRESS   VARCHAR2(500)   NULL,
   U_POST   VARCHAR2(30)   NULL,
   U_MILEAGE   NUMBER   DEFAULT 0 NOT NULL,
   U_BANK   VARCHAR2(100)   NULL,
   U_BANK_ACCOUNT   VARCHAR2(50)   CONSTRAINT UNQ_U_BANK_ACCOUNT UNIQUE,
   U_HOMEPAGE   VARCHAR2(100)   NULL,
   U_CATEGORY   VARCHAR2(150)   CONSTRAINT CHK_U_CATEGORY CHECK (U_CATEGORY IN ('�ַ�', '��Ȱ', '�ǰ�', '�Ƿ�', 'IT', '����', '�Ǽ�����', '����', '�Ź�'))
);

--����, ���ּ� �÷��߰�
alter table users add(u_address_detail varchar2(255));
alter table users add(u_job varchar2(30));

--��ȭ��ȣ null�� ������� ����
ALTER TABLE users MODIFY (u_phone NULL);

--users ���̺� ī�װ����κ� �������� ����(���߼��� �ʿ�)
ALTER TABLE users DROP CONSTRAINT CHK_U_CATEGORY;


CREATE TABLE PAYMENT (
   PM_NO   VARCHAR2(40)   CONSTRAINT PK_PM_NO PRIMARY KEY ,
   U_NO   VARCHAR2(40)   CONSTRAINT FK_PMT_U_NO  REFERENCES USERS(U_NO) ON DELETE CASCADE NOT NULL,
   P_NO   VARCHAR2(40)   CONSTRAINT FK_PMT_P_NO  REFERENCES PROJECT(P_NO) ON DELETE CASCADE NOT NULL,
   R_NO   VARCHAR2(40)   CONSTRAINT FK_PMT_R_NO  REFERENCES REWARD(R_NO) ON DELETE CASCADE NOT NULL,
   PM_OPTION   VARCHAR2(500)   NULL,
   PM_INFO   VARCHAR2(1000)   NOT NULL,
   PM_PRICE      NUMBER      NOT NULL,
   PM_PRICE_PLUS   NUMBER      NOT NULL,
   PM_DATE   DATE   NOT NULL,
   PM_MILEAGE   NUMBER      NOT NULL,
   PM_QUANTITY   NUMBER   DEFAULT 1 NOT NULL,
   PM_NOPEN   VARCHAR2(3)   DEFAULT 'Y'  CONSTRAINT CHK_PM_NOPEN CHECK (PM_NOPEN IN ('Y', 'N')) NOT NULL,
   PM_POPEN   VARCHAR2(3)   DEFAULT 'Y' CONSTRAINT CHK_PM_POPEN CHECK (PM_POPEN IN ('Y', 'N')) NOT NULL
);

CREATE TABLE PROJECT (
   P_NO   VARCHAR2(40)   CONSTRAINT PK_P_NO PRIMARY KEY,
   U_NO   VARCHAR2(40) CONSTRAINT FK_U_NO  REFERENCES USERS(U_NO) NOT NULL,
   P_TITLE   VARCHAR2(150)   NOT NULL,
   P_CATEGORY   VARCHAR2(150)   NOT NULL,
   P_STORY   VARCHAR2(4000)   NOT NULL,
   P_IMG   VARCHAR2(250)   NULL,
   P_INFO   VARCHAR2(4000)   NOT NULL,
   P_NPRICE   NUMBER   DEFAULT 0 NOT NULL,
   P_TPRICE   NUMBER NOT NULL,
   P_SDATE   DATE   NOT NULL,
   P_EDATE   DATE   NOT NULL,
   P_SECONDARY   VARCHAR2(3)    DEFAULT 'Y' CONSTRAINT CHK_P_SECONDARY CHECK (P_SECONDARY IN ('Y', 'N')) NOT NULL,
   P_DDATE   DATE   NOT NULL,
   P_COUNT   NUMBER   DEFAULT 0 NOT NULL,
   P_PERMISSION   VARCHAR2(3)   DEFAULT 'Y' CONSTRAINT CHK_P_PERMISSION CHECK (P_PERMISSION IN ('Y', 'N')) NOT NULL,
   P_PDATE   DATE   NULL,
   P_RETURN   VARCHAR2(4000)   NULL
);

CREATE TABLE PROJECT_NEWS (
   PN_NO   VARCHAR2(40)   CONSTRAINT PK_PN_NO PRIMARY KEY,
   P_NO   VARCHAR2(40)   CONSTRAINT FK_PNEW_P_NO REFERENCES PROJECT(P_NO) ON DELETE CASCADE NOT NULL,
   PN_TITLE   VARCHAR2(150)   NOT NULL,
   PN_TEXT   VARCHAR2(4000)   NOT NULL,
   PN_DATE   DATE   DEFAULT SYSDATE NOT NULL,
   PN_COUNT   NUMBER   DEFAULT 0 NOT NULL
);

CREATE TABLE REVIEW (
   RV_NO   VARCHAR2(40)   CONSTRAINT PK_RV_NO PRIMARY KEY,
   P_NO   VARCHAR2(40)   CONSTRAINT FK_RV_P_NO REFERENCES PROJECT(P_NO) ON DELETE CASCADE NOT NULL,
   U_NO   VARCHAR2(40)   CONSTRAINT FK_RV_U_NO REFERENCES USERS(U_NO) ON DELETE CASCADE NOT NULL,
   RV_TITLE   VARCHAR2(150)   NOT NULL,
   RV_TEXT   VARCHAR2(4000)   NOT NULL,
   RV_DATE   DATE   DEFAULT SYSDATE NOT NULL,
   RV_GRADE   NUMBER   DEFAULT 4 NOT NULL,
   RV_IMG   VARCHAR2(250)   NULL
);

CREATE TABLE REVIEW_REPLY (
   RV_NO   VARCHAR2(40)   CONSTRAINT FK_RVR_RVR_NO REFERENCES REVIEW(RV_NO) ON DELETE CASCADE NOT NULL,
   U_NO   VARCHAR2(40)   CONSTRAINT FK_RVR_U_NO REFERENCES USERS(U_NO) ON DELETE CASCADE NOT NULL,
   RVR_TEXT   VARCHAR2(4000)   NOT NULL,
   RVR_DATE   DATE   DEFAULT SYSDATE NOT NULL
);

CREATE TABLE REVIEW_LIKE (
   RV_NO   VARCHAR2(40)   CONSTRAINT FK_RVL_RVL_NO REFERENCES REVIEW(RV_NO) ON DELETE CASCADE  NOT NULL, 
   U_NO   VARCHAR2(40)   CONSTRAINT FK_RVL_U_NO REFERENCES USERS(U_NO) ON DELETE CASCADE NOT NULL,
   RVL_DATE   DATE   DEFAULT SYSDATE NOT NULL
);

CREATE TABLE NOTICE (
   NT_NO   VARCHAR2(40)   CONSTRAINT PK_NT_NO PRIMARY KEY,
   NT_TITLE   VARCHAR2(150)   NOT NULL,
   NT_TEXT   VARCHAR2(2000)   NOT NULL,
   NT_IMG   VARCHAR2(200)   NULL,
   NT_DATE   DATE   DEFAULT SYSDATE NOT NULL,
   NT_OC   VARCHAR2(3)   DEFAULT 'Y' CONSTRAINT CHK_NT_OC CHECK (NT_OC IN ('Y', 'N')) NOT NULL,
   NT_TYPE   VARCHAR2(20)   DEFAULT 'NOTICE' CONSTRAINT CHK_NT_TYPE CHECK (NT_TYPE IN ('NOTICE', 'EVENT')) NOT NULL,
   A_NO   VARCHAR2(40)   CONSTRAINT FK_NOTICE_A_NO  REFERENCES ADMIN(A_NO) ON DELETE CASCADE NOT NULL
);

CREATE TABLE FAQ (
   FAQ_NO   VARCHAR2(40)   CONSTRAINT PK_FAQ_NO PRIMARY KEY,
   U_NO   VARCHAR2(40)   CONSTRAINT FK_FAQ_A_NO REFERENCES ADMIN(A_NO) ON DELETE CASCADE NOT NULL,
   FAQ_TITLE   VARCHAR2(150)   NOT NULL,
   FAQ_TEXT   VARCHAR2(2000)   NOT NULL,
   FAQ_DATE   DATE   DEFAULT SYSDATE NOT NULL,
   FAQ_OC   VARCHAR2(3)   DEFAULT 'Y' CONSTRAINT CHK_FAQ_OC CHECK (FAQ_OC IN ('Y', 'N')) NOT NULL
);

CREATE TABLE VISIT (
   V_DATE   VARCHAR2(50)   CONSTRAINT PK_V_DATE PRIMARY KEY,
   V_VALUE   NUMBER   DEFAULT 0 NOT NULL
);

CREATE TABLE FOLLOW (
   U_NO_F   VARCHAR2(40)   CONSTRAINT FK_U_NO_F REFERENCES USERS(U_NO) ON DELETE CASCADE NOT NULL,
   U_NO_FR   VARCHAR2(40)   CONSTRAINT FK_U_NO_FR REFERENCES USERS(U_NO) ON DELETE CASCADE NOT NULL,
   F_DATE   DATE   DEFAULT SYSDATE NOT NULL
);

CREATE TABLE PROJECT_LIKE (
   P_NO   VARCHAR2(40)   CONSTRAINT FK_PL_P_NO REFERENCES PROJECT(P_NO) ON DELETE CASCADE NOT NULL,
   U_NO   VARCHAR2(40) CONSTRAINT FK_PL_U_NO REFERENCES USERS(U_NO) ON DELETE CASCADE NOT NULL,
   PL_POST   VARCHAR2(500)   NULL,
   PL_DATE   DATE   DEFAULT SYSDATE NOT NULL
);

CREATE TABLE INQUIRY (
   IQ_NO   VARCHAR2(40)   CONSTRAINT PK_IQ_NO PRIMARY KEY,
   U_NO   VARCHAR2(40)   CONSTRAINT FK_IQ_U_NO  REFERENCES USERS(U_NO) ON DELETE CASCADE NOT NULL,
   IQ_TITLE   VARCHAR2(250)   NOT NULL,
   IQ_TEXT   VARCHAR2(2000)   NOT NULL,
   IQ_IMG   VARCHAR2(250)   NULL,
   IQ_CATEGORY   VARCHAR2(30)   DEFAULT 'INQUIRY' CONSTRAINT CHK_INQ_IQ_CATEGORY CHECK(IQ_CATEGORY IN ('INQUIRY', 'DECLARE')) NOT NULL,
   IQ_DCATEGORY   VARCHAR2(30)  CONSTRAINT   CHK_IQ_DCATEGORY CHECK (IQ_DCATEGORY IN ('USERS', 'PROJECT', 'ETC')),
   IQ_DATE   DATE   DEFAULT SYSDATE NOT NULL,
   IQ_OC   VARCHAR2(3)   DEFAULT 'N' CONSTRAINT CHK_INQ_IQ_OC CHECK(IQ_OC IN ('Y','N')) NOT NULL,
   IQ_REPLY   VARCHAR2(2000)   NULL,
   IQ_RDATE   DATE   DEFAULT SYSDATE NOT NULL,
   A_NO   VARCHAR2(40)   CONSTRAINT FK_IQ_A_NO  REFERENCES ADMIN(A_NO) ON DELETE CASCADE
);

CREATE TABLE REWARD (
   R_NO   VARCHAR2(40)   CONSTRAINT PK_R_NO PRIMARY KEY,
   P_NO   VARCHAR2(40)   CONSTRAINT FK_R_P_NO  REFERENCES PROJECT(P_NO) ON DELETE CASCADE NOT NULL,
   R_AMOUNT VARCHAR2(40) DEFAULT '������' NOT NULL,
   R_NAME   VARCHAR2(100)   NOT NULL,
   R_DETAIL   VARCHAR2(500)   NOT NULL,
   R_PRICE   NUMBER   NOT NULL
);

CREATE TABLE ADMIN (
   A_NO   VARCHAR2(40)   CONSTRAINT PK_A_NO PRIMARY KEY,
   A_ID   VARCHAR2(40)   CONSTRAINT UNQ_A_ID UNIQUE NOT NULL,
   A_NAME   VARCHAR2(40)   NOT NULL,
   A_PW   VARCHAR2(40)   NOT NULL,
   A_JOIN_DATE   DATE   DEFAULT SYSDATE NOT NULL
);

COMMENT ON TABLE ADMIN IS '������';
COMMENT ON TABLE FAQ IS 'FAQ';
COMMENT ON TABLE FOLLOW IS '�ȷο�';
COMMENT ON TABLE NOTICE IS '��������';
COMMENT ON TABLE PAYMENT IS '����';
COMMENT ON TABLE ADMIN IS '������';
COMMENT ON TABLE PROJECT IS '������Ʈ';
COMMENT ON TABLE PROJECT_LIKE IS '������Ʈ_���ƿ�';
COMMENT ON TABLE PROJECT_NEWS IS '������Ʈ_���ҽ�';
COMMENT ON TABLE REVIEW IS '����';
COMMENT ON TABLE REVIEW_LIKE IS '����_���ƿ�';
COMMENT ON TABLE REVIEW_REPLY IS '����_���';
COMMENT ON TABLE REWARD IS '������';
COMMENT ON TABLE USERS IS 'ȸ��';
COMMENT ON TABLE VISIT IS '�湮�����';

COMMENT ON COLUMN ADMIN.A_NO IS '�����ڹ�ȣ';
COMMENT ON COLUMN ADMIN.A_ID IS '���̵�';
COMMENT ON COLUMN ADMIN.A_NAME IS '�̸�';
COMMENT ON COLUMN ADMIN.A_PW IS '��й�ȣ';
COMMENT ON COLUMN ADMIN.A_JOIN_DATE IS '������';

COMMENT ON COLUMN FAQ.FAQ_NO IS '�۹�ȣ';
COMMENT ON COLUMN FAQ.A_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN FAQ.FAQ_TITLE IS '����';
COMMENT ON COLUMN FAQ.FAQ_TEXT IS '����';
COMMENT ON COLUMN FAQ.FAQ_DATE IS '�����';
COMMENT ON COLUMN FAQ.FAQ_OC IS '��������';

 COMMENT ON COLUMN INQUIRY.IQ_NO IS '�۹�ȣ';
COMMENT ON COLUMN INQUIRY.U_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN INQUIRY.IQ_TITLE IS '����';
COMMENT ON COLUMN INQUIRY.IQ_TEXT IS '����';
COMMENT ON COLUMN INQUIRY.IQ_REPLY IS '�亯';
 COMMENT ON COLUMN INQUIRY.A_NO IS '�����ڹ�ȣ';
COMMENT ON COLUMN INQUIRY.IQ_OC IS 'Ȯ�ο���';
COMMENT ON COLUMN INQUIRY.IQ_DATE IS '�����';
COMMENT ON COLUMN INQUIRY.IQ_IMG IS '�̹���';
COMMENT ON COLUMN INQUIRY.IQ_RDATE IS '�亯��';
COMMENT ON COLUMN INQUIRY.IQ_CATEGORY IS '�з�(�Ű�,1��1����,�����ڹ���)';
COMMENT ON COLUMN INQUIRY.IQ_DCATEGORY IS '�Ű��з�';

CCOMMENT ON COLUMN FOLLOW.U_NO_F IS 'ȸ����ȣ(�ȷο�)';
COMMENT ON COLUMN FOLLOW.U_NO_FR IS 'ȸ����ȣ(�ȷο�)';
COMMENT ON COLUMN FOLLOW.F_DATE IS '�����';

COMMENT ON COLUMN NOTICE.NT_NO IS '�۹�ȣ';
COMMENT ON COLUMN NOTICE.A_NO IS '�����ڹ�ȣ';
COMMENT ON COLUMN NOTICE.NT_TITLE IS '����';
COMMENT ON COLUMN NOTICE.NT_TEXT IS '����';
COMMENT ON COLUMN NOTICE.NT_IMG IS '�̹���';
COMMENT ON COLUMN NOTICE.NT_DATE IS '�����';
COMMENT ON COLUMN NOTICE.NT_OC IS '��������';
COMMENT ON COLUMN NOTICE.NT_TYPE IS 'Ÿ��';

COMMENT ON COLUMN PAYMENT.PM_NO IS '������ȣ';
COMMENT ON COLUMN PAYMENT.U_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN PAYMENT.P_NO IS '������Ʈ��ȣ';
COMMENT ON COLUMN PAYMENT.R_NO IS '�������ȣ';
COMMENT ON COLUMN PAYMENT.PM_INFO IS '��������';
COMMENT ON COLUMN PAYMENT.PM_PRICE IS '�����ݾ�';
COMMENT ON COLUMN PAYMENT.PM_PRICE_PLUS IS '�߰��ݾ�';
COMMENT ON COLUMN PAYMENT.PM_DATE IS '����������';
COMMENT ON COLUMN PAYMENT.PM_MILEAGE IS '���ϸ���';
COMMENT ON COLUMN PAYMENT.PM_QUANTITY IS '����';
COMMENT ON COLUMN PAYMENT.PM_NOPEN IS '�̸���������';
COMMENT ON COLUMN PAYMENT.PM_POPEN IS '�ݾװ�������';
COMMENT ON COLUMN PAYMENT.PM_OPTION IS '�ɼǼ���';

COMMENT ON COLUMN PROJECT.P_NO IS '������Ʈ��ȣ';
COMMENT ON COLUMN PROJECT.U_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN PROJECT.P_TITLE IS '������Ʈ����';
COMMENT ON COLUMN PROJECT.P_CATEGORY IS 'ī�װ���';
COMMENT ON COLUMN PROJECT.P_STORY IS '���丮';
COMMENT ON COLUMN PROJECT.P_IMG IS '�̹���';
COMMENT ON COLUMN PROJECT.P_INFO IS '�ȳ�����';
COMMENT ON COLUMN PROJECT.P_NPRICE IS '��������ݾ�';
COMMENT ON COLUMN PROJECT.P_TPRICE IS '��ǥ�ݾ�';
COMMENT ON COLUMN PROJECT.P_SDATE IS '������';
COMMENT ON COLUMN PROJECT.P_EDATE IS '������';
COMMENT ON COLUMN PROJECT.P_SECONDARY IS '����';
COMMENT ON COLUMN PROJECT.P_DDATE IS '�߼���';
COMMENT ON COLUMN PROJECT.P_COUNT IS '��ȸ��';
COMMENT ON COLUMN PROJECT.P_PERMISSION IS '���ο���';
COMMENT ON COLUMN PROJECT.P_PDATE IS 'ó����';
COMMENT ON COLUMN PROJECT.P_RETURN IS '�ݷ�����';

COMMENT ON COLUMN PROJECT_LIKE.P_NO IS '������Ʈ��ȣ';
COMMENT ON COLUMN PROJECT_LIKE.U_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN PROJECT_LIKE.PL_POST IS '�޸�';
COMMENT ON COLUMN PROJECT_LIKE.PL_DATE IS '�����';

COMMENT ON COLUMN PROJECT_NEWS.PN_NO IS '�۹�ȣ';
COMMENT ON COLUMN PROJECT_NEWS.P_NO IS '������Ʈ��ȣ';
COMMENT ON COLUMN PROJECT_NEWS.PN_TITLE IS '����';
COMMENT ON COLUMN PROJECT_NEWS.PN_TEXT IS '����';
COMMENT ON COLUMN PROJECT_NEWS.PN_DATE IS '�ۼ���';
COMMENT ON COLUMN PROJECT_NEWS.PN_COUNT IS '��ȸ��';

COMMENT ON COLUMN REVIEW.RV_NO IS '�����ȣ';
COMMENT ON COLUMN REVIEW.P_NO IS '������Ʈ��ȣ';
COMMENT ON COLUMN REVIEW.U_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN REVIEW.RV_TITLE IS '����';
COMMENT ON COLUMN REVIEW.RV_TEXT IS '����';
COMMENT ON COLUMN REVIEW.RV_DATE IS '�ۼ���';
COMMENT ON COLUMN REVIEW.RV_GRADE IS '����';
COMMENT ON COLUMN REVIEW.RV_IMG IS '�̹���';

COMMENT ON COLUMN REVIEW_LIKE.RV_NO IS '�����ȣ';
COMMENT ON COLUMN REVIEW_LIKE.U_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN REVIEW_LIKE.RVL_DATE IS '�����';

COMMENT ON COLUMN REVIEW_REPLY.RV_NO IS '�����ȣ';
COMMENT ON COLUMN REVIEW_REPLY.U_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN REVIEW_REPLY.RVR_TEXT IS '����';
COMMENT ON COLUMN REVIEW_REPLY.RVR_DATE IS '�ۼ���';

COMMENT ON COLUMN REWARD.R_NO IS '�������ȣ';
COMMENT ON COLUMN REWARD.P_NO IS '������Ʈ��ȣ';
COMMENT ON COLUMN REWARD.R_NAME IS '�������';
COMMENT ON COLUMN REWARD.R_DETAIL IS '�����弳��';
COMMENT ON COLUMN REWARD.R_PRICE IS '�ݾ�';

COMMENT ON COLUMN USERS.U_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN USERS.U_BNO IS '����ڵ�Ϲ�ȣ';
COMMENT ON COLUMN USERS.U_ID IS '���̵�';
COMMENT ON COLUMN USERS.U_NAME IS '�̸�';
COMMENT ON COLUMN USERS.U_PW IS '��й�ȣ';
COMMENT ON COLUMN USERS.U_JOIN_DATE IS '������';
COMMENT ON COLUMN USERS.U_PHONE IS '��ȭ��ȣ';
COMMENT ON COLUMN USERS.U_PROFILE IS '�����ʻ���';
COMMENT ON COLUMN USERS.U_INTRO IS '�Ұ�';
COMMENT ON COLUMN USERS.U_ADDRESS IS '�ּ�';
COMMENT ON COLUMN USERS.U_POST IS '������ȣ';
COMMENT ON COLUMN USERS.U_MILEAGE IS '���ϸ���';
COMMENT ON COLUMN USERS.U_BANK IS '����';
COMMENT ON COLUMN USERS.U_BANK_ACCOUNT IS '���¹�ȣ';
COMMENT ON COLUMN USERS.U_HOMEPAGE IS 'Ȩ������';
COMMENT ON COLUMN USERS.U_CATEGORY IS 'ī�װ���';

COMMENT ON COLUMN VISIT.V_DATE IS '����';
COMMENT ON COLUMN VISIT.V_VALUE IS '��';


CREATE SEQUENCE SEQ_U_PNO
START WITH 100
INCREMENT BY 1
NOCYCLE;

CREATE SEQUENCE SEQ_U_CNO
  START WITH 100
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE SEQ_A_NO
  START WITH 100
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE SEQ_PM_NO
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE SEQ_P_NO
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE SEQ_R_NO
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE SEQ_PN_NO
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE SEQ_RV_NO
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE SEQ_NT_NO
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE SEQ_FAQ_NO
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE SEQ_IQ_NO
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

INSERT INTO ADMIN
  VALUES (
    'C0000'|| TO_CHAR(SEQ_A_NO.nextval),
    'admin@rewardbook.com',
    '������',
    '1234',
    sysdate
  );
  
INSERT INTO ADMIN
  VALUES (
    'C0000'|| TO_CHAR(SEQ_A_NO.nextval),
    'admin2@rewardbook.com',
    '������',
    '1234',
    sysdate
  );
  
INSERT INTO ADMIN
  VALUES (
    'C0000'|| TO_CHAR(SEQ_A_NO.nextval),
    'admin3@rewardbook.com',
    '�̽���',
    '1234',
    sysdate
  );
  
INSERT INTO ADMIN
  VALUES (
    'C0000'|| TO_CHAR(SEQ_A_NO.nextval),
    'admin4@rewardbook.com',
    '�ּ���',
    '1234',
    sysdate
  );
  
INSERT INTO ADMIN
  VALUES (
    'C0000'|| TO_CHAR(SEQ_A_NO.nextval),
    'admin5@rewardbook.com',
    '�ֿ���',
    '1234',
    sysdate
  );
  
INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='�ֿ���'),
    '����� ������ ���� �ֳ���?',
    'ũ�����ݵ����� �����ϴ� ��ǰ���� ��쿡�� ����� ��ġ�� ���� ����ǰ ������ ������ ��찡 ���� �ֽ��ϴ�. ��� �� �ݵ��� ���� �ڱ��� �����Ͽ� �����ϰ� ����ϴ� ���·� ������ �ϴ°���. 
    �׷��ٺ��� ���� ����ǰ�� ��� ��ǰ�� �ٸ��ų�, ���� ���� �� ������ �߻��ϴ� �� ����ġ ���ϴ� ��Ȳ�� �߻��ϱ⵵ �մϴ�. �̷� �κп� ���ؼ��� �͵������ ������Ʈ ���� �� �Ĳ��� Ȯ���ϱ� ���� ����ϰ� ������, �پ��� ������� ���� ����� ������ �� �ֽ��ϴ�.',
    SYSDATE,
    'Y'
  );

INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='�ּ���'),
    '������ �Ͻúҷθ� �����Ѱ���?',
    '������Ͽ��� �ݵ��Ͻ� ������ ī�������� �Է��Ͽ� ���������� �ɾ�δ� ����̴ٺ��� �Ͻú� ������ �����ϰ�, �Һΰ����� �Ͻ� �� �����ϴ�.',
    SYSDATE,
    'Y'
  );
  
INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='�ּ���'),
    '�����带 ���� ���ɰ����Ѱ���?',
    '�Ϲ������� �ù����� ��Ģ���� ��ǰ��ֽ��ϴ�.',
    SYSDATE,
    'Y'
  );

INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='������'),
    '������ ���� �ǳ���?',
    '������Ʈ�� ����� �� ������ �̷�����ϴ�.',
    SYSDATE,
    'Y'
  );

 INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='�̽���'),
    '��ȯ/ȯ��/AS�� ���� �����ؾ��ϳ���?',
    '��ǰ ���� ��ȯ/ȯ��/AS�� ����Ŀ���� �������ּ���.',
    SYSDATE,
    'Y'
  );  
  
INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='������'),
    '������ �ݵ��̶� �����ΰ���?',
    '�������� �ݵ��� �ڱ��� �ʿ��� ����Ŀ�� �ݵ��� ���� �ڱ��� �����Ͽ� �����ϸ� �����尡 �ϼ��Ǹ� �ݵ��� ������ �����Ϳ��� �����ϴ� ����Դϴ�. ����Ŀ�� ������Ʈ ������ �����Ϳ��� ���� �ǵ���� ����ǰ ���ۿ� �ݿ��ϰų� ������Ʈ ȫ���� ������ �� �����͵��� ���� �̺�Ʈ�� �����ϴ� �� �ݵ��ϴ� �����Ϳ� ��ǰ/���񽺸� ����� ����Ŀ���� ����� ������ �̷������ ���� Ư¡�Դϴ�.',
    SYSDATE,
    'N'
  );

INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='�ּ���'),
    '�� ���� ���� ����� ����ϳ���?',
    '������Ʈ�� ������ ��� ������ �̷������ �ʽ��ϴ�.',
    SYSDATE,
    'Y'
  );
  
INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='�ֿ���'),
    '������Ʈ ����/������ ������ �����ΰ���?',
    '������ �ݾ��� ������Ʈ ��ǥ �ݾ��� 100% �̸��̸� ����, ������ �ݾ��� ������Ʈ ��ǥ �ݾ��� 100% �̻� �޼��� ��� �����Դϴ�',
    SYSDATE,
    'Y'
  );

INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='�̽���'),
    '���ҽ��̶� �����ΰ���?',
    '���ҽ��������Ϳ� �����ϴ� â������ �ŷڸ� ����� ������ �� �ƴ϶�, �ݵ��� ���������� �������ֽ� �е鲲 �̸��Ϸ� �˸��� ���� ������ ����Ŀ���� ������ ���Ǹ� ������ �� �ִ� ����̱⵵ �մϴ�. ',
    SYSDATE,
    'N'
  );

 INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='������'),
    '������Ʈ�� ���� �����ϴ� �� ���� ��������?',
    '��ŷŸ�� (���� 9��~6��)�� �����ڰ� ���� ���̸� Ȥ�� ���� �Ŀ� �߻��� �� �ִ� ������ ������Ͽ��� �ﰢ������ ������ �� �ֵ��� ��ŷŸ�� �߿� �����Ͻô� ���� ����帳�ϴ�.',
    SYSDATE,
    'N'
  ); 
 
 
 
 
 INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_MILEAGE)  --����ȸ��
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'kimjy@gmail.com',
    '������',
    '1234__@@rsb',
    sysdate,
    '010-7644-0834',
    '�ȳ��ϼ��� �ݰ����ϴ�. �ְ߿�ǰ�� ������ ���ƿ�!',
    0
  ); 
  
   INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_MILEAGE)  --����ȸ��
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'sangwanpark@naver.com',
    '�ڻ��',
    'psw00_!',
    sysdate,
    '010-5097-1268',
    '�ȳ��ϼ��� �ߺ�Ź�帳�ϴ�.',
    2300
  ); 
  
  INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE,  U_INTRO, U_ADDRESS, U_POST, U_BANK, U_BANK_ACCOUNT,U_MILEAGE)  --����ȸ��
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'jinjoooo@naver.com',
    '������',
    '94_kang!!',
    sysdate,
    '010-3301-4599',
    '�������Դϴ�.',
    '��⵵ ��õ�� �һ籸 �۳��� 402-1���� 303ȣ',
    '11407',
    '�ϳ�',
    '302-9923-331-01',
    0
  );
  
  INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_MILEAGE)  --����ȸ��
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'kimdooo11@naver.com',
    '�赵��',
    'doyeon1@@0809',
    sysdate,
    '010-5202-9633',
    '��ǻ�Ϳ�ǰ�� ������ �����ϴ�.',
    100
  ); 
 
   
  INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_MILEAGE)  --����ȸ��
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'jiwwwoo@gmail.com',
    'Ȳ����',
    'jwh_##3399',
    sysdate,
    '010-8685-0102',
    '�ڱ�Ұ�',
    1380
  );
  
  INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE,  U_INTRO, U_ADDRESS, U_POST, U_BANK, U_BANK_ACCOUNT,U_MILEAGE)  --����ȸ��
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'jangsyyy@daum.net',
    '�弭��',
    '9292__kcgood!@',
    sysdate,
    '010-2202-5619',
    '�ݰ����ϴ�. �ߺ�Ź�����.',
    '����Ư���� ���ﵿ �������� 2F',
    '100382',
    '����',
    '110-402-744292',
    0
  );  
  
  INSERT INTO USERS(U_NO, U_BNO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_ADDRESS, U_POST, U_HOMEPAGE, U_CATEGORY) --���ȸ��
  VALUES(
    'B0000'|| TO_CHAR(SEQ_U_CNO.nextval),
    '243-85-00787',
    'michyeora@naver.com',
    '����ũ�ν�',
    'micheya5501!!',
    sysdate,
    '1666-3166',
    '���ۿ����Ƿ����� �����ϴ� ���Ķ�',
    '��⵵ ������ ������ 1-50 �츮���� 5�� ����ũ�ν�',
    '12088',
    'https://www.michyeora.com',
    '�Ƿ�'
  );
  
    INSERT INTO USERS(U_NO, U_BNO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_ADDRESS, U_POST, U_HOMEPAGE, U_CATEGORY) --���ȸ��
  VALUES(
    'B0000'|| TO_CHAR(SEQ_U_CNO.nextval),
    '201-86-40287',
    'sappun@naver.com',
    '�ֽ�ȸ�� ���',
    'micheya5501!!',
    '2019/01/22',
    '1544-2767',
    '����ϰ�, SAPPUN',
    '����� ���ϱ� ������ 1262-211����',
    '12088',
    'http://www.sappun.co.kr',
    '�Ź�'
  );
  
  INSERT INTO USERS(U_NO, U_BNO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_CATEGORY) --���ȸ��
  VALUES(
    'B0000'|| TO_CHAR(SEQ_U_CNO.nextval),
    '606-86-47092',
    'good1212@gmail.com',
    '����Ʈ���� �ֽ�ȸ��',
    'healthgood12!!',
    '2019/05/11',
    '010-4789-0504',
    '�ǰ��� ���� �ǰ���',
    '�ǰ�'
  );
  
  INSERT INTO USERS(U_NO, U_BNO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_CATEGORY) --���ȸ��
  VALUES(
    'B0000'|| TO_CHAR(SEQ_U_CNO.nextval),
    '105-88-04158',
    'zoomhaven@daum.net',
    '���ؼ�',
    '@soosoo1001@',
    '2019/07/30',
    '02-334-3332',
    '��Ÿ�Ͽ� ����Ƽ�� ���ϴ�! ���ؼ�',
    '�Ǽ�����'
  ); 
  
  INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '������'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '�ڻ��'),
    sysdate
    
  );
  
  INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '������'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '�赵��'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '�赵��'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '������'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = 'Ȳ����'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '�弭��'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '������'),
    (SELECT U_NO FROM USERS WHERE U_NAME = 'Ȳ����'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '�ڻ��'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '������'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '������'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '����ũ�ν�'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '�弭��'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '�ڻ��'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '�ڻ��'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '���ؼ�'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '�弭��'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '������'),
    sysdate
    
  );
  
  delete from follow where U_NO_F = 'A0000101';
  
  INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '�������� �׽�Ʈ��', --����
    '�������� �׽�Ʈ���Դϴ�.', --����
    NULL, --�̹���
    SYSDATE,  --�����
    'Y',   --��������
    'NOTICE', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '�ֿ���')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '���������� Ȯ�����ּ���.', --����
    '�������ױ��Դϴ�..', --����
    NULL, --�̹���
    SYSDATE,  --�����
    'N',   --��������
    'NOTICE', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '������')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '������� 7�� �̺�Ʈ �ȳ�', --����
    '������� 7�� �̺�Ʈ �ȳ� ���Դϴ�.', --����
    NULL, --�̹���
    '2019/07/01',  --�����
    'N',   --��������
    'NOTICE', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '�ּ���')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '������� 8�� �̺�Ʈ �ȳ�', --����
    '������� 8�� �̺�Ʈ �ȳ� ���Դϴ�.', --����
    NULL, --�̹���
    SYSDATE,  --�����
    'Y',   --��������
    'EVENT', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '�ֿ���')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '���������� ����Ǵ� �׽�Ʈ���Դϴ�.', --����
    '�������� �׽�Ʈ���Դϴ�.', --����
    NULL, --�̹���
    SYSDATE,  --�����
    'Y',   --��������
    'NOTICE', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '������')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '���� �ݵ��ϸ� �߼� �� ���', --����
    '���� �ݵ��ϸ� �߼� �� ���!', --����
    NULL, --�̹���
    SYSDATE,  --�����
    'Y',   --��������
    'EVENT', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '������')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '�߼����� �ݵ������� ����Ŀ�� �����մϴ�.', --����
    '�߼����� �ݵ������� ����Ŀ�� �����մϴ�..', --����
    NULL, --�̹���
    SYSDATE,  --�����
    'Y',   --��������
    'NOTICE', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '�̽���')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '����Ŀ�� �ݵ� ���� ���� ���� ����', --����
    '�ֱ� ��ü ������Ʈ ��� ���� ���� ���������� ������Ʈ ���� �� �Ϻ� ����Ŀ �� �����ڰ� ���� �ݵ��� �����Ͽ� �ݵ����� ���� �� ���������� ���� ���� ó���ϴ� ��ʰ� �߰ߵǰ� �־� �����帳�ϴ�.', --����
    NULL, --�̹���
    SYSDATE,  --�����
    'Y',   --��������
    'NOTICE', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '�ֿ���')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '�������� �׽�Ʈ��', --����
    '�������� �׽�Ʈ���Դϴ�.', --����
    NULL, --�̹���
    SYSDATE,  --�����
    'Y',   --��������
    'NOTICE', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '�ֿ���')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '���� ����', --����
    '������ �����Ǿ����ϴ�. ���� �̿� ��Ź�帳�ϴ�.', --����
    NULL, --�̹���
    SYSDATE,  --�����
    'Y',   --��������
    'NOTICE', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '�ּ���')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '��� ���� �ȳ�', --����
    '��� ���� �ȳ�.', --����
    NULL, --�̹���
    SYSDATE,  --�����
    'Y',   --��������
    'NOTICE', --Ÿ��
    (SELECT A_NO FROM ADMIN where A_NAME = '������')
  );
  
  INSERT INTO PROJECT
  VALUES(
   TO_CHAR(SEQ_P_NO.nextval),
  (SELECT U_NO FROM USERS where U_NAME = '���ؼ�'),
  '���� �簢 ���� �� ������ �ʸ� ���� �Ҹ�! ź���� �־� ��Ʈ',
  '�Ǽ�����',
  '���� �簢�� �� �Ҹ��� ���� ź���� �־�, �ڽ��� �¾ �ް� �´� ź������ �����ϰ� ������ �ǰ��� ����� ������ �������ݴϴ�.',
  NULL,
  '������ �߼��� 2019.10.30 ���� ������ �� �ֽ��ϴ�. �ݵ� ���� ��, �����带 ������ �� �ִ� ũ�����ݵ��� Ư���� ���� ���������� ����ġ ���� ��Ȳ���� ���Ͽ� ������ �߼��� �����ǰų� �߼��� �Ұ��� �� �ֽ��ϴ�.',
  0,
  1000000,
  SYSDATE,
  '19/09/30',
  'Y',
 '19/10/30',
  0,
  'Y',
  '19/08/27',
  NULL
  );
  
  INSERT INTO PROJECT
  VALUES(
   TO_CHAR(SEQ_P_NO.nextval),
  (SELECT U_NO FROM USERS where U_NAME = '������'),
  '������ ��Ÿ��D �ַ�� - ��Ÿ���콺',
  'IT',
  '�׷��� ����� ������ �����߽��ϴ�. �����ϰ�, �����ϰ�, �׸��� �ϻ� ��Ȱ�� ū ��ȭ ���� ��Ÿ��D�� �ռ��� ���� ������? �׸���, ��ħ�� ��� �е��� �����ϰ� �����ϸ� �ϻ��Ȱ�� ū ��ȭ ���� ��Ÿ��D�� �ռ��� �� �ִ� ���콺�� ����� �Ǿ����ϴ�. ��ǻ�ͷ� �� ���� ���� ��ôٸ�, �ٷ� ���ݵ� ��Ÿ��D�� �ռ��� �� �ְ� ����� �帮��, ��Ÿ���콺�� �Ұ��մϴ�.',
  NULL,
  '������ �߼��� 2019.10.30 ���� ������ �� �ֽ��ϴ�. �ݵ� ���� ��, �����带 ������ �� �ִ� ũ�����ݵ��� Ư���� ���� ���������� ����ġ ���� ��Ȳ���� ���Ͽ� ������ �߼��� �����ǰų� �߼��� �Ұ��� �� �ֽ��ϴ�.',
  1900000,
  2000000,
  SYSDATE,
  '19/09/30',
  'Y',
 '19/10/30',
  0,
  'Y',
  '19/07/29',
  NULL
  );
  
   INSERT INTO PROJECT
  VALUES(
   TO_CHAR(SEQ_P_NO.nextval),
  (SELECT U_NO FROM USERS where U_NAME = '�ڻ��'),
  '�� 1�и��� �Ϻ� ���! ��Ÿ�ϸ����� �޴�� �ڿܼ� ��ձ�',
  'IT',
  '������, ������, 1��. ������ ��� ����� �ʿ�ġ �ʾƿ�. ���� ���������� ����� ����ũ��. �� ���� Ŭ������ �����Ը� ���⼼��.',
  NULL,
  '������ �߼��� 2019.11.03 ���� ������ �� �ֽ��ϴ�.',
  1000000,
  3500000,
  SYSDATE,
  '19/10/03',
  'Y',
 '19/11/30',
  0,
  'Y',
  '19/08/02',
  NULL
  ); 

   INSERT INTO PROJECT
  VALUES(
   TO_CHAR(SEQ_P_NO.nextval),
  (SELECT U_NO FROM USERS where U_NAME = '�赵��'),
  '����� ������ �ո��� ��ȣ���� OFM�ʷ���Ʈ',
  'IT',
  '��ġ�� ���µ� �ո���� ������ �ʵ���. Ű���嵵 ���콺�� OFM �ʷ���Ʈ�� ���ĵ帱����.',
  NULL,
  '������ �߼��� 2019.01.09 / 2019.01.19 / 2019.01.30 ���� ������ �� �ֽ��ϴ�.',
  1000000,
  3500000,
  SYSDATE,
  '19/09/23',
  'Y',
 '19/10/30',
  0,
  'Y',
  '19/07/20',
  NULL
  ); 

   INSERT INTO PROJECT
  VALUES(
   TO_CHAR(SEQ_P_NO.nextval),
  (SELECT U_NO FROM USERS where U_NAME = '����Ʈ���� �ֽ�ȸ��'),
  '���� �Ծ �������� �ʴ� �ֻ��� ���̴�����! [���ο����Ϲ���]',
  '�Ƿ�',
  '����ߴ� �� �� �״��, �������� ���� �ֻ��� ���̴�����! 40�� ����� ������������ ���Ͽ츦 ��Ƴ� ���������� �⺻.  ���ο����Ϲ����� Ŭ����+������ ���̴�����',
  NULL,
  '�����尡 9�� �� ���¿����Դϴ�.',
  0,
  5000000,
  SYSDATE,
  '19/10/01',
  'Y',
 '19/11/30',
  0,
  'N',
  NULL,
  NULL
  ); 

  INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '1'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '�ڻ��'),
    SYSDATE
  );

  INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '1'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '�赵��'),
    SYSDATE
  );
  
    INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '4'),
    (SELECT U_NO FROM USERS WHERE U_NAME = 'Ȳ����'),
    SYSDATE
  );
  
    INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '4'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '������'),
    SYSDATE
  );
  
    INSERT INTO PROJECT_LIKE
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '5'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '�ڻ��'),
    '�����ֿ� �Ŀ��ҿ���!',
    SYSDATE
  );
  COMMIT;
  
  INSERT INTO PROJECT_NEWS
  VALUES(
    TO_CHAR(SEQ_PN_NO.nextval),
    (SELECT P_NO FROM PROJECT WHERE P_NO = '1'),
    '������Ʈ ���ҽ� �Դϴ�.',
    '�����ӹ�! �����ͺе�, ���� �����մϴ�!',
    SYSDATE,
    0
  );
  
  INSERT INTO PROJECT_NEWS
  VALUES(
    TO_CHAR(SEQ_PN_NO.nextval),
    (SELECT P_NO FROM PROJECT WHERE P_NO = '1'),
    '�����Ǿ����ϴ�.',
    '�����ͺе��� ������ ���Ծ� �����Ǿ����ϴ�! �����մϴ�.',
    SYSDATE,
    0
  ); 
  
    INSERT INTO PROJECT_NEWS
  VALUES(
    TO_CHAR(SEQ_PN_NO.nextval),
    (SELECT P_NO FROM PROJECT WHERE P_NO = '4'),
    '������ �����߰��ȳ�',
    '�����ͺе��� ������ ���Ծ� ������ ������ 100�� �� �÷Ƚ��ϴ�. �����մϴ�.',
    SYSDATE,
    0
  ); 
  
    
    INSERT INTO PROJECT_NEWS
  VALUES(
    TO_CHAR(SEQ_PN_NO.nextval),
    (SELECT P_NO FROM PROJECT WHERE P_NO = '5'),
    '���ƿ� 100�� ��� ��¦ �̺�Ʈ ��÷�� ��ǥ�Դϴ�.',
    '�����ͺе鲲 ū ����� �޾Ƽ� ������ ������ ���ϰ���, ��¦ �̺�Ʈ�� �������ϴ�.',
    SYSDATE,
    0
  );

    INSERT INTO PROJECT_NEWS
  VALUES(
    TO_CHAR(SEQ_PN_NO.nextval),
    (SELECT P_NO FROM PROJECT WHERE P_NO = '1'),
    '���ƿ� 30�� ��� ��¦ �̺�Ʈ ��÷�� ��ǥ�Դϴ�.',
    '�����ͺе鲲 ū ����� �޾Ƽ� ������ ������ ���ϰ���, ��¦ �̺�Ʈ�� �������ϴ�.',
    SYSDATE,
    0
  );

 INSERT INTO REVIEW(RV_NO, P_NO, U_NO, RV_TITLE, RV_TEXT, RV_DATE, RV_GRADE, RV_IMG)  --����ȸ��
  VALUES (
    TO_CHAR(seq_rv_no.nextval),
    '1',
    'A0000100',
    '�̰� ��� ����ģ���� �޶������',
    '����ģ�� ���Ϸ� ����������� ���� �����ֳ׿� ��¥ ���޴ϴ�',
     sysdate,
     4,
     null
  ); 
  
   INSERT INTO REVIEW(RV_NO, P_NO, U_NO, RV_TITLE, RV_TEXT, RV_DATE, RV_GRADE, RV_IMG)  --����ȸ��
  VALUES (
    TO_CHAR(seq_rv_no.nextval),
    '2',
    'A0000101',
    '�̰� ��� ���Ⱑ ���Ҿ��',
    '������õ �մϴ� ���콺���� ��Ÿ���� ���Ϳ� �ű�..',
     sysdate,
     4,
     null
  ); 
  
   INSERT INTO REVIEW(RV_NO, P_NO, U_NO, RV_TITLE, RV_TEXT, RV_DATE, RV_GRADE, RV_IMG)  --����ȸ��
  VALUES (
    TO_CHAR(seq_rv_no.nextval),
    '3',
    'A0000102',
    '������ �޶����ϴ�..',
    '�̾� ����ϴµ� 1���̸� ����ϳ׿� ����մϴ�',
     sysdate,
     1,
     null
  ); 
  
   INSERT INTO REVIEW(RV_NO, P_NO, U_NO, RV_TITLE, RV_TEXT, RV_DATE, RV_GRADE, RV_IMG)  --����ȸ��
  VALUES (
    TO_CHAR(seq_rv_no.nextval),
    '4',
    'A0000103',
    '���콺 ��¥ �����׿�',
    '����ģ�� ��������µ� ���� �����ؿ� ����',
     sysdate,
     3,
     null
  ); 
  
   INSERT INTO REVIEW(RV_NO, P_NO, U_NO, RV_TITLE, RV_TEXT, RV_DATE, RV_GRADE, RV_IMG)  --����ȸ��
  VALUES (
    TO_CHAR(seq_rv_no.nextval),
    '5',
    'A0000104',
    '�� �����ϴ� ����',
    '�� ���� ���Ƽ� �׷����� ���� �� ���׿�',
     sysdate,
     5,
     null
  ); 



 INSERT INTO REVIEW_REPLY(RV_NO, U_NO, RVR_TEXT, RVR_DATE)  --����ȸ��
  VALUES (
    '1',
    'A0000104',
    '�������� �η��׿�',
    sysdate
    ); 
  
   INSERT INTO REVIEW_REPLY(RV_NO, U_NO, RVR_TEXT, RVR_DATE)  --����ȸ��
  VALUES (
    '2',
    'A0000103',
    '��¥ ��Ÿ�� ����?',
    sysdate
  ); 
  
   INSERT INTO REVIEW_REPLY(RV_NO, U_NO, RVR_TEXT, RVR_DATE)  --����ȸ��
  VALUES (
    '3',
    'A0000102',
    '�̰� ��������',
    sysdate
  ); 
  
   INSERT INTO REVIEW_REPLY(RV_NO, U_NO, RVR_TEXT, RVR_DATE)  --����ȸ��
  VALUES (
    '4',
    'A0000101',
    '�̰� ���콺 ����� �̻���',
    sysdate
  ); 
  
   INSERT INTO REVIEW_REPLY(RV_NO, U_NO, RVR_TEXT, RVR_DATE)  --����ȸ��
  VALUES (
    '5',
    'A0000100',
    '�� ������?',
    sysdate
  ); 



INSERT INTO REVIEW_LIKE(RV_NO, U_NO, RVL_DATE)  --����ȸ��
  VALUES (
    '1',
    'A0000104',
    sysdate
    ); 
  
   INSERT INTO REVIEW_LIKE(RV_NO, U_NO, RVL_DATE)  --����ȸ��
  VALUES (
    '2',
    'A0000103',
    sysdate
  ); 
  
  INSERT INTO REVIEW_LIKE(RV_NO, U_NO, RVL_DATE)  --����ȸ��
  VALUES (
    '3',
    'A0000102',
    sysdate
  ); 
  
  INSERT INTO REVIEW_LIKE(RV_NO, U_NO, RVL_DATE)  --����ȸ��
  VALUES (
    '4',
    'A0000101',
    sysdate
  ); 
  
  INSERT INTO REVIEW_LIKE(RV_NO, U_NO, RVL_DATE)  --����ȸ��
  VALUES (
    '5',
    'A0000100',
    sysdate
  ); 



 INSERT INTO REWARD (R_NO, P_NO,R_AMOUNT, R_NAME, R_DETAIL, R_PRICE)  --����ȸ��
  VALUES (
    TO_CHAR(seq_r_no.nextval),
    '1',
    '300',
    'ź���� �����',
    '�����ջ� ����� �Դϴ�',
    '49800'
    ); 
  
   INSERT INTO REWARD (R_NO, P_NO,R_AMOUNT, R_NAME, R_DETAIL, R_PRICE)--����ȸ��
  VALUES (
    TO_CHAR(seq_r_no.nextval),
    '2',
    '500',
    '��Ÿ���콺',
    '����� ���� ��Ÿ��!',
    '59500'
  ); 
  
  INSERT INTO REWARD (R_NO, P_NO,R_AMOUNT, R_NAME, R_DETAIL, R_PRICE)  --����ȸ��
  VALUES (
    TO_CHAR(seq_r_no.nextval),
    '3',
    '1000',
    '��Ÿ�ϸ��� �ڿܼ� ��ձ�',
    '���� �ڿܼ� ��ձ�',
    '20000'
  ); 
  
  INSERT INTO REWARD (R_NO, P_NO,R_AMOUNT, R_NAME, R_DETAIL, R_PRICE) --����ȸ��
  VALUES (
    TO_CHAR(seq_r_no.nextval),
    '4',
    default,
    'OFM �ʷ���Ʈ',
    '�ո�ȣ ���콺',
    '80000'
  ); 
  
  INSERT INTO REWARD (R_NO, P_NO,R_AMOUNT, R_NAME, R_DETAIL, R_PRICE)  --����ȸ��
  VALUES (
    TO_CHAR(seq_r_no.nextval),
    '5',
    '142'
    '���� ���̴� ����',
    '�� ���� �ְ� ������',
    '149800'
  ); 



 INSERT INTO PAYMENT (PM_NO, U_NO, P_NO, R_NO, PM_INFO, PM_PRICE, PM_PRICE_PLUS, PM_DATE, PM_MILEAGE, PM_QUANTITY, PM_NOPEN, PM_POPEN)  --����ȸ��
  VALUES (
    TO_CHAR(seq_pm_no.nextval),
    'A0000100',
    '1',
    '1',
    'Ŀ�� �󸮹���',
    '49800',
    '20000',
    sysdate,
    '300',
    '2',
    default,
    default
    ); 
  
   INSERT INTO PAYMENT (PM_NO, U_NO, P_NO, R_NO, PM_INFO, PM_PRICE, PM_PRICE_PLUS, PM_DATE, PM_MILEAGE, PM_QUANTITY, PM_NOPEN, PM_POPEN)--����ȸ��
  VALUES (
    TO_CHAR(seq_pm_no.nextval),
    'A0000101',
    '2',
    '2',
    '���� �󸮹���',
    '59500',
    '30000',
    sysdate,
    '1300',
    '1',
    default,
    default
  ); 
  
  INSERT INTO PAYMENT (PM_NO, U_NO, P_NO, R_NO, PM_INFO, PM_PRICE, PM_PRICE_PLUS, PM_DATE, PM_MILEAGE, PM_QUANTITY, PM_NOPEN, PM_POPEN)  --����ȸ��
  VALUES (
    TO_CHAR(seq_pm_no.nextval),
    'A0000102',
    '3',
    '3',
    '�󸮹���',
    '20000',
    '10000',
    sysdate,
    '500',
    '1',
    default,
    default
  ); 
  
  INSERT INTO PAYMENT (PM_NO, U_NO, P_NO, R_NO, PM_INFO, PM_PRICE, PM_PRICE_PLUS, PM_DATE, PM_MILEAGE, PM_QUANTITY, PM_NOPEN, PM_POPEN) --����ȸ��
  VALUES (
    TO_CHAR(seq_pm_no.nextval),
    'A0000103',
    '4',
    '4',
    'Ŀ�� �󸮹���',
    '80000',
    '20000',
    sysdate,
    '700',
    '2',
    default,
    default
  ); 
  
  INSERT INTO PAYMENT (PM_NO, U_NO, P_NO, R_NO, PM_INFO, PM_PRICE, PM_PRICE_PLUS, PM_DATE, PM_MILEAGE, PM_QUANTITY, PM_NOPEN, PM_POPEN)  --����ȸ��
  VALUES (
    TO_CHAR(seq_pm_no.nextval),
    'A0000104',
    '5',
    '5',
    '��Ʈ�� �󸮹���',
    '149800',
    '20000',
    sysdate,
    '3300',
    '1',
    default,
    default
  ); 
  
  --�������� ����κ� null�� ���  
  ALTER TABLE notice MODIFY (nt_text NULL);

  ALTER TABLE faq RENAME COLUMN u_no TO a_no;
  
 -- reward ���̺� r_amount �÷��߰� 
ALTER TABLE reward ADD(R_AMOUNT VARCHAR2(40));

-- inquiry ���̺� ���õ������߰�
 INSERT INTO inquiry
  VALUES(
    TO_CHAR(SEQ_IQ_NO.nextval),
    'A0000104',
    '�������ݵ��� �����ΰ���?',
    '�������ݵ��� ���� �� �𸣰ڽ��ϴ�. �˷��ּ���.',
    null,
    default,
    null,
    sysdate,
    'Y',
    '������� �ڱ��� �ʿ��� ����Ŀ�� �ݵ��� ���� �ڱ��� �����Ͽ� �����ϸ� �����尡 �ϼ��Ǹ� �ݵ��� ������ �����Ϳ��� �����ϴ� ����Դϴ�. ����Ŀ�� ������Ʈ ������ �����Ϳ��� ���� �ǵ���� ����ǰ ���ۿ� �ݿ��ϰų� ������Ʈ ȫ���� ������ �� �����͵��� ���� �̺�Ʈ�� �����ϴ� �� �ݵ��ϴ� �����Ϳ� ��ǰ/���񽺸� ����� ����Ŀ���� ����� ������ �̷������ ���� Ư¡�Դϴ�.',
    sysdate,
    'C0000100'
  ); 

 INSERT INTO inquiry
  VALUES(
    TO_CHAR(SEQ_IQ_NO.nextval),
    'A0000104',
    '�����带 ���� ���ɰ����Ѱ���?',
    '���� ���� �����带 ã�ư��� �����ϰ� ������ �����ұ��?',
    null,
    default,
    null,
    sysdate,
    'Y',
    '������� �ù� ����� ��Ģ���� �ϰ��ֽ��ϴ�.',
    sysdate,
    'C0000100'
  );
  
   INSERT INTO inquiry
  VALUES(
    TO_CHAR(SEQ_IQ_NO.nextval),
    'A0000104',
    '������ �Ͻúҷθ� �����Ѱ���?',
    '������ �Ͻúҷθ� �����Ѱ���?',
    null,
    default,
    null,
    sysdate,
    'Y',
    '��. ������Ͽ��� �ݵ��Ͻ� ������ ī�������� �Է��Ͽ� ���������� �ɾ�δ� ����̴ٺ��� �Ͻú� ������ �����ϰ�, �Һΰ����� �Ͻ� �� �����ϴ�.',
    sysdate,
    'C0000101'
  ); 

CREATE SEQUENCE SEQ_OTO_NO
START WITH 100
INCREMENT BY 1
NOCYCLE;

DROP TABLE OTO;

CREATE TABLE OTO (

  OTO_NO  VARCHAR2(40) NOT NULL,
  U_NO   VARCHAR2(40),
  U_NO_answer   VARCHAR2(40) CONSTRAINT FK_U_NO_ANSWER_OTOA REFERENCES USERS(U_NO) ON DELETE CASCADE NOT NULL,
  OTO_QTITLE VARCHAR2(100) NOT NULL,
  OTO_QTEXT VARCHAR2(4000) NOT NULL,
  OTO_QDATE DATE NOT NULL,
  OTO_YN  VARCHAR2(10) NOT NULL,
  OTO_ATITLE VARCHAR2(100),
  OTO_ATEXT VARCHAR2(4000),
  OTO_ADATE DATE
);
COMMENT ON COLUMN OTO.OTO_NO IS '�۹�ȣ';
COMMENT ON COLUMN OTO.U_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN OTO.U_NO_answer IS '�亯��ȸ����ȣ';
COMMENT ON COLUMN OTO.OTO_QTITLE IS '��������';
COMMENT ON COLUMN OTO.OTO_QTEXT IS '��������';
COMMENT ON COLUMN OTO.OTO_QDATE IS '������';
COMMENT ON COLUMN OTO.OTO_YN IS '�亯����';
COMMENT ON COLUMN OTO.OTO_ATITLE IS '�亯����';
COMMENT ON COLUMN OTO.OTO_ATEXT IS '�亯����';
COMMENT ON COLUMN OTO.OTO_ADATE IS '�亯��';

COMMENT ON TABLE OTO IS '1��1����';

COMMIT;

INSERT INTO OTO
VALUES (
  TO_CHAR(SEQ_OTO_NO.nextval),
  'A0000104',
  'B0000103',
  '������Ʈ ���� �����ϳ���?',
  '�ʹ� �����ϰ� ������ �ƽ��Ե� �����Ƴ׿�. ���ݿ����� �ֳ���?',
  SYSDATE,
  'Y',
  '�����Ե��� ������ ���Ծ� 10���߼��� ���� ������ �ֽ��ϴ�.',
  '�����Ե��� ������ ���Ծ� 10���߼��� ���� ������ �ֽ��ϴ�. ����ũ�ν��� ������ּż� �����մϴ�. ���� ��� ��Ź�帳�ϴ�.',
  SYSDATE
);

INSERT INTO OTO
VALUES (
  TO_CHAR(SEQ_OTO_NO.nextval),
  'A0000104',
  'A0000103',
  '�ּ��� ���氡���Ѱ���?',
  '�ּ����� �߸��Է��߽��ϴ�..��۹��� �ּҸ� ������� 11-7����� �������ּ���.',
  SYSDATE,
  'Y',
  'Ȳ���� ������, �亯�Դϴ�.',
  '�̹� ���� 9�� 18���ڷ� ��ǰ�� ����Ȱ����� Ȯ�ε˴ϴ�. ������ �帮�� ���� �˼��մϴ�. �ڼ��� ������ �ù��� �����ֽñ� �ٶ��ϴ�.',
  SYSDATE
);

INSERT INTO OTO
VALUES (
  TO_CHAR(SEQ_OTO_NO.nextval),
  'A0000104',
  'B0000103',
  '�ִ� ���ż����� 3���� �����Ǿ��ִµ� �߰� ���Ŵ� �ȵǳ���',
  '5������ �� �����ϰ�������, �ȵɱ��?',
  SYSDATE,
  'N',
  NULL,
  NULL,
  NULL
);

DELETE FROM OTO WHERE OTO_NO = '108';
COMMIT;

CREATE SEQUENCE SEQ_MEMO_NO
INCREMENT BY 1
NOCYCLE;


CREATE TABLE MEMO (

  M_NO  VARCHAR2(40) NOT NULL,
  P_NO   VARCHAR2(40)  CONSTRAINT FK_P_NO_MEMO REFERENCES PROJECT(P_NO) ON DELETE CASCADE NOT NULL,
 U_NO VARCHAR2(40)  CONSTRAINT FK_U_NO_MEMO REFERENCES USERS(U_NO) ON DELETE CASCADE NOT NULL,
  M_TEXT VARCHAR2(4000),
  M_DATE DATE
);
COMMENT ON COLUMN MEMO.M_NO IS '�޸��ȣ';
COMMENT ON COLUMN MEMO.P_NO IS '������Ʈ��ȣ';
COMMENT ON COLUMN MEMO.U_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMO.M_TEXT IS '�޸𳻿�';
COMMENT ON COLUMN MEMO.M_DATE IS '�޸�����';
COMMENT ON TABLE OTO IS '�޸�';

COMMIT;


INSERT INTO MEMO
VALUES (
  TO_CHAR(SEQ_MEMO_NO.nextval),
  '1',
  'A0000104',
  '���� �̰�  �ʿ��Ѱ�?',
  SYSDATE
 
);

INSERT INTO MEMO
VALUES (
  TO_CHAR(SEQ_MEMO_NO.nextval),
  '2',
  'A0000104',
  '��Ÿ���� �� ���ƺ��δ�',
  SYSDATE
 
);

INSERT INTO MEMO
VALUES (
  TO_CHAR(SEQ_MEMO_NO.nextval),
  '3',
  'A0000104',
  '���!!',
  SYSDATE
 
);

INSERT INTO MEMO
VALUES (
  TO_CHAR(SEQ_MEMO_NO.nextval),
  '4',
  'A0000104',
  '�� �ո� �߿�����',
  SYSDATE
 
);

INSERT INTO MEMO
VALUES (
  TO_CHAR(SEQ_MEMO_NO.nextval),
  '5',
  'A0000104',
  '���̴��� ���ڴ�',
  SYSDATE
 
);


COMMIT;

--������� 1.6VER

UPDATE USERS SET U_NAME = '����Ʈ����' WHERE U_NO = 'B0000102';

COMMIT;

--������� 1.7VER

ALTER TABLE USERS ADD(P_BILLING VARCHAR2(100));

COMMIT;

ALTER TABLE PAYMENT DROP COLUMN PM_INFO;

COMMIT;

COMMENT ON COLUMN USERS.P_BILLING IS '����Ű';
COMMENT ON COLUMN USERS.U_ADDRESS_DETAIL IS '���ּ�';
COMMENT ON COLUMN USERS.U_JOB IS '����';

COMMIT;

--������� 1.8VER

delete from payment where u_no = 'A0000104' and p_no = '5';

COMMIT;

--������� 1.9VER

ALTER TABLE PAYMENT DROP COLUMN PM_DATE;

COMMIT;

--������� 2.0VER

ALTER TABLE PAYMENT ADD(PM_OID VARCHAR2(100));
COMMENT ON COLUMN PAYMENT.PM_OID IS '�ֹ���ȣ';

ALTER TABLE PAYMENT DROP COLUMN PM_QUANTITY;

ALTER TABLE PAYMENT ADD(PM_QUANTITY VARCHAR2(30));

ALTER TABLE PAYMENT MODIFY (PM_QUANTITY DEFAULT '1');

COMMENT ON COLUMN PAYMENT.PM_QUANTITY IS '����';

--����� Ŀ���� ���� ������ ���õ����Ϳ� ���� ä�����մϴ�. �������� cache ����
--������� 2.1VER (�ֹ���ȣ ���̺� ���� ����� ���̸�Ʈ ���̺��� ���� �÷��� ������Ÿ���� ����)

alter sequence SEQ_A_NO nocache;
alter sequence SEQ_FAQ_NO nocache;
alter sequence SEQ_IQ_NO nocache;
alter sequence SEQ_MEMO_NO nocache;
alter sequence SEQ_NT_NO nocache;
alter sequence SEQ_OTO_NO nocache;
alter sequence SEQ_P_NO nocache;
alter sequence SEQ_PM_NO nocache;
alter sequence SEQ_PN_NO nocache;
alter sequence SEQ_R_NO nocache;
alter sequence SEQ_RV_NO nocache;
alter sequence SEQ_U_CNO nocache;
alter sequence SEQ_U_PNO nocache;

ALTER TABLE inquiry MODIFY iq_rdate NULL;

COMMIT;

-- ������� 2,2VER

  INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '2'),
    (SELECT U_NO FROM USERS WHERE U_NAME = 'Ȳ����'),
    SYSDATE
  );

  INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '2'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '�ڻ��'),
    SYSDATE
  );

   UPDATE project
     SET p_count = 10
     WHERE p_no = '1';
     
     UPDATE project
     SET p_count = 2197
     WHERE p_no = '2';
     
     UPDATE project
     SET p_count = 128
     WHERE p_no = '3';
     
     UPDATE project
     SET p_count = 781
     WHERE p_no = '4';
     
     UPDATE project
     SET p_count = 750
     WHERE p_no = '5';
     
--������� 2.3ver  

ALTER TABLE PAYMENT ADD(PM_SUCCESS VARCHAR2(3) DEFAULT 'N' NOT NULL);

COMMENT ON COLUMN PAYMENT.PM_SUCCESS IS '��������';

COMMIT;

-- �߰����� : PAYMENT ���̺��� PM_SUCCESS �÷� �߰�
--������� 2.4VER

   UPDATE project
     SET p_img = 't1.PNG'
     WHERE p_no = '21';

   UPDATE project
     SET p_img = 't3.PNG'
     WHERE p_no = '2';
     
  UPDATE project
     SET p_img = 't2.PNG'
     WHERE p_no = '4' or p_no ='24';   
  
   UPDATE project
     SET p_img = 't3.PNG'
     WHERE p_no ='22';      
     
    UPDATE project
     SET p_img = 't6.PNG'
     WHERE p_no ='23' or p_no = '3';        
     commit;
     
      UPDATE project
     SET p_img = 't7.PNG'
     WHERE p_no ='27' or p_no = '5';        
     commit;

-- ������Ʈ �����̹��� ������Ʈ 2.5VER
 commit;
 
 -- �������̺� �Ű���� �÷� �߰�
 ALTER TABLE inquiry ADD(iq_target VARCHAR2(40));