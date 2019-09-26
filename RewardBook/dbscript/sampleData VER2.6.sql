
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
   U_CATEGORY   VARCHAR2(150)   CONSTRAINT CHK_U_CATEGORY CHECK (U_CATEGORY IN ('주류', '생활', '건강', '의류', 'IT', '여행', '악세서리', '가방', '신발'))
);

--직업, 상세주소 컬럼추가
alter table users add(u_address_detail varchar2(255));
alter table users add(u_job varchar2(30));

--전화번호 null값 허용으로 수정
ALTER TABLE users MODIFY (u_phone NULL);

--users 테이블 카테고리부분 제약조건 삭제(다중선택 필요)
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
   R_AMOUNT VARCHAR2(40) DEFAULT '무제한' NOT NULL,
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

COMMENT ON TABLE ADMIN IS '관리자';
COMMENT ON TABLE FAQ IS 'FAQ';
COMMENT ON TABLE FOLLOW IS '팔로우';
COMMENT ON TABLE NOTICE IS '공지사항';
COMMENT ON TABLE PAYMENT IS '결제';
COMMENT ON TABLE ADMIN IS '관리자';
COMMENT ON TABLE PROJECT IS '프로젝트';
COMMENT ON TABLE PROJECT_LIKE IS '프로젝트_좋아요';
COMMENT ON TABLE PROJECT_NEWS IS '프로젝트_새소식';
COMMENT ON TABLE REVIEW IS '리뷰';
COMMENT ON TABLE REVIEW_LIKE IS '리뷰_좋아요';
COMMENT ON TABLE REVIEW_REPLY IS '리뷰_댓글';
COMMENT ON TABLE REWARD IS '리워드';
COMMENT ON TABLE USERS IS '회원';
COMMENT ON TABLE VISIT IS '방문자통계';

COMMENT ON COLUMN ADMIN.A_NO IS '관리자번호';
COMMENT ON COLUMN ADMIN.A_ID IS '아이디';
COMMENT ON COLUMN ADMIN.A_NAME IS '이름';
COMMENT ON COLUMN ADMIN.A_PW IS '비밀번호';
COMMENT ON COLUMN ADMIN.A_JOIN_DATE IS '가입일';

COMMENT ON COLUMN FAQ.FAQ_NO IS '글번호';
COMMENT ON COLUMN FAQ.A_NO IS '회원번호';
COMMENT ON COLUMN FAQ.FAQ_TITLE IS '제목';
COMMENT ON COLUMN FAQ.FAQ_TEXT IS '본문';
COMMENT ON COLUMN FAQ.FAQ_DATE IS '등록일';
COMMENT ON COLUMN FAQ.FAQ_OC IS '공개여부';

 COMMENT ON COLUMN INQUIRY.IQ_NO IS '글번호';
COMMENT ON COLUMN INQUIRY.U_NO IS '회원번호';
COMMENT ON COLUMN INQUIRY.IQ_TITLE IS '제목';
COMMENT ON COLUMN INQUIRY.IQ_TEXT IS '본문';
COMMENT ON COLUMN INQUIRY.IQ_REPLY IS '답변';
 COMMENT ON COLUMN INQUIRY.A_NO IS '관리자번호';
COMMENT ON COLUMN INQUIRY.IQ_OC IS '확인여부';
COMMENT ON COLUMN INQUIRY.IQ_DATE IS '등록일';
COMMENT ON COLUMN INQUIRY.IQ_IMG IS '이미지';
COMMENT ON COLUMN INQUIRY.IQ_RDATE IS '답변일';
COMMENT ON COLUMN INQUIRY.IQ_CATEGORY IS '분류(신고,1대1문의,관리자문의)';
COMMENT ON COLUMN INQUIRY.IQ_DCATEGORY IS '신고분류';

CCOMMENT ON COLUMN FOLLOW.U_NO_F IS '회원번호(팔로우)';
COMMENT ON COLUMN FOLLOW.U_NO_FR IS '회원번호(팔로워)';
COMMENT ON COLUMN FOLLOW.F_DATE IS '등록일';

COMMENT ON COLUMN NOTICE.NT_NO IS '글번호';
COMMENT ON COLUMN NOTICE.A_NO IS '관리자번호';
COMMENT ON COLUMN NOTICE.NT_TITLE IS '제목';
COMMENT ON COLUMN NOTICE.NT_TEXT IS '본문';
COMMENT ON COLUMN NOTICE.NT_IMG IS '이미지';
COMMENT ON COLUMN NOTICE.NT_DATE IS '등록일';
COMMENT ON COLUMN NOTICE.NT_OC IS '공개여부';
COMMENT ON COLUMN NOTICE.NT_TYPE IS '타입';

COMMENT ON COLUMN PAYMENT.PM_NO IS '결제번호';
COMMENT ON COLUMN PAYMENT.U_NO IS '회원번호';
COMMENT ON COLUMN PAYMENT.P_NO IS '프로젝트번호';
COMMENT ON COLUMN PAYMENT.R_NO IS '리워드번호';
COMMENT ON COLUMN PAYMENT.PM_INFO IS '결제정보';
COMMENT ON COLUMN PAYMENT.PM_PRICE IS '결제금액';
COMMENT ON COLUMN PAYMENT.PM_PRICE_PLUS IS '추가금액';
COMMENT ON COLUMN PAYMENT.PM_DATE IS '결제예정일';
COMMENT ON COLUMN PAYMENT.PM_MILEAGE IS '마일리지';
COMMENT ON COLUMN PAYMENT.PM_QUANTITY IS '수량';
COMMENT ON COLUMN PAYMENT.PM_NOPEN IS '이름공개여부';
COMMENT ON COLUMN PAYMENT.PM_POPEN IS '금액공개여부';
COMMENT ON COLUMN PAYMENT.PM_OPTION IS '옵션선택';

