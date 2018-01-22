
COPY(SELECT DISTINCT staff.first_name, staff.last_name, COUNT(rental.rental_id) 
FROM staff 
INNER JOIN rental ON staff.staff_id = rental.staff_id 
GROUP BY staff.first_name,staff.last_name 
ORDER BY COUNT(rental.rental_id) DESC)

TO 'csv/most_rentals_by_staff.csv' (format CSV);