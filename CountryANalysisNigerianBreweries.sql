Alter table Nigerian_breweries 
add TERRITORIES nvarchar(20);

update Nigerian_Breweries
set TERRITORIES = 
case when countries in ('benin','senegal','togo') then 'Francophone'
else 'Anglophone'
end;
select * from Nigerian_Breweries;
select countries,
case when countries in ('benin','senegal','togo') then 'Francophone'
else 'Anglophone'
end as TERRITORIES
from Nigerian_Breweries;

--Country with the highest consumption of beer--
select countries, product_type, sum(QUANTITY) as TotalQ
From Nigerian_breweries
where product_type = 'Beer'
group by product_type,COUNTRIES
order by TotalQ desc;

--Highest sales personnel of budweiser in senegal--
select * from Nigerian_Breweries;
select sales_rep, brands, sum(quantity) as TotalSales
from Nigerian_Breweries
where brands = 'budweiser'
and COUNTRIES = 'Senegal'
group by SALES_REP,BRANDS
order by TotalSales desc;

