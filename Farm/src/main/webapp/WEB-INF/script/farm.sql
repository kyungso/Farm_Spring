
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
   sns_id varchar2(22));    


create table goods
   ( gCode varchar2(20) PRIMARY KEY, --��ǰ�ڵ�
     gCategory varchar2(20) not null,
     gName varchar2(50) not null,
     gContent varchar2(4000) not null,
     gPrice NUMBER(10) not null,
     gImage1 varchar2(20) not null,
     gImage2 varchar2(20) not null );
     


create table review
 ( review_num NUMBER(10) PRIMARY KEY,
   userid VARCHAR2(10) NOT NULL,
   username VARCHAR2(10) NOT NULL,
   grade NUMBER(5) NOT NULL,
   image VARCHAR2(20) DEFAULT 'x',
   title VARCHAR2(50) NOT NULL,
   content VARCHAR2(4000) NOT NULL,
   writeday DATE DEFAULT SYSDATE, 
   gname VARCHAR2(10) NOT NULL,
   gsize VARCHAR2(10) NOT NULL);

create sequence review_num_seq START WITH 1;

 create table cart
 (  cart_num NUMBER(10) PRIMARY KEY,
    gCategory VARCHAR2(20) not null,
    gCode varchar2(20) not null,
    gName varchar2(50) not null,
    gPrice NUMBER(10) not null,
    gAmount NUMBER(10) not null,
    gImage1 VARCHAR2(20) not null,
    userid VARCHAR2(10) not null,
    gSize VARCHAR2(10) not null
 );  
 
 create sequence cart_num_seq START WITH 1;
 

 drop table freeboard;

 create table freeboard
( board_num NUMBER(20) PRIMARY KEY,
  userid VARCHAR2(20) NOT NULL,
  title VARCHAR2(50) NOT NULL,
  author VARCHAR2(50) NOT NULL,
  content VARCHAR2(4000),
  writeday DATE DEFAULT SYSDATE,
  image VARCHAR2(100)  ,
  readcnt NUMBER(10) DEFAULT 0 ,
  imageName VARCHAR2(100),
  secret VARCHAR2(100),
  passwd VARCHAR2(100) );
  
drop sequence  board_num_seq;

create sequence  board_num_seq start with 1;

 create table boardcomment
( board_num NUMBER(20) ,
  co_num NUMBER(20) ,
  userid VARCHAR2(20) ,
  cowriteday DATE DEFAULT SYSDATE,
  cocontent VARCHAR2(1000) );
  
create sequence co_num_seq start with 1;




create table orderinfo
(
 
USERID VARCHAR2(10) PRIMARY KEY,
ORDERNUM NUMBER(10) NOT NULL,
ORDERNAME NUMBER(10) NOT NULL,
PHONE VARCHAR2(15) NOT NULL,
POST1 VARCHAR2(3) NOT NULL,
POST2 VARCHAR2(3) NOT NULL,
ADDR1 VARCHAR2(500) DEFAULT 'x',
ADDR2 VARCHAR2(500) NOT NULL,
GCODE VARCHAR2(20) NOT NULL,
GNAME VARCHAR2(50) NOT NULL,
GPRICE NUMBER(10) NOT NULL,
GSIZE VARCHAR2(10) NOT NULL,
GIMAGE VARCHAR2(20) NOT NULL,
PAYMETHOD VARCHAR2(10) NOT NULL,
GAMOUNT NUMBER(10) NOT NULL,
ORDERDAY DATE DEFAULT SYSDATE

);




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
STATE VARCHAR2(10) DEFAULT '처리중'
);

 create sequence QNA_NUM_seq START WITH 1;
 
