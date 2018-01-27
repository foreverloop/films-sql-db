--select the films which have the largest number of known actors in them
SELECT film.title,COUNT(film_actor.film_id)
FROM film
INNER JOIN film_actor ON film_actor.film_id = film.film_id
GROUP BY film.title
ORDER BY COUNT(film_actor.film_id) DESC;