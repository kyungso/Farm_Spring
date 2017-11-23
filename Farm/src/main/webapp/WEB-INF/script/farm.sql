
create table member
 ( userid VARCHAR2(30) PRIMARY KEY,
   passwd VARCHAR2(10) ,
   username VARCHAR2(10) NOT NULL,
   post1 VARCHAR2(3) ,
   post2 VARCHAR2(3) ,
   addr1 VARCHAR2(500) ,
   addr2 VARCHAR2(500) ,
   phone1 VARCHAR2(3) NOT NULL,
   phone2 VARCHAR2(4) NOT NULL,
   phone3 VARCHAR2(4) NOT NULL,
   email VARCHAR2(50) ,
   point NUMBER(10) DEFAULT 0,
   buycnt NUMBER(10) DEFAULT 0,
   joinday DATE DEFAULT SYSDATE,
   jointype number(1) default 0,            /*1 = SNS 통한 가입*/
   sns_id varchar2(22),
   isSeller varchar2(2) default 'N');   


create table goods
   ( gcode varchar2(20) PRIMARY KEY,
     gcategory varchar2(20) not null,
     gname varchar2(50) not null,
     gcontent varchar2(4000) not null,
     gprice NUMBER(10) not null,
     gimage1 varchar2(20) not null,
     gimage2 varchar2(20) not null
     image varchar2(20)); --이미지업로드용
     


create table review
 ( review_num NUMBER(10) PRIMARY KEY,
   userid VARCHAR2(30) NOT NULL,
   username VARCHAR2(10) NOT NULL,
   grade NUMBER(5) NOT NULL,
   image VARCHAR2(20) DEFAULT 'x',
   title VARCHAR2(50) NOT NULL,
   content VARCHAR2(4000) NOT NULL,
   writeday DATE DEFAULT SYSDATE, 
   gname VARCHAR2(10) NOT NULL,
   gsize VARCHAR2(10) NOT NULL);

create sequence review_num_seq;
 
 create table freeboard
( board_num NUMBER(20) PRIMARY KEY,
  userid VARCHAR2(30) NOT NULL,
  title VARCHAR2(50) NOT NULL,
  author VARCHAR2(50) NOT NULL,
  content VARCHAR2(4000),
  writeday DATE DEFAULT SYSDATE,
  image VARCHAR2(100)  ,
  readcnt NUMBER(10) DEFAULT 0 ,
  imageName VARCHAR2(100),
  secret VARCHAR2(10),
  passwd VARCHAR2(10)
  );

create sequence  board_num_seq;

 create table boardcomment
( board_num NUMBER(20)  ,
  co_num NUMBER(20)PRIMARY KEY ,
  userid VARCHAR2(30) NOT NULL ,
  cowriteday DATE DEFAULT SYSDATE,
  cocontent VARCHAR2(1000) NOT NULL );
  
create sequence co_num_seq;
create sequence group_no_seq;

create table QNA(
 
USERID VARCHAR2(30) NOT NULL ,
USERNAME VARCHAR2(10) NOT NULL,
PHONE1 VARCHAR2(15) NOT NULL,
PHONE2 VARCHAR2(15) NOT NULL,
PHONE3 VARCHAR2(15) NOT NULL,
EMAIL VARCHAR2(40) NULL,
TITLE VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2 (4000) NOT NULL,
QNA_NUM NUMBER(10) PRIMARY KEY,
WRITEDAY DATE DEFAULT SYSDATE,
STATE VARCHAR2(10) ,
GROUP_NO NUMBER(10) NOT NULL
);

 create sequence QNA_NUM_seq;
 
 -- cart
 create table cart
 (  cart_num NUMBER(10) PRIMARY KEY,
    gCategory VARCHAR2(20) not null,
    gCode varchar2(20) not null,
    gName varchar2(50) not null,
    gPrice NUMBER(10) not null,
    gAmount NUMBER(10) not null,
    gImage1 VARCHAR2(20) not null,
    userid VARCHAR2(30) not null);  
 drop sequence cart_num_seq;
 create sequence cart_num_seq; 

 --order
 create table orderInfo(
ORDER_NUM NUMBER(10) PRIMARY KEY,
USERID VARCHAR2(30) NOT NULL,
ORDERNAME VARCHAR2(10) NOT NULL,
PHONE VARCHAR2(15) NOT NULL,
POST1 VARCHAR2(3) NOT NULL,
POST2 VARCHAR2(3) NOT NULL,
ADDR1 VARCHAR2(500) DEFAULT 'X',
ADDR2 VARCHAR2(500) NOT NULL,
GCODE VARCHAR2(20) NOT NULL,
GNAME VARCHAR2(50) NOT NULL,
GPRICE NUMBER(10) NOT NULL,
GIMAGE1 VARCHAR2(20) NOT NULL,
PAYMETHOD VARCHAR2(10) NOT NULL,
GAMOUNT NUMBER(10) NOT NULL,
ORDERDAY DATE DEFAULT SYSDATE
);

drop sequence order_num_seq;
create sequence order_num_seq;

-- 관리자 테이블
CREATE TABLE admin(
 userid VARCHAR(30) NOT NULL,
 passwd VARCHAR(10) NOT NULL,
 PRIMARY KEY(userid)
);

  alter table QNA
  add CONSTRAINT QNA_userid_fk FOREIGN KEY(userid)
   REFERENCES member(userid) ON DELETE CASCADE;
   
   alter table FREEBOARD
  add CONSTRAINT FREEBOARD_userid_fk FOREIGN KEY(userid)
   REFERENCES member(userid) ON DELETE CASCADE;
   
   alter table BOARDCOMMENT
  add CONSTRAINT BOARDCOMMENT_BOARD_NUM_fk FOREIGN KEY(BOARD_NUM)
   REFERENCES FREEBOARD(BOARD_NUM) ON DELETE CASCADE;
   
  alter table CART
  add CONSTRAINT CART_userid_fk FOREIGN KEY(userid)
   REFERENCES member(userid) ON DELETE CASCADE;
   
   alter table ORDERINFO
  add CONSTRAINT ORDERINFO_userid_fk FOREIGN KEY(userid)
   REFERENCES member(userid) ON DELETE CASCADE;

   
   
   