COMMENT ON COLUMN PROJECT.P_NO IS '프로젝트번호';
COMMENT ON COLUMN PROJECT.U_NO IS '회원번호';
COMMENT ON COLUMN PROJECT.P_TITLE IS '프로젝트제목';
COMMENT ON COLUMN PROJECT.P_CATEGORY IS '카테고리';
COMMENT ON COLUMN PROJECT.P_STORY IS '스토리';
COMMENT ON COLUMN PROJECT.P_IMG IS '이미지';
COMMENT ON COLUMN PROJECT.P_INFO IS '안내사항';
COMMENT ON COLUMN PROJECT.P_NPRICE IS '현재모집금액';
COMMENT ON COLUMN PROJECT.P_TPRICE IS '목표금액';
COMMENT ON COLUMN PROJECT.P_SDATE IS '시작일';
COMMENT ON COLUMN PROJECT.P_EDATE IS '마감일';
COMMENT ON COLUMN PROJECT.P_SECONDARY IS '차수';
COMMENT ON COLUMN PROJECT.P_DDATE IS '발송일';
COMMENT ON COLUMN PROJECT.P_COUNT IS '조회수';
COMMENT ON COLUMN PROJECT.P_PERMISSION IS '승인여부';
COMMENT ON COLUMN PROJECT.P_PDATE IS '처리일';
COMMENT ON COLUMN PROJECT.P_RETURN IS '반려사유';

COMMENT ON COLUMN PROJECT_LIKE.P_NO IS '프로젝트번호';
COMMENT ON COLUMN PROJECT_LIKE.U_NO IS '회원번호';
COMMENT ON COLUMN PROJECT_LIKE.PL_POST IS '메모';
COMMENT ON COLUMN PROJECT_LIKE.PL_DATE IS '등록일';

COMMENT ON COLUMN PROJECT_NEWS.PN_NO IS '글번호';
COMMENT ON COLUMN PROJECT_NEWS.P_NO IS '프로젝트번호';
COMMENT ON COLUMN PROJECT_NEWS.PN_TITLE IS '제목';
COMMENT ON COLUMN PROJECT_NEWS.PN_TEXT IS '본문';
COMMENT ON COLUMN PROJECT_NEWS.PN_DATE IS '작성일';
COMMENT ON COLUMN PROJECT_NEWS.PN_COUNT IS '조회수';

COMMENT ON COLUMN REVIEW.RV_NO IS '리뷰번호';
COMMENT ON COLUMN REVIEW.P_NO IS '프로젝트번호';
COMMENT ON COLUMN REVIEW.U_NO IS '회원번호';
COMMENT ON COLUMN REVIEW.RV_TITLE IS '제목';
COMMENT ON COLUMN REVIEW.RV_TEXT IS '본문';
COMMENT ON COLUMN REVIEW.RV_DATE IS '작성일';
COMMENT ON COLUMN REVIEW.RV_GRADE IS '평점';
COMMENT ON COLUMN REVIEW.RV_IMG IS '이미지';

COMMENT ON COLUMN REVIEW_LIKE.RV_NO IS '리뷰번호';
COMMENT ON COLUMN REVIEW_LIKE.U_NO IS '회원번호';
COMMENT ON COLUMN REVIEW_LIKE.RVL_DATE IS '등록일';

COMMENT ON COLUMN REVIEW_REPLY.RV_NO IS '리뷰번호';
COMMENT ON COLUMN REVIEW_REPLY.U_NO IS '회원번호';
COMMENT ON COLUMN REVIEW_REPLY.RVR_TEXT IS '본문';
COMMENT ON COLUMN REVIEW_REPLY.RVR_DATE IS '작성일';

COMMENT ON COLUMN REWARD.R_NO IS '리워드번호';
COMMENT ON COLUMN REWARD.P_NO IS '프로젝트번호';
COMMENT ON COLUMN REWARD.R_NAME IS '리워드명';
COMMENT ON COLUMN REWARD.R_DETAIL IS '리워드설명';
COMMENT ON COLUMN REWARD.R_PRICE IS '금액';

COMMENT ON COLUMN USERS.U_NO IS '회원번호';
COMMENT ON COLUMN USERS.U_BNO IS '사업자등록번호';
COMMENT ON COLUMN USERS.U_ID IS '아이디';
COMMENT ON COLUMN USERS.U_NAME IS '이름';
COMMENT ON COLUMN USERS.U_PW IS '비밀번호';
COMMENT ON COLUMN USERS.U_JOIN_DATE IS '가입일';
COMMENT ON COLUMN USERS.U_PHONE IS '전화번호';
COMMENT ON COLUMN USERS.U_PROFILE IS '프로필사진';
COMMENT ON COLUMN USERS.U_INTRO IS '소개';
COMMENT ON COLUMN USERS.U_ADDRESS IS '주소';
COMMENT ON COLUMN USERS.U_POST IS '우편번호';
COMMENT ON COLUMN USERS.U_MILEAGE IS '마일리지';
COMMENT ON COLUMN USERS.U_BANK IS '은행';
COMMENT ON COLUMN USERS.U_BANK_ACCOUNT IS '계좌번호';
COMMENT ON COLUMN USERS.U_HOMEPAGE IS '홈페이지';
COMMENT ON COLUMN USERS.U_CATEGORY IS '카테고리';

COMMENT ON COLUMN VISIT.V_DATE IS '일자';
COMMENT ON COLUMN VISIT.V_VALUE IS '값';


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
    '강귀정',
    '1234',
    sysdate
  );
  
INSERT INTO ADMIN
  VALUES (
    'C0000'|| TO_CHAR(SEQ_A_NO.nextval),
    'admin2@rewardbook.com',
    '오세준',
    '1234',
    sysdate
  );
  
INSERT INTO ADMIN
  VALUES (
    'C0000'|| TO_CHAR(SEQ_A_NO.nextval),
    'admin3@rewardbook.com',
    '이승진',
    '1234',
    sysdate
  );
  
INSERT INTO ADMIN
  VALUES (
    'C0000'|| TO_CHAR(SEQ_A_NO.nextval),
    'admin4@rewardbook.com',
    '최선혜',
    '1234',
    sysdate
  );
  
