drop table if exists banchan;
drop table if exists category;
drop table if exists banchanDetail;
drop table if exists deliveryType;
drop table if exists badge;
drop table if exists ThumbImg;
drop table if exists DetailImg;
drop table if exists CATEGORY;
drop table if exists BANCHAN;
drop table if exists token;
drop table if exists user;






create table category (
    category_id int primary key,
    category_name varchar(128),
    category_description varchar (256)
);

create table banchan (
    banchan_id int primary key,
    description varchar(256),
    image varchar(128),
    title varchar (128),
    normal_price int ,
    sale_price int ,
    category_id int references category(category_id)
);

create table banchanDetail (
    banchanDetail_id int primary key,
    normal_price int,
    sale_price int,
    main_image varchar (256),
    description varchar (256),
    point int (128),
    delivery_info varchar (256),
    delivery_fee varchar (256),
    title varchar(256),
    banchan_id int references BANCHAN(banchan_id)
);

create table deliveryType (
    name varchar (128),
    banchan_id int references BANCHAN(banchan_id)
);

create table badge (
    name varchar (128),
    banchan_id int references BANCHAN(banchan_id)
);

create table ThumbImg (
    url varchar (2000),
    banchanDetail_id int references banchanDetail(banchanDetail_id)
);

create table DetailImg (
    url varchar (2000),
    banchanDetail_id int references banchanDetail(banchanDetail_id)
);


create table token (
    id BIGINT PRIMARY KEY,
    token_type VARCHAR(64),
    token VARCHAR(64)
);

create table user (
    id BIGINT PRIMARY KEY,
    github_id VARCHAR(64),
    login VARCHAR(64),
    name VARCHAR (64)
);
