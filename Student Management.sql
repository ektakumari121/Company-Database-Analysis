create database StudentManagementDB;
use StudentManagementDB;    

create table students(
   student_id int primary key auto_increment,
   student_name varchar(50) not null,
   student_gender enum('M','F','Other'),
   student_contact varchar(30),
   student_email varchar(50)
);

create table subjects(
    subject_Id int primary key auto_increment,
    subject_name varchar(50) 
    );

create table marks(
    mark_id int primary key auto_increment,
    student_id int,
    subject_id int,
    marks int,
    foreign key (student_id) references students(student_id),
    foreign key (subject_id) references subjects(subject_id)
    );
    
    DELIMITER $$
    
    create procedure addstudent(
    student_name varchar(50),
    student_gender enum('M','F'),
    student_contact varchar(50),
    student_email varchar(50)
    )
    begin
        insert into students(student_name,student_gender,student_contact,student_email)
        values (student_name,student_gender,student_contact,student_email);

    end $$    
    DELIMITER ;
    
    call addstudent ('arpita', 'F', 62169826145, 'arpita@gmail.com' );
    
    select * from students;
    
    insert into subjects (subject_name)
    values ('Hindi'),('Maths'),('English');
    
    insert into marks (student_id,subject_id,marks)
    values (2,1,55),(2,2,67),(2,3,84),
		   (3,1,65),(3,2,85),(3,3,95),
           (4,1,45),(4,2,68),(4,3,78);
           
    select m.mark_id,m.marks,s.subject_name from marks m
    JOIN subjects s on m.subject_id=s.subject_id;
    
    select m.mark_id,m.marks,s.subject_name from marks m
    JOIN subjects s on m.subject_id=s.subject_id order by mark_id;
    
	select m.mark_id,m.marks,s.subject_name,st.student_name from marks m
    JOIN subjects s on m.subject_id=s.subject_id
    join students st on m.student_id=st.student_id
    order by mark_id;
    
    select
    s.student_id,
    s.student_name,
    sum(m.marks) as sum
    from students s join marks m on s.student_id=m.student_id
    group by s.student_id,s.student_name;
    
	select
    s.student_id,
    s.student_name,
    sum(m.marks) as sum
    from students s join marks m on s.student_id=m.student_id
    group by s.student_id,s.student_name order by sum DESC;
    
    select
    s.student_id,
    s.student_name,
    sum(m.marks) as sum
    from students s join marks m on s.student_id=m.student_id
    group by s.student_id,s.student_name order by sum DESC limit 1;
    
	select 
	s.student_id,
    s.student_name,
    sum(m.marks) as sum,avg(m.marks) as avgValue
    from students s join marks m on s.student_id=m.student_id
    group by s.student_id,s.student_name order by sum DESC;
    
    select count(*) as COUNT from students;
    
    select
    s.student_name,
    sum(m.marks) as total_marks
    from students s 
    join marks m on s.student_id=m.student_id
    group by s.student_name;
    
	select
    s.student_name,
    sum(m.marks) as total_marks
    from students s 
    join marks m on s.student_id=m.student_id
    group by s.student_name
    order by total_marks DESC limit 1;
    
	select
    s.student_name,
    avg(m.marks) as AVG_marks
    from students s 
    join marks m on s.student_id=m.student_id
    group by s.student_name
    having avg(marks) < 70;
    
    
    