--NOTES: Contingent_1C = Contingent Resource Low,
--		Contingent _2C = Contingent Resource Best,
--		Contingent_3C = Contingent Resource High


--Calculate Production Contingent Resource Sales LOW, BEST, HIGH (1C, 2C, 3C)

SELECT 
    YEAR(CONVERT(DATE, reported_date, 111)) AS Reported_Year,
    country,
    fluid_name,
    SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN contingent_1C  -- for oil and condensate keep as it is (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN contingent_1C * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE contingent_1C --some case have fluid_name Oil&condensate
        END) AS Total_Contingent_Sales_Low,
		SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN contingent_2C  -- for oil and condensate keep as it is (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN contingent_2C * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE contingent_2C --some case have fluid_name Oil&condensate
        END) AS Total_Contingent_Sales_Best,
		SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN contingent_3C  -- for oil and condensate keep as it is (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN contingent_3C * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE contingent_3C --some case have fluid_name Oil&condensate
        END) AS Total_Contingent_Sales_High

FROM 
    resource_data

GROUP BY 
    YEAR(CONVERT(DATE, reported_date, 111)),
    country,
    fluid_name;