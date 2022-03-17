--use Internship_portal;
use evaluation_portal;
go
-- 1)a

create proc ShowEmployers

as
select * from Employer E
				inner join Review_Profile RF on RF.employer_id = E.id
where RF.status_ = 1
order by E.company_name

go


-- 1)b
create proc ShowJobs
as
select * from Job
where Job.visibility = 1
go

-- 1)c

create proc JobsSearch
@semester int,
@allowed_faculty varchar(30)
as
if
	exists(
	select * from Job J
					inner join Allowed_faculties AF on AF.id = J.job_id
	where AF.faculty_name = @allowed_faculty

	UNION

	select * from Job J
					inner join Required_semesters RS on RS.id = J.job_id
	where RS.semester = @semester)

	begin
	select * from Job J
						inner join Allowed_faculties AF on AF.id = J.job_id
		where AF.faculty_name = @allowed_faculty

		UNION

		select * from Job J
						inner join Required_semesters RS on RS.id = J.job_id
		where RS.semester = @semester
	end

else
	begin
	exec ShowJobs
	end

go


create procedure getUserId
@email varchar(50),
@id int output
as
select @id = User_.id FROM User_ where  User_.email=@email

go

	CREATE PROC UserRegister
	@usertype varchar(30),@email varchar(50),@first_name varchar(20),@middle_name varchar(20),
	@last_name varchar(20), @birth_date datetime,@GIU_id int,@semester int, @faculty varchar(20),@major
	varchar(20),@gpa decimal(4,2),@adress varchar(10), @company_name varchar(20), @company_phone
	varchar(20),@fax varchar(50), @company_website varchar(50), @type_of_business varchar(30), 
	@establishment_year datetime, @origin_country varchar(20), @industry varchar(20), @n_current_employees
	int, @products_services varchar(30),

	@password varchar(8) output
	AS 
	INSERT INTO User_ ( email , username , password_ )
	VALUES (@email , @first_name ,'01010292')

	declare @idUser int 
	--select the id of the last record in the table
	select @idUser = User_.id FROM User_ where  User_.email=@email



	set @password = '01010292'
	print @password
	print @idUser
	if @usertype = 'Student'
		begin
		INSERT INTO Student(student_id,GIU_ID, first_name,middle_name,last_name,birth_date,semester,
		faculty, major, GPA, address_)
		VALUES (@idUser,@GIU_id,@first_name,@middle_name,@last_name,@birth_date,@semester,@faculty,
		@major, @gpa, @adress)
		end
	else if @usertype = 'Employer'
		begin
		INSERT INTO Employer(id,company_name,address_,phone_number,fax,website,type_of_bussines,
		establishment_year, country_of_origin, industry, number_of_currents_employes, products_or_services)
		VALUES(@idUser,@company_name,@adress,@company_phone,@fax,@company_website,@type_of_business,
		@establishment_year,@origin_country, @industry, @n_current_employees, @products_services)
		end
	else if @usertype = 'Admin'
		begin
		INSERT INTO Admin_ VALUES(@idUser);
		end
	else if @usertype = 'Career office coordinator'
			begin 
			INSERT INTO Career_Office_Coordinator VALUES (@idUser);
			end
	else if @usertype = 'Faculty representative'
			begin
			INSERT INTO Faculty_Representative VALUES (@idUser , @faculty);
			end
	else if @usertype='Academic_Advisor'
	begin
	INSERT INTO Academic_Advisor VALUES (@idUser , @faculty);

end


go

CREATE PROC UserLogin
@email varchar(50),
@password varchar(20),
@success bit OUTPUT,
@user_id int OUTPUT
AS
IF exists(
SELECT User_.id FROM User_ 
WHERE  User_.email=@email AND User_.password_=@password)
	begin 
	SELECT @user_id= User_.id FROM User_ 
	WHERE  User_.email=@email AND User_.password_=@password
	SET @success = 1;
	print @success;
	print @user_id;
	end 
ELSE 
	begin 
	SET @success = 0 ;
	SET @user_id=-1;
	print @success ;
	print @user_id ;
	END

go

