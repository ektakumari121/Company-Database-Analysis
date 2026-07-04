create database company_db;
use company_db;

create table department(
    dept_id int primary key auto_increment,
    dept_name varchar(50),
    location varchar(50) not null,
    budget int
);

Insert into department (dept_id,dept_name,location,budget) values 
(1, 'HR', 'New York', 200000),
(2, 'IT', 'Chicago', 500000),
(3, 'Sales', 'Dallas', 300000),
(4, 'Marketing', 'Chicago', 250000),
(5, 'Finance', 'New York', 400000),
(6, 'Opertions', 'Dallas', 350000),
(7, 'Logistics', 'Chicago', 1800000),
(8, 'R$D', 'New York', 600000),
(9, 'Support', 'Dallas', 150000),
(10, 'Legal', 'Chicago', 220000),
(11, 'Procedure', 'New York', 280000),
(12, 'Admin', 'Boston', 200000),
(13, 'Design', 'San Francisco', 320000),
(14, 'Quality', 'Boston', 210000),
(15, 'Training', 'San Francisco', 190000);

select * from department;

select dept_id,dept_name,budget from department;

show tables;
select * from department where location='Dallas';
select * from department where budget>800000;
select * from department where budget<250000;
select * from department where budget>=300000;
select * from department where budget between 200000 and 400000;
select * from department where location in ('New York', 'Dallas');
select * from department where location not in ('New York', 'Dallas');
select * from department where dept_name like 'M%';
select * from department where dept_name like '%M';
select * from department where dept_name like '%M%';
select * from department where dept_name ='admin';
select * from department where location='New York' and budget>200000;
select * from department where location='New York' or budget>200000;
select * from department where not location ='New York';
select * from department where budget is null;

update department set budget= 250000 where dept_id in (4);

select * from department order by location ASC;
select * from department order by budget ASC;
select * from department order by budget DESC limit 3;

select upper(location) from department;
select upper(location) as UPPERlocation from department;
select *, upper(location) as UPPERlocation from department;
select lower(location) from department;
select *,lower(location) as LOWERlocation from department;

select concat(dept_name,' - ', location) as name_location from department;

select substring(upper(location),1,4) from department;

select dept_name, length(dept_name) as len from department;

update department set dept_name= concat(' ',dept_id,' ') where dept_id in (1,2,3,4);

update department set budget= budget -200000 where dept_id in(1,2,3,4);

select abs(budget) as budget from department;

update department set budget= 200000 where dept_id in(1);
update department set budget= 500000 where dept_id in(2);
update department set budget= 300000 where dept_id in(3);
update department set budget= 250000 where dept_id in(4);

select count(*) as count from department;
select sum(budget) as total from department;

select count(*) as count,sum(budget) as total from department;

select avg(budget) as avg from department;
select count(*) as count,sum(budget) as total, avg(budget) as avgvalue from department;

select max(budget) from department;

select
count(*) as count,
sum(budget) as total,
avg(budget) as avgvalue,
max(budget) as maxdata,
min(budget) as mindata
from department;

select location, sum(budget) as totalbudget from department group by location;
select location, count(*) as total from department group by location;
select location, min(budget) as Mindata from department group by location; 
select location, max(budget) as Maxdata from department group by location;

CREATE TABLE employees(
    emp_id int primary key auto_increment,
    emp_name varchar(50),
    salary int,
    dept_id int,
    foreign key (dept_id) references department(dept_id)
    );
    
    INSERT INTO employees (emp_id, emp_name, salary, dept_id) VALUES
    (1, 'Amit', 50000, 1),
    (2, 'Priya', 60000, 2),
    (3, 'Rahul', 55000, 2),
    (4, 'Sneha', 70000, 3),
    (5, 'Rohit', 48000, NULL),
    (6, 'Anjali', 52000, 1),
    (7, 'Vikram', 58000, 2),
    (8, 'Kavya', 49000, 3),
    (9, 'Suresh', 61000, 2),
    (10, 'Neha', 47000, NULL),
    (11, 'Manish', 53000, 1),
    (12, 'Ritika', 68000, 3),
    (13, 'Arjun', 55000, 2),
    (14, 'Pooja', 50000, NULL),
    (15, 'Deepak', 62000, 4),
    (16, 'Isha', 48000, 5),
    (17, 'Nikhil', 57000, 6),
    (18, 'Sakshi', 50000, 7),
    (19, 'Tanvi', 59000, 8),
    (20, 'Rohan', 53000, 9);
    
SELECT * FROM employees;

SELECT 
  e.emp_id,e.emp_name,e.salary,d.dept_id,d.dept_name,d.location
  FROM employees e
  INNER JOIN department d ON e.dept_id ORDER BY emp_id;

SELECT 
  e.emp_id,e.emp_name,e.salary,d.dept_id,d.dept_name,d.location
  FROM employees e 
  LEFT JOIN department d ON e.dept_id=d.dept_id ORDER BY emp_id;

SELECT
  e.emp_id,e.emp_name,e.salary,d.dept_id,d.dept_name,d.location
  FROM employees e
  RIGHT JOIN department d ON e.dept_id=d.dept_id ORDER BY emp_id;
  
