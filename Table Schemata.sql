Drop table if exists titles CASCADE;
Drop table if exists employees CASCADE;
Drop table if exists departments CASCADE;
Drop table if exists dept_manager CASCADE;
Drop table if exists dept_emp CASCADE;
Drop table if exists salaries CASCADE;

--create titles table
CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

--select * from titles;

--create employees table
CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
       "emp_no"
     ), CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id"));

--select * from employees;

--Create dept_manager table
CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

--select * from departments;

--Create dept_manager table
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL ,
    "emp_no" INT   NOT NULL,
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"), FOREIGN KEY("emp_no")
	REFERENCES "employees" ("emp_no"),
	primary key(dept_no, emp_no));

--Select * from dept_manager;

--Create Dept_emp table
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL, FOREIGN KEY("emp_no")REFERENCES "employees" ("emp_no"), FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no"),
primary key(dept_no, emp_no));

--Select * from dept_emp;

--Create Salaries Table
CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL Primary Key,
    "salary" INT   NOT NULL,
	FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);


--select * from salaries;




