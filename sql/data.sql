-- Include table data insertion, updation, deletion and select scripts


-- -----------------------------------------------------
-- Admin Movie List
-- -----------------------------------------------------
insert into movie
values
(1,'Avatar',2787965087,'Yes','2017-03-15','Science Fiction','Yes'),
(2,'The Avengers',1518812988,'Yes','2017-12-23','Superhero','No'),
(3,'Titanic',2187463944,'Yes','2018-08-21','Romance','No'),
(4,'Jurassic World',1671713208,'No','2017-07-02','Science Fiction','Yes'),
(5,'Avengers End Game',2750760348,'Yes','2022-11-02','Superhero','Yes');


select * from movie;

-- -----------------------------------------------------
-- Update Movie List
-- -----------------------------------------------------

update movie
set mov_title='Iron Man',
mov_box_office=150989777,mov_genre='Superhero'
where mov_id=1;

-- -----------------------------------------------------
-- Customer Movie List
-- -----------------------------------------------------


select mov_title,mov_box_office,mov_genre,mov_has_teaser
from movie
where mov_active='Yes' and 
mov_date_of_launch <= current_date();


-- -----------------------------------------------------
-- Adding User
-- -----------------------------------------------------

insert into user 
values(1,'anil123'),
(2,'user007'),(3,'vibu');

select * from user;
select * from favorite;

-- -----------------------------------------------------
-- Favorites
-- -----------------------------------------------------

insert into favorite (fav_us_id,fav_mov_id) 
values(2,1),(2,2),(2,5),(2,1),(1,1),(1,4);



select mov_title,mov_box_office,mov_genre 
from movie
inner join favorite on fav_mov_id=mov_id
where fav_us_id=2; 

-- -----------------------------------------------------
-- Delete Favorite
-- -----------------------------------------------------


delete from favorite 
where fav_us_id=2 and fav_mov_id=1 limit 1; 

-- -----------------------------------------------------
-- No of Favorites
-- -----------------------------------------------------
select count(mov_title) as No_of_favorites from movie
inner join favorite on fav_mov_id=mov_id
where fav_us_id=2; 

