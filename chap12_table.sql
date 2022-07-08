create table worker (
    id varchar2(20) NOT NULL,
    pwd varchar2(20),
    name varchar2(40),
    phone varchar2(20),
    primary key(id)
    );

select * from worker;

create table member (
    id varchar2(20) not null,
    pwd varchar2(20),
    name varchar2(40),
    email varchar2(40),
    zip_num varchar2(7),
    address varchar2(100),
    phone varchar(20),
    useyn char(1) default 'y',
    indate date default sysdate,
    primary key(id)
    );
    
drop table member2;

create table address (
    zip_num varchar2(7),
    sido varchar2(30),
    gugun varchar2(30),
    dong varchar2(100),
    zip_code varchar2(30),
    bunji varchar2(30)
    );
    
create table product (
    pseq number(5) not null,
    name varchar2(100) default 0,
    kind char(1),
    price1 number(7) default 0,
    price2 number(7) default 0,
    price3 number(7) default 0,
    content varchar2(1000) default null,
    image varchar2(50) default 'default.jpg',
    useyn char(1) default 'y',
    bestyn char(1) default 'n',
    indate date default sysdate,
    primary key(pseq)
    );

create sequence product_seq start with 1 increment by 1;

create table cart (
    cseq number(10) not null,
    id varchar2(20),
    pseq number(5),
    quantity number(5) default 1,
    result char(1) default 1,
    indate date default sysdate,
    primary key(cseq),
    foreign key (id) references member (id),
    foreign key (pseq) references product (pseq)
    );
    
create sequence cart_seq start with 1 increment by 1;

drop table cart;
select * from address;

create table orders (
    oseq number(10) not null,
    id varchar2(20),
    indate date default sysdate,
    primary key(oseq),
    FOREIGN key (id) references member(id)
);

create sequence orders_seq start with 1 increment by 1;

create table order_detail (
    odseq number(10) not null,
    oseq number(10),
    pseq number(5),
    quantity number(5),
    result char(1) default 1,
    primary key(odseq),
    foreign key (oseq) references orders(oseq),
    foreign key (pseq) references product(pseq)
);

create sequence order_detail_seq start with 1 INCREMENT by 1;

create table qna (
    qseq number(5) not null,
    subject varchar2(30),
    content varchar2(1000),
    reply varchar2(1000),
    id varchar2(20),
    rep char(1) default 1,
    indate date default sysdate,
    primary key(qseq),
    foreign key (id) references member(id)
    );
    
create sequence qna_seq start with 1 INCREMENT by 1;

exp userId=bg2/userPw=bg2@SID file=backup.dmp
