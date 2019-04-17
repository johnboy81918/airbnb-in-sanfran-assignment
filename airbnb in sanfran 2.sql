SELECT
	neighbourhood,
	COUNT(CASE WHEN availability_365 = '0' THEN 1 END) fully_booked
FROM
	sfo_listings
GROUP BY neighbourhood
ORDER BY fully_booked DESC