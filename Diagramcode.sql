﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/h5ThWn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "departments" (
    "dept_no" VARCHAR(100)   NOT NULL,
    "dept_name" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dep_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_dep_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR(100)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "sex" VARCHAR(100)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_managers" (
    "dept_no" VARCHAR(100)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_managers" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(100)   NOT NULL,
    "title" Varchar(100)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dep_emp" ADD CONSTRAINT "fk_dep_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dep_emp" ADD CONSTRAINT "fk_dep_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title");

