CREATE DATABASE MusicLibrary;

USE MusicLibrary;

CREATE TABLE users (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(50),
    user_type VARCHAR(30),  
    reg_date TIMESTAMP
);

create table music
(
    id int auto_increment
        primary key,
    name varchar(500) null,
    content longblob null
);