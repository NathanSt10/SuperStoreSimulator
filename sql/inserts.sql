use super_store_sim_db;
insert into department (`name`) 
values ('Produce'), ('Dairy'),('Electronics'),('Frozen'),('Clothes'), ('Bakery'), ('Beauty'),
('Pharmacy'), ('Cleaning'), ('Meat'),('Toys'),('Automotive');
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
