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
	foreign key (emp_no) references employees (emp_no),
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
	foreign key (emp_no) references employees (emp_no),
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