CREATE PROC ViewProfile
@user_id int
AS
if  exists (SELECT * FROM User_ U 
			INNER JOIN Student S ON U.id=@user_id AND S.student_id= @user_id )
	begin
	SELECT * FROM User_ U 
			INNER JOIN Student S ON U.id=@user_id AND S.student_id = @user_id
		-- where S.student_id = @user_id
	end

if  exists (SELECT * FROM User_ U 
			INNER JOIN Employer E ON U.id=@user_id AND E.id= @user_id )
	begin
	SELECT * FROM User_ U 
			INNER JOIN Employer E ON U.id=@user_id AND E.id= @user_id 
		-- where S.student_id = @user_id
	end

if  exists (SELECT * FROM User_ U 
			INNER JOIN Admin_ A ON U.id=@user_id AND A.id= @user_id )
	begin
	SELECT * FROM User_ U 
			INNER JOIN Admin_ A ON U.id=@user_id AND A.id= @user_id  
		-- where S.student_id = @user_id
	end

if  exists (SELECT * FROM User_ U 
			INNER JOIN Faculty_Representative FR ON U.id=@user_id AND FR.id= @user_id )
	begin
	SELECT * FROM User_ U 
			INNER JOIN Faculty_Representative FR ON U.id=@user_id AND FR.id= @user_id   
		-- where S.student_id = @user_id
	end

if  exists (SELECT * FROM User_ U 
			INNER JOIN Career_Office_Coordinator COC ON U.id=@user_id AND COC.id= @user_id )
	begin
	SELECT * FROM User_ U 
			INNER JOIN Career_Office_Coordinator COC ON U.id=@user_id AND COC.id= @user_id   
		-- where S.student_id = @user_id
	end

if  exists (SELECT * FROM User_ U 
			INNER JOIN Academic_Advisor AA ON U.id=@user_id AND AA.id= @user_id )
	begin
	SELECT * FROM User_ U 
			INNER JOIN Academic_Advisor AA ON U.id=@user_id AND AA.id= @user_id   
		-- where S.student_id = @user_id
	end

go

CREATE PROC DeleteProfile
@user_id int
AS
DELETE FROM User_ WHERE User_.id= @user_id ;

go

CREATE PROC AdminViewEmps
AS
SELECT * from Employer

go

CREATE PROC AdminReviewEmp
@admin_id int, @emp_id int, @profile_status bit, @reason varchar(100)
AS
INSERT INTO Review_Profile(admin_id,employer_id,status_,reason)
VALUES(@admin_id,@emp_id,@profile_status,@reason)

go

CREATE PROC AdminViewJobs
AS
SELECT *
FROM Job

go

CREATE PROC AdminViewFRs
AS
SELECT * FROM Faculty_Representative
--GROUP BY faculty
go

CREATE PROC AddFacultyRepToII
@job_id int, @admin_id int, @facultyRep_id int
AS
DECLARE @faculty varchar(30)
if EXISTS( SELECT * FROM Admin_ WHERE @admin_id = Admin_.id)
begin
	SELECT @faculty = faculty FROM Faculty_Representative
	WHERE @facultyRep_id = Faculty_Representative.id

	if
	EXISTS(
	SELECT * FROM Job J
	INNER JOIN Allowed_faculties AF ON AF.id = J.job_id
	WHERE J.job_id = @job_id AND AF.faculty_name = @faculty
	)
	begin
	UPDATE Industrial_internship
	SET
	facultyRep_id=@facultyRep_id
	WHERE
	@job_id = id
	end
end
go

CREATE PROC AdminReviewJob
@admin_id int, @job_id int, @visibility bit, @reason varchar(100)
AS
--if exists(
--SELECT * from Industrial_internship --if job is industrial intern
--WHERE @job_id = id)
--	begin
--	if @visibility = 0 -- if not accepted : set reason = reason and visibility =0
--		begin
--		UPDATE Job
--		SET 
--		visibility = 0,
--		reason = @reason
--		WHERE
--			job_id = @job_id AND admin_id = @admin_id
--		end
--	else
--	begin -- if accepted : set reason with null, so that you know in FR
--		UPDATE Job
--		SET 
--		visibility = 0,
--		reason = null
--		WHERE
--			job_id = @job_id AND admin_id = @admin_id
--	end
--	end
--ELSE

--begin
	UPDATE Job
