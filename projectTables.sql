
--CREATE DATABASE evaluation_portal;
use evaluation_portal;
CREATE TABLE User_ (
id int identity,
email varchar(60) unique,
username varchar(30),
password_ varchar(30),
PRIMARY KEY (id)
);
---------------------------------------------
CREATE TABLE Student(
student_id int,
GIU_ID int unique,
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
birth_date datetime NOT NULL,
semester varchar(20),
faculty varchar(40),
major varchar(40),
GPA DECIMAL(4,2),
coverletter varchar(200),
address_ varchar(60),
CV varchar(200), -- Link to cv as pdf
age as (year(CURRENT_TIMESTAMP) - year(birth_date) )
PRIMARY KEY(student_id),
FOREIGN KEY (student_id) REFERENCES User_ ON DELETE CASCADE ON UPDATE CASCADE);
--ALTER table Student
--ADD coverletter varchar(200);

-----------------------------------------------
create table student_phonenumber(
id int,
number varchar(16),
PRIMARY KEY(id,number),
FOREIGN KEY (id) REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE);

create table Employer(
id int ,
PRIMARY KEY (id),
FOREiGN KEY (id) REFERENCES  User_ ON DELETE CASCADE ON UPDATE CASCADE,
company_name varchar(50),
address_ varchar(30),
phone_number varchar(30),
fax  varchar(50),
website  varchar(50), 
type_of_bussines  varchar(30),
establishment_year datetime,
country_of_origin  varchar(30),
industry varchar(30),
number_of_currents_employes  int,
products_or_services  varchar(100)
);


create table Contact_Person(

employer_id int,
PRIMARY KEY (employer_id),
FOREiGN KEY (employer_id) REFERENCES Employer ON DELETE CASCADE ON UPDATE CASCADE,
name_ varchar(30),
job_title varchar(30),
email varchar(30),
mobile_number varchar(30),
fax varchar(30)
);

create table HR_Director(
employer_id int,
PRIMARY KEY (employer_id),
FOREiGN KEY (employer_id) REFERENCES Employer ON DELETE CASCADE ON UPDATE CASCADE,
name_ varchar(30),
email varchar(30)
);


create table Admin_(
id int ,
PRIMARY KEY (id),
FOREiGN KEY (id) REFERENCES  User_ ON DELETE CASCADE ON UPDATE CASCADE,
);

create table Faculty_Representative(
id int ,
PRIMARY KEY (id),
FOREiGN KEY (id) REFERENCES User_ ON DELETE CASCADE ON UPDATE CASCADE,
faculty varchar(30)
);

--------------------------------------------

create table Academic_Advisor
(
id int ,
PRIMARY KEY (id),
FOREIGN KEY (id) REFERENCES  User_ ON DELETE CASCADE ON UPDATE CASCADE,
faculty VARCHAR (20)	
);


