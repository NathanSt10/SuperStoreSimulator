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


