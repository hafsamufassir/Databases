CREATE DATABASE lab6;

/* Delete the tables if they already exist */
drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;

/* Create the schema for our tables */
create table Movie(mID int, title text, year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);

/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');

/*TASK 1 */
ALTER TABLE Movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY(mID); --1

ALTER TABLE Movie
    ADD CONSTRAINT unique_key UNIQUE (title, year); --2

ALTER TABLE Reviewer
    ADD CONSTRAINT reviewer_pkey PRIMARY KEY(rID); --3

ALTER TABLE Rating
    ADD CONSTRAINT allowed_nulls UNIQUE (rID, mID, ratingDate); --4

ALTER TABLE Reviewer
    ALTER COLUMN name SET NOT NULL; --5

ALTER TABLE Rating
    ALTER COLUMN stars SET NOT NULL; --6

ALTER TABLE Movie
    ADD CONSTRAINT year_check CHECK (year > 1900); --7

ALTER TABLE Rating
    /*ADD CONSTRAINT stars_check CHECK (stars > 0 AND stars < 6);*/ --8
    ADD CONSTRAINT rating_checcker1 CHECK (stars between 1 and 5);

ALTER TABLE Rating
    ADD CONSTRAINT date_check CHECK (ratingDate >= TO_DATE('2000-01-01', 'yyyy-mm-dd')); --9

ALTER TABLE Movie
    ADD CONSTRAINT tuple_check CHECK ((title = 'Steven Spielberg' AND year < 1990) OR (title = 'James Cameron' AND year > 1990)); --10

/*TASK 3 */

update Movie set mID = mID + 1;
------------------11) error

insert into Movie values (109, 'Titanic', 1997, 'JC');
------------------12) error

insert into Reviewer values (201, 'Ted Codd');
------------------13) error

update Rating set rID = 205, mID = 104;
------------------14) error

insert into Reviewer values (209, null);
------------------15) error

update Rating set stars = null where rID = 208;
------------------16) error

update Movie set year = year - 40;
------------------17) error

update Rating set stars = stars + 1;
------------------18) error

insert into Rating values (201, 101, 1, '1999-01-01');
------------------19) error

insert into Movie values (109, 'Jurassic Park', 1993, 'Steven Spielberg');
------------------20) error

update Movie set year = year-10 where title = 'Titanic';
------------------21) error

insert into Movie values (109, 'Titanic', 2001, null);
------------------22) ok

update Rating set mID = 109;
------------------23) ok

update Movie set year = 1901 where director <> 'James Cameron';
------------------24) ok

update Rating set stars = stars - 1;
------------------25) ok

ALTER TABLE Rating
    ADD CONSTRAINT rating_reviewer_fk FOREIGN KEY(rID) REFERENCES Reviewer ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE Rating
    ADD CONSTRAINT rating_movie_fk FOREIGN KEY (mID) REFERENCES Movie ON DELETE CASCADE;
------------------26)

insert into Rating values (209, 109, 3, '2001-01-01');
------------------27) error

update Rating set rID = 209 where rID = 208;
------------------28) error

update Rating set mID = mID + 1;
------------------29) error

update Movie set mID = 109 where mID = 108;
------------------30) error

update Movie set mID = 109 where mID = 102;
------------------31) error

update Reviewer set rID = rID + 10;
------------------32) ok

delete from Reviewer where rID > 215;
------------------33) ok

delete from Movie where mID < 105;
------------------34) ok

SELECT sum(rID) AS Sum FROM Rating;

SELECT * FROM Rating
    WHERE rID IS NULL;
------------------35)

SELECT * FROM Movie;
SELECT * FROM Rating;
SELECT * FROM Reviewer;
SELECT * FROM pg_constraint;










