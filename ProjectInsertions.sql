use Internship_portal;

-- Student register

execute ShowJobs;
execute AdminViewJobs
DECLARE @int INT;
DECLARE @varchar VARCHAR(100);
DECLARE @bit BIT;
EXECUTE UserRegister @usertype = 'Student',
@email = 'koko.sese@@icloud.com',
@first_name = 'kokosese',
@middle_name = null, @last_name = 'Keilan',
@major = 'CS',@adress = 'hassanradwan',
@birth_date = '4/8/1996', @GIU_id = 3232112,
@semester = 3, @faculty = 'Computer Science',
@gpa = '4.38' ,@password  = @varchar OUTPUT, @company_name = null, @company_phone = null,
@fax =null, @company_website =null, @type_of_business =null, @establishment_year = null, @origin_country =null, @industry =null,
@n_current_employees = null
, @products_services =null;


DECLARE @int INT;
DECLARE @varchar VARCHAR(100);
DECLARE @bit BIT;
EXECUTE UserRegister @usertype = 'Career office coordinator',
@email = 'momosada@gmail.com',
@first_name = 'momosada',
@middle_name = null, @last_name = null,
@major = null,@adress = null,
@birth_date = null, @GIU_id = null,
@semester =null, @faculty = null,
@gpa = null  ,@password  = @varchar OUTPUT, @company_name = null, @company_phone = null,
@fax =null, @company_website =null, @type_of_business =null, @establishment_year = null, @origin_country =null, @industry =null,
@n_current_employees = null
, @products_services =null;


--Employer register


EXECUTE UserRegister @usertype = 'Employer',
@email = 'kkk-Bilal.Keilan@@icloud.com' ,
@password  = @varchar OUTPUT,
@first_name = 'anakkbilal',
@middle_name = null, @last_name = null,
@major = null,@adress = 'Eskan',
@birth_date = null, @GIU_id = null,
@semester = null, @faculty = null,
@gpa = null, @company_name = 'shawerma', @company_phone = '01091638529',
@fax ='57589-2848', @company_website ='www.shawerma.com', @type_of_business ='food', @establishment_year = '4/8/1996', @origin_country ='Arabia', @industry ='food chain',
@n_current_employees = 16
, @products_services ='Shawerma';


EXECUTE UserRegister @usertype = 'Employer',
@email = 'sary@@icloud.com' ,
@password  = @varchar OUTPUT,
@first_name = 'sary',
@middle_name = null, @last_name = null,
@major = null,@adress = 'sakan',
@birth_date = null, @GIU_id = null,
@semester = null, @faculty = null,
@gpa = null, @company_name = 'GoogleTanta', @company_phone = '01091438529',
@fax ='5752838', @company_website ='www.GoogleT7tberelselem.com',
@type_of_business ='food', @establishment_year = '4/8/1886', @origin_country ='Masr', @industry ='food chain',
@n_current_employees = 16
, @products_services ='bn7b elakl';

EXECUTE UserRegister @usertype = 'Academic_Advisor',
@email = 'spiderman@gmail.com' ,
@password  = @varchar OUTPUT,
@first_name = null,
@middle_name = null, @last_name = null,
@major = null,@adress = null,
@birth_date = null, @GIU_id = null,
@semester = null, @faculty = 'CS',
@gpa = null, @company_name = null, @company_phone = null,
@fax =null, @company_website =null, @type_of_business =null, @establishment_year = null, @origin_country =null, @industry =null,
@n_current_employees = null
, @products_services =null;

EXECUTE UserRegister @usertype = 'Admin',
@email = 'spiderman@gmail.com' ,
--@password  = @varchar OUTPUT,
@first_name = "mohamed",
@middle_name = null, @last_name = null,
@major = null,@adress = null,
@birth_date = null, @GIU_id = null,
@semester = null, @faculty = null,
@gpa = null, @company_name = null, @company_phone = null,
@fax =null, @company_website =null, @type_of_business =null, @establishment_year = null, @origin_country =null, @industry =null,
@n_current_employees = null
, @products_services =null;


EXECUTE UserRegister @usertype = 'Admin',
@email = 'Zeyadgobran@gmail.com' ,
@password  = @varchar OUTPUT,
@first_name = 'zeyad',
@middle_name = null, @last_name = null,
@major = null,@adress = null,
@birth_date = null, @GIU_id = null,
@semester = null, @faculty = null,
@gpa = null, @company_name = null, @company_phone = null,
@fax = null, @company_website = null, @type_of_business = null, @establishment_year =  null, @origin_country = null, @industry = null,
@n_current_employees =  null
, @products_services = null;

EXECUTE AddHR 3, 'TaneRobbi', 'Tane.Robbi@gmail.com'

EXECUTE AdminReviewEmp @admin_id = 2, @emp_id = 3, @profile_status = 0, @reason='rejected'

EXECUTE AdminReviewEmp @admin_id = 2, @emp_id = 4, @profile_status = 1 , @reason='acceptedmeow'


--i have updated this proc logic so we need to update the whole database 
DECLARE @int INT;
DECLARE @varchar VARCHAR(100);
DECLARE @bit BIT;

EXECUTE PostJob @emp_id = 4, @title = '', @description = '',
@department = 'cattshop', @start_date = '1/12/2021',
@end_date='4/10/2020', @application_deadline = '8/15/2020',
@n_available_internships = 6, @salary_range = '610-1000', 
@qualifications = '', @location = '', @job_type = 'Industrial_internship',
@workdays = 1, @application_link = '',
@application_email = '', @job_id = @int OUTPUT
 

--------

