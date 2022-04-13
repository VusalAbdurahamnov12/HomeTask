create database cinema;
use cinema;


create table hall(
Id int identity (1,1) primary key ,
Name nvarchar(50) not null,
SeatCount int check (SeatCount<250)
)

insert into hall(Name,SeatCount)
values('Otaq1',100),('Otaq2',50),('Otaq3',90),('Otaq4',30)



create table actors(
Id int identity (1,1) primary key ,
Name nvarchar(150) not null,
Surname nvarchar(150) default 'xxx',
Age int check (age<166and age>0)
)

insert into actors(Name,Surname,Age)
values('James','Bond',40),('Lewis ','Delaney ',15),('Warren ','Oates ',30)


create table session(
Id int identity (1,1) primary key ,
[Time] time not null
)
insert into session(Time)
values('20:00:00'),('15:45:00'),('10:00:00')


create table genres(
Id int identity (1,1) primary key ,
Name nvarchar(50) not null
)

insert into genres([Name])
values('Horror'),('Action'),('Adventure')



create table films(
Id int identity (1,1) primary key ,
Name nvarchar(50) not null,
Releasedate date not null
)
insert into films([Name],Releasedate)
values('Evdetek','2009-09-09'),('MrRobot','2015-12-19'),('Who am I','2018-08-09')


create table FilmGenres(
id int identity (1,1) primary key ,
FilmId int references films(Id) not null,
GenresId int references genres(Id) not null
)

insert into FilmGenres(FilmId,GenresId)
values('Evdetek','2009-09-09'),('MrRobot','2015-12-19'),('Who am I','2018-08-09')



create table Filmactors(
id int identity (1,1) primary key ,
FilmId int references films(Id) not null,
ActorID int references genres(Id) not null
)

create table tickets(
Id int identity (1,1) primary key ,
SoldDate date DEFAULT getdate(),
Price decimal,
Place int check (100>Place),
CustomersId int references Customers(Id) not null,
HallId int references hall(Id) not null,
FilmId int references films(Id) not null,
SessonId int references session(Id) not null
)

create table Customers(
Id int identity (1,1) primary key ,
[Name] nvarchar(150) not null,
Surname nvarchar(150) not null,
Age int check (age<166 and age>0) not null
)

select *from hall
select *from actors