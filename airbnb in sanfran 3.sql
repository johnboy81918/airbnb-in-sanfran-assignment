WITH
	average_listing as (
	SELECT
		listing_id,
		avg(to_number(price,'L9G999g999.99')) as average_price
	FROM sfo_calendar
	GROUP BY 1)
SELECT
	to_char(c.calender_date, 'YYYYMM'),
	COUNT(*) as listing_count
FROM
	sfo_calendar c
JOIN average_listing a
ON a.listing_id = c.listing_id
WHERE to_number(c.price, 'L9G999g999.99') > a.average_price
GROUP BY 1
ORDER BY listing_count DESC