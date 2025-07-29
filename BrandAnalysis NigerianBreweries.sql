--BRAND ANALYSIS--
--Top Three brands consumed in the last two years in Francophone--
Select TOP 3 BRANDS, SUM(QUANTITY) as QuantityConsumed 
from Nigerian_Breweries
where (years between 2018 and 2019) and 
TERRITORIES = 'Francophone'
group by brands
order by QuantityConsumed desc;

--Top two choices brand in ghana--
select * from Nigerian_Breweries;
select top 2 brands, sum(quantity) as TotalQ
from Nigerian_Breweries
where (countries = 'Ghana')
group by brands;

--GROUP BRANDS TO BEER AND MALT---
Alter table Nigerian_breweries
Add PRODUCT_TYPE nvarchar(15);
select distinct brands from Nigerian_Breweries;
select brands,
case when brands in ('castle lite','eagle lager','trophy','hero','budweiser') then 'Beer'
else 'Malt'
end as Product_type
from Nigerian_Breweries;
update Nigerian_Breweries
set product_type =
case when brands in ('castle lite','eagle lager','trophy','hero','budweiser') then 'Beer'
else 'Malt'
end;
select * From Nigerian_Breweries;

--FIND THE BEERS CONSUMED IN PAST THREE YEARS IN NIGERIA--
Select brands,PRODUCT_TYPE,sum(quantity) as TotalQ
FROM Nigerian_Breweries
where countries = 'Nigeria'
group by product_type,BRANDS
order by TotalQ desc;

---favourite malt brand in anglophone between 2018 and 2019--
select BRANDS,Product_type,sum(QUANTITY) as TotalConsumption
from Nigerian_Breweries
where TERRITORIES = 'Anglophone'
and (YEARS between 2018 and 2019)
group by brands,product_type;

--which brands sold highest in Nigeria in 2019--
select * from Nigerian_Breweries;
select brands,sum(QUANTITY) as TotalSales
from Nigerian_Breweries
where YEARS = 2019
and COUNTRIES ='Nigeria'
group by brands
order by TotalSales desc;

--Favorite brand in south south Nigeria--
select * from Nigerian_Breweries;
select brands,region, sum(QUANTITY) as TotalSales
from Nigerian_Breweries
where COUNTRIES = 'Nigeria'
and region ='southsouth'
group by region,brands
order by TotalSales desc;

---Beer consumption in Nigeria--
select product_type, sum(QUANTITY) as TotalProfit
from Nigerian_Breweries
where countries = 'Nigeria'
and product_type = 'Beer'
group by product_type;

--Level of consumption of budweiser in the regions in Nigeria--
select brands,region, sum(QUANTITY) as TotalSales
from Nigerian_Breweries
where brands = 'budweiser'
AND YEARS = 2019
and countries = 'Nigeria'
group by brands, region
order by TotalSales desc;

select * from Nigerian_Breweries;