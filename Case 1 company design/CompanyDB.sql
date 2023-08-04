CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employee
(
SSN INT PRIMARY KEY,
Fname VARCHAR(30),
Lname VARCHAR(30),
BDate DATE,
Gender CHAR(1),
Superssn INT FOREIGN KEY REFERENCES Employee(SSN),
Dnum INT,
CONSTRAINT c1 CHECK ( Gender IN ('M', 'F'))
);

CREATE TABLE Dependent
(
Name VARCHAR(50) UNIQUE,
ESSN INT FOREIGN KEY REFERENCES Employee(SSN),
Gender CHAR(1),
BDate DATE,
CONSTRAINT c2 PRIMARY KEY(Name, ESSN),
CONSTRAINT c3 CHECK ( Gender IN ('M', 'F'))
);

CREATE TABLE Department
(
Dnum INT PRIMARY KEY,
Dname VARCHAR(30),
MGRSSN INT FOREIGN KEY REFERENCES Employee(SSN),
MGR_hire_date DATE
);

ALTER TABLE Employee 
ADD FOREIGN KEY (Dnum) REFERENCES Department(Dnum);

CREATE TABLE Dept_location
(
Dnum INT FOREIGN KEY REFERENCES Department(Dnum),
Location VARCHAR(50),
CONSTRAINT c4 PRIMARY KEY(Dnum, Location)
);

CREATE TABLE Project
(
Pnum INT PRIMARY KEY,
Pname VARCHAR(50),
Location VARCHAR(50),
City VARCHAR(50),
Dnum INT FOREIGN KEY REFERENCES Department(Dnum)
);

CREATE TABLE Works_for
(
ESSN INT FOREIGN KEY REFERENCES Employee(SSN),
Pnum INT FOREIGN KEY REFERENCES Project(Pnum),
Hours INT
);