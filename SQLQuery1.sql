create database Mentor_on_Demand



create table UserDtls ( id int identity(1000,1) primary key, username nvarchar(20) unique not null, user_password nvarchar(16) not null, first_name nvarchar(20) not null,
	last_name nvarchar(20), contact_number bigint unique not null, reg_datetime datetime, reg_code nvarchar(10), force_reset_password bit default 0)
alter table UserDtls add constraint [Default_Reg_Code] default '000' for reg_code

create table Mentor (id int identity(1000,1) primary key, username nvarchar(20) unique not null, mentor_password nvarchar(16) not null, first_name nvarchar(20) not null, 
	last_name nvarchar(20), contact_number bigint unique not null, reg_datetime datetime, reg_code nvarchar(10) default '000', force_reset_password bit default 0,
	linkedin_url nvarchar(100), years_of_experience int not null)

alter table Mentor add constraint [Default_Code] default '000' for reg_code


create table Skills (id int identity(1000,1) primary key, s_name nvarchar(30) unique not null, s_toc nvarchar(20), s_duration_hrs int not null, prerequisites nvarchar(100))
alter table Skills add constraint [Default_TOC] default '000' for s_toc

create table Mentor_Skills (id int identity (1000,1) primary key, m_id int, s_id int, self_rating decimal(3,1), years_of_exp int, trainings_delivered int, facilities_offered nvarchar(100))

alter table Mentor_Skills add constraint [FK_MS_Mentor] foreign key ([m_id]) references [Mentor](id)

alter table Mentor_Skills add constraint [FK_MS_Skills] foreign key ([s_id]) references [Skills](id)

create table Trainings (id int identity (1000,1) primary key, userid int, mentor_id int, skill_id int, status nvarchar(15) default 'Pending')

alter table Trainings add constraint [FK_Trainings_User] foreign key ([userid]) references [UserDtls] (id)

alter table Trainings add constraint [FK_Trainings_Mentor] foreign key ([mentor_id]) references [Mentor] (id)

alter table Trainings add constraint [FK_Trainings_Skills] foreign key ([skill_id]) references [Skills] (id)


create table Tbl_Admin (id int identity(1000,1) primary key, username nvarchar(20) unique not null, ad_password nvarchar(16) not null)

INSERT INTO [dbo].[UserDtls]
           ([username]
           ,[user_password]
           ,[first_name]
           ,[last_name]
           ,[contact_number]
           ,[reg_datetime]
           ,[reg_code])
     VALUES
           ('finu.nazar@gmail.com'
           ,'finu'
           ,'Finu'
           ,'Nazar'
           ,1234567899
           ,'2019-10-12 10:20:00 AM'
           ,'1000')

select * from UserDtls

create procedure getAllUsers
as
	select id, username, user_password, first_name, last_name, contact_number, reg_datetime, reg_code, force_reset_password from UserDtls

exec getAllUsers

select * from UserDtls

create procedure registerNewUser @username nvarchar(20), @user_password nvarchar(16), @firstName nvarchar(20), @lastName nvarchar(20)
	, @contactNumber bigint, @regDateTime datetime
as
	INSERT INTO [dbo].[UserDtls]
           ([username]
           ,[user_password]
           ,[first_name]
           ,[last_name]
           ,[contact_number]
           ,[reg_datetime])
     VALUES
           (@username,
		   @user_password,
		   @firstName,
		   @lastName,
		   @contactNumber,
		   @regDateTime)

exec registerNewUser 'venky.guru@gmail.com','venky','Venkatesan','Gurusamy',1234567849,'2019-09-03 11:20:00 AM'

create procedure authenticateUser @username nvarchar(20), @password nvarchar(16)
as
	select id,username,user_password,first_name,last_name,contact_number,reg_datetime,reg_code,force_reset_password from UserDtls where username=@username and user_password=@password

exec authenticateUser 'venky.guru@gmail.com','venky'


