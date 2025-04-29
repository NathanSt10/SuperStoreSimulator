use super_store_sim_db;
DELIMITER $$
create trigger order_detail_price before insert on orderdetails for each row
begin
	declare product_price decimal(10, 2);
    select price into product_price from product where id = NEW.product_id;
    set NEW.price = NEW.quantity * product_price;
end$$
DELIMITER ;

DELIMITER $$
create trigger wage_increase before update on employee for each row
begin
	if new.years_worked > old.years_worked then
		set new.wage = old.wage + 0.25;
	end if;
end$$
DELIMITER ;

DELIMITER $$
create trigger manager_bonus after update on manager for each row
begin
	if new.employee_id <> old.employee_id then
		update employee set  wage = wage + 5 
        where employee.id = new.employee_id;
	end if;
end$$
DELIMITER ;

DELIMITER $$
create trigger manager_bonus_creation after insert on manager for each row
begin
  update employee
     set wage = wage + 5
   where id = new.employee_id;
end$$
DELIMITER ;

DELIMITER $$
create trigger add_to_points after insert on `payment` for each row
begin
	update members 
    set points = points + 
		cast(
			case membership
				when 1 then new.total * 0.5	
				when 2 then new.total * 0.95
				when 3 then new.total * 1.30
			end
		as signed)
	where id = new.member_id;
end$$
DELIMITER ;

DELIMITER $$
create trigger quantity_order_update after insert on `orderdetails` for each row
begin
	declare v_quantity int;
    
	update product set quantity = quantity - new.quantity
    where product.id = new.product_id;
    
    select quantity into v_quantity from product where id = new.product_id;
    if v_quantity < 0 then
		update product set quantity = 0 where product.id = new.product_id;
	end if;
end$$
DELIMITER ;