INSERT INTO ADMIN
  VALUES (
    'C0000'|| TO_CHAR(SEQ_A_NO.nextval),
    'admin5@rewardbook.com',
    '최연영',
    '1234',
    sysdate
  );
  
INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='최연영'),
    '배송이 지연될 수도 있나요?',
    '크라우드펀딩으로 진행하는 제품들의 경우에는 양산을 거치지 않은 시제품 정도의 상태인 경우가 많이 있습니다. 양산 전 펀딩을 통해 자금을 모집하여 제작하고 배송하는 형태로 진행을 하는거죠. 
    그러다보니 실제 시제품과 양산 제품이 다르거나, 제작 과정 중 문제가 발생하는 등 예상치 못하는 상황이 발생하기도 합니다. 이런 부분에 대해서는 와디즈에서도 프로젝트 오픈 전 꼼꼼히 확인하기 위해 노력하고 있으나, 다양한 변수들로 종종 배송이 지연될 수 있습니다.',
    SYSDATE,
    'Y'
  );

INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='최선혜'),
    '결제는 일시불로만 가능한가요?',
    '리워드북에서 펀딩하실 때에는 카드정보를 입력하여 결제예약을 걸어두는 방식이다보니 일시불 결제만 가능하고, 할부결제는 하실 수 없습니다.',
    SYSDATE,
    'Y'
  );
  
INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='최선혜'),
    '리워드를 직접 수령가능한가요?',
    '일반적으로 택배배송을 원칙으로 운영되고있습니다.',
    SYSDATE,
    'Y'
  );

INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='오세준'),
    '결제는 언제 되나요?',
    '프로젝트가 종료될 때 결제가 이루어집니다.',
    SYSDATE,
    'Y'
  );

 INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='이승진'),
    '교환/환불/AS는 어디로 문의해야하나요?',
    '제품 관련 교환/환불/AS은 메이커에게 문의해주세요.',
    SYSDATE,
    'Y'
  );  
  
INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='강귀정'),
    '리워드 펀딩이란 무엇인가요?',
    '리워드형 펀딩은 자금이 필요한 메이커가 펀딩을 통해 자금을 모집하여 제작하며 리워드가 완성되면 펀딩에 참여한 서포터에게 제공하는 방식입니다. 메이커는 프로젝트 진행중 서포터에게 받은 피드백을 보상품 제작에 반영하거나 프로젝트 홍보에 도움을 준 서포터들을 위해 이벤트를 진행하는 등 펀딩하는 서포터와 제품/서비스를 만드는 메이커간의 긴밀한 소통이 이루어지는 점이 특징입니다.',
    SYSDATE,
    'N'
  );

INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='최선혜'),
    '왜 결제 예약 방식을 사용하나요?',
    '프로젝트가 실패한 경우 결제가 이루어지지 않습니다.',
    SYSDATE,
    'Y'
  );
  
INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='최연영'),
    '프로젝트 성공/실패의 기준은 무엇인가요?',
    '모집된 금액이 프로젝트 목표 금액의 100% 미만이면 실패, 모집된 금액이 프로젝트 목표 금액의 100% 이상 달성한 경우 성공입니다',
    SYSDATE,
    'Y'
  );

INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='이승진'),
    '새소식이란 무엇인가요?',
    '새소식은서포터와 소통하는 창구이자 신뢰를 만드는 공간일 뿐 아니라, 펀딩과 지지서명에 참여해주신 분들께 이메일로 알림이 가기 때문에 메이커님의 열정과 성의를 보여줄 수 있는 기능이기도 합니다. ',
    SYSDATE,
    'N'
  );

 INSERT INTO FAQ
  VALUES(
    TO_CHAR(SEQ_FAQ_NO.nextval),
    (SELECT A_NO FROM ADMIN WHERE A_NAME ='오세준'),
    '프로젝트는 언제 오픈하는 게 제일 좋은가요?',
    '워킹타임 (평일 9시~6시)에 접속자가 많은 편이며 혹시 오픈 후에 발생할 수 있는 문제에 리워드북에서 즉각적으로 대응할 수 있도록 워킹타임 중에 오픈하시는 것을 권장드립니다.',
    SYSDATE,
    'N'
  ); 
 
 
 
 
 INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_MILEAGE)  --개인회원
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'kimjy@gmail.com',
    '김지연',
    '1234__@@rsb',
    sysdate,
    '010-7644-0834',
    '안녕하세요 반갑습니다. 애견용품에 관심이 많아요!',
    0
  ); 
  
   INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_MILEAGE)  --개인회원
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'sangwanpark@naver.com',
    '박상완',
    'psw00_!',
    sysdate,
    '010-5097-1268',
    '안녕하세요 잘부탁드립니다.',
    2300
  ); 
  
  INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE,  U_INTRO, U_ADDRESS, U_POST, U_BANK, U_BANK_ACCOUNT,U_MILEAGE)  --개인회원
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'jinjoooo@naver.com',
    '강진주',
    '94_kang!!',
    sysdate,
    '010-3301-4599',
    '강진주입니다.',
    '경기도 부천시 소사구 송내동 402-1번지 303호',
    '11407',
    '하나',
    '302-9923-331-01',
    0
  );
  
  INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_MILEAGE)  --개인회원
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'kimdooo11@naver.com',
    '김도연',
    'doyeon1@@0809',
    sysdate,
    '010-5202-9633',
    '컴퓨터용품에 관심이 많습니다.',
    100
  ); 
 
   
  INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_MILEAGE)  --개인회원
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'jiwwwoo@gmail.com',
    '황지우',
    'jwh_##3399',
    sysdate,
    '010-8685-0102',
    '자기소개',
    1380
  );
  
  INSERT INTO USERS(U_NO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE,  U_INTRO, U_ADDRESS, U_POST, U_BANK, U_BANK_ACCOUNT,U_MILEAGE)  --개인회원
  VALUES (
    'A0000'|| TO_CHAR(SEQ_U_PNO.nextval),
    'jangsyyy@daum.net',
    '장서영',
    '9292__kcgood!@',
    sysdate,
    '010-2202-5619',
    '반갑습니다. 잘부탁드려요.',
    '서울특별시 역삼동 남도빌딩 2F',
    '100382',
    '국민',
    '110-402-744292',
    0
  );  
  
  INSERT INTO USERS(U_NO, U_BNO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_ADDRESS, U_POST, U_HOMEPAGE, U_CATEGORY) --기업회원
  VALUES(
    'B0000'|| TO_CHAR(SEQ_U_CNO.nextval),
    '243-85-00787',
    'michyeora@naver.com',
    '위드크로스',
    'micheya5501!!',
    sysdate,
    '1666-3166',
    '예쁜여성의류만을 고집하는 미쳐라',
    '경기도 군포시 금정동 1-50 우리빌딩 5층 위드크로스',
    '12088',
    'https://www.michyeora.com',
    '의류'
  );
  
    INSERT INTO USERS(U_NO, U_BNO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_ADDRESS, U_POST, U_HOMEPAGE, U_CATEGORY) --기업회원
  VALUES(
    'B0000'|| TO_CHAR(SEQ_U_CNO.nextval),
    '201-86-40287',
    'sappun@naver.com',
    '주식회사 사뿐',
    'micheya5501!!',
    '2019/01/22',
    '1544-2767',
    '사뿐하게, SAPPUN',
    '서울시 성북구 길음동 1262-211번지',
    '12088',
    'http://www.sappun.co.kr',
    '신발'
  );
  
  INSERT INTO USERS(U_NO, U_BNO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_CATEGORY) --기업회원
  VALUES(
    'B0000'|| TO_CHAR(SEQ_U_CNO.nextval),
    '606-86-47092',
    'good1212@gmail.com',
    '베스트위즈 주식회사',
    'healthgood12!!',
    '2019/05/11',
    '010-4789-0504',
    '건강을 위한 건강몰',
    '건강'
  );
  
  INSERT INTO USERS(U_NO, U_BNO, U_ID, U_NAME, U_PW, U_JOIN_DATE, U_PHONE, U_INTRO, U_CATEGORY) --기업회원
  VALUES(
    'B0000'|| TO_CHAR(SEQ_U_CNO.nextval),
    '105-88-04158',
    'zoomhaven@daum.net',
    '수앤수',
    '@soosoo1001@',
    '2019/07/30',
    '02-334-3332',
    '스타일에 퀄리티를 더하다! 수앤수',
    '악세서리'
  ); 
  
  INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '김지연'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '박상완'),
    sysdate
    
  );
  
  INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '강진주'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '김도연'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '김도연'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '강진주'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '황지우'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '장서영'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '김지연'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '황지우'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '박상완'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '강진주'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '강진주'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '위드크로스'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '장서영'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '박상완'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '박상완'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '수앤수'),
    sysdate
    
  );
  
    INSERT INTO FOLLOW
  VALUES(
  
    (SELECT U_NO FROM USERS where U_NAME = '장서영'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '강진주'),
    sysdate
    
  );
  
  delete from follow where U_NO_F = 'A0000101';
  
  INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '공지사항 테스트글', --제목
    '공지사항 테스트글입니다.', --본문
    NULL, --이미지
    SYSDATE,  --등록일
    'Y',   --공개여부
    'NOTICE', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '최연영')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '공지사항을 확인해주세요.', --제목
    '공지사항글입니다..', --본문
    NULL, --이미지
    SYSDATE,  --등록일
    'N',   --공개여부
    'NOTICE', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '강귀정')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '리워드북 7월 이벤트 안내', --제목
    '리워드북 7월 이벤트 안내 글입니다.', --본문
    NULL, --이미지
    '2019/07/01',  --등록일
    'N',   --공개여부
    'NOTICE', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '최선혜')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '리워드북 8월 이벤트 안내', --제목
    '리워드북 8월 이벤트 안내 글입니다.', --본문
    NULL, --이미지
    SYSDATE,  --등록일
    'Y',   --공개여부
    'EVENT', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '최연영')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '공지사항이 저장되는 테스트글입니다.', --제목
    '공지사항 테스트글입니다.', --본문
    NULL, --이미지
    SYSDATE,  --등록일
    'Y',   --공개여부
    'NOTICE', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '오세준')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '지금 펀딩하면 추석 전 배송', --제목
    '지금 펀딩하면 추석 전 배송!', --본문
    NULL, --이미지
    SYSDATE,  --등록일
    'Y',   --공개여부
    'EVENT', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '오세준')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '추석연휴 펀딩오픈할 메이커를 모집합니다.', --제목
    '추석연휴 펀딩오픈할 메이커를 모집합니다..', --본문
    NULL, --이미지
    SYSDATE,  --등록일
    'Y',   --공개여부
    'NOTICE', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '이승진')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '메이커의 펀딩 조작 행위 관련 공지', --제목
    '최근 전체 프로젝트 대비 아주 적은 비율이지만 프로젝트 진행 중 일부 메이커 및 관계자가 직접 펀딩에 참여하여 펀딩액을 높인 후 고의적으로 결제 실패 처리하는 사례가 발견되고 있어 공지드립니다.', --본문
    NULL, --이미지
    SYSDATE,  --등록일
    'Y',   --공개여부
    'NOTICE', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '최연영')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '공지사항 테스트글', --제목
    '공지사항 테스트글입니다.', --본문
    NULL, --이미지
    SYSDATE,  --등록일
    'Y',   --공개여부
    'NOTICE', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '최연영')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '메인 개편', --제목
    '메인이 개편되었습니다. 많은 이용 부탁드립니다.', --본문
    NULL, --이미지
    SYSDATE,  --등록일
    'Y',   --공개여부
    'NOTICE', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '최선혜')
  );
  
    INSERT INTO NOTICE
  VALUES(
    TO_CHAR(SEQ_NT_NO.nextval),
    '약관 개정 안내', --제목
    '약관 개정 안내.', --본문
    NULL, --이미지
    SYSDATE,  --등록일
    'Y',   --공개여부
    'NOTICE', --타입
    (SELECT A_NO FROM ADMIN where A_NAME = '오세준')
  );
  
  INSERT INTO PROJECT
  VALUES(
   TO_CHAR(SEQ_P_NO.nextval),
  (SELECT U_NO FROM USERS where U_NAME = '수앤수'),
  '작은 사각 공간 속 빛나는 너를 위한 소망! 탄생석 주얼리 세트',
  '악세서리',
  '작은 사각형 속 소망을 담은 탄생석 주얼리, 자신의 태어난 달과 맞는 탄생석을 착용하고 있으면 건강과 행운을 보석이 가져다줍니다.',
  NULL,
  '리워드 발송이 2019.10.30 까지 지연될 수 있습니다. 펀딩 받은 후, 리워드를 제작할 수 있는 크라우드펀딩의 특성과 생산 과정에서의 예상치 못한 상황으로 인하여 리워드 발송이 지연되거나 발송이 불가할 수 있습니다.',
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
  (SELECT U_NO FROM USERS where U_NAME = '김지연'),
  '간편한 비타민D 솔루션 - 비타마우스',
  'IT',
  '그래서 저희는 고민을 시작했습니다. 안전하게, 간편하게, 그리고 일상 생활의 큰 변화 없이 비타민D를 합성할 수는 없을까? 그리고, 마침내 모든 분들이 안전하고 간편하며 일상생활에 큰 변화 없이 비타민D를 합성할 수 있는 마우스를 만들게 되었습니다. 컴퓨터로 이 글을 보고 계시다면, 바로 지금도 비타민D를 합성할 수 있게 만들어 드리는, 비타마우스를 소개합니다.',
  NULL,
  '리워드 발송이 2019.10.30 까지 지연될 수 있습니다. 펀딩 받은 후, 리워드를 제작할 수 있는 크라우드펀딩의 특성과 생산 과정에서의 예상치 못한 상황으로 인하여 리워드 발송이 지연되거나 발송이 불가할 수 있습니다.',
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
  (SELECT U_NO FROM USERS where U_NAME = '박상완'),
  '단 1분만에 완벽 살균! 스타일리쉬한 휴대용 자외선 살균기',
  'IT',
  '꺼내고, 누르고, 1분. 복잡한 살균 방법은 필요치 않아요. 가장 직관적으로 설계된 유비크리. 한 번의 클릭으로 깨끗함만 남기세요.',
  NULL,
  '리워드 발송이 2019.11.03 까지 지연될 수 있습니다.',
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
  (SELECT U_NO FROM USERS where U_NAME = '김도연'),
  '당신의 소중한 손목을 보호해줄 OFM팜레스트',
  'IT',
  '골치도 아픈데 손목까지 아프지 않도록. 키보드도 마우스도 OFM 팜레스트가 받쳐드릴께요.',
  NULL,
  '리워드 발송이 2019.01.09 / 2019.01.19 / 2019.01.30 까지 지연될 수 있습니다.',
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
  (SELECT U_NO FROM USERS where U_NAME = '베스트위즈 주식회사'),
  '누가 입어도 실패하지 않는 최상의 라이더자켓! [슬로우유니버스]',
  '의류',
  '상상했던 그 핏 그대로, 실패하지 않을 최상의 라이더자켓! 40년 경력의 레더마스터의 노하우를 담아낸 가죽자켓의 기본.  슬로우유니버스의 클래식+오버핏 라이더자켓',
  NULL,
  '리워드가 9월 초 오픈예정입니다.',
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
    (SELECT U_NO FROM USERS WHERE U_NAME = '박상완'),
    SYSDATE
  );

  INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '1'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '김도연'),
    SYSDATE
  );
  
    INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '4'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '황지우'),
    SYSDATE
  );
  
    INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '4'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '강진주'),
    SYSDATE
  );
  
    INSERT INTO PROJECT_LIKE
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '5'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '박상완'),
    '다음주에 후원할예정!',
    SYSDATE
  );
  COMMIT;
  
  INSERT INTO PROJECT_NEWS
  VALUES(
    TO_CHAR(SEQ_PN_NO.nextval),
    (SELECT P_NO FROM PROJECT WHERE P_NO = '1'),
    '프로젝트 새소식 입니다.',
    '마감임박! 서포터분들, 정말 감사합니다!',
    SYSDATE,
    0
  );
  
  INSERT INTO PROJECT_NEWS
  VALUES(
    TO_CHAR(SEQ_PN_NO.nextval),
    (SELECT P_NO FROM PROJECT WHERE P_NO = '1'),
    '마감되었습니다.',
    '서포터분들의 성원에 힘입어 마감되었습니다! 감사합니다.',
    SYSDATE,
    0
  ); 
  
    INSERT INTO PROJECT_NEWS
  VALUES(
    TO_CHAR(SEQ_PN_NO.nextval),
    (SELECT P_NO FROM PROJECT WHERE P_NO = '4'),
    '리워드 수량추가안내',
    '서포터분들의 성원에 힘입어 리워드 수량을 100개 더 늘렸습니다. 감사합니다.',
    SYSDATE,
    0
  ); 
  
    
    INSERT INTO PROJECT_NEWS
  VALUES(
    TO_CHAR(SEQ_PN_NO.nextval),
    (SELECT P_NO FROM PROJECT WHERE P_NO = '5'),
    '좋아요 100개 기념 깜짝 이벤트 당첨자 발표입니다.',
    '서포터분들께 큰 사랑을 받아서 감사한 마음을 전하고자, 깜짝 이벤트를 열었습니다.',
    SYSDATE,
    0
  );

    INSERT INTO PROJECT_NEWS
  VALUES(
    TO_CHAR(SEQ_PN_NO.nextval),
    (SELECT P_NO FROM PROJECT WHERE P_NO = '1'),
    '좋아요 30개 기념 깜짝 이벤트 당첨자 발표입니다.',
    '서포터분들께 큰 사랑을 받아서 감사한 마음을 전하고자, 깜짝 이벤트를 열었습니다.',
    SYSDATE,
    0
  );

 INSERT INTO REVIEW(RV_NO, P_NO, U_NO, RV_TITLE, RV_TEXT, RV_DATE, RV_GRADE, RV_IMG)  --개인회원
  VALUES (
    TO_CHAR(seq_rv_no.nextval),
    '1',
    'A0000100',
    '이걸 사고 여자친구가 달라졌어요',
    '여자친구 생일로 선물해줬더니 정말 잘해주네요 진짜 예쁩니다',
     sysdate,
     4,
     null
  ); 
  
   INSERT INTO REVIEW(RV_NO, P_NO, U_NO, RV_TITLE, RV_TEXT, RV_DATE, RV_GRADE, RV_IMG)  --개인회원
  VALUES (
    TO_CHAR(seq_rv_no.nextval),
    '2',
    'A0000101',
    '이걸 사고 감기가 나았어요',
    '강력추천 합니다 마우스에서 비타민이 나와요 신기..',
     sysdate,
     4,
     null
  ); 
  
   INSERT INTO REVIEW(RV_NO, P_NO, U_NO, RV_TITLE, RV_TEXT, RV_DATE, RV_GRADE, RV_IMG)  --개인회원
  VALUES (
    TO_CHAR(seq_rv_no.nextval),
    '3',
    'A0000102',
    '집안이 달라집니다..',
    '이야 살균하는데 1분이면 충분하네요 대단합니다',
     sysdate,
     1,
     null
  ); 
  
   INSERT INTO REVIEW(RV_NO, P_NO, U_NO, RV_TITLE, RV_TEXT, RV_DATE, RV_GRADE, RV_IMG)  --개인회원
  VALUES (
    TO_CHAR(seq_rv_no.nextval),
    '4',
    'A0000103',
    '마우스 진짜 괜찮네요',
    '여자친구 선물해줬는데 정말 좋아해요 ㅎㅎ',
     sysdate,
     3,
     null
  ); 
  
   INSERT INTO REVIEW(RV_NO, P_NO, U_NO, RV_TITLE, RV_TEXT, RV_DATE, RV_GRADE, RV_IMG)  --개인회원
  VALUES (
    TO_CHAR(seq_rv_no.nextval),
    '5',
    'A0000104',
    '핏 좋습니다 ㅎㅎ',
    '제 몸이 좋아서 그런지는 몰라도 핏 좋네요',
     sysdate,
     5,
     null
  ); 



 INSERT INTO REVIEW_REPLY(RV_NO, U_NO, RVR_TEXT, RVR_DATE)  --개인회원
  VALUES (
    '1',
    'A0000104',
    'ㅋㅋㅋㅋ 부럽네요',
    sysdate
    ); 
  
   INSERT INTO REVIEW_REPLY(RV_NO, U_NO, RVR_TEXT, RVR_DATE)  --개인회원
  VALUES (
    '2',
    'A0000103',
    '진짜 비타민 나옴?',
    sysdate
  ); 
  
   INSERT INTO REVIEW_REPLY(RV_NO, U_NO, RVR_TEXT, RVR_DATE)  --개인회원
  VALUES (
    '3',
    'A0000102',
    '이거 괜찮을듯',
    sysdate
  ); 
  
   INSERT INTO REVIEW_REPLY(RV_NO, U_NO, RVR_TEXT, RVR_DATE)  --개인회원
  VALUES (
    '4',
    'A0000101',
    '이거 마우스 생긴거 이상함',
    sysdate
  ); 
  
   INSERT INTO REVIEW_REPLY(RV_NO, U_NO, RVR_TEXT, RVR_DATE)  --개인회원
  VALUES (
    '5',
    'A0000100',
    '님 스펙이?',
    sysdate
  ); 



