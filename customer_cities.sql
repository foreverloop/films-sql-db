--select the country, city and count of the 10 most popular cities
SELECT DISTINCT country.country,city.city,COUNT(address.city_id)
FROM address
LEFT JOIN city on address.city_id = city.city_id
LEFT JOIN country on city.country_id = country.country_id
GROUP BY city.city, country.country
ORDER BY COUNT(address.city_id) DESC LIMIT 10;