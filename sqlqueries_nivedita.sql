/*List all movies released in english and dutch */
/*Select movie.title , language.language
from movie 
inner join language 
on movie.language_id = language.language_id
where language = 'Dutch' OR language='English'
order by language;*/

/* List names of director starting with first name with A and end with w*/
/*select first_name , last_name
from director
where first_name like 'A%w'
order by last_name desc
FETCH FIRST 10 ROW ONLY;*/

/*Show all movies released between '2021/1/5' and '2021/3/3'*/
/*select title,type,rating,netflix_release_date
from movie
WHERE netflix_release_date 
BETWEEN '2021/1/5' and '2021/3/3'
order by netflix_release_date desc;*/

/*Which director did most movies in year '2020'.Order the result from most to least*/

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

/* Give list of movies with duration of 120 minutes */
/*Select title,runtime
from movie 
where
runtime=120;*/

/*Which country has the most number of titles produced?*/
/*Select count(title) As "number of movies produced" ,country
from movie 
group by country
order by count(title) desc;*/

/*What are most popular ratings on Netflix  */
/*Select Count(title) As "popular ratings count" ,rating
from movie 
group by rating
order by Count(title) DESC ;

/*Suppose we want to find the movies whose runtime is higher than the min runtime*/ 
/*Finding the min runtime*/

Select min(runtime)
from movie;


/*Using a subquery */

SELECT
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

/*Count of titles based on genre*/

/*SELECT count(m.title) As "title count based on genre",g.genre
FROM movie as m
inner join genre  as g
on g.genre_id = m.genre_id
group by g.genre
order by  count(m.title) DESC*/

/*which individual has highest number of tv shows*/
