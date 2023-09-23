-- Stock Data Exploration --  

/*Daily Return*/
Select Instrument, Date, Price_Close, Price_Open, 
Round(((Price_Close - Price_Open)/Price_Open)*100, 2) as Daily_Return 
From [Project Portfolio]..stock_data
Where Instrument LIKE '%CBKG.DE%'
order by 1,2

/*Price Change*/
Select Instrument, Date, Price_Close, Price_Open, 
round(Price_Close - Price_Open, 3)AS PriceChange
From [Project Portfolio]..stock_data
Where Price_Close is not null 
And Price_Open is not null;

/* Average Daily Volume */
Select Instrument, Date,
AVG(Volume) AS Average_Daily_Volume
From [Project Portfolio]..stock_data
Where date >= '2023-01-01' And date <= '2023-01-03'
And Volume is not null
Group by Instrument, Date 
Order by Average_Daily_Volume desc;


/* Daily Return of total stock information */
SELECT 
    dea.Instrument,
    dea.Date,
    vac.TRBC_Industry_Name,
    vac.TRBC_Economic_Sector_Code,
	dea.Price_High,
	dea.Price_Open,
	AVG(dea.Volume) AS Average_Volume
FROM [Project Portfolio]..stock_data AS dea
JOIN [Project Portfolio]..Stock_sector_information AS vac
ON dea.Instrument = vac.Instrument
WHERE date >= '2023-01-05' And date <= '2023-01-10'
AND dea.Volume is not null
GROUP BY 
    dea.Instrument, dea.Date, vac.TRBC_Industry_Name, vac.TRBC_Economic_Sector_Code, dea.Price_High, dea.Price_Open
ORDER BY 
    dea.Date, vac.TRBC_Industry_Name, Average_Volume DESC;



