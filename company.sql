drop table if exists employee cascade;
drop table if exists branch cascade;
drop table if exists client;
drop table if exists works_with;
drop table if exists branch_supplier;

drop type if exists sex_type;

create type sex_type as enum ('M', 'F');

create table employee (
  emp_id int primary key,
  first_name varchar(20) not null,
  last_name varchar(20) not null,
  birth_date date,
  sex sex_type,
  salary int,
  super_id int,
  branch_id int
);

create table branch (
  branch_id int primary key,
  branch_name varchar(20) not null,
  mgr_id int references employee(emp_id) on delete set null,
  mgr_start_date date
);

alter table employee add foreign key(super_id) references employee(emp_id) on delete set null;
alter table employee add foreign key(branch_id) references branch(branch_id) on delete set null;

create table client (
  client_id int primary key,
  client_name varchar(20),
  branch_id int,
  foreign key(branch_id) references branch(branch_id) on delete set null
);

create table works_with (
  emp_id int references employee(emp_id) on delete cascade,
  client_id int references client(client_id) on delete cascade,
  total_sales int,
  primary key(emp_id, client_id)
);

create table branch_supplier (
  branch_id int references branch(branch_id) on delete cascade,
  supplier_name varchar(30),
  supply_type varchar(20),
  primary key(branch_id, supplier_name)
);

insert into employee values(100, 'David', 'Wallace', '1967-11-17', 'M', 250000,null, null);
insert into branch values(1, 'corporate', 100, '2006-02-09');
update employee set branch_id = 1 where emp_id = 100;

insert into employee values(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000,100, null);
insert into branch values(2, 'scranton', 102, '1992-04-06');
update employee set branch_id =2 where emp_id = 102;
insert into employee values(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000,102, 2);
insert into employee values(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000,102, 2);
insert into employee values(105, 'Stanely', 'Hudson', '1958-02-19', 'M', 69000,102, 2);

insert into employee values(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000,100, null);
insert into branch values(3, 'stamford', 106, '1998-02-13');
update employee set branch_id = 3 where emp_id = 106;
insert into employee values(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000,106, 3);
insert into employee values(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000,106, 3);

insert into employee values(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000,100, 1);

insert into client values(400, 'dunmore highschool', 2);
insert into client values(401, 'lackawana county', 2);
insert into client values(402, 'fedex', 3);
insert into client values(403, 'john daly lw, llc', 3);
insert into client values(404, 'scranton whitepages', 2);
insert into client values(405, 'times newspaper', 3);
insert into client values(406, 'fedex', 2);

insert into works_with values(105, 400, 55000);
insert into works_with values(102, 401, 267000);
insert into works_with values(108, 402, 22500);
insert into works_with values(107, 403, 5000);
insert into works_with values(108, 403, 12000);
insert into works_with values(105, 404, 33000);
insert into works_with values(107, 405, 26000);
insert into works_with values(102, 406, 15000);
insert into works_with values(105, 406, 130000);

insert into  branch_supplier values(2, 'hammer mill', 'paper');
insert into  branch_supplier values(2, 'uni-ball', 'writing utensils');
insert into  branch_supplier values(3, 'patriot paper', 'paper');
insert into  branch_supplier values(2, 'j.t. forms and labels', 'custom forms');
insert into  branch_supplier values(3, 'uni-ball', 'writing utensils');
insert into  branch_supplier values(3, 'hammer mill', 'paper');
insert into  branch_supplier values(2, 'stamford labels', 'custom forms');