SET 
	visibility = @visibility,
	reason = @reason,
	admin_id = @admin_id
WHERE
	job_id = @job_id
--end


go
CREATE PROC EmpEditProfile
@id int, @password varchar(8), @adress varchar(10), @company_name varchar(20),
@company_phone varchar(20),@fax varchar(50), @company_website varchar(50),
@type_of_business varchar(30), @establishment_year datetime , @origin_country varchar(20), @industry varchar(20),
@n_current_employees int , @products_services varchar(30)
as

UPDATE User_
SET 
	password_=@password
WHERE 
	User_.id=@id

UPDATE Employer
SET
address_=@adress,
company_name=@company_name,
phone_number=@company_phone,
fax=@fax,
website=@company_website,
type_of_bussines=@type_of_business,
establishment_year=@establishment_year,
country_of_origin=@origin_country,
number_of_currents_employes=@n_current_employees,
products_or_services=@products_services
WHERE
	Employer.id=@id

go

CREATE PROC AddContact
@emp_id int, @name varchar(20), @job_title varchar(30), @email varchar(50),
@mobile_number varchar(20), @fax varchar(50)
AS
--INSERT INTO Employer(id) VALUES(@emp_id)
INSERT INTO Contact_Person VALUES ( @emp_id , @name , @job_title , @email, @mobile_number,@fax)


go 
CREATE PROC AddHR
@emp_id int, @name varchar(20), @email varchar(50)
AS
INSERT INTO HR_Director VALUES (@emp_id , @name , @email)

go

CREATE PROC ViewProfileStatus
@emp_id int ,
@status bit OUTPUT ,
@reason varchar(100) OUTPUT 
AS 
SELECT @status=status_ , @reason=reason FROM Review_Profile 
WHERE Review_Profile.employer_id =@emp_id

go

CREATE PROC PostJob
@emp_id int, @title varchar(30), @description varchar(50), @department varchar(20), @start_date
datetime, @end_date datetime, @application_deadline datetime, @n_available_internships int,
@salary_range varchar(20), @qualifications varchar(100), @location varchar(20), @application_link
varchar(50), @application_email varchar(50), @job_type varchar(30), @workdays int,
@job_id int OUTPUT

AS

IF exists (SELECT * FROM Review_Profile	WHERE @emp_id= employer_id AND Review_Profile.status_ = 1)-- if accepted
BEGIN
INSERT INTO Job(title,description_,department,start_date_,end_date_,application_deadline_,
num_of_availabe_internships, salary_range, qualification, location_,
application_email, job_type,employer_id)
VALUES (@title , @description , @department,@start_date, @end_date, @application_deadline,
@n_available_internships,@salary_range, @qualifications, @location,
@application_email,@job_type,@emp_id)


--select last insterted element and get its id

SELECT @job_id=Job.job_id FROM Job 
WHERE job_id=(
SELECT max(Job.job_id) 
FROM Job
);


if @job_type='Part_time' 
begin
INSERT INTO Part_Time VALUES (@job_id , @workdays)
end

if @job_type='Freelance'
begin

INSERT INTO Freelance VALUES(@job_id)
end

if @job_type= 'Summer_internship'
begin
INSERT INTO Summer_internship VALUES (@job_id)
end

if @job_type= 'Full_Time'
begin
INSERT INTO Full_Time VALUES (@job_id)
end

if @job_type= 'Project_based'
begin
INSERT INTO Project_based VALUES (@job_id)
end

--missing values for this type
if @job_type= 'Industrial_internship'
begin

INSERT INTO Industrial_internship(id) VALUES (@job_id)
END
end


go
CREATE PROC AddFaculty
@job_id int,@allowed_faculty varchar(20)
AS
INSERT INTO Allowed_faculties VALUES (@job_id , @allowed_faculty)

go

CREATE PROC AddSemester
@job_id int,@semester int
as
INSERT INTO Required_semesters VALUES (@job_id ,@semester)

go

CREATE PROC  EmpViewJobs 
@emp_id int

AS

SELECT  * FROM Job WHERE Job.employer_id=@emp_id
ORDER BY Job.start_date_ ASC


go
CREATE PROC EmpViewApplicants
 @emp_id int, @job_id int
 AS

