USE IC; /*IC is Item Catalogue DB*/

declare @x int;
set @x=1;
while @x < 6
	begin
	insert into IC_CATEGORY values (@x,'Category'+cast(@x as varchar(100)),'Description')
	set @x=@x+1
	end

declare @x int;
set @x=1;
while @x < 11
	begin
	insert into IC_BRAND values (@x,'Brand'+cast(@x as varchar(100)),'Description')
	set @x=@x+1
	end

declare @x int;
set @x=1;
while @x < 10001
	begin
	insert into IC_ITEM values (@x,'Item'+cast(@x as varchar(100)),'Description',rand()*10+1,rand()*5+1)
	set @x=@x+1
	end

USE PriA; /*PriA is Pricing Application DB*/

declare @x int;
declare @y int;
declare @date date = getdate();
declare @price int = rand()*1000+1 /*figured prices should vary between 1 and 1000 Euros*/
declare @up int; /*upper decent-ish margin change on price*/
set @x=1;
set @y=1;
while @x < 10001 /*item cycle*/
	begin
	while @y < 10 /*date cycle*/
		begin
		set @up=@price/20 /*basically i don't let price fluctuate for more than +/- 5% on a monthly basis, rolling - i.e. from previous month*/
		if floor(rand()*2)=1 /*check to find out if price drops or rises next month*/
			set @price = @price+floor(rand()*(@up))
			ELSE
			set @price = @price-floor(rand()*(@up))
		insert into PR_PRICE values (@x,@date,@price)
		set @date = dateadd(month,-1,@date)
		set @y=@y+1
		end
	set @price = rand()*1000+1
	set @y=1
	set @date = getdate()
	set @x=@x+1
	end