INSERT INTO REVIEW_LIKE(RV_NO, U_NO, RVL_DATE)  --개인회원
  VALUES (
    '1',
    'A0000104',
    sysdate
    ); 
  
   INSERT INTO REVIEW_LIKE(RV_NO, U_NO, RVL_DATE)  --개인회원
  VALUES (
    '2',
    'A0000103',
    sysdate
  ); 
  
  INSERT INTO REVIEW_LIKE(RV_NO, U_NO, RVL_DATE)  --개인회원
  VALUES (
    '3',
    'A0000102',
    sysdate
  ); 
  
  INSERT INTO REVIEW_LIKE(RV_NO, U_NO, RVL_DATE)  --개인회원
  VALUES (
    '4',
    'A0000101',
    sysdate
  ); 
  
  INSERT INTO REVIEW_LIKE(RV_NO, U_NO, RVL_DATE)  --개인회원
  VALUES (
    '5',
    'A0000100',
    sysdate
  ); 



 INSERT INTO REWARD (R_NO, P_NO,R_AMOUNT, R_NAME, R_DETAIL, R_PRICE)  --개인회원
  VALUES (
    TO_CHAR(seq_r_no.nextval),
    '1',
    '300',
    '탄생석 목걸이',
    '존예뿜뿜 목걸이 입니다',
    '49800'
    ); 
  
   INSERT INTO REWARD (R_NO, P_NO,R_AMOUNT, R_NAME, R_DETAIL, R_PRICE)--개인회원
  VALUES (
    TO_CHAR(seq_r_no.nextval),
    '2',
    '500',
    '비타마우스',
    '당신을 위한 비타민!',
    '59500'
  ); 
  
  INSERT INTO REWARD (R_NO, P_NO,R_AMOUNT, R_NAME, R_DETAIL, R_PRICE)  --개인회원
  VALUES (
    TO_CHAR(seq_r_no.nextval),
    '3',
    '1000',
    '스타일리쉬 자외선 살균기',
    '슈퍼 자외선 살균기',
    '20000'
  ); 
  
  INSERT INTO REWARD (R_NO, P_NO,R_AMOUNT, R_NAME, R_DETAIL, R_PRICE) --개인회원
  VALUES (
    TO_CHAR(seq_r_no.nextval),
    '4',
    default,
    'OFM 팜레스트',
    '손목보호 마우스',
    '80000'
  ); 
  
  INSERT INTO REWARD (R_NO, P_NO,R_AMOUNT, R_NAME, R_DETAIL, R_PRICE)  --개인회원
  VALUES (
    TO_CHAR(seq_r_no.nextval),
    '5',
    '142'
    '슈퍼 라이더 자켓',
    '핏 기장 최고 가성비',
    '149800'
  ); 



 INSERT INTO PAYMENT (PM_NO, U_NO, P_NO, R_NO, PM_INFO, PM_PRICE, PM_PRICE_PLUS, PM_DATE, PM_MILEAGE, PM_QUANTITY, PM_NOPEN, PM_POPEN)  --개인회원
  VALUES (
    TO_CHAR(seq_pm_no.nextval),
    'A0000100',
    '1',
    '1',
    '커플 얼리버드',
    '49800',
    '20000',
    sysdate,
    '300',
    '2',
    default,
    default
    ); 
  
   INSERT INTO PAYMENT (PM_NO, U_NO, P_NO, R_NO, PM_INFO, PM_PRICE, PM_PRICE_PLUS, PM_DATE, PM_MILEAGE, PM_QUANTITY, PM_NOPEN, PM_POPEN)--개인회원
  VALUES (
    TO_CHAR(seq_pm_no.nextval),
    'A0000101',
    '2',
    '2',
    '슈퍼 얼리버드',
    '59500',
    '30000',
    sysdate,
    '1300',
    '1',
    default,
    default
  ); 
  
  INSERT INTO PAYMENT (PM_NO, U_NO, P_NO, R_NO, PM_INFO, PM_PRICE, PM_PRICE_PLUS, PM_DATE, PM_MILEAGE, PM_QUANTITY, PM_NOPEN, PM_POPEN)  --개인회원
  VALUES (
    TO_CHAR(seq_pm_no.nextval),
    'A0000102',
    '3',
    '3',
    '얼리버드',
    '20000',
    '10000',
    sysdate,
    '500',
    '1',
    default,
    default
  ); 
  
  INSERT INTO PAYMENT (PM_NO, U_NO, P_NO, R_NO, PM_INFO, PM_PRICE, PM_PRICE_PLUS, PM_DATE, PM_MILEAGE, PM_QUANTITY, PM_NOPEN, PM_POPEN) --개인회원
  VALUES (
    TO_CHAR(seq_pm_no.nextval),
    'A0000103',
    '4',
    '4',
    '커플 얼리버드',
    '80000',
    '20000',
    sysdate,
    '700',
    '2',
    default,
    default
  ); 
  
  INSERT INTO PAYMENT (PM_NO, U_NO, P_NO, R_NO, PM_INFO, PM_PRICE, PM_PRICE_PLUS, PM_DATE, PM_MILEAGE, PM_QUANTITY, PM_NOPEN, PM_POPEN)  --개인회원
  VALUES (
    TO_CHAR(seq_pm_no.nextval),
    'A0000104',
    '5',
    '5',
    '울트라 얼리버드',
    '149800',
    '20000',
    sysdate,
    '3300',
    '1',
    default,
    default
  ); 
  
  --공지사항 내용부분 null값 허용  
  ALTER TABLE notice MODIFY (nt_text NULL);

  ALTER TABLE faq RENAME COLUMN u_no TO a_no;
  
 -- reward 테이블 r_amount 컬럼추가 