create procedure getAllMentors
as
	select id,username,mentor_password,first_name,last_name,contact_number,reg_datetime,reg_code,force_reset_password,linkedin_url,years_of_experience from Mentor


create procedure authenticateMentor @username nvarchar(20), @password nvarchar(16)
as
	select id, username,mentor_password,first_name,last_name,contact_number,reg_datetime,reg_code,force_reset_password,linkedin_url,years_of_experience from Mentor where username=@username and mentor_password=@password

create procedure registerNewMentor @username nvarchar(20), @m_password nvarchar(16),@firstName nvarchar(20), @lastName nvarchar(20),
	@contactNumber bigint, @reg_datetime datetime, @linkedinUrl nvarchar(100), @yoe int
as
	INSERT INTO [dbo].[Mentor]
           ([username]
           ,[mentor_password]
           ,[first_name]
           ,[last_name]
           ,[contact_number]
           ,[reg_datetime]
           ,[linkedin_url]
           ,[years_of_experience])
     VALUES
           (@username
           ,@m_password
           ,@firstName
           ,@lastName
           ,@contactNumber
           ,@reg_datetime
           ,@linkedinUrl
           ,@yoe)



drop procedure authenticateMentor

exec registerNewMentor 'iris.jestin@gmail.com','iris','Iris','Jestin',6758493021,'2019-02-14 03:00:00 PM','www.linkedin.com/iris.jestin',4
exec getAllMentors
exec authenticateMentor 'iris.jestin@gmail.com','iris'
select id, username,mentor_password,first_name,last_name,contact_number,reg_datetime,reg_code,force_reset_password,linkedin_url,years_of_experience from Mentor where username='iris.jestin@gmail.com' and mentor_password='iris'

update Mentor set username='joseph.chungath@gmail.com' where id=1005

create procedure getAllSkills
as
	select id, s_name,s_toc,s_duration_hrs,prerequisites from Skills

exec getAllSkills

create procedure insertNewSkill @name nvarchar(30), @toc nvarchar(20), @duration int, @prerequisites nvarchar(100)
as
	INSERT INTO [dbo].[Skills]
           ([s_name]
           ,[s_toc]
           ,[s_duration_hrs]
           ,[prerequisites])
     VALUES
           (@name
           ,@toc
           ,@duration
           ,@prerequisites)

exec insertNewSkill 'Python','Programming',8,'NIL'

create procedure setTraining @userid int, @mentorid int, @skillid int
as
	INSERT INTO [dbo].[Trainings]
           ([userid]
           ,[mentor_id]
           ,[skill_id])
     VALUES
           (@userid
           ,@mentorid
           ,@skillid)

exec setTraining 1000,1002,1001

create procedure editMentorProfile @username nvarchar(20), @mentor_password nvarchar(16), @firstName nvarchar(20), @lastName nvarchar(20),
	@contactNumber bigint, @linkedinURL nvarchar(100), @yoe int, @mid int
as
	update Mentor set username=@username, mentor_password=@mentor_password, first_name=@firstName, last_name=@lastName,
		contact_number=@contactNumber, linkedin_url=@linkedinURL, years_of_experience=@yoe where id=@mid

exec editMentorProfile 'samuel.george@gmail.','samuel','Samuel','George',6753493022,'www.linkedin.com/samuel.george',5,1003

alter procedure getAllTrainingsForMentor @mid int
as
	select T.id as TrainingId, S.id as SkillId, S.s_name as SkillName, S.s_duration_hrs as Duration, U.first_name as UserFirstName, U.last_name as UserLastName, U.contact_number as UserContactNumber, U.username as UserEmail, T.[status] as TrainingStatus from Skills as S, UserDtls as U,Trainings as T where T.skill_id=S.id and T.userid=U.id and T.mentor_id=@mid

exec getAllTrainingsForMentor 1002

create procedure updateTrainingStatus @tid int, @status nvarchar(15)
as
	update Trainings set [status]=@status where id=@tid

updateTrainingStatus 1002,'Confirmed'

create procedure getAllTechnologies
as
	select id, s_name, s_toc, s_duration_hrs, prerequisites from Skills

