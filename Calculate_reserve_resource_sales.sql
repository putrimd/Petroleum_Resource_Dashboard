--NOTES: reserve_sales_1P = Reserve Resource Low ;
--		Reserve Resource Low consists of:
--		reserves_sales_1PD = Developed Reserve Resource Low AND
--		reserves_sales_2PU = Undeveloped Reserve Resource Low ; 

--		reserves_sales_2P =  Reserve Resource Best ;
--		Reserves Resource Best consists of:
--		reserves_sales_2PD = Developed Reserve Resource Best AND
--		reserves_sales_2PU = Undeveloped Reserve Resource Best ;

--		reserves_sales_3P =  Reserve Resource High ;
--		Reserves Resource High consists of:
--		reserves_sales_3PD = Developed Reserve Resource High AND
--		reserves_sales_3PU = Undeveloped Reserve Resource High ;


 --Calculate Production Reserve Resource LOW / 1P

	SELECT 
    YEAR(CONVERT(DATE, reported_date, 111)) AS Reported_Year,
    country,
    fluid_name,
    SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN reserves_sales_1P  -- Oil and Condensate reserves are equal to oil equivalent (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN reserves_sales_1P * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE reserves_sales_1P --some case have fluid_name Oil&condensate
        END) AS Total_Reserve_Sales_Low,
	SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN reserves_sales_1PD  -- Oil and Condensate reserves are equal to oil equivalent (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN reserves_sales_1PD * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE reserves_sales_1PD --some case have fluid_name Oil&condensate
        END) AS Total_Developed_Reserve_Sales_Low,
	SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN reserves_sales_1PU  -- Oil and Condensate reserves are equal to oil equivalent (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN reserves_sales_1PU * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE reserves_sales_1PU --some case have fluid_name Oil&condensate
        END) AS Total_Undeveloped_Reserve_Sales_Low
FROM 
    resource_data
GROUP BY 
    YEAR(CONVERT(DATE, reported_date, 111)),
    country,
    fluid_name;


--Calculate Production Reserve Resource BEST / 2P
	SELECT 
    YEAR(CONVERT(DATE, reported_date, 111)) AS Reported_Year,
    country,
    fluid_name,
    SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN reserves_sales_2P  -- Oil and Condensate reserves are equal to oil equivalent (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN reserves_sales_2P * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE reserves_sales_2P --some case have fluid_name Oil&condensate
        END) AS Total_Reserve_Sales_Best,
	SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN reserves_sales_2PD  -- Oil and Condensate reserves are equal to oil equivalent (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN reserves_sales_2PD * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE reserves_sales_2PD --some case have fluid_name Oil&condensate
        END) AS Total_Developed_Reserve_Sales_Best,
	SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN reserves_sales_2PU  -- Oil and Condensate reserves are equal to oil equivalent (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN reserves_sales_2PU * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE reserves_sales_2PU --some case have fluid_name Oil&condensate
        END) AS Total_Undeveloped_Reserve_Sales_Best
FROM 
    resource_data
GROUP BY 
    YEAR(CONVERT(DATE, reported_date, 111)),
    country,
    fluid_name;


--Calculate Production Reserve Resource HIGH / 3P
	SELECT 
    YEAR(CONVERT(DATE, reported_date, 111)) AS Reported_Year,
    country,
    fluid_name,
    SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN reserves_sales_3P  -- Oil and Condensate reserves are equal to oil equivalent (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN reserves_sales_3P * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE reserves_sales_3P --some case have fluid_name Oil&condensate
        END) AS Total_Reserve_Sales_High,
	SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN reserves_sales_3PD  -- Oil and Condensate reserves are equal to oil equivalent (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN reserves_sales_3PD * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE reserves_sales_3PD --some case have fluid_name Oil&condensate
        END) AS Total_Developed_Reserve_Sales_High,
	SUM(CASE 
            WHEN fluid_name IN ('oil', 'condensate') THEN reserves_sales_3PU  -- Oil and Condensate reserves are equal to oil equivalent (MSTB = MMBOE)
            WHEN fluid_name = 'gas' THEN reserves_sales_3PU * 0.1726  -- Gas reserves are converted to oil equivalent (from BSCF to MMBOE)
            ELSE reserves_sales_3PU --some case have fluid_name Oil&condensate
        END) AS Total_Undeveloped_Reserve_Sales_High
FROM 
    resource_data
GROUP BY 
    YEAR(CONVERT(DATE, reported_date, 111)),
    country,
    fluid_name;