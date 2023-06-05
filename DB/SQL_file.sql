drop database NASCON_DB

create database NASCON_DB;

use NASCON_DB;

-- Creation

create table User_ (
	userID INT IDENTITY (1,1) PRIMARY KEY,
	username VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255),
	userType INT NOT NULL
);

create table Admin (
	A_ID int IDENTITY (1,1) PRIMARY KEY,
	name varchar(255),
	username VARCHAR(255) FOREIGN KEY REFERENCES USER_(Username) ON DELETE CASCADE
);

create table Faculty (
	empID INT PRIMARY KEY,
	name varchar(255),
	username VARCHAR(255) FOREIGN KEY REFERENCES USER_(Username) ON DELETE CASCADE
);

create table Roles (
	roleID INT PRIMARY KEY,
	title varchar(255),
);

create table Student_Executives (
	execID INT PRIMARY KEY,
	fname varchar(255),
	lname varchar(255),
	batch INT,
	roleID INT FOREIGN KEY REFERENCES Roles(roleID) ON DELETE CASCADE,
	username VARCHAR(255) FOREIGN KEY REFERENCES USER_(Username) ON DELETE CASCADE
	-- rollNo is execID needs changing
);

create table SponsorPackage (
	PackageID int not null primary key,
	Description varchar(255),
	Amount int,
);

create table HostTeams(
	HT_ID int not null primary key,
	Name varchar(255),
	memberCount int,
	SecretaryID int foreign key references Student_Executives(execID) ON DELETE CASCADE,
	-- EventID should be here
	-- EventID int foreign key references Events(EventID) ON DELETE CASCADE,
);

create table HostTeamMembers(
	RollNo int foreign key references Student_Executives(execID),
	HT_ID int foreign key references HostTeams(HT_ID) ON DELETE CASCADE
);

create table eventCategory (
	CategoryID int NOT NULL PRIMARY KEY,
	CategoryName varchar(255),
	faculty_mentor int FOREIGN KEY REFERENCES Faculty(empID) ON DELETE CASCADE
);

create table Events (
	EventID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	name varchar(255),
	Venue VARCHAR(255),
	categoryID int foreign key references eventCategory(CategoryID),
	max_members int not null,
	min_members int not null,
	start_time time,
	end_time time,
	description varchar(255),
	price int not null,
	HTID int not null foreign key references HostTeams(HT_ID) ON DELETE CASCADE,
	FacultyID int FOREIGN KEY REFERENCES Faculty(empID),
	-- SponsorID int FOREIGN KEY REFERENCES Sponsor(SponsorID) ON DELETE CASCADE,
	-- does it really need HTID & SponsorID over here? Also date is missing from this
	eventDate date
);

create table Sponsor (
	SponsorID int IDENTITY (1,1) not null, -- primary key, 
	Name varchar(255) not null,
	RepID int not null,
	CNIC int not null,
	PackageID int foreign key references SponsorPackage(PackageID) ON DELETE CASCADE,
	-- EventID should be here
	EventID int foreign key references Events(EventID) ON DELETE CASCADE,
	CONSTRAINT sponsorEventID Primary key (SponsorID, EventID)
);

--create table Mentors(
--	EmpID int foreign key references Faculty(empID),
--	CategoryAssigned int foreign key references eventCategory(CategoryID) ON DELETE CASCADE
--);

create table StudentHeads(
	userID INT foreign key references Student_Executives(execID),--on delete cascade gives cycle
	event_ID int foreign key references Events(EventID) ON DELETE CASCADE
);

create table Food (
	FtypeID int not null primary key,
	description varchar(255),
);

create table Participants (
	P_ID int IDENTITY (1,1) not null primary key,
	name varchar(255),
	email varchar(255),
	CNIC int not null,
	contact int,
	FtypeID int foreign key references Food(FtypeId) ON DELETE CASCADE
	-- int8 instead of int for CNIC bcs it is long
);

create table RegisteredTeams (
	TeamId int IDENTITY (1,1) not null primary key,
	Name varchar(255),
	EventID int not null foreign key references events(EventID) ON DELETE CASCADE,
	totalmembers int,
	paid bit, 
);