DECLARE @specific_job_id int 
SELECT  @specific_job_id= job_id FROM Job Where Job.employer_id=@emp_id AND Job.job_id=@job_id 

SELECT * FROM Apply_
				INNER JOIN Student ON Apply_.job_id = @specific_job_id
				AND Apply_.student_id=Student.student_id



go
CREATE PROC EmpUpdateApplicant
@student_id int, @job_id int, @application_status varchar(20)
AS
DECLARE @IIID int

if EXISTS( -- if it's industrial intern
SELECT * FROM Industrial_internship II
WHERE II.id = @job_id
)
	begin
	if EXISTS( -- if II is eligible
	SELECT E.eligibility FROM Eligible E
	WHERE E.student_id = @student_id AND @job_id = E.II_id AND E.eligibility = 1
	)
		begin
		UPDATE Apply_
		SET application_status = @application_status
		WHERE Apply_.job_id = @job_id AND Apply_.student_id = @student_id
		end
	ELSE
		begin
		UPDATE Apply_
		SET application_status = 'rejected'
		WHERE Apply_.job_id = @job_id AND Apply_.student_id = @student_id
		end
	end
ELSE
	begin
	UPDATE Apply_
	SET application_status = @application_status
	WHERE Apply_.job_id = @job_id AND Apply_.student_id = @student_id
	end


go
CREATE PROC courseInformation
@facRep_id int, @job_id int ,@ii_status bit,
@ii_status_output bit OUTPUT
AS

DECLARE @faculty varchar(30)

SELECT @faculty = faculty FROM Faculty_Representative
WHERE @facRep_id = Faculty_Representative.id

if
EXISTS(
SELECT * FROM Job J
INNER JOIN Allowed_faculties AF ON AF.id = J.job_id
WHERE J.job_id = @job_id AND AF.faculty_name = @faculty AND visibility = 1
)
begin
--SET @ii_status=1
if( @ii_status = 1)
begin
SET @ii_status_output=1
UPDATE Industrial_internship 
SET status_= @ii_status
WHERE Industrial_internship.id=@job_id
end
else
begin
SET @ii_status_output=0
UPDATE Industrial_internship 
SET status_=0
WHERE Industrial_internship.id=@job_id

UPDATE Job
SET Job.visibility = 0
WHERE Job.job_id = @job_id
end
end

else
begin

SET @ii_status_output=0
UPDATE Industrial_internship 
SET status_= 0
WHERE Industrial_internship.id=@job_id

UPDATE Job
SET Job.visibility = 0
WHERE Job.job_id = @job_id
end

go

CREATE PROC  StudentEditProfile
@sid int, @email varchar(50),@first_name varchar(20),@middle_name varchar(20), @last_name
varchar(20), @birth_date datetime,@GIU_id int,@semester int, @faculty varchar(20),
@major varchar(20),@gpa decimal(4,2),@adress varchar(10)

AS
UPDATE User_
	SET 
	User_.email=@email
	WHERE 
	User_.id =@sid

UPDATE Student
	SET
	Student.GIU_ID=@GIU_id,
	Student.first_name=@first_name,
	Student.middle_name=@middle_name,
	Student.last_name=@last_name,
	Student.birth_date=@birth_date,
	Student.semester=@semester,
	Student.faculty=@faculty,
	Student.major=@major,
	Student.GPA=@gpa,
	Student.address_=@adress
	WHERE
		Student.student_id=@sid


go

CREATE PROC AddMobile
@sid int,@mobileNumber varchar(20)

AS
INSERT INTO student_phonenumber VALUES (@sid , @mobileNumber)

go

CREATE PROC CreateCV
@s_id int, @personal_mail varchar(50), @education varchar(100), @extracurricular_activities
varchar(300), @linkedIn_link varchar(30), @github_link varchar(30), @skills varchar(300), @achievements varchar(300)

AS

INSERT INTO CV_Builder(student_id,personal_mail,education,extracurricular_activities,likedin_link,github_link,
skills,achievements) VALUES(@s_id,@personal_mail,@education,@extracurricular_activities,@linkedIn_link,@github_link,
@skills,@achievements)

SELECT * from CV_Builder
WHERE @personal_mail=CV_Builder.personal_mail

go

