create DATABASE lab1;

create table users(
  ID serial,
  FirstName varchar(50),
  LastName varchar(50)
);

ALTER table users
    add column isadmin int;

ALTER table users
    alter COLUMN isadmin TYPE BOOLEAN USING isadmin::boolean;
ALTER TABLE users
    ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users
    ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (ID);

  /*select * from users;*/

create table tasks(
  id serial,
  name varchar(50),
  users_id int
);

  /*SELECT * from tasks;*/

drop table tasks;
drop database lab1;