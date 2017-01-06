INSERT INTO ProA.dbo.PA_ITEM
SELECT ite.Item_ID, ite.Item_Name, ite.Item_Desc, bra.Brand_ID, bra.Brand_Name, cat.Cat_ID, cat.Cat_Name, pri.Price_Date, pri.Price_Value 
FROM 
	IC.dbo.IC_ITEM ite
	join IC.dbo.IC_BRAND bra on ite.Brand_ID = bra.Brand_ID 
	join IC.dbo.IC_CATEGORY cat on ite.Cat_ID = cat.Cat_ID
	join PriA.dbo.PR_PRICE pri on ite.Item_ID = pri.Item_ID
WHERE
	day(pri.price_date)=day(getdate())
	AND
	month(pri.price_date)=month(getdate())
	AND
	year(pri.price_date)=year(getdate())

/*i don't understand CTEs yet so this was the easiest and admitedly cheatiest way to return the latest price data :(*/