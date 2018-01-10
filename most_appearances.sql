--select the 10 actors who have the most film appearances
SELECT actor.first_name,actor.last_name,COUNT(film.film_id) 
FROM actor 
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id 
INNER JOIN film ON film_actor.film_id = film.film_id 
GROUP BY actor.first_name, actor.last_name 
ORDER BY COUNT(film.film_id) DESC LIMIT 10;