SELECT
  e.emp_name,e.salary
  FROM employees e
  LEFT JOIN department d ON e.dept_id=d.dept_id WHERE e.dept_id IS NULL;
  
SELECT 
  e.emp_name,e.salary
  FROM employees e WHERE e.dept_id IS NULL;
  
SELECT d.dept_name,
  sum(e.salary) AS SalarySum
  FROM department d
  INNER JOIN employees AS e
  ON d.dept_id= e.dept_id GROUP BY d.dept_name;
  
SELECT d.dept_name,
   max(e.salary) AS Salarymax
   FROM department d
   INNER JOIN employees AS e 
   ON d.dept_id=e.dept_id GROUP BY d.dept_name;

SELECT d.dept_name,
   count(e.emp_id) as empCount
   FROM department d
   INNER JOIN employees AS e
   ON d.dept_id=e.dept_id GROUP BY d.dept_name HAVING empCount>=3;
   
SELECT emp_name,dept_id FROM employees WHERE dept_id=1

UNION 

SELECT emp_name,dept_id FROM employees WHERE dept_id=2;

ALTER TABLE employees
ADD manager_id INT,
ADD CONSTRAINT FOREIGN KEY(manager_id)
REFERENCES employees(emp_id);

UPDATE employees SET manager_id=1
WHERE emp_id IN (2,3);
UPDATE employees SET manager_id=2
WHERE emp_id IN (4,5);

SELECT
e1.emp_name AS Employee,
e2.emp_name AS Manager
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id=e2.emp_id;


CREATE TABLE colors(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    colorName VARCHAR(50)
    );
    
INSERT INTO colors (Id, colorName) VALUES
    (1, 'red'),
    (2, 'blue');
    
CREATE TABLE sizes(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    sizeName VARCHAR(50)
    );
    
INSERT INTO sizes (Id, sizeName) VALUES
    (1, 'XXL'),
    (2, 'XL');
    
SELECT c.colorName, s.sizeName
FROM colors c CROSS JOIN sizes s;

SELECT max(salary) AS secondMax FROM employees
WHERE salary<(SELECT max(salary) FROM employees);

SELECT emp_name,salary,dept_id,(SELECT max(salary) 
FROM employees e2
WHERE e2.dept_id=e1.dept) AS deptMaxSalary
FROM employees e1;

SELECT emp_name FROM employees 
WHERE dept_id=(SELECT dept_id
FROM department WHERE dept_name='sales');

CREATE VIEW employee_salary_view AS 
SELECT emp_name,salary FROM employees
WHERE salary>50000;

SELECT * FROM employee_salary_view;

CREATE VIEW employee_list_view AS
SELECT emp_name FROM employees
WHERE dept_id IS NOT NULL;

SELECT * FROM employees_list_view;

CREATE INDEX idx_employees_name
ON employees (emp_name);

SELECT * FROM employees WHERE emp_name='priya';

SELECT emp_name,salary,
   CASE 
       WHEN salary>100000 THEN 'High'
       WHEN salary BETWEEN 50000 AND 100000 THEN 'Medium'
       ELSE 'Low'
  END AS Salary_category FROM employees;
  
CREATE VIEW empcountbyDept AS
SELECT d.dept_id,d.dept_name,count(e.emp_id)
FROM department AS d LEFT JOIN employees AS e
ON e.dept_id=d.dept_id GROUP BY d.dept_id;

SELECT * FROM empCountDept;

DELIMITER $$
CREATE FUNCTION getAnnualsalary(monthsalary INT)
RETURNS INT
DETERMINISTIC
BEGIN
     RETURN monthsalary*12;
END $$
DELIMITER $$,

SELECT emp_name,salary,getAnnualSalary(salary) AS AnnualSalary FROM employees;

DELIMITER $$
CREATE PROCEDURE getEmployeesByDept(deptId INT)
BEGIN
     SELECT emp_id,emp_name,salary FROM employees 
     WHERE dept_id=dept_Id;
END $$
DELIMITER $$;

CALL getEmployeesbyDepId(1);

DELIMITER $$
CREATE PROCEDURE IncreaseSalary(
deptId INT,
amount INT 
)
BEGIN
     UPDATE employees SET salary=salary+amount
     WHERE dept_id=dept_Id;
END $$
DELIMITER $$;

CALL IncreaseSalary(1,5000);

DELIMITER $$
CREATE TRIGGER before_insert_employees
BEFORE INSERT ON employees
FOR EACH ROW 
BEGIN
     IF NEW.salary<0 OR NEW.salary IS NULL THEN 
        SET NEW.salary=0;
	END IF;
END $$
DELIMITER $$;

CREATE TABLE employees_audit (
      audit_id INT AUTO_INCREMENT PRIMARY KEY,
      empt_id INT NOT NULL,
      action_time DATETIME DEFAULT CURRENT_TIMESTAMP,
      remarks VARCHAR(255)
);

DELIMITER $$
CREATE TRIGGER emp_logs
AFTER DELETE ON employees
FOR EACH ROW 
BEGIN
	INSERT INTO employees_audit (empt_id, action_type, remarks)
       VALUES(OLD.emp_id, 'DELETE', 'employee deleted');
       
END $$;
DELIMITER $$;

DELETE FROM employees WHERE emp_id=22;

SELECT * FROM employees;






    



