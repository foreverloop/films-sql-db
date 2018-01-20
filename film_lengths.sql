--select the first 10 films that are over 120 minutes in length
SELECT film.title,film.length,category.name 
FROM film 
INNER JOIN film_category ON film_category.film_id = film.film_id 
INNER JOIN category ON film_category.category_id = category.category_id 
WHERE film.length > 120
ORDER BY film.length DESC LIMIT 10;

--select the top 20 films in each category for length
COPY(WITH top_twenty AS (
    SELECT film.title,film.length, category.name,ROW_NUMBER()
    over (
        PARTITION BY category.name 
        order by film.length
    ) AS RowNo 
    FROM category 
    INNER JOIN film_category ON film_category.category_id = category.category_id
    INNER JOIN film ON film.film_id = film_category.film_id
    WHERE film.length > 120
    ORDER BY category.name DESC,film.length ASC
)

SELECT * FROM top_twenty WHERE RowNo <= 20)
TO 'csv/long_films.csv' (format CSV);

