--finding the number of rentals per category
SELECT DISTINCT category.name,COUNT(rental.rental_id)
FROM category 
INNER JOIN film_category ON film_category.category_id = category.category_id
INNER JOIN film ON film_category.film_id = film.film_id
INNER JOIN inventory ON inventory.film_id = film.film_id
INNER JOIN rental ON rental.inventory_id = inventory.film_id
GROUP BY category.name ORDER BY COUNT(rental.rental_id);


--for academic purposes only, finding the number of rentals per category, making use of a partition
--this works the same as the above statement
WITH rental_counts AS 
(SELECT category.name,COUNT(rental.rental_id), ROW_NUMBER()
 over ( PARTITION BY category.name
 	ORDER BY category.name )
 AS RowNo
 FROM category
 INNER JOIN film_category ON film_category.category_id = category.category_id
 INNER JOIN film ON film_category.film_id = film.film_id
 INNER JOIN inventory ON inventory.film_id = film.film_id
 INNER JOIN rental ON rental.inventory_id = inventory.film_id
 GROUP BY category.name
 ORDER BY COUNT(rental_id))

SELECT * FROM rental_counts;