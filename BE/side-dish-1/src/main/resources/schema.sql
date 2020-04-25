drop table if exists category;
drop table if exists banchan;
drop table if exists token;
drop table if exists image;
drop table if exists user;


create table CATEGORY (
    id int primary key auto_increment,
    categoryName varchar(128)
);

create table BANCHAN (
    id int primary key auto_increment,
    name varchar(128),
    price varchar (128),
    category_id int references category(id)
);

create table IMAGE (
    id int primary key auto_increment,
    url varchar(128),
    banchan int references BANCHAN(id)
);

create table token (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    token_type VARCHAR(64),
    token VARCHAR(64)
);

create table user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    github_id VARCHAR(64),
    login VARCHAR(64),
    name VARCHAR (64)
);
