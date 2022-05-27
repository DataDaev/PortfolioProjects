-- Sum of total volume by region

Select region, SUM(TotalVolume) AS TotalVol
FROM PortfolioProject..['avocado cleaned$']
WHERE region IN ('West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'Greatlakes', 'Midsouth', 'Plains')
Group By region
Order BY TotalVol DESC;

-- Sum of total volume by city excluding regions

Select TOP 10 region, SUM(TotalVolume) AS TotalVol
FROM PortfolioProject..['avocado cleaned$']
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'Greatlakes', 'Midsouth', 'Plains')
Group By region
Order BY TotalVol DESC;

-- Sum of total volume and each variety of avocados by year excluding specific regions

Select 
	year, 
	SUM(TotalVolume) AS TotalVol, 
	SUM(plu4046) AS PluSmall, 
	SUM(plu4225) AS PluLarge, 
	SUM(plu4770) AS PluExtraLarge
FROM PortfolioProject..['avocado cleaned$']
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'Greatlakes', 'Midsouth', 'Plains')
GROUP BY year
ORDER BY year;


-- Average Price of avocados by year excluding specific regions

Select year, AVG(AveragePrice) AS AvgPrice
FROM PortfolioProject..['avocado cleaned$']
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'Greatlakes', 'Midsouth', 'Plains')
GROUP BY year
ORDER BY year;

-- Average Price of avocados for year 2018 excluding specific regions

Select year, AVG(AveragePrice) AS AvgPrice
FROM PortfolioProject..['avocado cleaned$']
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 
'Northeast', 'Southeast', 'Greatlakes', 'Midsouth', 'Plains')
	AND year = '2018'
GROUP BY year
ORDER BY year;

-- Average Total Volume by year excluding specific regions

Select year, AVG(TotalVolume) AS AvgTotalVol
FROM PortfolioProject..['avocado cleaned$']
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'Greatlakes', 'Midsouth', 'Plains')
GROUP BY year
ORDER BY year;

-- *EXTRA* Max volume of PLU4046 in Los Angeles in year 2020

Select region, year, MAX(plu4046) AS MaxAvoSmall
FROM PortfolioProject..['avocado cleaned$']
WHERE region = 'LosAngeles'
AND year = '2020'
GROUP BY region, year;