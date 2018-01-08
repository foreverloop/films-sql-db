--select the customers who have spent the most and their names and address
COPY(SELECT customer.first_name,customer.last_name,SUM(COALESCE(payment.amount,0)),
address.address,address.address2,city.city,address.postal_code 
FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id 
INNER JOIN payment ON rental.rental_id = payment.rental_id
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
GROUP BY customer.first_name,customer.last_name,address.address,address.address2,city.city,address.postal_code
ORDER BY SUM(COALESCE(payment.amount,0))DESC LIMIT 5)
TO 'csv/best_customers.csv' (format CSV);
