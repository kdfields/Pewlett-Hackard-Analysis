--Creating tables for PH-EmployeeDB
create table departments(
	dept_no varchar(4) not null,
	dept_name varchar(40) not null,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

create table employees(
	emp_no int not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hire_date date not null,
	PRIMARY KEY (emp_no)
);

create table dept_manager(
	dept_no varchar(4) not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null,
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);

create table salaries(
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no)
);

create table dept_employee(
	emp_no int not null,
	dept_no varchar(4) not null,
	from_date date not null,
	to_date date not null,
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
	);
	
create table titles(
	emp_no int not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no, title, from_date)
);
select * from titles;
select * from departments;

select first_name, last_name
from employees
where 1=1
AND birth_date between '1952-01-01' and '1955-12-31';

select first_name, last_name, birth_date, hire_date
from employees
where 1=1
and birth_date between '1952-01-01' and '1952-12-31'
and hire_date between '1985-01-01' and '1988-12-31'
order by birth_date, hire_date;

select first_name, last_name
from employees
where 1=1
and birth_date between '1953-01-01' and '1953-12-31';

select first_name, last_name
from employees
where 1=1
and birth_date between '1954-01-01' and '1954-12-31';

select first_name, last_name
from employees
where 1=1
and birth_date between '1955-01-01'and '1955-12-31';

--Number of employees retiring
select count(first_name)
from employees
where 1=1
and birth_date between '1952-01-01' and '1955-12-31'
and hire_date between '1985-01-01' and '1988-12-31';

--Create a new table called retirement info
select first_name, last_name
into retirement_info
from employees
where 1=1
and birth_date between '1952-01-01' and '1955-12-31'
and hire_date between '1985-01-01' and '1988-12-31'; 

select * from retirement_info;

--Drop retirement_info table
drop table retirement_info;

--Create new table for retiring employees 
select emp_no, first_name, last_name
into retirement_info
from employees
where 1=1
and birth_date between '1952-01-01' and '1955-12-31'
and hire_date between '1985-01-01' and '1988-12-31'; 

select * from retirement_info;

--joining departments and dept_managers table
select dp.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
from departments as dp
inner join dept_manager as dm
on dp.dept_no=dm.dept_no;

--joining retirement_info and dept_emp tables
select retirement_info.emp_no,
	retirement_info.first_name, 
	retirement_info.last_name,
	dept_employee.to_date
from retirement_info
left join dept_employee
on retirement_info.emp_no = dept_employee.emp_no;

--left join for retirement_info and dept_emp tables
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.to_date
	from retirement_info as ri
	left join dept_employee as d
	on ri.emp_no = d.emp_no;
	
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
into current_emp
from retirement_info as ri
left join dept_employee as de
on ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

select * from current_emp;

--Employee count by department number
select count(ce.emp_no), de.dept_no
from current_emp as ce
left join dept_employee as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

select * from salaries
order by to_date desc;

--create a list of employees w/ emp_no, last name, first name, gender & salary
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary, de.to_date
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
order by emp_no;

--Create new table for retiring employees 
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary, de.to_date
into emp_info
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
inner join dept_employee as de
on e.emp_no = de.emp_no
where 1=1
and e.birth_date between '1952-01-01' and '1955-12-31'
and e.hire_date between '1985-01-01' and '1988-12-31'
and de.to_date = '9999-01-01'; 

--Create a new table for retiring managers
select dm.dept_no, 
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
into manager_info
from dept_manager as dm
	inner join departments as d
		on dm.dept_no = d.dept_no
	inner join current_emp as ce
		on dm.emp_no = ce.emp_no;
		
--Department retirees
select ce.emp_no, ce.first_name, ce.last_name, d.dept_name
into dept_info
from current_emp as ce
	inner join dept_employee as de
		on ce.emp_no = de.emp_no
			inner join departments as d
				on de.dept_no = d.dept_no;
				
				
select * from employees;
select ce.emp_no,
	ce.first_name, 
	ce.last_name,
	d.dept_name
from current_emp ce
inner join dept_employee de
on ce.emp_no = de.emp_no
inner join departments d
on de.dept_no = d.dept_no
where d.dept_name in ('Sales', 'Development');