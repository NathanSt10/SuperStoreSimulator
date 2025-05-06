-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema super_store_sim_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema super_store_sim_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `super_store_sim_db` DEFAULT CHARACTER SET utf8mb3 ;
USE `super_store_sim_db` ;

-- -----------------------------------------------------
-- Table `super_store_sim_db`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`membership` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `membership_tier` VARCHAR(45) NOT NULL,
  `yearly_fee` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `membership_tier_UNIQUE` (`membership_tier` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`members`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`members` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `full_name` VARCHAR(100) GENERATED ALWAYS AS (concat(`first_name`,_utf8mb3' ',`last_name`)) VIRTUAL,
  `email` VARCHAR(320) NOT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `membership` INT NOT NULL DEFAULT '0',
  `points` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `ship-mem-idfk_idx` (`membership` ASC) VISIBLE,
  CONSTRAINT `ship-mem-idfk`
    FOREIGN KEY (`membership`)
    REFERENCES `super_store_sim_db`.`membership` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`supplier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `website` VARCHAR(2083) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  `quantity` INT NOT NULL DEFAULT '0',
  `supplier_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `dep-pro-idfk_idx` (`department_id` ASC) VISIBLE,
  INDEX `cat_pro_idfk_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `cat_pro_idfk`
    FOREIGN KEY (`category_id`)
    REFERENCES `super_store_sim_db`.`category` (`id`)
    ON DELETE RESTRICT,
  CONSTRAINT `dep_pro_idfk`
    FOREIGN KEY (`department_id`)
    REFERENCES `super_store_sim_db`.`department` (`id`)
    ON DELETE RESTRICT,
  CONSTRAINT `sup_pro_idfk`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `super_store_sim_db`.`supplier` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`bagcontents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`bagcontents` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL DEFAULT NULL,
  `product_id` INT NOT NULL,
  `product_quantity` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `mem_bag_idfk_idx` (`member_id` ASC) VISIBLE,
  INDEX `pro_bag_idfk_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  CONSTRAINT `mem_bag_idfk`
    FOREIGN KEY (`member_id`)
    REFERENCES `super_store_sim_db`.`members` (`id`),
  CONSTRAINT `pro_bag_idfk`
    FOREIGN KEY (`product_id`)
    REFERENCES `super_store_sim_db`.`product` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `full_name` VARCHAR(45) GENERATED ALWAYS AS (concat(`first_name`,_utf8mb3' ',`last_name`)) VIRTUAL,
  `department_id` INT NULL DEFAULT NULL,
  `email` VARCHAR(320) NOT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `wage` DECIMAL(10,2) NOT NULL DEFAULT '10.00',
  `years_worked` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idemployee_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `dep-emp-idfk_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `dep-emp-idfk`
    FOREIGN KEY (`department_id`)
    REFERENCES `super_store_sim_db`.`department` (`id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`manager` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NULL DEFAULT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `department_id_UNIQUE` (`department_id` ASC) VISIBLE,
  UNIQUE INDEX `employee_id_UNIQUE` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `dep-man-idfk`
    FOREIGN KEY (`department_id`)
    REFERENCES `super_store_sim_db`.`department` (`id`)
    ON DELETE RESTRICT,
  CONSTRAINT `emp-man-idfk`
    FOREIGN KEY (`employee_id`)
    REFERENCES `super_store_sim_db`.`employee` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL DEFAULT NULL,
  `cost` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `mem-ord-idfk_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `mem-ord-idfk`
    FOREIGN KEY (`member_id`)
    REFERENCES `super_store_sim_db`.`members` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`orderdetails` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `ord_det_idfk_idx` (`order_id` ASC) VISIBLE,
  INDEX `pro-det-idfk_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `ord_det_idfk`
    FOREIGN KEY (`order_id`)
    REFERENCES `super_store_sim_db`.`orders` (`id`),
  CONSTRAINT `pro-det-idfk`
    FOREIGN KEY (`product_id`)
    REFERENCES `super_store_sim_db`.`product` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NULL DEFAULT NULL,
  `type` ENUM('Card', 'Check', 'Cash') NOT NULL DEFAULT 'Card',
  `payment_date` DATE NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `mem_pay_idfk_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `mem_pay_idfk`
    FOREIGN KEY (`member_id`)
    REFERENCES `super_store_sim_db`.`members` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_store_sim_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_store_sim_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `member_id` INT NULL,
  `admin_rights` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `member_id_UNIQUE` (`member_id` ASC) VISIBLE,
  CONSTRAINT `mem_user_idfk`
    FOREIGN KEY (`member_id`)
    REFERENCES `super_store_sim_db`.`members` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use super_store_sim_db;
alter table members
add constraint chk_membership_type
check (membership in (1, 2, 3));

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

DELIMITER $$
create trigger new_member_to_user after insert on `members` for each row
begin
	insert into `users` (username,`password`, member_id, admin_rights)
    values (concat(lower(left(new.first_name,3)), lower(left(new.last_name, 3)), new.id), '0', new.id, 0);
end$$
DELIMITER ;

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
    insert into `users` (username, `password`, member_id, admin_rights)
    values (p_user, p_pass, v_member_id, 0);
end$$
DELIMITER ;

use super_store_sim_db;
create view `all_members_query` 
as select m.first_name, m.last_name, m.full_name, m.email, m.phone_number, mem.membership_tier, points
from `members` as m join `membership` as mem on m.membership = mem.id;

create view aisle_view as
select p.`name` as `name`, p.price, p.quantity, s.`name` as brand, c.`name` as category, d.id as department
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
select row_number() over (partition by o.member_id order by o.id) as member_order_number, p.`name` as product,
od.price, od.quantity, member_id from orderdetails od join orders o on od.order_id = o.id 
join product p on od.product_id = p.id;

create view checkout as
select member_id, p.`name` as product, bc.product_quantity, (p.price *bc.product_quantity) as price
from bagcontents bc join product p on bc.product_id = p.id;

use super_store_sim_db;
insert into department (`name`) 
values ('Produce'), ('Dairy'),('Electronics'),('Frozen'),('Clothes'), ('Bakery'), ('Beauty'),
('Pharmacy'), ('Cleaning'), ('Deli'),('Toys'),('Automotive');
insert into membership (`membership_tier`, `yearly_fee`)
values ('Basic', 50), ('Gold', 100), ('Platinum', 150);
INSERT INTO employee (first_name, last_name, department_id, email, phone_number, wage, years_worked)
VALUES
('Alice',  'Adams',     1, 'alice.adams1@example.com',     '555-0101', 12.50, 10),
('Bob',    'Baker',     1, 'bob.baker1@example.com',       '555-0102', 10.25,  1),
('Carol',  'Clark',     1, 'carol.clark1@example.com',     '555-0103', 12.00,  8),
('David',  'Davis',     2, 'david.davis2@example.com',     '555-0201', 11.50,  6),
('Eva',    'Evans',     2, 'eva.evans2@example.com',       '555-0202', 11.50,  6),
('Frank',  'Foster',    2, 'frank.foster2@example.com',    '555-0203', 12.00,  8),
('Grace',  'Green',     3, 'grace.green3@example.com',     '555-0301', 12.25,  9),
('Henry',  'Hill',      3, 'henry.hill3@example.com',      '555-0302', 10.50,  2),
('Ivy',    'Irwin',     3, 'ivy.irwin3@example.com',       '555-0303', 12.00,  8),
('Jack',   'Jackson',   4, 'jack.jackson4@example.com',    '555-0401', 10.50,  2),
('Kate',   'King',      4, 'kate.king4@example.com',       '555-0402', 10.75,  3),
('Liam',   'Lewis',     4, 'liam.lewis4@example.com',      '555-0403', 10.00,  0),
('Mia',    'Miller',    5, 'mia.miller5@example.com',      '555-0501', 10.00,  0),
('Noah',   'Nichols',   5, 'noah.nichols5@example.com',    '555-0502', 12.50, 10),
('Olivia', 'Owens',     5, 'olivia.owens5@example.com',     '555-0503', 10.00,  0),
('Paul',   'Parker',    6, 'paul.parker6@example.com',      '555-0601', 10.00,  0),
('Quinn',  'Quinn',     6, 'quinn.quinn6@example.com',      '555-0602', 10.25,  1),
('Ruby',   'Russell',   6, 'ruby.russell6@example.com',     '555-0603', 10.50,  2),
('Sam',    'Smith',     7, 'sam.smith7@example.com',        '555-0701', 10.00,  0),
('Tina',   'Thompson',  7, 'tina.thompson7@example.com',    '555-0702', 10.25,  1),
('Ulysses','Underwood', 7, 'ulysses.underwood7@example.com', '555-0703', 10.50,  2),
('Vera',   'Vincent',   8, 'vera.vincent8@example.com',     '555-0801', 11.00,  4),
('Will',   'Walker',    8, 'will.walker8@example.com',      '555-0802', 12.25,  9),
('Xander', 'Xu',        8, 'xander.xu8@example.com',         '555-0803', 11.50,  6),
('Yara',   'Young',     9, 'yara.young9@example.com',       '555-0901', 12.00,  8),
('Zane',   'Zimmerman', 9, 'zane.zimmerman9@example.com',   '555-0902', 11.50,  6),
('Abby',   'Abbott',    9, 'abby.abbott9@example.com',      '555-0903', 12.25,  9),
('Ben',    'Benson',   10, 'ben.benson10@example.com',      '555-1001', 11.75,  7),
('Cora',   'Campbell', 10, 'cora.campbell10@example.com',   '555-1002', 11.75,  7),
('Dylan',  'Daniels',  10, 'dylan.daniels10@example.com',   '555-1003', 10.25,  1),
('Ella',   'Edwards',  11, 'ella.edwards11@example.com',    '555-1101', 10.25,  1),
('Finn',   'Fisher',   11, 'finn.fisher11@example.com',     '555-1102', 12.25,  9),
('Gina',   'Gomez',    11, 'gina.gomez11@example.com',      '555-1103', 11.00,  4),
('Harry',  'Harris',   12, 'harry.harris12@example.com',    '555-1201', 10.50,  2),
('Isla',   'Ingram',   12, 'isla.ingram12@example.com',     '555-1202', 11.50,  6),
('Jake',   'Jacobs',   12, 'jake.jacobs12@example.com',     '555-1203', 12.00,  8);

insert into manager (employee_id, department_id)
values (1,1), (4,2), (7,3), (10,4),
(13,5), (16,6), (19,7), (22,8),
(25,9), (28,10), (31,11), (34,12);

INSERT INTO supplier (name, website)
VALUES
('SuperStoreSim', 'https://www.superstore.com'),
('FreshHarvest Farms', 'https://www.freshharvestfarms.com'),
('GreenLeaf Produce', 'https://www.greenleafproduce.com'),
('DairyLand Suppliers', 'https://www.dairylandsuppliers.com'),
('CreamyGoodness Co.', 'https://www.creamygoodnessco.com'),
('ElectroGoods Inc.', 'https://www.electrogoodsinc.com'),
('TechNova Electronics', 'https://www.technovaelectronics.com'),
('FrozenDelights Co.', 'https://www.frozendelightsco.com'),
('IceKing Foods', 'https://www.icekingfoods.com'),
('FashionTrends Apparel', 'https://www.fashiontrendsapparel.com'),
('UrbanWear Clothing', 'https://www.urbanwearclothing.com'),
('GoldenCrust Bakery', 'https://www.goldencrustbakery.com'),
('SweetTreats Bakers', 'https://www.sweettreatsbakers.com'),
('GlowBeauty Supplies', 'https://www.glowbeautysupplies.com'),
('Radiance Beauty Co.', 'https://www.radiancebeautyco.com'),
('MediCare Pharmacy', 'https://www.medicarepharmacy.com'),
('HealthFirst Pharmacy', 'https://www.healthfirstpharmacy.com'),
('SparkClean Products', 'https://www.sparkcleanproducts.com'),
('ShinyHome Cleaners', 'https://www.shinyhomecleaners.com'),
('PrimeCuts Meat Co.', 'https://www.primecutsmeatco.com'),
('Butcher\'s Choice Meats', 'https://www.butcherschoicemeats.com'),
('ToyAdventure World', 'https://www.toyadventureworld.com'),
('FunZone Toys', 'https://www.funzonetoys.com'),
('AutoWorks Parts', 'https://www.autoworksparts.com'),
('DriveMaster Auto Supplies', 'https://www.drivemasterautosupplies.com');
insert into members (first_name, last_name, email, phone_number, membership)
values ('Ad','min', 'admin@superstore.com','000-000-0000', 3),
('Andew', 'Metz', 'email@email.com', '111-111-111', 1),
('John', 'Smith', 'email@email.org', '222-222-2222', 2),
('Joe', 'Random', 'email2@notemail.com', '123-123-1234', 3);
update users set `password` = 'admin', admin_rights = 1 where id = 1;
insert into category (`name`)
values ('Fruit'),('Vegtable'),('Milk'),('Cheese'),('Ice Cream'),('Yogurt'),('Photography'),
('Video Games'),('Phones'),('Audio'),('Ready-To-Eat'),('Meat'),('Seafood'),('Dessert'),('Shirt'),
('Pants'),('Footwear'),('Donuts'),('Cake'),('Bread'),('Makeup'),('Hair'),('Hygiene'),
('Over-the-counter'),('First-Aid'),('Vitamins'),('Toilet Paper'),('Cleaning Tool'),('Cleaning Product'),
('Sandwich'),('Games'),('Figurine'),('Sport'),('Tires'),('Batteries'),('Service');
insert into product (`name`, category_id, department_id, price, quantity, supplier_id)
values ('Watermelon', 1, 1, 6.99, 100, 2), ('Fuji Apple (lbs)',1,1,1.99,100,2),
('Asparaus (lbs)',2,1,3.99,100,3),('Baby Carrots',2,1,1.99,100,3),('String Cheese',4,2,5.99,100,5),
('American Singles',4,2,5.49,100,4),('Whole Milk (gal)',3,2,2.79,100,4),('Chocolate Milk (gal)',3,2,5.49,100,4),
('Ice Cream Sandwiches',5,2,4.79,100,5),('Ice Cream (48 fl oz)',5,2,2.99,100,5),('Yogurt (2 lb)',6,2,3.69,100,5),
('Frozen Pizza',11,4,4.99,100,9),('Pizza Rolls',11,4,5.99,100,9),('Bacon',12,4,5.49,100,8),
('Bone-in Drumsticks',12,4,6.79,100,8),('Shrimp',13,4,13.98,100,9),('Ahi Tuna Steak',13,4,19.99,100,9),
('Cherry Pie',14,4,8.99,100,8),('Bomb Pops',14,4,3.99,100,8),('Crab Clusters',13,10,13.99,100,20),
('Tilapia Fillets',13,10,6.99,100,20),('Boneless Chicken Breast (lbs)',12,10,3.99,100,21),
('New York Strip Streak (lbs)',12,10,15.99,100,21),('Mozzarella (lbs)',4,10,8.99,100,20),
('Provolone (lbs)',4,10,8.99,100,20),('Italian Sub',30,10,6.99,100,1),('Club Sub',30,10,5.99,100,1),
('Assorted Donuts',18,6,4.99,100,13),('Custom Cake',19,6,24.99,100,1),('Baguette',20,6,2.99,100,12),
('Hard Rolls',20,6,3.99,100,12),('Italian Bread',20,6,2.99,100,12),('Photo Camera',7,3,599.99,100,7),
('Action Camera',7,3,429.99,100,7),('Film',7,3,54.99,100,7),('Console',8,3,500.00,100,6),
('RPG Game',8,3,70.00,100,6),('Smart Phone',9,3,829.99,100,6),('Phone Case',9,3,49.99,100,6),
('Portable Speaker',10,3,199.99,100,7),('Wireless Headphones',10,3,349.99,100,7),('Graphic Tee',15,5,14.99,100,11),
('Button-up Shirt',15,5,30.00,100,10),('Jeans',16,5,36.00,100,11),('Sweatpants',16,5,30.00,100,11),
('Socks',17,5,9.99,100,11),('Athletic Shoes',17,5,50.00,100,11),('Dress Shoes',17,5,100.00,100,10),
('Concealer',21,7,12.99,100,14),('Brush Set',21,7,18.99,100,15),('Mascara',21,7,8.00,100,14),
('Shampoo',22,7,8.99,100,14),('Conditioner',22,7,10.99,100,14),('Deodorant',23,7,6.99,100,15),
('Lotion',23,7,5.99,100,15),('Body Wash',23,7,9.99,100,15),('Allergy Relief',24,8,5.99,100,17),
('Ibuprofen',24,8,3.59,100,16),('Band Aids',25,8,3.79,100,17),('First-Aid Kit',25,8,6.99,100,17),
('Multi Vitamin',26,8,12.49,100,16),('Vitamin C',26,8,15.69,100,15),('Fish Oil',26,8,15.29,100,17),
('Toilet Paper (12 Pack)',27,9,12.99,100,18),('Toilet Paper (30 pack)',27,9,24.99,100,18),
('Broom',28,9,14.29,100,19),('Mop',28,9,29.99,100,19),('Plunger',28,9,5.69,100,18),
('Surface Cleaner',29,9,4.99,100,19),('Bleach',29,9,5.79,100,18),('Game of Life',31,11,18.59,100,22),
('Chess Board',31,11,24.99,100,22),('Action Guy',32,11,15.99,100,23),('Barbie',32,11,15.99,100,23),
('Pickleball Set',33,11,19.99,100,23),('Bicycle',33,11,149.99,100,23),('Basketball',33,11,24.99,100,22),
('Dumbell Set',33,11,99.99,100,22),('Tires (Full set)',34,12,900.00,100,25),('Car Battery',35,12,200.00,100,24),
('Car Service',36,12,80.00,100,1);   

ALTER TABLE bagcontents
DROP INDEX product_id_UNIQUE;
ALTER TABLE bagcontents
ADD UNIQUE KEY uniq_member_product (member_id, product_id);