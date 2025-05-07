use super_store_sim_db;
create view `all_members_query` 
as select m.first_name, m.last_name, m.full_name, m.email, m.phone_number, mem.membership_tier, points
from `members` as m join `membership` as mem on m.membership = mem.id;

create view aisle_view as
select p.id, p.`name` as `name`, p.price, p.quantity, s.`name` as brand, c.`name` as category, d.id as department
from product p join category c on p.category_id = c.id 
join supplier s on p.supplier_id = s.id join department d on p.department_id = d.id;

create view emp_manager_only as
select full_name, d.`name` as department, email, phone_number 
from employee e join department d on e.department_id = d.id where e.id in 
(select employee_id from manager);

create view view_bag as
select member_id, p.`name` as product, product_quantity from bagcontents bc
join product p on bc.product_id = p.id;

create view view_orders as 
select row_number() over (partition by member_id order by id) as member_order_number, 
cost, member_id from orders; 

create view view_orderdetail as
select dense_rank() over (partition by member_id order by od.order_id) as member_order_number,
p.`name` as product, od.quantity, od.price, o.member_id 
FROM orderdetails od join orders o on od.order_id = o.id join product p on od.product_id = p.id;

create view checkout as
select member_id, p.`name` as product, bc.product_quantity, (p.price *bc.product_quantity) as price
from bagcontents bc join product p on bc.product_id = p.id;