create table RegisteredParticipants (
	ParticipantID int foreign key references Participants(P_ID) ON DELETE CASCADE,
	TeamId int not null foreign key references RegisteredTeams(TeamId) ON DELETE CASCADE,
	leader bit
	CONSTRAINT RegisteredParticpantsID Primary key (ParticipantID, TeamID)
);

select * from INFORMATION_SCHEMA.TABLES

-- Insertion

insert into User_ values
	('Admin', 'pass1', 1),
	('Faculty1', 'pass2', 2),
	('Faculty2', 'pass2', 2),
	('Faculty3', 'pass2', 2),
	('Faculty4', 'pass2', 2),
	('Faculty5', 'pass2', 2),
	('President', 'nascon', 3),
	('Secretary1', 'ee', 3),
	('Head1', 'ee', 3),
	('Member1', 'ee', 3),
	('Secretary2', 'cs', 3),
	('Head2', 'cs', 3),
	('Member2', 'cs', 3),
	('Secretary3', 'business', 3),
	('Head3', 'business', 3),
	('Member3', 'business', 3),
	('Secretary4', 'social', 3),
	('Head4', 'social', 3),
	('Member4', 'social', 3),
	('Secretary5', 'social', 3),
	('Head5', 'sports', 3),
	('Member5', 'pass3', 3);

insert into admin values
('Ijaz', 'Admin');

insert into faculty values
	(2, 'Javed', 'Faculty1'),
	(3, 'Umar', 'Faculty2'),
	(4, 'Rizvi', 'Faculty3'),
	(5, 'Shervan', 'Faculty4'),
	(6, 'Ahmed', 'Faculty5');

insert into Roles values 
	(1, 'President'),
	(2, 'Secretary'),
	(3, 'Head'),
	(4, 'Member'),
	(5, 'Vice President');
	
insert into Student_Executives values 
	(0000, 'Wajeeha ', 'Bahawa', 18, 1, 'President'),
	(0001, 'Ahmed', 'Khan', 19, 2, 'Secretary1'),
	(0010, 'Touba ', 'Khan', 19, 2, 'Secretary2'),
	(0011, 'Yahya', 'Abbas', 19, 2, 'Secretary3'),
	(0100, 'Ayesha', 'Javed', 19, 2, 'Secretary4'),
	(0101, 'Ramina ', 'Lehri', 19, 2, 'Secretary5'),
	(0110, 'Muhammad', 'Abdullah', 20, 3, 'Head1'),
	(0111, 'Faizan', 'Shafqat', 20, 3, 'Head2'),
	(1000, 'Sara', 'Aziz', 20, 3, 'Head3'),
	(1001, 'Mehmood', 'Sultan', 20, 3, 'Head4'),
	(1010, 'Aliza', 'Umar', 20, 3, 'Head5'),
	(1011, 'Fatima', 'Kamran', 21, 4, 'Member1'),
	(1100, 'Usama', 'Ali', 21, 4, 'Member2'),
	(1101, 'Kamran', 'Arshad', 21, 4, 'Member3'),
	(1110, 'Umar', 'Arif', 21, 4, 'Member4'),
	(1111, 'Naima', 'Imran', 21, 4, 'Member5');

insert into SponsorPackage values
	(1, 'Gold', 100000),
	(2, 'Silver', 60000),
	(3, 'Bronze', 25000);

insert into HostTeams values
	(1, 'HostTeamEE', 3, 0001),
	(2, 'HostTeamCS', 3, 0010),
	(3, 'HostTeamBusi', 3, 0011),
	(4, 'HostTeamSS', 3, 0100),
	(5, 'HostTeamSP', 3, 0101);

insert into HostTeamMembers values
	(1011, 1),
	(1100, 2), 
	(1101, 3),
	(1110, 4), 
	(1111, 5);

insert into eventCategory values
	(1, 'EE', 2),
	(2, 'CS', 3),
	(3, 'Business', 4),
	(4, 'Socials', 5),
	(5, 'Sports', 6);

