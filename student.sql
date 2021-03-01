/* drop table student; */

create table student (
  student_id serial,
  name varchar(30) not null,
  major varchar(30) default 'undecided',
  primary key(student_id)
);

insert into student values(1, 'jack', 'biology');
insert into student values(2, 'kate', 'sociology');
insert into student values(3, 'claire', 'chemistry');
insert into student values(4, 'jack', 'biology');
insert into student values(5, 'mike', 'computer science');

update student set major = 'bio' where major = 'biology';
