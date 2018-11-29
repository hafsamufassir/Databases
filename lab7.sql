create database lab7;--1

create table locations(
  location_id serial primary key,
  street_address varchar(25),
  postal_code varchar(12),
  city varchar(30),
  state_province varchar(12)
);

create table departments(
  department_id serial primary key,
  department_name varchar(50) unique,
  budget integer,
  location_id integer references locations
);

  create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
  );
/* 2 aaction */

select first_name, last_name, d.department_id, department_name from departments as d inner join employees as e on d.department_id = e.department_id; --3

select first_name, last_name, d.department_id, department_name from departments as d inner join employees as e on d.department_id = e.department_id and d.department_id in (80, 40); --4

select first_name, last_name, d.location_id, state_province from departments as d inner join employees as e on d.department_id = e.department_id inner join locations as l on d.location_id = l.location_id; --5

select first_name, last_name, d.department_id, d.department_name from employees as e right join departments as d on e.department_id = d.department_id; --6

select first_name, last_name, d.department_id, d.department_name from employees as e left join departments as d on e.department_id = d.department_id; --7