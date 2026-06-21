drop schema if exists ch3;
create schema ch3;
use ch3;

create table continent (
continent_id int primary key auto_increment,
continent_name varchar(50) not null,
population bigint not null
);

-- insert data into the continents table.
insert into continent (continent_name, population) values
('Asia', 4641054775),
('Africa', 1340598147),
('Europe', 747636026),
('North America', 592072212),
('South America', 43075966),
('Australia', 43111704),
('Antarctica', 0);

-- a query is a request for information and you use the select command to retrieve data.
select continent_id, continent_name, population
from continent;

-- the where clause represents a horizontal partition of the data.
select continent_id, continent_name, population
from continent
where continent_name = 'Asia';

-- the select clause represents a vertical partition of the data.
select population
from continent
where continent_name = 'Asia';

-- exercise 1: feedback
create table customer
(
    customer_id     int,
    first_name	    varchar(50),
    last_name       varchar(50),
    address         varchar(100),
    primary key (customer_id)
); 

insert into customer (customer_id, first_name, last_name, address)
values
(1, 'Bob', 'Smith', '12 Dreary Lane'),
(2, 'Sally', 'Jones', '76 Boulevard Meugler'),
(3, 'Karen', 'Bellyacher', '354 Main Street');

-- exercise 3-1:
select first_name, last_name
from customer;

-- exercise 3-2:
select customer_id, first_name, last_name
from customer
where first_name = 'Karen';

-- * retrieve all columns from the table.
select * from continent;

-- when you query data, you'll often want to see the results in a particular order.
-- you use the order by clause to order your tuples.
select *
from continent
order by population;

/* backticks allow you to define columns that would otherwise be mysql keywords.
   backticks also allow you to add spaces in your column name definitions.
*/
select 7--5;
-- is null and not null clauses
create table unemployed (
region_id int primary key,
unemployed int
);
insert into unemployed (region_id, unemployed) values
(1, 2288457),
(2, 137455),
(3, null);

select *
from unemployed
where unemployed is null;

select *
from unemployed
where unemployed is not null;