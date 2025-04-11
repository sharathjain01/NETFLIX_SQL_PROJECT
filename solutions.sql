--Netflix Project
create table Netflix
(	
	show_id varchar(10),
	type varchar(10),
	title varchar(150),
	director varchar(230),
	casts	varchar(1000),
	country varchar(150),
	date_added varchar(25),
	release_year int,
	rating	varchar (10),
	duration varchar(10),
	listed_in varchar(100),
	description varchar(300)
);
select * from Netflix;


-- 12 Business problems


 1.count the number of movies vs TV shows
 
select type,
count(*) as Total_content
from Netflix
group by type;

2.list all movies released in a specific year(eg 2020)

select * from Netflix
where type ='Movie'
and
release_year=2020

3.find the top 5 countries with most content on Netflix

SELECT country, COUNT(*) AS content_count
FROM (
    SELECT TRIM(unnest(string_to_array(country, ','))) AS country
    FROM Netflix
    WHERE country IS NOT NULL
) AS country_list
GROUP BY country
ORDER BY content_count DESC
LIMIT 5;




4.Identify the longest movie

SELECT title, duration
FROM Netflix
WHERE type = 'Movie'
  AND duration LIKE '%min%'
ORDER BY 
  CAST(SUBSTRING(duration FROM 1 FOR POSITION(' ' IN duration) - 1) AS INTEGER) DESC
LIMIT 1;


5.find the content added in last 5 years 

SELECT *
FROM Netflix
WHERE 
  date_added ~ '^[A-Za-z]{3} [0-9]{1,2}, [0-9]{4}$' -- checks for format like "Sep 9, 2021"
  AND TO_DATE(date_added, 'Mon DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'; 

6.find all the movies/tv directed by "Rajiv chilaka"

select *
from Netflix
where director= 'Rajiv Chilaka'


7.List all TV shows that having more than 5 seasons

SELECT * 
FROM netflix
WHERE type = 'TV Show'
  AND duration LIKE '%Season%'
  AND CAST(SUBSTRING(duration FROM 1 FOR POSITION(' ' IN duration) - 1) AS INTEGER) > 5;


8.Count the number of content produced in each genre

SELECT genre, COUNT(*) AS content_count
FROM (
    SELECT TRIM(unnest(string_to_array(listed_in, ','))) AS genre
    FROM Netflix
    WHERE listed_in IS NOT NULL
) AS genre_list
GROUP BY genre
ORDER BY content_count DESC;


9.List all the movies that are documentaries


select * from Netflix
where type='Movie'
and listed_in ilike'%Documentaries%'

10.find all content without director

select * from Netflix
where director is null


11.Find how many movies actor 'Salman Khan'apperared in last 10 years


select * from Netflix
where
	casts ilike '%Salman Khan%'
	and 
	release_year >= extract(year from current_date)-10

12.find the top 10 actors who have appered in the highest number of movies produced in india

WITH indian_movies AS (
    SELECT *
    FROM Netflix
    WHERE type = 'Movie'
      AND country ILIKE '%India%'
      AND casts IS NOT NULL
),
exploded_casts AS (
    SELECT 
        TRIM(actor_name) AS actor
    FROM indian_movies,
         unnest(string_to_array(casts, ',')) AS actor_name
)
SELECT 
    actor,
    COUNT(*) AS movie_count
FROM exploded_casts
GROUP BY actor
ORDER BY movie_count DESC
LIMIT 10;

13.Categorize the content based on presence of the keyword 'kill 'and 'violence'in the description field.
label content counting these keywords as 'bad'and all other content as 'good'.

select
*,
	case
	when 
		description ilike '%kill%' or
		description ilike '%violence%'	then 'Bad Content'
		else
	'Good Content'
	end category
	from 
	Netflix

14.find the films which was released in 2020;

select * from Netflix
where type ='Movie'
and release_year='2020'	

