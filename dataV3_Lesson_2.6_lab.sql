

-- In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. 
-- So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

select last_name, count(last_name) as ocurrences from actor
group by last_name
having ocurrences=1
order by last_name;

-- Which last names appear more than once? 
-- We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

select last_name, count(last_name) as ocurrences from actor
group by last_name
having ocurrences>1
order by ocurrences desc;

-- Using the film table, find out how many films were released each year.

select release_year as Year , count(*) as Films from film
group by release_year
order by Year;

-- Using the film table, find out for each rating how many films were there.

select rating, count(*) as Films from film
group by rating
order by Films desc ;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal 

select Rating, round(avg(length),2) as 'Mean Length' from film
group by rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?

select  Rating, round(avg(length),2) as Mean_Length from film
group by rating
having avg(length)>120;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

select title, length ,row_number() over (order by length) from film
where length>0;