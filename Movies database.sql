Create database Movie_database;
use Movie_database;

create table Movies(
Movie_id int primary key auto_increment,
Movie_Name varchar(50),
Collection DECIMAL(15, 2),
Release_date DATE NOT NULL
);

desc Movies;

drop table Movies;

insert into Movies(Movie_Name,Collection,Release_date) values('Kabali','2500000000','2017-12-12'),
('veeram','15000000000','2019-02-23'),
('theri','10000000000','2021-07-29'),
('amaran','2500000000','2024-09-25'),
('Pushpa','1782200000','2024-12-13');

Select* from Movies;

Create table Actors(
actor_id int ,
actor_name varchar(50),
Address varchar(25),
Salary DECIMAL(15, 2),
Movie_id int,
foreign key(Movie_id)
references Movies(Movie_id)

);
desc Actors;
drop table Actors;

insert into Actors(actor_id,actor_name,Address,Salary,Movie_id) values(101,'Rajini','karanaka','10000000000',1),
(102,'Ajith','chennai','50000000',2),
(103,'vijay','chennai','60000000',3),
(104,'siva karthikeyan','thiruchy','258000000',4),
(105,'allu arjun','Andra Pradesh','150000000000',5);
Select * from Actors;

--- join on actor name using  movie_id----

select m.Movie_id,m.Movie_Name,a.actor_name from Movies m
join Actors a 
on m.movie_id=a.movie_id;

create table Director(
dr_id int Not Null,
dr_name varchar(20),
phone varchar(10),
actor_id int
);
desc Director;

drop table Director;

insert into Director(dr_id,dr_name,phone,actor_id) values(201,'Pa.ranjith','9365144525',101),
(202,'siva','9632587410',102),
(203,'Atlee','9638521470',103 ),
(204,'RajKUmar','9635824471',104),
(205,'Sukumar','9233114750',105);

select *from Director;

------inner join Two table in actors and Directors-----------

select a.actor_id ,a.actor_name,d.dr_name ,d.phone from Actors a
inner join Director d
on a.actor_id = d.actor_id;

Create table User(
user_id int primary key auto_increment,
user_name varchar(30)
);
desc User;

insert into User(user_name) values('A'),('b'),('c'),('d'),('e');
select * from User;
 
 create table review(
 r_id int primary key,
 user_id int,
 movie_id int,
 comments varchar(200)
 );
 desc review;

 insert into review(r_id,user_id,movie_id ,comments) values(501,1,1,'Super Hits'),
 (502,2,2,'flop'),(503,3,3,'hit'),(504,4,4,'super'),(505,5,5,'Hits');
 
Create table Generes(
g_id int,
g_Name varchar(30),
movie_id int
);
desc Generes;

insert into Generes(g_id,g_Name,movie_id) values('701','action',1),
('702','sci-fic',2),
('703','comdey',3),
('704','action & love',4),
('705','Family and action',5);
select * from Generes;

------all Execution of Table-------

select * from movies;
select * from actors;
select * from director;
select * from review;
select * from generes;

-------Sub Query-------

select actor_name, Address,salary from actors where salary >(select Avg(salary) from actors);

-----Stored Procedure--------
DELIMITER &&  
CREATE PROCEDURE get_actors()  
BEGIN  
    SELECT * FROM actors;
END&&  
DELIMITER ; 

------calling Function name of Stored Produre----------
call get_actors();  

-------------Multiple inner Join----------
select m.Movie_id,m.Movie_Name ,a.actor_name as actor ,d.dr_name as director ,d.phone,g.g_Name as generes,r.Comments from  Movies m
inner join Actors a on m.movie_id = a.movie_id
inner join Director d on a.actor_id = d.actor_id
inner join review r on m.movie_id =r.Movie_id
inner join generes g on m.movie_id=g.movie_id;

--------------view----------
create view movie_details
as
Select Movie_Name,Collection from Movies;

Select * from Movie_details;





