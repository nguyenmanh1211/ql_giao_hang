DELIMITER $$

 CREATE TRIGGER before_insert_products

 BEFORE INSERT ON products

 FOR EACH ROW

BEGIN

 if new.product_code is null or new.product_code = '' 
 then 
 set new.product_code = 
 concat("SP00",
 (select convert(SUBSTRING_INDEX(product_code,"SP00",-1) , UNSIGNED INTEGER) as pz from products where product_code like '%SP00%'  order by pz desc limit 0,1) +1);
 end if;
END$$

 DELIMITER ;
 
 DROP TRIGGER before_insert_products;
 
 /* trickger bảng Customer */
 
 DELIMITER $$
 
 CREATE TRIGGER before_insert_customer

 BEFORE INSERT ON customer

 FOR EACH ROW

 BEGIN
	set @code_KH = '0';
    select CONVERT(SUBSTRING_INDEX(code, 'CUS', -1), UNSIGNED INTEGER)+1 into @code_KH from customer
			order by id desc
			limit 1;
	if new.code is null or new.code = '' 
    then
		if @code_KH <= 9 
		then
			set new.code = concat("CUS000",(select CONVERT(SUBSTRING_INDEX(code, 'CUS', -1), UNSIGNED INTEGER)+1 from customer
			order by id desc
			limit 1));
		end if;
        if @code_KH >9 && @code_KH <=99
        then
			set new.code = concat("CUS00",(select CONVERT(SUBSTRING_INDEX(code, 'CUS', -1), UNSIGNED INTEGER)+1 from customer
			order by id desc
			limit 1));
		end if;
        if @code_KH > 99 
		then
			set new.code = concat("CUS0",(select CONVERT(SUBSTRING_INDEX(code, 'CUS', -1), UNSIGNED INTEGER)+1 from customer
			order by id desc
			limit 1));
		end if;
	end if;
 END$$
 
 DELIMITER ;
 
 DROP TRIGGER before_insert_customer;
 
 
 /* trickger bảng Fulfillment */
 
 DELIMITER $$
 
 CREATE TRIGGER before_insert_fulfillment

 BEFORE INSERT ON fulfillment

 FOR EACH ROW

 BEGIN
	set @code_FUL = '0';
    select CONVERT(SUBSTRING_INDEX(code, 'FUL', -1), UNSIGNED INTEGER)+1 into @code_FUL from fulfillment
			order by id desc
			limit 1;
	if new.code is null or new.code = '' 
    then
		if @code_FUL <= 9 
		then
			set new.code = concat("FUL000",(select CONVERT(SUBSTRING_INDEX(code, 'FUL', -1), UNSIGNED INTEGER)+1 from fulfillment
			order by id desc
			limit 1));
		end if;
        if @code_FUL >9 && @code_KH <=99
        then
			set new.code = concat("FUL00",(select CONVERT(SUBSTRING_INDEX(code, 'FUL', -1), UNSIGNED INTEGER)+1 from fulfillment
			order by id desc
			limit 1));
		end if;
        if @code_FUL > 99 
		then
			set new.code = concat("FUL0",(select CONVERT(SUBSTRING_INDEX(code, 'FUL', -1), UNSIGNED INTEGER)+1 from fulfillment
			order by id desc
			limit 1));
		end if;
	end if;
 END$$
 
 DELIMITER ;
 
 DROP TRIGGER before_insert_fulfillment;
 
 
/*  
DELIMITER $$
 
CREATE TRIGGER insert_customers

BEFORE INSERT ON customers

FOR EACH ROW

BEGIN
	set @code_KH = '0';
    select CONVERT(SUBSTRING_INDEX(code, 'CUS', -1), UNSIGNED INTEGER)+1 into @code_KH from customer
			order by id desc
			limit 1;
	set @i=4-length(@code_KH);
    select @i;
        WHILE (@a <= @i) DO
        set @cus = CONCAT("CUS","0");
		set @a = @a + 1;
        select @cus;
        END WHILE;
        set new.code =@cus;
	
END$$
 
DELIMITER ;
 
DROP TRIGGER insert_customers;
*/

select * from fulfillment where id=1;
select count(*) from customer where is_active=null;
SELECT * FROM fulfillment where customer_id=1;
 
 
 