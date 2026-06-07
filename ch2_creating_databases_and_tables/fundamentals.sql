-- Show the available databases.
show databases;

-- Alternatively
show schemas;

-- To create a database.
create database music;
create schema circus;
create database finance;

-- To drop a database.
drop database music;
drop database circus;
drop database finance;

-- Creating a table within a database.
drop database if exists land;
create database land;
use land;
create table continent (
continent_id int,
continent_name varchar(20),
population bigint
);

-- Defining constraints: primary key, foreign key, unique, not null, check, default
create table customer (
customer_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50),
address varchar(100)
);

insert into customer (first_name, last_name, address) values
('Bob', 'Smith', '12 Dreary Lane'),
('Sally', 'Jones', '76 Boulevard Meugler'),
('Karen', 'Bellyacher', '354 Main Street');

select * from customer;

-- Composite key
create table high_temperature (
city varchar(50),
`year` year,
high_temperature int,
primary key (city, `year`)
);
insert into high_temperature (city, `year`, high_temperature) values
('Death Valley, CA', 2020, 130),
('International Falls, MN', 2020, 78),
('New York, NY', 2020, 96),
('Death Valley, CA', 2021, 128),
('International Falls, MN', 2021, 77),
('New York, NY', 2021, 98);

select * from high_temperature;

-- Foreign keys
create table complaint (
complaint_id int primary key auto_increment,
customer_id int,
complaint varchar(200),
foreign key (customer_id) references customer(customer_id)
);
insert into complaint (customer_id, complaint) values
(3, 'I want to speak to your manager');

-- Retrieve the complaint
select c.first_name, c.last_name, d.complaint
from customer c
inner join complaint d
on (c.customer_id = d.customer_id);

drop database if exists athletics;
create database athletics;
use athletics;

create table sport (
sport_id int primary key,
sport_name varchar(50)
);

create table player (
player_id int primary key,
sport_id int,
player_name varchar(50),
player_age int,
foreign key (sport_id) references sport(sport_id)
);

-- not null, unique, and check
create table contact (
contact_id int primary key,
`name` varchar(50) not null,
city varchar(50),
age int,
phone varchar(50),
email_address varchar(100) not null,

-- constraints
constraint check (age between 0 and 120)
);

-- default
create table job (
job_id int primary key auto_increment,
job_title varchar(100),
job_desc varchar(200),
shift varchar(20) default '9-5'
);
insert into job (job_title, job_desc)
values ('Principal Data Scientist', 'Machine learning and stuff');
select * from job;

-- indexes
create table product (
product_id int primary key,
product_name varchar(50),
supplier_id int
);
create index product_name_index on product(product_name);
show indexes from product;