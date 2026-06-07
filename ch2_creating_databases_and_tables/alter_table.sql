drop database if exists shoppers;

create database shoppers;
use shoppers;
create table customers (
customer_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
address varchar(100) not null
);

-- you use the alter table command to make changes to a table.
alter table customers add column zip varchar(50);
alter table customers drop column address;
alter table customers rename column zip to zip_code;
alter table customers rename to valued_customers;

desc valued_customers;