--first attempt, has a join on rental which isn't actually required...
SELECT customer.first_name, customer.last_name,address.address,city.city,country.country,SUM(payment.amount)
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY country.country,city.city,customer.first_name,customer.last_name,address.address
HAVING SUM(payment.amount) > 150
ORDER BY SUM(payment.amount) DESC LIMIT 20;

--second attempt, directly link to payment from customer_id
SELECT customer.first_name, customer.last_name, address.address, city.city, country.country, SUM(payment.amount)
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY country.country,city.city,customer.first_name,customer.last_name,address.address
HAVING SUM(payment.amount) > 150
ORDER BY SUM(payment.amount) DESC LIMIT 20;