insert into Events values 
	('Speed Wiring', 'Wisdom Tree', 1, 1, 1, '10:00 AM', '11:00 AM', 'wire circuit', 1000, 1, 2, '5-14-2022'),
	('Aero Wars', 'Main Ground', 1, 5, 1, '11:00 AM', '12:00 PM', 'airplane combat', 1000, 1, 2, '5-15-2022'),
	('Robo Race', 'Central Walk', 1, 5, 1, '12:00 PM', '2:00 PM', 'Race with robots', 1000, 1, 2, '5-16-2022'),
	('Robo Wars', 'Cafe', 1, 5, 1, '2:00 PM', '4:00 PM', 'Make your bots fight', 1000, 1, 2, '5-14-2022'),
	('Engineering Gameshow', 'Margalla 3 Lab', 1, 5, 1, '4:00 PM', '5:00 PM', 'Showoff cool gadgets', 1000, 1, 2, '5-16-2022'),

	('Bug Hunt', 'Karakoram2 Lab', 2, 3, 1, '10:00 AM', '11:00 AM', 'Fix the code', 2000, 2, 3, '5-16-2022'),
	('Cyber Security Quiz', 'Main Ground', 2, 3, 1, '11:00 AM', '12:00 PM', 'Security knowledge', 2000, 2, 3, '5-15-2022'),
	('Mobile App Development', 'Margalla2 Lab', 2, 3, 1, '12:00 PM', '2:00 PM', 'Make an app', 2000, 2, 3, '5-14-2022'),
	('Game Jam', 'Cafe', 2, 1, 1, '2:00 PM', '4:00 PM', 'Deafeat your opponents', 2000, 2, 3, '5-14-2022'),
	('SE Quiz', 'Margalla 3 Lab', 2, 3, 1, '4:00 PM', '5:00 PM', 'software knowledge', 2000, 2, 3, '5-15-2022'),

	('Entrepreneurial Venture', 'Auditorium', 3, 3, 1, '10:00 AM', '11:00 AM', 'Pitch an idea', 1000, 3, 4, '5-16-2022'),
	('Ad-Maniac', 'Mehran2 Lab', 3, 1, 1, '11:00 AM', '12:00 PM', 'Design an ad', 1000, 3, 4, '5-15-2022'),
	('Accounting and Finance Guru', 'Conference Room', 3, 3, 1, '12:00 PM', '2:00 PM', 'ANF Knowledge', 1000, 3, 4, '5-15-2022'),
	('Marketing Plan', 'Cafe', 3, 3, 1, '2:00 PM', '4:00 PM', 'Design a mareting strategy', 1000, 3, 4, '5-16-2022'),
	('Business Case Simulation', 'Auditorium', 3, 4, 1, '4:00 PM', '5:00 PM', 'Solve a business problem', 1000, 3, 4, '5-16-2022'),

	('Auto Show', 'Parking Lot', 4, 3, 1, '10:00 AM', '11:00 AM', 'Show yours cars', 1500, 4, 5, '5-14-2022'),
	('NaSCon got Challenge', 'Auditorium', 4, 1, 1, '11:00 AM', '12:00 PM', 'Singing competition', 1500, 4, 5, '5-15-2022'),
	('Battle of the Bands', 'Auditorium', 4, 3, 1, '12:00 PM', '2:00 PM', 'Musical competition', 1500, 4, 5, '5-16-2022'),
	('English poetry', 'Auditorium', 4, 3, 1, '2:00 PM', '4:00 PM', 'Peotry Reading', 1500, 4, 5, '5-15-2022'),
	('Bait bazi', 'Cafe', 4, 4, 1, '4:00 PM', '5:00 PM', 'Urdu poetry reading', 1500, 4, 5, '5-16-2022'),

	('Futsal', 'Futsal Ground', 5, 3, 1, '10:00 AM', '11:00 AM', 'Futsal tournament', 1000, 5, 6, '5-15-2022'),
	('Basketball', 'Basketball Court', 5, 1, 1, '11:00 AM', '12:00 PM', 'Basketball tournament', 1000, 5, 6, '5-16-2022'),
	('Table Tennis', 'Table Tennis Area', 5, 3, 1, '12:00 PM', '2:00 PM', 'Table Tennis tournament', 1000, 5, 6, '5-15-2022'),
	('Cricket', 'Cricket Ground', 5, 3, 1, '2:00 PM', '4:00 PM', 'Cricket Tournament', 1000, 5, 6, '5-16-2022'),
	('Maze Run', 'Sports Complex', 5, 4, 1, '4:00 PM', '5:00 PM', 'Escape the maze', 1000, 5, 6, '5-14-2022');

