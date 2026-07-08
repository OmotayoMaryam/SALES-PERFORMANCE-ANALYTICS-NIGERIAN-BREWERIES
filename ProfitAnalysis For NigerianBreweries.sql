--PROFIT ANALYSIS--
--Total Profit--
select * from Nigerian_Breweries;
select sum(cast( quantity as bigint) * cast(unit_price as decimal (18,2))) as TotalProfit
from Nigerian_Breweries;

--PROFIT FOR THE LAST THREE YEARS--
select YEARS,TERRITORIES,sum(profit) as Total_Profit from Nigerian_Breweries
group by YEARS,TERRITORIES
order by Total_Profit,YEARS;

--COMPARE THE TWO TERRITORRIES--
select TERRITORIES,sum(profit) as Total_Profit from Nigerian_Breweries
group by TERRITORIES
order by Total_Profit DESC;

--COUNTRIES THAT GENERATED MORE REVENUE IN 2019--
Select countries,sum(profit) as Total_Profit
from Nigerian_Breweries
where YEARS = 2019
group by countries
order by Total_Profit desc;

--FIND YEAR WITH HIGHEST PROFIT--
select years, sum(profit) as Total_Profit
from Nigerian_Breweries
group by years
order by Total_Profit desc;

--Profit Rank--
select months, sum(profit) as TotalProfit,
rank() over(order by sum(profit) desc) as ProfitRank
from Nigerian_Breweries
group by MONTHS
order by ProfitRank;

--MONTH WHERE LEAST PROFIT WAS GENERATED--
Select months,sum(profit) as Total_Profit from Nigerian_Breweries
group by Months
order by Total_Profit asc;

--Year on Year percentage increase/decline in profit--
select years, sum(cast(quantity as bigint)*cast(UNIT_PRICE as decimal(18,2))) as TotalRevenue,
round((sum(cast(Quantity as bigint) * cast(UNIT_PRICE as decimal(18,2))) - 
lag(sum(cast(Quantity as bigint) * cast(UNIT_PRICE as decimal(18,2))))
over(order by Years )) * 100 / Nullif(Lag(sum(cast(quantity as bigint) * cast(unit_Price as decimal (18,2))))
over(order by Years),0),2) as YoYPercentage
from Nigerian_Breweries
group by years
order by years;

--MINIMUM PROFIT IN YEAR 2018--
Select years, min(profit) as MinimunProfit from Nigerian_Breweries
where years = 2018
group by years;

--COMPARE PROFIT FOR EACH MONTH IN 2019--
select * from Nigerian_Breweries;
Select months, sum(profit) as TotalProfit from Nigerian_Breweries
where years = 2019
group by months
order by TotalProfit desc;

--BRAND THAT GENERATED THE HIGHEST PROFIT--
Select brands, sum(profit) as TotalProfit
from Nigerian_Breweries
group by Brands
order by TotalProfit desc;

--Overall Profit Margin--
select sum(profit) as TotalProfit, sum(quantity * unit_price) as TotalRevenue,
round(sum(profit),2) * 100 / sum(quantity * unit_price) as ProfitMargin
from Nigerian_breweries;





