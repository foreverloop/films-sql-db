--find addresses that have no customers associated and list them first
--it is likeley these are 'staff' addresses, but could be here for
--training purposes?
SELECT customer.first_name,customer.last_name,address.address 
FROM customer 
RIGHT JOIN address 
ON address.address_id = customer.address_id 
ORDER BY customer.first_name DESC;