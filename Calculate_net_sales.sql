-- There are Net Sales values in column net_sales_last_year and Production Sales values in column production_last_year
-- There is issue when Net Sales value is 0 , so we need to update Net Sales value where is 0 and considered the same as Production Sales value.

UPDATE resource_data
SET net_sales_last_year = CASE
			WHEN net_sales_last_year = 0 THEN production_last_year
			ELSE net_sales_last_year

			END;

-- Calculate Total Net Sales grouped by Year, Country and Fluid Name

SELECT 
    country,
    fluid_name,
    YEAR(CONVERT(DATE, reported_date, 111)) AS reported_year,
    SUM(net_sales_last_year) AS total_net_sales
FROM 
    resource_data
GROUP BY 
    country,
    fluid_name,
    YEAR(CONVERT(DATE, reported_date, 111));