CREATE PROC ApplyForJob
@sid int, @job_id int
AS
INSERT INTO Apply_(student_id,job_id,application_status)
VALUES(@sid,@job_id,'Pending')

go

CREATE PROC ViewMyStatus
@sid int, @job_id int,
@application_status varchar(20) output,
@job_name varchar(30) output,
@employer_name varchar(30) output

AS
SELECT @application_status=Apply_.application_status from Apply_
WHERE Apply_.job_id = @job_id AND Apply_.student_id = @sid

SELECT @job_name=Job.title FROM Job WHERE Job.job_id=@job_id

SELECT @employer_name=Employer.company_name  FROM  Job INNER JOIN Employer ON Job.job_id=@job_id AND Job.employer_id=Employer.id

go

CREATE PROC AddProgressReport
@sid int, @date datetime, @description varchar (100)
AS
INSERT INTO Progress_report (student_id,date_,description_)
VALUES(@sid,@date,@description)

go

CREATE PROC ViewMyReports
@sid int,
@nOfReports int output, @date datetime output, @decription varchar(100) output, @numeric_state int output
, @evaluation varchar(100) output

AS
update progress_report
set numeric_state = -1,evaluation = 'not evaluated yet'
where @sid = student_id and evaluation = null

SELECT
@nOfReports= COUNT(*)
FROM Progress_report
WHERE Progress_report.student_id = @sid
GROUP BY Progress_report.student_id

SELECT
@date= Progress_report.date_ , @decription = description_,
@numeric_state = numeric_state, @evaluation = evaluation
FROM Progress_report
WHERE Progress_report.student_id = @sid

go


CREATE PROC ViewAdvisors
AS
SELECT * FROM Academic_Advisor 
--GROUP BY faculty



go

CREATE PROC CocViewStudents
@ii_id int
AS
 SELECT * FROM Apply_ 
		  INNER JOIN Student ON  Apply_.student_id = Student.student_id AND Apply_.job_id=@ii_id
		  


go

CREATE PROC CocUpdateEligibility
@coc_id int, @s_id int, @ii_id int, @eligibility bit

AS

INSERT INTO Eligible(student_id , II_id ,coc_id , eligibility) VALUES (@s_id , @ii_id , @coc_id , @eligibility)




go

CREATE PROC AAToII
@aa_id int, @ii_id int

AS

UPDATE Industrial_internship 
SET
aa_id=@aa_id
WHERE 
Industrial_internship.status_=1 AND Industrial_internship.id=@ii_id


go

CREATE PROC EvalProgressReport
@aa_id int ,@sid int, @date datetime, @numeric_state int, @evaluation varchar(100)
AS

UPDATE Progress_report 
SET
numeric_state=@numeric_state,
evaluation=@evaluation,
advisor_id = @aa_id

WHERE 
Progress_report.student_id=@sid AND Progress_report.date_=@date


go

CREATE PROC ViewProgressReports
@advisor_id int
AS

SELECT * FROM Progress_report	
				INNER JOIN Student ON Progress_report.student_id =Student.student_id 
				AND Progress_report.advisor_id=@advisor_id
ORDER BY date_ DESC 

go

CREATE PROC GetUserType
@user_id int,
@type varchar(50) output

AS
if exists(
SELECT * FROM Student
WHERE Student.student_id = @user_id
)
begin
SET @type = 'Student.aspx'
end

if exists(
SELECT * FROM Employer
WHERE Employer.id = @user_id
)
begin
SET @type = 'Employer.aspx'
end

if exists(
SELECT * FROM Admin_
WHERE Admin_.id = @user_id
)
begin
SET @type = 'Admin_.aspx'
end

if exists(
SELECT * FROM Faculty_Representative
WHERE Faculty_Representative.id = @user_id
)
begin
SET @type = 'Faculty Representative.aspx'
end

if exists(
SELECT * FROM Academic_Advisor
WHERE Academic_Advisor.id = @user_id
)
begin
SET @type = 'Academic Advisor.aspx'
end


if exists(
SELECT * FROM Career_Office_Coordinator
WHERE Career_Office_Coordinator.id = @user_id
)
begin
SET @type = 'Career Office Coordinator.aspx'
end

go 

create proc ShowUser
@id int
as 
select * from User_ 
where User_.id	=   id
