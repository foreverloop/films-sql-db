--select actors from films and list the film title and length
SELECT actor.first_name,actor.last_name,film.title,film.length 
FROM actor 
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id 
INNER JOIN film ON film_actor.film_id = film.film_id LIMIT 50;