exec getAllTechnologies

create procedure authenticateAdmin @username nvarchar(20), @password nvarchar(16)
as
	select id, username, ad_password from Tbl_Admin where username=@username and ad_password=@password

select * from Tbl_Admin
insert into Tbl_Admin values ('admin','admin')


create procedure addNewSkill @name nvarchar(30), @toc nvarchar(20), @duration int, @prereq nvarchar(100)
as
	INSERT INTO [dbo].[Skills]
           ([s_name]
           ,[s_toc]
           ,[s_duration_hrs]
           ,[prerequisites])
     VALUES
           (@name
           ,@toc
           ,@duration
           ,@prereq)

create procedure editSkill @toc nvarchar(20), @duration int, @prereq nvarchar(100), @id int
as
	update Skills set s_toc=@toc, s_duration_hrs=@duration, prerequisites=@prereq where id=@id

alter procedure getAllMentorsDetails 
as
	select M.id as MentorId, M.username as MentorEmail, M.contact_number as MentorPhone, M.first_name as MentorFirstName, M.last_name as MentorLastName,
		M.linkedin_url as MentorLinkedInURL, M.years_of_experience as MentorYOE,
		MS.self_rating as MentorSkillRating, MS.trainings_delivered as MentorSkillTrainingsDelivered, MS.years_of_exp as MentorSkillYOE,
		MS.facilities_offered as MentorSkillFacilitiesOffered,
		S.s_name as MentorSkillName, S.id as MentorSkillId
	from Mentor as M, Mentor_Skills as MS, Skills as S where M.id=MS.m_id and MS.s_id=S.id

exec getAllMentorsDetails


select * from Mentor_Skills

select * from Mentor
Select * from Skills

select * from Trainings

select * from UserDtls

delete from UserDtls where id=1005

update UserDtls set username = 'a.hitler@gmail.com' where id=1003
update UserDtls set username = 'm.manoj@gmail.com' where id=1004


insert into Mentor_Skills values (1004,1002,9.9,10,35,'Classroom Training')

exec addNewSkill '.NET Core','000',40,'Basic Programming in any language'
exec editSkill 'Framework',40,'Basic Programming in any language',1002
exec registerNewUser 'mervin.manoj@gmail.com','mervin','Mervin','Manoj',5334567849,'2017-11-03 11:20:00 PM'
exec registerNewMentor 'mathew.jovit@gmail.com','mathew','Mathew','Jovit',3758493021,'2013-12-14 03:00:00 AM','www.linkedin.com/mathew.jovit',12

alter procedure getSkillsForMentor @id int
as
	select MS.id as MentorSkillId, S.id as SkillId, S.s_name as SkillName, S.s_duration_hrs as SkillDuration, S.s_toc as SToc, 
	MS.self_rating as MentorSkillRating, MS.trainings_delivered as MentorSkillRTrainingsDelivered, MS.years_of_exp as MentorSkillYoe, 
	MS.facilities_offered as MentorSkillFacilities
	from Mentor_Skills as MS,Skills as S where MS.s_id=S.id and MS.m_id=@id

exec getSkillsForMentor 1002

select * from sysobjects where type='P' and category=0

sp_helptext insertNewSkill

drop procedure insertNewSkill

create procedure addSkillForMentor @mid int, @sid int, @rating decimal(3,1), @yoe int, @trainingsDelivered int, @facilitiesOffered nvarchar(100)
as
	INSERT INTO [dbo].[Mentor_Skills]
           ([m_id]
           ,[s_id]
           ,[self_rating]
           ,[years_of_exp]
           ,[trainings_delivered]
           ,[facilities_offered])
     VALUES
           (@mid
           ,@sid
           ,@rating
           ,@yoe
           ,@trainingsDelivered
           ,@facilitiesOffered)

select * from Mentor
select * from Skills
select * from Mentor_Skills
select * from UserDtls
select * from Trainings

delete from Mentor_Skills where id=1004
