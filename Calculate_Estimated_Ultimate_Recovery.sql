--EUR stands for Estimated ultimate recovery (EUR) is a production term commonly used in the oil and gas industry
--Estimated ultimate recovery is an approximation of the quantity of oil or gas that is potentially recoverable or has already been recovered from a well.


--Calculate EUR LOW, BEST, HIGH
--This is used to calculate when there is no value of EUR provided

SELECT 
    YEAR(CONVERT(DATE, reported_date, 111)) AS Reported_Year,
    country,
    fluid_name,
	eur_low,
	eur_best,
	eur_high,
    SUM(
        CASE 
            WHEN fluid_name IN ('oil', 'condensate', 'oil & condensate') THEN
                CASE 
                    WHEN eur_low = 0 THEN cumulative_production + reserves_sales_1P + contingent_1C + nsf_1p + nsf_1c
                    WHEN eur_low <> 0 THEN eur_low
                    ELSE 0  
                END
            WHEN fluid_name = 'gas' THEN --fluid gas needs a conversion to oil equivalent
                CASE
                    WHEN eur_low = 0 THEN (cumulative_production + reserves_sales_1P + contingent_1C + nsf_1p + nsf_1c) * 0.1726
                    WHEN eur_low <> 0 THEN eur_low * 0.1726
                    ELSE 0  
                END
			ELSE 0  
        END
    ) AS Update_eur_low,
	SUM(
        CASE 
            WHEN fluid_name IN ('oil', 'condensate', 'oil & condensate') THEN
                CASE 
                    WHEN eur_best = 0 THEN cumulative_production + reserves_sales_1P + contingent_1C + nsf_1p + nsf_1c
                    WHEN eur_best <> 0 THEN eur_low
                    ELSE 0  
                END
            WHEN fluid_name = 'gas' THEN --fluid gas needs a conversion to oil equivalent
                CASE
                    WHEN eur_best = 0 THEN (cumulative_production + reserves_sales_1P + contingent_1C + nsf_1p + nsf_1c) * 0.1726
                    WHEN eur_best <> 0 THEN eur_low * 0.1726
                    ELSE 0  
                END
            ELSE 0 
        END
    ) AS Update_eur_best,
	SUM(
        CASE 
            WHEN fluid_name IN ('oil', 'condensate', 'oil & condensate') THEN
                CASE 
                    WHEN eur_high = 0 THEN cumulative_production + reserves_sales_1P + contingent_1C + nsf_1p + nsf_1c
                    WHEN eur_high <> 0 THEN eur_low
                    ELSE 0  
                END
            WHEN fluid_name = 'gas' THEN --fluid gas needs a conversion to oil equivalent
                CASE
                    WHEN eur_high = 0 THEN (cumulative_production + reserves_sales_1P + contingent_1C + nsf_1p + nsf_1c) * 0.1726
                    WHEN eur_high <> 0 THEN eur_low * 0.1726
                    ELSE 0  
                END
            ELSE 0  
        END
    ) AS Update_eur_high

FROM 
    resource_data

GROUP BY 
    YEAR(CONVERT(DATE, reported_date, 111)),
    country,
    fluid_name,
	eur_low,
	eur_best,
	eur_high

