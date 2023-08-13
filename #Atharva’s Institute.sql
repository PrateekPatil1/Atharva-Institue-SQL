--1. Create a database with the name ‘Institute’
create database Institute

--2. Create the above tables with the specified constraints in the above database.
create table subjects(
subject_id int primary key,
subject_name varchar(30) unique)
--column_name datatype primary key
-- column_name datatype unique

create table teachers
( teacher_id int primary key,
t_fname varchar(50) not null,
t_lname varchar(50) not null,
t_subject_id int foreign key references subjects(subject_id),
teaching_since date)
-- column_name datatype not null
-- column_name datatype foreign key references table2(column_name)

create table student
( student_id int primary key,
student_name varchar(50) not null ,
st_teacher_id int foreign key references teachers(teacher_id),
age int check(age>15),
doa date)
-- column_name datatype check condition
----------------------------------------------------------------------------------------

--3. Insert the values into the table as shown in the problem statement.
insert into subjects(Subject_id,Subject_name)
select 1,'Mathematics' union all
select 2,'Physics'union all
select 3,'Networking' union all
select 4,'Biology' union all
select 5,'Chemistry' 
--insert into table(columns) 
-- select row1  union all
-- select row2  union all
-- select rown  

insert into Teachers(Teacher_id,T_Fname,T_Lname,T_subject_id,Teaching_since)
values(101,'Anish','Oberoi',3,'09-19-2016'),
(102,'Vaishnavi','Roy',1,'05-26-2015'),
(103,'Shiva','Rathore',2,'12-21-2012'),
(104,'Kiran','Sharma',2,'02-01-2018'),
(105,'Sneha','Tiwari',4,'09-19-2014')

-- insert into table(columns) values
--(row1) ,
--(row2) ,
--(rown)

insert into student(Student_id,Student_name,St_Teacher_id,age,DOA)
values(201,'Ved',101,17,'05-12-2018'),
(202,'Aaron',102,17,'05-15-2019'),
(203,'Karan',103,16,'06-22-2018'),
(204,'Siri',105,18,'07-10-2019'),
(205,'Keerti',103,22,'05-11-2019')
-- insert into table values
--(row1) ,
--(row2) ,
--(rown)

select * from subjects
select * from Teachers
select * from Student
---------------------------------------------------------------------------------
--4. Display the details of students whose age is 17.
--select column from table where condition
-- table---> student
-- columns--> *
-- condition---> age=17 
select * from student where age=17
----------------------------------------------------------------------------------

--5. Display the details of the teachers whose first name starts with ‘S’.
select * from teachers
--select columns from table where condition
-- table--> teachers
-- condition --> t_fname like 's%'
select * from teachers where t_fname like 's%'
select * from teachers where t_fname like '_n%'
---------------------------------------------------------------------------------

--6. Display the names of the students whose age is between 17 and 20.
--select columns from table where age between
-- table --> students
-- condition--> age beetween 17 and 20
select student_name,age from student where age between 17 and 20
---------------------------------------------------------------------------------


--7. Display the student id of the students whose teacher_id is 103 and age is 16.
--select column from table where condition
-- condition --> st_teacher_id=103 and age=16
select student_id from student  where st_teacher_id=103 and age=16
--------------------------------------------------------------------------------------------------
--8. Display the records of students whose selected teacher is not Shiva. (use teacher id)
select * from student
select * from teachers
select * from student where not st_teacher_id=103
--step1--> extract detsil from teacers table
-- select teacher_id from teachers where tfname='shiva'

--step2 --> apply data in student table
--select * from student where st_teacher_id not in ()
select * from student where st_teacher_id not in
(select teacher_id from teachers where t_fname='shiva')
-----------------------------------------------------------------------------------------------------


--9. Get the First Name and Last name of the teacher/s who is/are teaching Mathematics.
-- step1
-- select subject_id from subjects where subject_name='mathematics'
-- step2
--select * from teachers where in ()
select * from teachers where t_subject_id in
(select subject_id from subjects where subject_name='mathematics')
-------------------------------------------------------------------------------------------------

--10. Display the details of the teacher whose last name has the letter ‘i’ in it.
select * from teacherswhere t_lname like '%i%'
-------------------------------------------------------------------------------------------------

--11. Display the Date of Admission of students who are students of Sneha
select * from student where st_teacher_id in
(select teacher_id  from teachers where t_fname ='sneha')
-------------------------------------------------------------------------------------------------


--12. Write a query to display the students whose chosen subject is ‘physics’.
select * from student
select * from teachers
select * from subjects

select * from subjects s
inner join teachers t
on s.subject_id=t.t_subject_id

inner join student st
on t.teacher_id=st.st_teacher_id

where s.subject_name='physics'
------------------------------------------------------------------------------------------------


--13. Display the student and their respective teachers’ names(first name and last name).
select student_name,t_fname from student s
inner join teachers t
on  s.st_teacher_id=t.teacher_id
--------------------------------------------------------------------------------------------------


--14. Atharva wants to remove some of the teachers who are not working currently so that 
--he can manage the expenses. Write a query to help him identify the first name of 
--teacher/s who is/are not teaching currently.
select * from teachers t
left join student s
on t.teacher_id=s.st_teacher_id
where student_id is null
--------------------------------------------------------------------------------------------------

-- 15. One of the students with id 205, has asked for a change in teacher. Write a query to 
--update the teacher id value of the respective student to 103
-- update table
-- set value
-- where condition
update student 
set st_teacher_id=103
where student_id=205

select * from student