-- rejected employer : 
DECLARE @int INT;

EXECUTE PostJob @emp_id = 3, @title = '', @description = '',
@department = 'SWVL2', @start_date = '',
@end_date='', @application_deadline = '',
@n_available_internships = 3, @salary_range = '61100', 
@qualifications = '', @location = '', @job_type = 'Summer_internship',
@workdays = 1, @application_link = '',
@application_email = '', @job_id = @int OUTPUT

-------------


-- rejected employer : 
EXECUTE PostJob @emp_id = 4, @title = 'softwareee', @description = 'meows',
@department = 'incorta', @start_date = '1/1/2020',
@end_date='4/10/2020', @application_deadline = '8/1/2020',
@n_available_internships = 6, @salary_range = '100-1000', 
@qualifications = '', @location = '', @job_type = 'Summer_internship',
@workdays = 1, @application_link = '',
@application_email = '', @job_id = @int OUTPUT

----------
DECLARE @int INT;
DECLARE @varchar VARCHAR(100);
DECLARE @bit BIT;
EXECUTE UserRegister @usertype = 'Faculty representative',
@email = 'sosmmmo@gmail.com' ,
@password  = @varchar OUTPUT,
@first_name = "mohamed",
@middle_name = null, @last_name = null,
@major = null,@adress = null,
@birth_date = null, @GIU_id = null,
@semester = null, @faculty = 'CS',
@gpa = null, @company_name = null, @company_phone = null,
@fax =null, @company_website =null, @type_of_business =null,
@establishment_year = null, @origin_country =null, @industry =null,
@n_current_employees = null
, @products_services =null;
---------------------
EXECUTE AddFaculty 1,'CS'
EXECUTE AddFacultyRepToII 1,2,7
EXECUTE AddSemester 1,2
EXECUTE AddSemester 2,3
EXECUTE ApplyForJob 11,3
EXECUTE AddProgressReport 1,'1/1/2002','he MEOWS'

DECLARE @int INT;
DECLARE @SUC int
EXECUTE UserLogin 'mohamed','01010292',@success = @SUC OUTPUT,@user_id = @int OUTPUT
print @int

EXECUTE DeleteProfile 1
EXECUTE AdminViewEmps
EXECUTE AdminViewJobs
EXECUTE AdminViewFRs


--correcto logic but it we should run the PostJob first so that we will not conflict with the foreign key constraint
--same as last one
--EXECUTE AddSemester 88, '4'

EXECUTE AdminReviewJob 2,1,1,'gamed'
EXECUTE AdminReviewJob 2,2,1,'msh test 5alth'
EXECUTE EmpEditProfile 3,'01010292','chonk','EatCompany','01001','23123213','dsadsa.com','CatsShop','12/31/2002','masr','dasdas',12,'cats'
EXECUTE JobsSearch 5,'cs'
EXECUTE AddContact 3,'iamcontactperson','ccc','contact@gmail.com','312312','312321321'

DECLARE @int bit;
DECLARE @varchar VARCHAR(100);
EXECUTE ViewProfileStatus 4,@int output,@varchar output
PRINT @int
PRINT @varchar

EXECUTE EmpViewJobs 4

EXECUTE EmpViewApplicants 4,1


execute CocUpdateEligibility 10,9,1,1
execute CocUpdateEligibility 10,11,3,0

EXECUTE EmpUpdateApplicant 9,1,'accepted'
execute EmpUpdateApplicant 11,3,'meowy'
execute EmpUpdateApplicant 11,1,'meowy'

DECLARE @BITT bit
EXECUTE courseInformation 7,1,1,@BITT

EXECUTE StudentEditProfile 9,'test@gmail.com','first','mid','last','1/1/2002',3434,3,'CS','Security',1.0,'tanta'

EXECUTE AddMobile 9,'07775000'

EXECUTE CreateCV 9,'sarynasser@lol.com','t3lem3aly','Football','linkedin','github/ssary','cooking','zero'


DECLARE @status varchar(100) 
DECLARE @jobname varchar(100) 
DECLARE @employername varchar(100) 

EXECUTE ViewMyStatus 9 , 9 , @application_status=@status output ,@employer_name=@employername output, @job_name=@jobname output  
print @status
print @employername
print @jobname


EXECUTE AddProgressReport 9,'1/1/2022', 'this is my report' 

DECLARE @noofreports int  , @date datetime  ,  @description varchar(100)  ,  @numeric_state int  ,@evaluation varchar(100)

EXECUTE ViewMyReports  9,@noofreports output, @date output , @description output , @numeric_state output , @evaluation output




DECLARE @int INT;
DECLARE @varchar VARCHAR(100);
DECLARE @bit BIT;
EXECUTE UserRegister @usertype = 'Academic_Advisor',
@email = 'mohamed_mostafa1@gmail.com',
@first_name = 'mohamedmostafa',
@middle_name = null, @last_name = null,
@major = null,@adress = null,
@birth_date = null, @GIU_id = null,
@semester =null, @faculty = 'CS',
@gpa = null  ,@password  = @varchar OUTPUT, @company_name = null, @company_phone = null,
@fax =null, @company_website =null, @type_of_business =null, @establishment_year = null, @origin_country =null, @industry =null,
@n_current_employees = null
, @products_services =null;


EXECUTE  ViewAdvisors


EXEC CocViewStudents 1



EXEC AAToII 16,1

EXEC EvalProgressReport 16,9,'1/1/2022',5,'excellence report' 

EXECUTE ViewProgressReports 16

DECLARE @varchar VARCHAR(50);
EXECUTE GetUserType 9,@type = @varchar output
print(@varchar)