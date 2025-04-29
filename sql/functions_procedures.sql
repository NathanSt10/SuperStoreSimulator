use super_store_sim_db;

DELIMITER $$
create procedure bag_to_order(in p_member_id int)
begin
	declare v_product_id int;
    declare v_product_quantity int;
    declare v_total_cost decimal(10,2) default 0.00;
    declare v_order_id int;
    declare done int default false;
    
    declare bag_cursor cursor for
		select bc.product_id, bc.product_quantity from bagcontents as bc 
        where bc.member_id = p_member_id;
        
	declare continue handler for not found set done = true;
    
    insert into `orders` (member_id, cost) 
    values (p_member_id, 0.00);
    
    set v_order_id = last_insert_id();
    
    open bag_cursor;
    read_loop: loop
		fetch bag_cursor into v_product_id, v_product_quantity;
		if done then 
			leave read_loop;
		end if;
		
        insert into orderdetails (order_id, product_id, quantity)
        values (v_order_id, v_product_id, v_product_quantity);
	end loop;
    close bag_cursor;
    select sum(price) into v_total_cost from orderdetails where order_id = v_order_id;
    
    update `orders` set cost = v_total_cost where id = v_order_id;
    
    delete from bagcontents where member_id = p_member_id;
end$$
DELIMITER ;

DELIMITER $$
create function get_total_spent_by_member(p_member_id int)
returns decimal(10, 2)
deterministic
begin
	declare v_total decimal(10, 2);
    
    select coalesce(sum(cost), 0.00)
    into v_total
    from `orders` 
    where member_id = p_member_id;
    
    return v_total;
end$$
DELIMITER ;

DELIMITER $$ 
create procedure restock_product(in p_quantity int)
begin
	declare done int default false;
    declare v_product_id int;
    
    declare product_cur cursor for
		select id from product where quantity = 0;
	declare continue handler for not found set done = true;
    
    open product_cur;
    read_loop: loop
		fetch product_cur into v_product_id;
        if done then 
			leave read_loop;
		end if;
        
        update product set quantity = quantity+p_quantity
        where id = v_product_id;
	end loop;
    close product_cur;
end$$
DELIMITER ;

DELIMITER $$
create procedure add_to_bag(in p_member_id int, in p_product_id int, in p_quantity int)
begin
	insert into bagcontents (member_id, product_id, product_quantity)
    values (p_member_id, p_product_id, p_quantity)
    on duplicate key update product_quantity = product_quantity+p_quantity;
end$$
DELIMITER ;

DELIMITER $$
create procedure create_payment(in p_member_id int, in p_pay_type enum('Card', 'Check', 'Cash'))
begin
	declare v_amount decimal(10,2);
    select cost into v_amount from `orders` where member_id = p_member_id
    order by id desc limit 1;
    
    insert into payment(member_id, `type`, payment_date, total)
    values (p_member_id, p_pay_type, curdate(), v_amount);
end$$
DELIMITER ;

DELIMITER $$
create procedure new_member_user
(in p_first varchar(45), in p_last varchar(45), in p_email varchar(320), in p_num varchar(45),
in p_type int, in p_user varchar(20), in p_pass varchar(20))
begin 
	declare v_member_id int;
	insert into members (first_name, last_name, email, phone_number, membership)
    values (p_first, p_last, p_email, p_num, p_type);
    set v_member_id = last_insert_id();
    insert into `user` (username, `password`, member_id, admin_rights)
    values (p_user, p_pass, v_member_id, 0);
end$$
DELIMITER ;
    






