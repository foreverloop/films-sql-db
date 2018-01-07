--finding the most common category of film, most common actors 
--and most common cities customers Live in

COPY(SELECT COUNT(film.film_id),category.name FROM film 
	INNER JOIN film_category ON film.film_id = film_category.film_id 
	INNER JOIN category ON film_category.category_id = category.category_id 
	GROUP BY category.name 
	ORDER BY COUNT(film.film_id) DESC) 
TO 'film_category_by_count.csv' (format CSV);

COPY(SELECT COUNT(film.film_id),actor.first_name,actor.last_name FROM actor 
	INNER JOIN film_actor ON film_actor.actor_id = actor.actor_id 
	INNER JOIN film ON film.film_id = film_actor.film_id 
	GROUP BY actor.first_name,actor.last_name 
	ORDER BY COUNT(film.film_id) DESC) 
TO 'most_common_actors.csv' (format CSV);

COPY(SELECT city.city,COUNT(address.address_id) FROM customer 
	INNER JOIN address ON customer.address_id = address.address_id 
	INNER JOIN city ON address.city_id = city.city_id 
	GROUP BY city.city 
	ORDER BY COUNT(address.address_id) DESC LIMIT 5)
TO 'most_common_cities.csv' (format CSV);

--select a count of each of the different types of film
COPY(SELECT COUNT(film.title),category.name 
FROM category 
LEFT JOIN film_category ON film_category.category_id = category.category_id 
LEFT JOIN film ON film.film_id = film_category.film_id 
GROUP BY category.name ORDER BY COUNT(film.title) ASC)
TO 'category_counts.csv' (format CSV);

--find the most profitable film type (also include how many of each type of film)
COPY(SELECT category.name, COALESCE(SUM(payment.amount),0) category_value,COUNT(film.title)
FROM payment 
INNER JOIN rental ON rental.rental_id = payment.rental_id 
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id 
INNER JOIN film_category ON film_category.film_id = inventory.film_id 
INNER JOIN category ON film_category.category_id = category.category_id 
GROUP BY category.name ORDER BY COALESCE(SUM(payment.amount),0) DESC,COUNT(film.title) ASC)
TO 'most_profitable.csv' (format CSV);