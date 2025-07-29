select * from Nigerian_Breweries;
select countries,
case when countries in ('benin','senegal','togo') then 'Francophone'
else 'Anglophone'
end as TERRITORIES
from Nigerian_Breweries;

select distinct countries from Nigerian_Breweries;

Alter table Nigerian_breweries 
add TERRITORIES nvarchar(20);

update Nigerian_Breweries
set TERRITORIES = 
case when countries in ('benin','senegal','togo') then 'Francophone'
else 'Anglophone'
end;

--PROFIT ANALYSIS--
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

--MONTH WHERE LEAST PROFIT WAS GENERATED--
Select months,sum(profit) as Total_Profit from Nigerian_Breweries
group by Months
order by Total_Profit asc; 

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