insert into Sponsor values
	('Sponsor1', 1, 11112222, 1, 1),
	('Sponsor2', 2, 22223333, 2, 2),
	('Sponsor3', 3, 33334444, 3, 3),
	('Sponsor4', 4, 44445555, 1, 4),
	('Sponsor5', 5, 55556666, 2, 5),
	('Sponsor6', 1, 11112222, 1, 6),
	('Sponsor7', 2, 22223333, 2, 7),
	('Sponsor8', 3, 33334444, 3, 8),
	('Sponsor9', 4, 44445555, 1, 9),
	('Sponsor10', 5, 55556666, 2, 10),
	('Sponsor11', 1, 11112222, 1, 11),
	('Sponsor12', 2, 22223333, 2, 12),
	('Sponsor13', 3, 33334444, 3, 13),
	('Sponsor14', 4, 44445555, 1, 14),
	('Sponsor15', 5, 55556666, 2, 15);

insert into Mentors values
	(2, 1),
	(3, 2),
	(4, 3),
	(5, 4),
	(6, 5);

insert into StudentHeads values
	(0110, 1), (0110, 2), (0110, 3), (0110, 4), (0110, 5),
	(0111, 6), (0111, 7), (0111, 8), (0111, 9), (0111, 10),
	(1000, 11), (1000, 12), (1000, 13), (1000, 14), (1000, 15),
	(1001, 16), (1001, 17), (1001, 18), (1001, 19), (1001, 20),
	(1010, 21), (1010, 22), (1010, 23), (1010, 24), (1010, 25);

insert into Food values
	(1, '3 burger, fries and 3 drink for Rs 1200'),
	(2, '4 burger, fries and 4 drink for Rs 1500'),
	(3, '1 burger, fries and 1 drink for Rs 500');

insert into Participants values
	('Participant1','p1@gmail.com', 2999992, 23232323, 3),
	('Participant2','p2@gmail.com', 2996792, 23233323, 3),
	('Participant3','p3@gmail.com', 2926792, 23255523, 3),
	('Participant4','p4@gmail.com', 2637492, 23453323, 3),
	('Participant5','p5@gmail.com', 2964892, 23637323, 3);

insert into RegisteredTeams values
	('Team1', 1, 5, 1);

insert into RegisteredParticipants values
	(001, 0001, 1),
	(002, 0001, 0),
	(003, 0001, 0),
	(004, 0001, 0),
	(005, 0001, 0);

-- Report Queries

--1--
Select * from Participants

--2--
select sum(SponsorPackage.amount) from SponsorPackage 
inner join Sponsor on Sponsor.PackageID = SponsorPackage.PackageID 
inner join Events on Events.EventID = Sponsor.EventID 
group by categoryID

--3--
select * from Events where categoryID=1;

--4--
select Name as Mentor_name from faculty where empID=
(select EmpID from mentors where CategoryAssigned= 
(select categoryID from eventCategory where CategoryName ='CS'));

--5--


--6--
select* from Sponsor;

--7--
select * from Participants where P_ID=1 or Name='Participant1';

--8--
select * from Participants where FtypeID= 3;

--9--
select name from events where eventDate= '5-14-2022';

--10--
Select sum(totalmembers) as Total_Participants from RegisteredTeams where EventID=1;

--11--
select events.name, events.Venue, Student_Executives.fname, Faculty.name from Events
inner join StudentHeads on Events.EventID = StudentHeads.event_ID inner join Student_Executives 
on Student_Executives.execID = StudentHeads.userID inner join Faculty on Faculty.empID = Events.FacultyID;