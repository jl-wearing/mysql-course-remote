drop database if exists ch4;
create database ch4;
use ch4;

create table solar_eclipse (
eclipse_date date,
time_of_greatest_eclipse time,
eclipse_type varchar(10),
magnitude decimal(4,3)
);
insert into solar_eclipse (eclipse_date, time_of_greatest_eclipse, eclipse_type, magnitude) values
('2020-04-30', '20:42:36', 'Partial', 0.640),
('2022-10-25', '11:01:20', 'Partial', 0.862),
('2023-04-20', '04:17:56', 'Hybrid', 1.013);

-- char is used for fixed length strings.
/*
defaults to 1 character if you leave out parentheses.
pads with whitespace for characters less than defined.
can be defined upto 255 characters.
*/
create table country_code (
country_code char(3)
);

-- varchar is for variable length strings.
-- can be defined upto 16383 characters.
create table interesting_people (
interesting_name varchar(100)
);

-- enum is to pick a specific value from a list of values as a string.
-- you can only select 1 value from the list.
create table student (
student_id int primary key,
student_class enum('Freshman', 'Sophomore', 'Junior', 'Senior')
);

-- set is similar to enum but allows you to select multiple values.
create table interpreter (
interpreter_id int primary key,
language_spoken set('English','German','French','Spanish')
);
insert into interpreter (interpreter_id, language_spoken) values
(1, 'English,Spanish');
select * from interpreter;

-- tinytext, text, mediumtext, longtext
/*
tinytext = 255 characters
text = 65 535 characters
mediumtext = 16.7 million characters
longtext = 4.2 billion characters
*/
create table book (
book_id int primary key,
author_bio tinytext,
book_proposal text,
entire_book mediumtext
);

-- string literals can be written in either single quotes or double-quotes.
-- escape charaters like \ can be used to escape special characters in string literals.

-- binary data types
-- i.e. - tinyblob, blob, mediumblob, longblob
/*
BLOB's are variable-length string of bytes.
They are used to store binary data like images, pdf's, and videos.
BLOB data types come in the same sizes as text data types.
*/

-- binary is for fixed-length binary data.
create table encryption (
key_id int primary key,
encryption_key binary(30)
);

-- varbinary is for variable-length binary data.
create table signature (
signature_id int,
signature varbinary(400)
);

-- bit is used to store individual bits upto 64.

-- Numeric Data Types
/*
tinyint = -128 to 127
smallint = -32k to 32k
mediumint = -8.3m to 8.3m
int = -2b to 2b
bigint = -9t to 9t
*/
create table planet_stat (
planet varchar(20),
miles_from_earth int unsigned,
diameter_km mediumint
);
-- you can use unsigned to prevent negative values and increase the range of positive values.

-- bool is used for boolean data types.
-- when you define a bool, it creates tinyint(1) behind the scenes.
create table food (
food varchar(30),
organic_flag bool,
gluten_free_flag bool
);
desc food;
insert into food (food, organic_flag, gluten_free_flag) values
('chips', true, false);
select * from food;

-- Decimal Data Types
/*
decimal, float, and double data types
decimal stores exact values, whereas float and double store approximate values.
decimal has the following aliases: decimal(5,2), fixed(5,2), dec(5,2), numeric(5,2)
*/

-- Date and Time
/*
For dates and times, mysql provides the date, time, datetime, timestamp, and year
data types.
timestamp is used to store the current date and time.
*/
create table users (
id int auto_increment primary key,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);

-- JSON data type is used to store JSON documents
-- MySQL verifies that the JSON is correct before inserting the data.
create table profiles (
metadata json
);
insert into profiles (metadata) values
('{ "user_id": 101, "preferences": { "theme": "dark", "notifications": true } }');
select * from profiles;

-- Spatial Data Types
/*
MySQL provides data types for representing geographical location data.
/*
geometry stores location values of any geographical type, including point, linestring and polygon
point stores latitude and longitude like your current location
linestring represents points and the curve between them
polygon represents a boundary such as around a country or city
multipoint stores an unordered collection of points
multilinestring stores a collection of linestring types
emultipolygon stores a collection of polygon types
geometrycollection stores a collection of geometry types
*/

create table album (
rapped_id int unsiged primary key,
album_name varchar(100) not null,
explicit_lyrics_flag bool not null default true,
album_revenue decimal(12,2),
album_content longblob
);