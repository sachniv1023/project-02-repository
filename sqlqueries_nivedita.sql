1/*List all movies released in english and dutch */
/*Select movie.title , language.language
from movie 
join language 
on movie.language_id = language.language_id
where language = 'Dutch' OR language='English'
order by language;*/

2/* List names of director starting with first name with A and end with w*/
/*select first_name , last_name
from director
where first_name like 'A%w'
order by last_name desc
FETCH FIRST 10 ROW ONLY;*/

3/*Show all movies released between '2021/1/5' and '2021/3/3'*/
/*select title,type,rating,netflix_release_date
from movie
WHERE netflix_release_date 
BETWEEN '2021/1/5' and '2021/3/3'
order by netflix_release_date desc;*/

4/*Which director did most movies in year '2020'.Order the result from most to least*/

/*SELECT count(movie.title) As movies_count,
concat(director.first_name,' ',director.last_name)as director_fullname ,movie.year
FROM movie
INNER JOIN movie_director
ON movie.movie_id=movie_director.movie_id
INNER JOIN director
ON movie_director.director_id=director.director_id
GROUP BY movie.year, director.first_name, director.last_name
HAVING movie.year= 2020
ORDER BY count(movie.title) desc;*/

5/* Give list of movies with duration of 120 minutes */
/*Select title,runtime
from movie 
where
runtime=120;*/

6/*Which country has the most number of titles produced?*/
/*Select count(title) As "number of movies produced" ,country
from movie 
group by country
order by count(title) desc;*/

7/*What are most popular ratings on Netflix  */
/*Select Count(title) As "popular ratings count" ,rating
from movie 
group by rating
order by Count(title) DESC ;*/

8/*Suppose we want to find the movies whose runtime is higher than the min runtime*/ 
/*Finding the min runtime*/

/*Select min(runtime)
from movie;*/


/*Using a subquery */

/*ELECT
	movie_id,
	title,
	runtime
FROM
	movie
WHERE
	runtime > (
		SELECT
			min (runtime)
		FROM
			movie
);*/

9/*Count of titles based on genre*/

/*SELECT count(m.title) As "title count based on genre",g.genre
FROM movie as m
inner join genre  as g
on g.genre_id = m.genre_id
group by g.genre
order by  count(m.title) DESC*/


10/* list all movies having maximum awards*/ 
/*SELECT movie_id, title, MAX(awards) as maximum_awards,type
FROM movie
where type = 'Series'
GROUP BY movie_id
Order by  MAX(awards) DESC;*/

11/*show language of joker movie*/
/*select movie_id,title, language
from language l
inner join movie m 
on l.language_id = m.language_id
where title = 'Joker'
Order by language DESC;*/

12/*show director name with movies name and total number of awards with genre*/
/*select g.genre, m.title,m.awards, d.first_name, d.last_name
from genre as g
join movie m
using (genre_id)
join movie_director
using(movie_id)
join director d
using(director_id)
order by d.first_name desc;*/