ALTER TABLE reward ADD(R_AMOUNT VARCHAR2(40));

-- inquiry 테이블 샘플데이터추가
 INSERT INTO inquiry
  VALUES(
    TO_CHAR(SEQ_IQ_NO.nextval),
    'A0000104',
    '리워드펀딩이 무엇인가요?',
    '리워드펀딩이 뭔지 잘 모르겠습니다. 알려주세요.',
    null,
    default,
    null,
    sysdate,
    'Y',
    '리워드란 자금이 필요한 메이커가 펀딩을 통해 자금을 모집하여 제작하며 리워드가 완성되면 펀딩에 참여한 서포터에게 제공하는 방식입니다. 메이커는 프로젝트 진행중 서포터에게 받은 피드백을 보상품 제작에 반영하거나 프로젝트 홍보에 도움을 준 서포터들을 위해 이벤트를 진행하는 등 펀딩하는 서포터와 제품/서비스를 만드는 메이커간의 긴밀한 소통이 이루어지는 점이 특징입니다.',
    sysdate,
    'C0000100'
  ); 

 INSERT INTO inquiry
  VALUES(
    TO_CHAR(SEQ_IQ_NO.nextval),
    'A0000104',
    '리워드를 직접 수령가능한가요?',
    '제가 직접 리워드를 찾아가서 수령하고 싶은데 가능할까요?',
    null,
    default,
    null,
    sysdate,
    'Y',
    '리워드는 택배 배송을 원칙으로 하고있습니다.',
    sysdate,
    'C0000100'
  );
  
   INSERT INTO inquiry
  VALUES(
    TO_CHAR(SEQ_IQ_NO.nextval),
    'A0000104',
    '결제는 일시불로만 가능한가요?',
    '결제는 일시불로만 가능한가요?',
    null,
    default,
    null,
    sysdate,
    'Y',
    '네. 리워드북에서 펀딩하실 때에는 카드정보를 입력하여 결제예약을 걸어두는 방식이다보니 일시불 결제만 가능하고, 할부결제는 하실 수 없습니다.',
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
COMMENT ON COLUMN OTO.OTO_NO IS '글번호';
COMMENT ON COLUMN OTO.U_NO IS '회원번호';
COMMENT ON COLUMN OTO.U_NO_answer IS '답변자회원번호';
COMMENT ON COLUMN OTO.OTO_QTITLE IS '질문제목';
COMMENT ON COLUMN OTO.OTO_QTEXT IS '질문내용';
COMMENT ON COLUMN OTO.OTO_QDATE IS '질문일';
COMMENT ON COLUMN OTO.OTO_YN IS '답변여부';
COMMENT ON COLUMN OTO.OTO_ATITLE IS '답변제목';
COMMENT ON COLUMN OTO.OTO_ATEXT IS '답변내용';
COMMENT ON COLUMN OTO.OTO_ADATE IS '답변일';

COMMENT ON TABLE OTO IS '1대1문의';

COMMIT;

INSERT INTO OTO
VALUES (
  TO_CHAR(SEQ_OTO_NO.nextval),
  'A0000104',
  'B0000103',
  '프로젝트 앵콜 진행하나요?',
  '너무 구매하고 싶은데 아쉽게도 마감됐네요. 앵콜예정이 있나요?',
  SYSDATE,
  'Y',
  '고객님들의 성원에 힘입어 10월중순에 앵콜 예정이 있습니다.',
  '고객님들의 성원에 힘입어 10월중순에 앵콜 예정이 있습니다. 위드크로스를 사랑해주셔서 감사합니다. 많은 사랑 부탁드립니다.',
  SYSDATE
);

INSERT INTO OTO
VALUES (
  TO_CHAR(SEQ_OTO_NO.nextval),
  'A0000104',
  'A0000103',
  '주소지 변경가능한가요?',
  '주소지를 잘못입력했습니다..배송받을 주소를 강남대로 11-7번길로 수정해주세요.',
  SYSDATE,
  'Y',
  '황지우 고객님, 답변입니다.',
  '이미 어제 9월 18일자로 상품이 출고된것으로 확인됩니다. 도움을 드리지 못해 죄송합니다. 자세한 사항은 택배사로 문의주시길 바랍니다.',
  SYSDATE
);

INSERT INTO OTO
VALUES (
  TO_CHAR(SEQ_OTO_NO.nextval),
  'A0000104',
  'B0000103',
  '최대 구매수량이 3개로 지정되어있는데 추가 구매는 안되나요',
  '5개정도 더 구매하고싶은데, 안될까요?',
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
COMMENT ON COLUMN MEMO.M_NO IS '메모번호';
COMMENT ON COLUMN MEMO.P_NO IS '프로젝트번호';
COMMENT ON COLUMN MEMO.U_NO IS '회원번호';
COMMENT ON COLUMN MEMO.M_TEXT IS '메모내용';
COMMENT ON COLUMN MEMO.M_DATE IS '메모등록일';
COMMENT ON TABLE OTO IS '메모';

COMMIT;


INSERT INTO MEMO
VALUES (
  TO_CHAR(SEQ_MEMO_NO.nextval),
  '1',
  'A0000104',
  '내가 이게  필요한가?',
  SYSDATE
 
);

INSERT INTO MEMO
VALUES (
  TO_CHAR(SEQ_MEMO_NO.nextval),
  '2',
  'A0000104',
  '비타민이 참 좋아보인다',
  SYSDATE
 
);

INSERT INTO MEMO
VALUES (
  TO_CHAR(SEQ_MEMO_NO.nextval),
  '3',
  'A0000104',
  '살균!!',
  SYSDATE
 
);

INSERT INTO MEMO
VALUES (
  TO_CHAR(SEQ_MEMO_NO.nextval),
  '4',
  'A0000104',
  '내 손목 중요하지',
  SYSDATE
 
);

INSERT INTO MEMO
VALUES (
  TO_CHAR(SEQ_MEMO_NO.nextval),
  '5',
  'A0000104',
  '라이더가 예쁘다',
  SYSDATE
 
);


COMMIT;

--여기까지 1.6VER

UPDATE USERS SET U_NAME = '베스트위즈' WHERE U_NO = 'B0000102';

COMMIT;

--여기까지 1.7VER

ALTER TABLE USERS ADD(P_BILLING VARCHAR2(100));

COMMIT;

ALTER TABLE PAYMENT DROP COLUMN PM_INFO;

COMMIT;

COMMENT ON COLUMN USERS.P_BILLING IS '빌링키';
COMMENT ON COLUMN USERS.U_ADDRESS_DETAIL IS '상세주소';
COMMENT ON COLUMN USERS.U_JOB IS '직업';

COMMIT;

--여기까지 1.8VER

delete from payment where u_no = 'A0000104' and p_no = '5';

COMMIT;

--여기까지 1.9VER

ALTER TABLE PAYMENT DROP COLUMN PM_DATE;

COMMIT;

--여기까지 2.0VER

ALTER TABLE PAYMENT ADD(PM_OID VARCHAR2(100));
COMMENT ON COLUMN PAYMENT.PM_OID IS '주문번호';

ALTER TABLE PAYMENT DROP COLUMN PM_QUANTITY;

ALTER TABLE PAYMENT ADD(PM_QUANTITY VARCHAR2(30));

ALTER TABLE PAYMENT MODIFY (PM_QUANTITY DEFAULT '1');

COMMENT ON COLUMN PAYMENT.PM_QUANTITY IS '수량';

--변경된 커럼의 값이 없으니 샘플데이터에 값을 채워야합니다. 시퀀스의 cache 제거
--여기까지 2.1VER (주문번호 테이블 새로 만들고 페이먼트 테이블에 수량 컬럼의 데이터타입을 변경)

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

-- 여기까지 2,2VER

  INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '2'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '황지우'),
    SYSDATE
  );

  INSERT INTO PROJECT_LIKE(P_NO, U_NO, PL_DATE)
  VALUES(
    (SELECT P_NO FROM PROJECT WHERE P_NO = '2'),
    (SELECT U_NO FROM USERS WHERE U_NAME = '박상완'),
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
     
--여기까지 2.3ver  

ALTER TABLE PAYMENT ADD(PM_SUCCESS VARCHAR2(3) DEFAULT 'N' NOT NULL);

COMMENT ON COLUMN PAYMENT.PM_SUCCESS IS '결제여부';

COMMIT;

-- 추가내용 : PAYMENT 테이블에 PM_SUCCESS 컬럼 추가
--여기까지 2.4VER

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

-- 프로젝트 샘플이미지 업데이트 2.5VER
 commit;
 
 -- 문의테이블 신고대상 컬럼 추가
 ALTER TABLE inquiry ADD(iq_target VARCHAR2(40));