--returns a list of the number of rentals per country
SELECT DISTINCT country.country,COUNT(rental.rental_id)
FROM country
INNER JOIN city ON city.country_id = country.country_id
INNER JOIN address ON address.city_id = city.city_id
INNER JOIN customer ON customer.address_id = address.address_id
INNER JOIN rental ON rental.customer_id = customer.customer_id
GROUP BY country.country
ORDER BY COUNT(rental.rental_id) DESC;