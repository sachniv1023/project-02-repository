1/*List all movies released in english and dutch */

/*#In my select statement  I have selected  movie.title and language.language  
#from movie table and then further joined it to language table using joins. Inner join are 
#basically used to get records which are common in both tables  and then I have used the IN operator 
#to specify multiple language values in where clause.*/

/*Select movie.title , language.language
from movie 
join language 
on movie.language_id = language.language_id
where language = 'Dutch' OR language='English'
order by language;*/


2/*Show all movies released between '2021/1/5' and '2021/3/3'*/

/*For finding release date of all  movies  between a given date range I have used Between in the where clause. 
The BETWEEN operator selects values within a given range.*/

/*select title,type,rating,netflix_release_date
from movie
WHERE netflix_release_date 
BETWEEN '2021/1/5' and '2021/3/3'
order by netflix_release_date desc;*/

3/*List of directors who have directed movies where genre = "Action and country = Japan

/*In this query we have joined movie to movie_director on movie_id , movie_director to director on director_id and 
movie to genre on genre_id  in order to get records from these tables and then used a where clause to get list of
Action movies in Japan.*/

/*SELECT first_name,last_name,genre,title,country from movie
join movie_director
on movie.movie_id = movie_director.movie_id
join director
on director.director_id = movie_director.director_id 
join genre
on genre.genre_id = movie.genre_id
where genre='Action' AND country='Japan'
order by genre;*/

/*view Query*/
/* Here WE have created a view for the above query:
Suppose we want to get information like  director names,genre,title and country we would normally 
be using a join statement.
This query  sometimes gets complex. SO for this we can create views and whenever we want to see this data, 
we can  just query it from the view by executing the simple SELECT statement

In general 
A view can be very useful in some cases such as:
A view helps simplify the complexity of a query because you can query a view, which is based on a complex query, 
using a simple SELECT statement.
Like a table, you can grant permission to users through a view that contains specific
data that the users are authorized to see./*

/*CREATE view movies_of_action_genre As 
SELECT first_name,last_name,genre,title,country from movie
join movie_director
on movie.movie_id = movie_director.movie_id
join director
on director.director_id = movie_director.director_id 
join genre
on genre.genre_id = movie.genre_id
where genre='Action' AND country='Japan'
order by genre;*/


4/* Give list of movies with duration of 120 minutes */

/*we have just selected title and runtime from movie table and then further used the where clause  
to get movies/series which have a runtime of 120 minutes.*/

/*Select title,runtime
from movie 
where
runtime=120;*/

5/*Which country has the most number of titles produced?*/

/*For this I  have just selected title and country  from movie table and then further grouped 
the results by country .For sorting we have used order by.
Also,I have given title an alias name*/

/*Select count(title) As "number of movies produced" ,country
from movie 
group by country
order by count(title) desc;*/

6/*What are most popular ratings on Netflix */

/*For getting the movies with most popular rating we have selected count(title) and rating from movie table
*/and then grouped by rating.

/*Select Count(title) As "popular ratings count" ,rating
from movie 
group by rating
order by Count(title) DESC ;*/


7/*Suppose we want to find the movies whose runtime is higher than the average runtime*/ 

#First we are finding avg runtime

Select avg(runtime)
from movie;

/*Suppose we want to find the movies whose runtime is higher than the average runtime*/

/*SELECT
	movie_id,
	title,
	runtime
FROM
	movie
WHERE
	runtime > (
		SELECT
			avg (runtime)
		FROM
			movie
);*/


8/*Count of titles based on genre*/

/*movie -->genre  tables are used to answer this query.
In order to fetch records from the above tables we have joined them on genre_id which is the common 
for both tables  and then further grouped by genre.
In order to make the code more readable I have given an alias name for movie ,movie title,genre*/

/*SELECT count(m.title) As "title count based on genre",g.genre
FROM movie as m
inner join genre  as g
on g.genre_id = m.genre_id
group by g.genre
order by  count(m.title) DESC;*/


9/*List of directors who have directed spanish movies*/
/*In this query we have joined movie to movie_director on movie_id , movie_director to director on director_id and 
movie to language on language_id  in order to get records from these tables and then used a where clause to get list of
Spanish movies*/

/*SELECT director.first_name,director.last_name,title,type,language from movie
join movie_director
on movie.movie_id = movie_director.movie_id
join director
on director.director_id = movie_director.director_id 
join language
on language.language_id = movie.language_id
where language='Spanish' and type = 'Movie';*/


10/*show language of joker movie*/

/*For this I have used  movie -->language  tables 
I have joined the two tables on language_id which is common in both tables. language_id acts as  
the pk for language table and fk for the movie table 
In the where clause I have used  title = joker in order to get the language for it.*/


/*select movie_id,title, language
from language l
inner join movie m 
on l.language_id = m.language_id
where title = 'Joker'
Order by language DESC;*/