create table Career_Office_Coordinator
(
id int ,
PRIMARY KEY (id),
FOREIGN key (id) REFERENCES USER_ ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Review_Profile
(
employer_id INT ,
admin_id INT,
status_ BIT,
reason VARCHAR(100),

PRIMARY KEY(employer_id),
FOREIGN KEY(employer_id ) REFERENCES Employer ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(admin_id) REFERENCES Admin_ ON DELETE NO ACTION ON UPDATE NO ACTION
);

--alter table Review_Profile
--alter column status_ BIT
--alter table Review_Profile
--alter column reason varchar(100)

CREATE TABLE Job (
job_id INT IDENTITY  ,
title VARCHAR(30),
description_ VARCHAR(30) ,
department VARCHAR(30),
start_date_ datetime,
end_date_ datetime,
duration AS year(end_date_)-year(start_date_),
application_deadline_ datetime,
num_of_availabe_internships INT,
salary_range VARCHAR(30),
qualification VARCHAR(100),
location_ VARCHAR(30),
application_link VARCHAR(30),
application_email VARCHAR(30),
job_type VARCHAR(30),
visibility VARCHAR(30),
reason VARCHAR(30),
employer_id INT ,
admin_id INT,
PRIMARY KEY (job_id),
FOREIGN KEY (employer_id) REFERENCES Employer ON DELETE  NO ACTION ON UPDATE  NO ACTION ,
FOREIGN KEY (admin_id) REFERENCES Admin_ ON DELETE  NO ACTION ON UPDATE  NO ACTION
);



CREATE TABLE Allowed_faculties (
id INT,
faculty_name VARCHAR(30),
PRIMARY KEY(id,faculty_name),
FOREIGN KEY(id) REFERENCES Job ON UPDATE CASCADE ON DELETE CASCADE 
);


CREATE TABLE Required_semesters(
id INT,
semester int,
PRIMARY KEY(id,semester),
FOREIGN KEY(id) REFERENCES Job ON UPDATE CASCADE ON DELETE CASCADE 

);

CREATE TABLE Part_Time (

id INT ,
workdays VARCHAR(50),
PRIMARY KEY (id),
FOREIGN  KEY (id) REFERENCES Job ON UPDATE CASCADE ON DELETE CASCADE 
);

CREATE TABLE Freelance (
id INT , 
PRIMARY KEY (id),
FOREIGN  KEY (id) REFERENCES Job ON UPDATE CASCADE ON DELETE CASCADE 

);


CREATE TABLE Summer_internship (
id INT , 
PRIMARY KEY (id),
FOREIGN  KEY (id) REFERENCES Job ON UPDATE CASCADE ON DELETE CASCADE 

);

CREATE TABLE Full_Time (
id INT , 
PRIMARY KEY (id),
FOREIGN  KEY (id) REFERENCES Job ON UPDATE CASCADE ON DELETE CASCADE 

);
CREATE TABLE Project_based (
id INT , 
PRIMARY KEY (id),
FOREIGN  KEY (id) REFERENCES Job ON UPDATE CASCADE ON DELETE CASCADE 

);

CREATE TABLE Industrial_internship(
id INT ,
status_ VARCHAR (30),
aa_id INT,
facultyRep_id INT,
PRIMARY KEY (id),
FOREIGN  KEY (id) REFERENCES Job ON UPDATE CASCADE ON DELETE CASCADE ,

FOREIGN  KEY (aa_id) REFERENCES Academic_Advisor ON UPDATE  NO ACTION ON DELETE  NO ACTION ,

FOREIGN  KEY (facultyRep_id) REFERENCES Faculty_Representative ON UPDATE  NO ACTION ON DELETE  NO ACTION

);


CREATE TABLE CV_Builder(

personal_mail VARCHAR (60),
education VARCHAR(30),
 extracurricular_activities VARCHAR(50),
 likedin_link VARCHAR(50),
 github_link VARCHAR(50),
skills VARCHAR(50),
 achievements VARCHAR (50),
 student_id INT,
 PRIMARY KEY (personal_mail),
 FOREIGN KEY (student_id) REFERENCES Student ON DELETE  NO ACTION ON UPDATE  NO ACTION 
);

CREATE TABLE Apply_(

student_id INT ,
job_id INT ,
application_status VARCHAR(30),
PRIMARY KEY(student_id , job_id ),
FOREIGN KEY (student_id) REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY (job_id) REFERENCES Job ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE Eligible(

student_id INT ,
II_id INT ,
coc_id INT ,
eligibility BIT,
PRIMARY KEY (student_id , II_id ),
FOREIGN KEY (student_id) REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY (II_id) REFERENCES Industrial_internship ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY (coc_id) REFERENCES Career_Office_Coordinator ON DELETE  NO ACTION ON UPDATE  NO ACTION 

);

CREATE TABLE Progress_report (
student_id INT ,
date_ datetime ,
numeric_state INT ,
evaluation VARCHAR(30),
description_ VARCHAR(30), -- Link to pdf
advisor_id INT ,
PRIMARY KEY (student_id , date_),
FOREIGN KEY (student_id) REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY (advisor_id) REFERENCES Academic_Advisor ON DELETE  NO ACTION ON UPDATE  NO ACTION
);