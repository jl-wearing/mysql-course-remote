-- Chapter 6: Performing Complex Joins with Multiple Tables
drop database if exists ch6;
create database ch6;
use ch6;

create table location
	(
	location_id		int,
	location_name	varchar(100),
	primary key (location_id)
	);
	
insert into location (location_id, location_name) values (1, 'Corner of Main and Elm');
insert into location (location_id, location_name) values (2, 'Family Donut Shop');
insert into location (location_id, location_name) values (3, 'House of Vegan Restaurant');

create table suspect
	(
	suspect_id		int,
	suspect_name	varchar(100),
	primary key(suspect_id)
);

insert into suspect (suspect_id, suspect_name) values (1, 'Eileen Sideways');
insert into suspect (suspect_id, suspect_name) values (2, 'Hugo Hefty');

create table crime
	(
	crime_id	int,
	location_id	int,
	suspect_id	int,
	crime_name	varchar(200),
	primary key(crime_id),
	foreign key (location_id) references location(location_id),
	foreign key (suspect_id) references suspect(suspect_id)
	);
	
insert into crime (crime_id, location_id, suspect_id, crime_name) values (1, 1, 1, 'Jaywalking');
insert into crime (crime_id, location_id, suspect_id, crime_name) values (2, 2, 2, 'Larceny: Donut');
insert into crime (crime_id, location_id, suspect_id, crime_name) values (3, 3, null, 'Receiving Salad Under False Pretenses');

-- get the list of crimes, where they occurred and the name of the suspect.
select c.crime_name, l.location_name, s.suspect_name
from crime c
inner join location l
using (location_id)
left outer join suspect s
using (suspect_id);

-- get the list of crimes, where they occurred, for crimes without suspect names.
select c.crime_name, l.location_name, s.suspect_name
from crime c
inner join location l
using (location_id)
left outer join suspect s
using (suspect_id)
where s.suspect_name is null;

/*
MySQL allows upto 61 tables in a join.
However, if you find yourself joining so many tables, that's a sign that the database could be redesigned
to make writing queries simpler.
*/

-- wine database information.
create table country
	(
	country_id		int,
	country_name	varchar(100)
	);

insert into country (country_id, country_name) values (1,'France');
insert into country (country_id, country_name) values (2,'Spain');
insert into country (country_id, country_name) values (3,'USA');

create table region
	(
	region_id	int,
	region_name	varchar(100),
	country_id	int
	);
	
insert into region (region_id, region_name, country_id) values (1, 'Napa Valley', 3);
insert into region (region_id, region_name, country_id) values (2, 'Walla Walla Valley', 3);
insert into region (region_id, region_name, country_id) values (3, 'Texas Hill', 3);

create table viticultural_area
	(
	viticultural_area_id	int,
	viticultural_area_name	varchar(100),
	region_id				int
	);

insert into viticultural_area (viticultural_area_id, viticultural_area_name, region_id) values (1, 'Atlas Peak', 1);
insert into viticultural_area (viticultural_area_id, viticultural_area_name, region_id) values (2, 'Calistoga', 1);
insert into viticultural_area (viticultural_area_id, viticultural_area_name, region_id) values (3, 'Wild Horse Valley', 1);

create table winery 
	(
	winery_id				int,
	winery_name 			varchar(100),
	viticultural_area_id	int,
	offering_tours_flag		bool
	);
	
insert into winery (winery_id, winery_name, viticultural_area_id, offering_tours_flag) values (1, 'Silva Vinyards', 1, false);
insert into winery (winery_id, winery_name, viticultural_area_id, offering_tours_flag) values (2, 'Chateau Traileur Parc', 2, true);
insert into winery (winery_id, winery_name, viticultural_area_id, offering_tours_flag) values (3, 'Winosaur Estate', 3, true);

	
create table wine_type
	(
	wine_type_id	int,
	wine_type_name	varchar(100)
	);
	
insert into wine_type values (1, 'Chardonnay');
insert into wine_type values (2, 'Cabernet Sauvignon');
insert into wine_type values (3, 'Merlot');

create table portfolio
	(
	winery_id		int,
	wine_type_id	int,
	in_season_flag	bool
	);
	
	
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (1, 1, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (1, 2, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (1, 3, false);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (2, 1, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (2, 2, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (2, 3, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (3, 1, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (3, 2, true);
insert into portfolio (winery_id, wine_type_id, in_season_flag) values (3, 3, true);

-- find a winery in USA that has a Merlot in season and is offerring tours.
select c.country_name, r.region_name, v.viticultural_area_name, w.winery_name
from country c
inner join region r
on c.country_id = r.country_id
and c.country_name = 'USA'
inner join viticultural_area v
on r.region_id = v.region_id
inner join winery w
on v.viticultural_area_id = w.viticultural_area_id
and w.offering_tours_flag is true
inner join portfolio p
on w.winery_id = p.winery_id
and p.in_season_flag is true
inner join wine_type t
on p.wine_type_id = t.wine_type_id
and t.wine_type_name = 'Merlot';

-- sometimes you'll want to control how much data from your queries is displayed in your result set.
-- the limit keyword lets you limit the number of rows in your result set.
create table best_wine_contest (
wine_name varchar(100),
place smallint unsigned check (place >= 1) unique
);
insert into best_wine_contest (wine_name, place) values
('Riesling', 1),
('Pinot Grigio', 2),
('Zinfandel', 3),
('Malbec', 4),
('Verdejo', 5),
('Merlot', 6);

-- retrieve the top 3 results.
select *
from best_wine_contest
order by place
limit 3;

-- the union keyword is used to join tables from multiple select statements.
-- union works only when the tables have the same number of columns.
-- the column name in the result set is usually taken from the first select statement.
-- also, union removes duplicate values from the result set.
select wine_type_name from wine_type
union
select wine_name from best_wine_contest;

-- to see a list that has duplicate values, use the union all keyword.
select wine_type_name from wine_type
union all
select wine_name from best_wine_contest;

-- exercise
create table good_snack (
snack_name varchar(100) not null
);
insert into good_snack (snack_name) values
('carrots'), ('salad'), ('soup');

create table bad_snack (
snack_name varchar(100) not null
);
insert into bad_snack (snack_name) values
('sausage_pizza'),('BBQ ribs'),('nachos');

-- display all snacks from both tables.
select snack_name from good_snack
union
select snack_name from bad_snack;

drop temporary table if exists wp1;
drop temporary table if exists winery_portfolio;
-- temporary tables
create temporary table wp1 (
winery_name varchar(100),
viticultural_area_id int
);

/*
to create a temporary table based on the results of a query,
precede the query with the temporary table syntax.

Temporary tables are created with the data types of the columns you
selected in your query.
*/
create temporary table winery_portfolio
select w.winery_name, w.viticultural_area_id
from winery w
inner join portfolio p
on w.winery_id = p.winery_id
and w.offering_tours_flag is true
and p.in_season_flag is true
inner join wine_type t
on p.wine_type_id = t.wine_type_id
and t.wine_type_name = 'Merlot';

select * from winery_portfolio;

select c.country_name, r.region_name, v.viticultural_area_name
from country c
inner join region r
on c.country_id = r.country_id
and c.country_name = 'USA'
inner join viticultural_area v
on r.region_id = v.region_id
inner join winery_portfolio w
on v.viticultural_area_id = w.viticultural_area_id;

