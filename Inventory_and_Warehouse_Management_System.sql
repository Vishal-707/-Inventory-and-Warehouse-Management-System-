
							-- Inventory Management System --
                            
    
-- -----------------------------------------------------------------------
--    SECTION 1: DATABASE CREATION 
-- -----------------------------------------------------------------------
                            
	CREATE DATABASE Inventory_Management_System; 
    USE Inventory_Management_System;
    
    SHOW TABLES;
								

-- -----------------------------------------------------------------------
--    SECTION 2: SCHEMA CREATION 
-- -----------------------------------------------------------------------
      
-- Roles Table
    CREATE TABLE Roles(
    Role_id INT PRIMARY KEY AUTO_INCREMENT,
    Role_Name VARCHAR(200),
    Created_at TIMESTAMP
    );
    
-- User Table 
                                
    CREATE TABLE Users(
    user_id INT PRIMARY KEY AUTO_INCREMENT ,
    User_Name VARCHAR(200) NOT NULL,
    Password_Hash VARCHAR(100) NOT NULL,
    Role_id INT NOT NULL,
    Created_at DATETIME NOT NULL,
    FOREIGN KEY(Role_id) REFERENCES Roles(Role_id));    
    
	ALTER TABLE Users AUTO_INCREMENT = 101; 

    
-- Fuel_Type Table
    CREATE TABLE Fuel_Type(
    Fuel_id INT PRIMARY KEY AUTO_INCREMENT,
    FuelType_Name VARCHAR(50) NOT NULL );
    
-- 	Vehicles (Products) Table
                                
    CREATE TABLE Vehicles(
    Vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    Model_Name VARCHAR(100) NOT NULL,
    Brand_Name VARCHAR(100) NOT NULL,
    Variant VARCHAR(50) NOT NULL,
    Fuel_id INT NOT NULL,
    Price DECIMAL(12,2) NOT NULL,
    Stock_quantity INT NOT NULL,
    Created_at TIMESTAMP,
    FOREIGN KEY(Fuel_id) REFERENCES Fuel_Type(Fuel_id) );
    
    ALTER TABLE Vehicles AUTO_INCREMENT=501; 
    
    
-- Payment Table
    
    CREATE TABLE Payments(
    Payment_id INT PRIMARY KEY AUTO_INCREMENT,
    Payment_type VARCHAR(50) NOT NULL );
    
    
-- Customers Table
                                
    CREATE TABLE Customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT ,
    Customer_Name VARCHAR(125) NOT NULL,
    Contact_Number BIGINT NOT NULL,
    Customer_Email VARCHAR(50) NOT NULL,
    Customer_Address VARCHAR(100) NOT NULL,
    Created_at TIMESTAMP NOT NULL);
    
	ALTER TABLE Customers AUTO_INCREMENT=10001;
    
-- Suppliers Table
                                        
    CREATE TABLE Suppliers(
    Supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    Supplier_Name VARCHAR(255) NOT NULL,
    Contact_Person VARCHAR(100) NOT NULL ,
    Contact_Number VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    created_date TIMESTAMP NOT NULL);
    
    ALTER TABLE Suppliers AUTO_INCREMENT=3001;
    
-- Spare_Part Table
                                        
    CREATE TABLE Spare_Part(
    Part_id INT PRIMARY KEY AUTO_INCREMENT,
    Part_Name VARCHAR(100) NOT NULL,
    Part_Number VARCHAR(50) NOT NULL,
    Stock_quantity INT NOT NULL,
    Reorder_level INT NOT NULL,
    Supplier_id INT NOT NULL,
    Created_id TIMESTAMP NOT NULL,
    FOREIGN KEY(Supplier_id) REFERENCES Suppliers(Supplier_id));
    
    
-- Vehicles_Sale Table
    
    CREATE TABLE Vehicles_Sales(
    Vehicles_Sale_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    Customer_id INT NOT NULL,
    Vehicle_id INT NOT NULL,
    Sale_Date TIMESTAMP NOT NULL,
    quantity INT NOT NULL,
    Total_Price DECIMAL(12,2),
    Payment_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY(Vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY(payment_id) REFERENCES Payments(payment_id));
    
	ALTER TABLE Vehicles_Sales AUTO_INCREMENT=5001;

    
-- Spare_parts_Sales Table	
                                    
    CREATE TABLE Spare_parts_sales(
    Spare_Sale_id INT PRIMARY KEY AUTO_INCREMENT ,
    Customer_id INT NOT NULl,
    user_id INT NOT NULL,Part_id INT NOT NULL,
    Sale_Date TIMESTAMP NOT NULL,
    quantity INT NOT NULL,
    Total_Price DECIMAL(10,2),
    Payment_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(Customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY(Part_id) REFERENCES Spare_part(part_id),
    FOREIGN KEY(Payment_id) REFERENCES Payments(payment_id));
    
	ALTER TABLE Spare_parts_sales AUTO_INCREMENT=401;
    

-- Purchase_Orders  Table 
                            
    CREATE TABLE Purchase_Orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT ,
    user_id INT NOT NULL,
    Supplier_id INT NOT NULL,
    Order_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    part_id INT NOT NULL,
    order_quantity INT NOT NULL,
    Total_Amount DECIMAL(12,2) NOT NULL,
    Order_Status ENUM('Completed','Pending','Cancelled'),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(Supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY(part_id) REFERENCES Spare_part(part_id) );
    
    ALTER TABLE Purchase_orders AUTO_INCREMENT=1001;
    
-- Stock Transactions Table 
                                
	CREATE TABLE Stock_Transactions(
    Transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    Item_Type VARCHAR(50) NOT NULL,
    Item_id INT NOT NULL,
    Transaction_type VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
	Transaction_Date TIMESTAMP DEFAULT current_timestamp,
    FOREIGN KEY(Item_id) REFERENCES Vehicles(Vehicle_id),
    FOREIGN KEY(Item_Id) REFERENCES Spare_Part(Part_Id));

    DESC Stock_Transactions;
    drop table stock_Transactions;
    ALTER TABLE Stock_Transactions AUTO_INCREMENT=55290;
    
-- Invoices Table 
                                
    CREATE TABLE Invoices(
    Invoice_Id INT PRIMARY KEY AUTO_INCREMENT,
    Order_id INT ,Vehicles_Sale_id INT ,
    Issue_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(15,2) NOT NULL,
    Payment_Status ENUM('Paid','Cancelled','Pending'),
    FOREIGN KEY(Order_id) REFERENCES Purchase_Orders(order_id),
    FOREIGN KEY(Vehicles_Sale_id) REFERENCES Vehicles_Sales(Vehicles_Sale_id) );
    
    
    ALTER TABLE Invoices AUTO_INCREMENT=1411;
    
    
-- -----------------------------------------------------------------------
-- SECTION 3 :  INSERTION DATA
-- -----------------------------------------------------------------------
	
    INSERT INTO Roles(Role_Name,Created_at)VALUES
    ("ADMIN",'2024-01-01 12:00:45'),
    ("MANAGER",'2024-01-05 12:00:00'),
    ("SALES",'2024-01-7 02:45:00');
    
    INSERT INTO Users(User_Name,Password_Hash,Role_id,Created_at)VALUES
    (" Mr. Vishal Agarwal","Admin@101",1,'2024-01-01 12:00:45'),
    ("Mr.Varun Mudgil","Manager@102",2,'2024-01-06 12:30:00'),
    ("Ms.Priya Patil","manager@104",2,'2024-01-07 15:20:00'),
    ("Mr. Rajesh Nair","sale@104",3,'2024-01-09 10:30:45'),
    ("Mr.Elvin Martins","sale@105",3,'2024-01-11 20:35:00');
    
    INSERT INTO Fuel_Type(FuelType_Name)VALUES
    ("PETROL"),("DIESEL"),
    ("HYBRID"),("ELECTRIC");
    
	INSERT INTO Vehicles(Model_Name,Brand_Name,Variant,Fuel_id,Price,Stock_quantity,Created_at)VALUES
    ("Ix1","BMW","GRAN",4,4990000,25,'2024-06-21 01:20:00'),("X1","BMW","SUV",2,5150000,14,'2024-05-25 12:50:00'),
    ("IXdrive50","BMW","Gran",4,13950000,30,'2024-08-24 22:01:00'),("M2","BMW","GMBH",1,10300000,30,'2024-12-21 21:20:00'),
    ("XM","BMW","GMBH",3,26000000,25,'2024-11-14 15:10:55'),("7 Series","BMW","Sedans",1,18420000,18,'2024-09-30 01:20:00'),
    ("I7","BMW","GRAN",4,20500000,15,'2025-01-12 19:19:00'),("X5","BMW","SUV",2,9780000,16,'2025-04-23 20:56:00'),
    ("Z4","BMW","GMBH",1,9290000,23,'2025-03-30 16:40:00'),("3 Series","BMW","sedans",1,6260000,20,'2024-08-14 04:36:00'),
    ("M340I","BMW","GMBH",1,7590000,11,'2024-12-28 17:33:00'),("M5","BMW","GMBH",4,19900000,21,'2025-03-05 14:20:00'),
    ("I4","BMW","GRAN",4,7250000,50,'2025-02-19 15:43:00'),("2 Serices","BMW","Sedans",1,4690000,16,'2025-04-30 16:44:00'),
    ("X3","BMW","SUV",2,7580000,22,'2024-08-17 18:33:00'),("I5 M60 Drive","BMW","GRAN",4,11950000,40,'2025-05-31 22:58:00'),
    ("X5","BMW","SUV",2,9780000,10,'2025-03-17 5:17:00'),("M4 CS","BMW","GMBH",1,18900000,18,'2025-06-30 15:00:00'),
    ("5 Series ","BMW","Seadans",1,7590000,20,'2025-06-13 23:48:00'),("M8 Comp ","BMW","GMBH",1,24400000,35,'2024-10-26 14:28:00'),
    ("X7","BMW","SUV",2,13140000,40,'2024-11-27 06:23:00');   
    
    INSERT INTO Suppliers(Supplier_Name,Contact_person,Contact_Number,Email,Address,created_date)VALUES
    ("Navnit Motors Pvt Ltd","Mr.Ankit Varma","+912266777777","info@navnitgroup.com","Mumbai-400058",'2024-06-30'),
    ("Chetak Auto Spares","Mr.Rajesh Patil","+919822283699","info@chetakauto.com","Pune-411040",'2024-07-14 12:00:58'),
    ("Namo Automobiles","Mr.jaynakay joshi","+918044566750","info@namoautomobiles.com","Hyderabad-5000003",'2024-06-20 1:00:58'),
    ("Infinity Cars Pvt Ltd","Ms.Pooja Choudary","+912267145100","info@infinity-group.in","Mumbai-400706",'2024-08-05 14:00:00'),
    ("Tirth Motors","Mr.Yash Jadhav","+918000662719","info@tirthmotors.com","Sangavi-411027",'2024-11-02 12:00:58'),
    ("Lujo Autocorp","Ms.Pallavi Patil","+919158068068","info@lujoautocorp.com","Pune-411005",'2025-02-06 17:30:00'),
    ("Panna Motors","Mr.karan sharma","+918956234117","info@pannamotors.in","Pune-411042",'2024-09-23 05:00:20'),
    ("Makson Luxury Cars LLP","Mr.Vishal Patil","+919823010101","info@makson.co.in","Nagpur-560021",'2024-10-10 10:00:00'),
    ("Abhijit Enterprises","Mr.Sachin Mane","+918046033608","info@abhijit.com","Pune-412205",'2025-03-25 02:35:22'),
    ("Sk Motors","Mr.Balaji Naik","+918954712325","info@skmotors.in","Mumbai-400706",'2025-05-22 07:09:38'),
    ("OKCAR Hub","Ms.Jayshree Varma","+919756451232","info@okcarhub.co.in","Pune-411014",'2024-12-31 12:00:00');
    
	INSERT INTO Spare_Part(Part_Name, Part_Number, Stock_quantity, Reorder_level, Supplier_id, Created_id) VALUES
	('BMW Brake Pad Set - Front', 'BMW-BPF-G20-001', 75, 10, 3001, '2024-06-15 10:00:00'),
    ('BMW Oil Filter - N20 Engine', 'BMW-OF-N20-002', 80, 15, 3002, '2024-07-20 11:30:00'),
	('BMW Air Filter - F30 Series', 'BMW-AF-F30-003', 60, 8, 3003, '2024-07-25 14:00:00'),
    ('BMW Spark Plugs - B58 Engine (Set of 6)', 'BMW-SP-B58-004', 50, 7, 3004, '2025-01-30 09:00:00'),
	('BMW Wiper Blades - F10 Front Pair', 'BMW-WB-F10-005', 90, 12, 3005, '2024-06-05 16:15:00'),
    ('BMW Alternator - E90 Series', 'BMW-ALT-E90-006', 30, 5, 3006, '2024-07-10 13:45:00'),
	('BMW Starter Motor - X5 E70', 'BMW-SM-X5-007', 25, 5, 3007, '2024-11-15 10:20:00'),
    ('BMW Water Pump - N54 Engine', 'BMW-WP-N54-008', 40, 6, 3008, '2025-02-20 08:50:00'),
	('BMW Fuel Pump - G30 Series', 'BMW-FP-G30-009', 35, 5, 3009, '2025-02-25 17:00:00'),
    ('BMW Radiator - F30 3 Series', 'BMW-RAD-F30-010', 20, 4, 3010, '2024-08-01 11:00:00'),
	('BMW Headlight Assembly - Right (G20)', 'BMW-HLA-G20-011', 15, 3, 3011, '2024-09-05 14:20:00'),
    ('BMW Taillight Assembly - Left (F10)', 'BMW-TLA-F10-012', 18, 3, 3001, '2024-08-10 09:40:00'),
	('BMW Door Handle - Exterior Front Left (E90)', 'BMW-DHF-E90-013', 45, 7, 3002, '2025-03-15 12:10:00'),
    ('BMW Power Window Motor - Rear Right (F30)', 'BMW-PWM-F30-014', 38, 6, 3005, '2024-10-20 15:30:00'),
	('BMW Suspension Strut - Front Left (G05)', 'BMW-SS-G05-015', 22, 4, 3004, '2024-10-25 10:05:00'),
    ('BMW Control Arm - Front Lower Left (F10)', 'BMW-CAL-F10-016', 28, 5, 3005, '2025-03-30 13:55:00'),
	('BMW Tie Rod End - Outer Left (E90)', 'BMW-TRE-E90-017', 55, 8, 3006, '2025-04-05 08:25:00'),
    ('BMW Wheel Bearing Kit - Front (G20)', 'BMW-WBK-G20-018', 32, 5, 3007, '2024-09-10 16:40:00'),
	('BMW CV Joint Boot Kit (F30)', 'BMW-CJBK-F30-019', 65, 9, 3008, '2025-04-15 11:10:00'),
    ('BMW Exhaust Muffler - Rear (E90)', 'BMW-EM-E90-020', 12, 3, 3009, '2024-11-20 14:00:00'),
	('BMW Catalytic Converter - N55 Engine', 'BMW-CC-N55-021', 10, 2, 3010, '2024-09-25 09:30:00'),
    ('BMW Oxygen Sensor - Pre-Cat (F10)', 'BMW-OS-F10-022', 48, 7, 3011, '2025-03-30 12:00:00'),
	('BMW Crankshaft Sensor - B48 Engine', 'BMW-CS-B48-023', 30, 5, 3008, '2024-05-05 15:45:00'),
    ('BMW Camshaft Sensor - N20 Engine', 'BMW-CMS-N20-024', 33, 5, 3002, '2024-12-10 10:10:00'),
	('BMW Throttle Body - N52 Engine', 'BMW-TB-N52-025', 27, 4, 3003, '2024-05-15 13:20:00'),
    ('BMW Mass Air Flow Sensor - M54 Engine', 'BMW-MAF-M54-026', 29, 4, 3004, '2025-05-20 08:00:00'),
	('BMW Ignition Coil - N55 Engine', 'BMW-IC-N55-027', 42, 6, 3005, '2025-05-25 16:00:00'),
    ('BMW Fuel Injector - B58 Engine', 'BMW-FI-B58-028', 36, 5, 3006, '2025-05-30 11:50:00'),
    ('BMW PCV Valve - N52 Engine', 'BMW-PCV-N52-029', 58, 8, 3007, '2024-06-05 14:10:00'),
    ('BMW Engine Mount - Left (F30)', 'BMW-EML-F30-030', 24, 4, 3008, '2024-08-10 09:00:00'),
    ('BMW Transmission Mount (G20)', 'BMW-TM-G20-031', 20, 3, 3009, '2024-06-30 12:30:00');
    
    INSERT INTO Customers(Customer_Name,Customer_Email,Contact_Number,Customer_Address,Created_at)VALUES
    ("Vishal Haribhau Dube","dubevishal707@gmail.com",9373181355,"Parbhani-431401",'2024-11-30 10:00:00'),
    ("Avinash Shubash Kate","avikate52@gmail.com",9022365610,"Yawatmal-440612",'2024-08-16'),
    ("Tejas Manohar Khilari","tejaskhilari78@gmail.com",9922010833,"Hingoli-450056",'2024-07-28 12:00:00'),
    ("Sairaj Santosh Suroshe","saisuroshe12@gmail.com",9322655209,"Mumbai-400706",'2025-12-25 14:00:00'),
    ("Kedar Balaji Dube","kedardube2013@gmail.com",9604350401,"Parbhani-431401",'2024-12-12 10:00:30'),
    ("Swaraj Balaji Dube","swaraj201@gmail.com",9685743212,"Parbhani-431401",'2024-08-30 14:05:00'),
    ("Vishal Keshvarao Gaikwad","vishal2106@gmail.com",6523410202,"Nashik-461601",'2025-02-14 16:10:45'),
    ("Raj Vishundas Shinde","shinderaj05@gmail.com",9865324578,"Latur-520711",'2024-10-14 23:52:30'),
    ("Ganesh Uttamrao Kale","ganesh45@gmail.com",9687544625,"Nagpur-150522",'2024-12-25 1:00:00'),
    ("Ajinkya Pavan Korde","kordeaju29@gmail.com",9452638978,"Partur-235601",'2024-11-20 11:32:15'),
    ("Tushar Anantarao Pawar","tusharp98@gmail.com",9656451232,"Satara-450231",'2025-04-23 15:20:22'),
    ("Yash Ramrao Jadhav","yash52@gmail.com",7845129636,"Jalna-560082",'2024-09-23 20:16:09'),
    ("Shinde Dipak Akosh","shindedipak55@gmail.com",9865231245,"Nashik-520011",'2024-11-01 12:00:02'),
    ("Pawar Ankita Udhavrao","anikita18@gmail.com",8956475288,"Karad-470023",'2024-09-19 05:17:00'),
	("Sivam Vijay Kadam","sivam65@gmail.com",7945653225,"Daund-560012",'2025-05-31 11:00:00'),
    ("Shivaji Sambhaji Shinde","sshivaji55@gmail.com",9984525658,"Manmad-520401",'2024-09-21 18:36:12'),
    ("Mahesh Prabhakar Jadhav","mahesh88@gmail.com",9632587414,"Nagpur-150231",'2025-03-25 22:00:00'),
    ("Nitin Manikrao Garud","nitin98@gmail.com",8954581246,"Pune-410011",'2024-12-01 14:52:30'),
    ("Om Ganesh Dube","om78@gmail.com",7789456525,"Mumbai-400701",'2024-07-02 08:00:00'),
    ("Datta Shivaji Chapke","datta56@gmail.com",8645599475,"Kohlapur-850121",'2025-06-18 15:02:30'),
    ("Nagesh Subhash Kure","nagesh87@gmail.com",8845798655,"Solapur-760015",'2024-12-28 01:00:00'),
    ("Ravi Udhavrao Deshmukh","ravinath01@gmail.com",7858693652,"Belapur-710052",'2025-06-23 12:00:30'),
    ("Karan Bapurao Deshpande","karan87@gmail.com",9865784595,"Jalna-550082",'2024-10-11 05:00:00'),
    ("Krushana Baban Kale","krushana102@gmail.com",7874562536,"Nanded-461602",'2025-05-01 12:30:00'),
    ("Lakan Sanjay More","lakan77@gmail.com",9656457485,"Satara-450231",'2025-06-21 19:00:00'),
    ("Rajesh tushar Gore","raju85@gmail.com",7485961425,"Latur-250711",'2024-08-02 23:00:00');
    
	INSERT INTO Payments(Payment_type) VALUES
    ("CASH !"),("CREDIT CARDS !"),
    ("DEBIT CARDS !"),("WALLETS !"),
    ("BANK TRANF !"),("BNPL !");

    
    INSERT INTO Spare_parts_sales(customer_id,user_id,part_id,sale_date,quantity,total_price,Payment_id)VALUES
    (10005,104,05,'2025-01-01 14:00:00',25,7800,2),(10012,105,22,'2025-04-23 04:00:00',25,65200,5),
    (10020,105,15,'2025-01-30 11:30:00',15,20000,1),(10015,105,06,'2024-08-10 15:32:00',20,11000,4),
    (10005,104,19,'2025-05-20 18:33:00',30,28000,3),(10007,105,25,'2024-12-21 20:36:00',02,17030,6),
    (10007,104,31,'2024-09-23 05:31:00',05,15000,4),(10006,105,31,'2025-02-18 07:14:00',10,30000,1),
    (10001,104,24,'2025-02-11 02:00:00',10,9360,2),(10009,105,22,'2025-06-15 13:33:00',20,55950,5),
    (10012,105,09,'2025-02-25 15:56:00',10,15500,2),(10025,104,14,'2025-05-31 22:00:00',1,5000,5),
    (10001,104,17,'2025-06-11 08:32:00',10,6500,1),(10015,104,25,'2024-09-25 22:00:00',14,2600,2),
    (10005,104,08,'2025-05-25 12:00:00',25,5500,4),(10016,105,14,'2024-12-23 19:00:00',22,25000,2),
    (10018,105,17,'2025-05-05 02:30:00',20,13000,3),(10001,105,29,'2024-08-15 23:00:00',20,55500,1),
    (10006,105,11,'2024-10-10 18:56:00',8,2500,3),(10025,104,15,'2025-03-23 12:00:00',20,3600,2);

    INSERT INTO Vehicles_Sales(customer_id,vehicle_id,sale_date,quantity,total_price,payment_id,user_id)VALUES
    (10005,511,'2025-01-15 10:00:00',3,22770000,2,104),(10010,514,'2024-10-20 12:45:20',1,4690000,1,105),
    (10007,513,'2024-11-05 14:55:00',1,7250000,3,104),(10020,517,'2024-09-21 12:00:00',1,9780000,2,104),
	(10005,516,'2025-01-01 11:31:00',2,11950000,1,105),(10005,506,'2024-10-21 23:20:00',2,36840000,4,104),
	(10005,509,'2024-09-05 20:00:00',5,46450000,5,104),(10005,520,'2025-02-12 16:30:00',1,24400000,6,104),
	(10005,505,'2025-04-04 09:00:00',2,52000000,2,104),(10005,514,'2024-12-15 05:31:00',3,14070000,4,104),
    (10005,516,'2024-10-01 12:36:00',1,11950000,3,105),(10005,521,'2025-05-31 18:09:22',1,13140000,1,105),
    (10005,512,'2024-12-21 14:50:00',2,39800000,2,105),(10005,502,'2024-11-30 21:30:00',2,10300000,1,104),
    (10005,507,'2025-03-15 22:29:00',2,4100000,1,105),(10005,513,'2025-04-12 09:31:00',2,14500000,1,104),
    (10005,510,'2024-12-05 03:15:00',1,6260000,2,105),(10005,511,'2025-05-16 23:15:00',2,15180000,3,104),
    (10005,511,'2025-06-21 22:10:00',1,7590000,4,105),(10005,508,'2025-04-22 10:00:00',1,9780000,2,104),
    (10005,508,'2025-04-22 10:00:00',1,9780000,3,105),(10005,505,'2025-03-10 11:23:00',1,26000000,2,105);
    
    INSERT INTO Purchase_Orders(user_id,supplier_id,order_date,total_amount,part_id,order_quantity,order_status)VALUES
    (102,3003,'2024-10-12 10:20:00',25000,4,20,'Completed'),(103,3005,'2024-12-31 05:20:00',25000,8,15,'Completed'),
    (103,3009,'2025-03-22 12:00:00',54200,5,50,'Pending'),(102,3011,now(),25130,6,10,'Cancelled'),
    (102,3008,'2024-11-30 15:30:00',35630,1,17,'Pending'),(103,3005,'2025-01-23 18:00:00',5600,7,2,'Completed'),
    (102,3003,'2025-03-25 06:32:00',50000,6,50,'Completed'),(102,3007,'2024-10-15 10:00:00',45000,2,20,'Pending'),
    (103,3005,now(),15230,5,25,'Completed'),(102,3009,'2025-04-22 17:38:33',65000,22,3,'Completed'),
    (102,3006,'2025-02-14 02:36:00',23000,9,05,'Completed'),(103,3004,'2024-11-20 07:56:00',51056,4,25,'Completed'),
    (102,3007,'2025-03-11 06:30:00',65000,8,20,'Completed'),(103,3006,'2025-04-25 12:31:00',30000,4,10,'Cancelled'),
    (102,3005,now(),35120,7,20,'Completed');
    
    INSERT INTO Stock_Transactions(Item_type,Item_id,Transaction_type,quantity,Transaction_Date)VALUES
    ("Vehicle",511,"OutBound",3,'2025-01-15 11:00:00'),("Vehicle",514,"OutBound",1,'2024-10-20 01:00:00'),("Vehicle",513,"OutBound",2,'2025-11-05 15:31:00'),
    ("Vehicle",506,"OutBound",1,'2024-10-21 23:22:00'),("Vehicle",516,"OutBound",1,'2025-01-01 12:00:00'),("Vehicle",520,"OutBound",1,'2025-02-15 22:00:00'),
    ("Vehicle",513,"OutBound",1,'2025-04-12 19:00:00'),("Vehicle",505,"OutBound",1,'2025-03-10 11:40:00'),("Vehicle",510,"OutBound",1,'2024-12-05 4:35:00'),
    ("Vehicle",508,"OutBound",2,'2025-04-22 11:00:00'),("Vehicle",521,"OutBound",1,'2025-05-31 01:00:00'),("Vehicle",512,"OutBound",1,'2024-12-21 22:00:00'),
    ("Vehicle",509,"OutBound",1,'2024-09-05 23:25:00'), -- Vehicle
    ("spare_part",15,"InBound",20,'2024-10-12 10:20:00'),("spare_part",1,"OutBound",25,'2025-04-23 05:20:00'),
    ("spare_part",6,"OutBound",20,'2024-08-10 15:20:00'),("spare_part",19,"InBound",30,'2025-05-20 19:20:00'),
    ("spare_part",25,"OutBound",2,'2024-12-21 21:20:00'),("spare_part",5,"OutBound",25,'2024-11-12 10:20:00'),
    ("spare_part",9,"OutBound",10,'2024-10-12 10:20:00'),("spare_part",15,"InBound",5,'2024-10-12 10:20:00'),
    ("spare_part",15,"InBound",20,'2024-10-12 10:20:00'),("spare_part",31,"InBound",15,'2025-04-12 10:20:00');
    
    INSERT INTO Invoices(order_id,vehicles_sale_id,issue_date,amount,payment_status)VALUES
    (1001, NULL, '2024-10-12 10:20:00', 25000.00, 'Paid'),(1002, NULL, '2024-12-31 05:20:00', 25000.00, 'Paid'),
	(1003, NULL, '2025-03-22 12:00:00', 54200.00, 'Pending'),(1004, NULL, '2025-03-22 12:00:00', 25130.00, 'Cancelled'),
	(1005, NULL, '2024-11-30 15:30:00', 35630.00, 'Pending'),(1006, NULL, '2025-01-23 18:00:00', 5600.00, 'Paid'),
	(1007, NULL, '2025-03-25 06:32:00', 50000.00, 'Paid'),(1008, NULL, '2024-10-15 10:00:00', 45000.00, 'Pending'),
	(1009, NULL, '2025-04-22 17:38:33', 15230.00, 'Paid'),(1010, NULL, '2025-02-14 02:36:00', 65000.00, 'Paid'),
    (1011, NULL, '2025-02-14 02:00:12', 23000.00, 'Paid'),(1012, NULL, '2025-11-20 06:11:00', 51056.00, 'Pending'),
    (1013, NULL, '2025-03-11 17:38:33', 65000.00, 'Paid'),(1014, NULL, '2025-04-25 15:08:00', 30000.00, 'Cancelled'),
    (1015, NULL, '2025-08-17 17:38:33', 35120.00, 'Paid'), -- End inoice Purchase_orders
    (NULL, 5001, '2025-01-15 10:00:00', 22770000.00, 'Paid'),(NULL, 5002, '2024-10-20 12:45:20', 4690000.00, 'Pending'),
	(NULL, 5003, '2024-11-05 14:55:00', 7250000.00, 'Paid'),(NULL, 5004, '2024-09-21 12:00:00', 9780000.00, 'Paid'),
	(NULL, 5005, '2025-01-01 11:31:00', 23900000.00, 'Cancelled'),(NULL, 5006, '2024-10-21 23:20:00', 36840000.00, 'Paid'),
    (NULL, 5007, '2024-09-05 20:01:00', 46450000.00, 'Paid'),(NULL, 5008, '2025-02-12 16:30:00', 24400000.00, 'Paid'),
    (NULL, 5009, '2025-04-04 09:05:00', 52000000.00, 'Paid'),(NULL, 5010, '2024-12-15 05:31:00', 14070000.00, 'Paid'),
    (NULL, 5011, '2024-10-01 12:40:00', 11950000.00, 'Paid'),(NULL, 5012, '2025-05-31 18:31:00', 13140000.00, 'Pending'),
    (NULL, 5013, '2024-12-31 14:55:00', 39800000.00, 'Cancelled'),(NULL, 5014, '2024-11-30 21:50:00', 10300000.00, 'Paid'),
    (NULL, 5015, '2025-03-15 22:31:00', 4100000.00, 'Pending');
		

    
-- -----------------------------------------------------------------------
-- SECTION 3:  RETRIVES DATA
-- -----------------------------------------------------------------------
    
    SELECT * FROM Roles;
    SELECT * FROM Users;
	SELECT * FROM Suppliers;
    SELECT * FROM Customers;
    SELECT * FROM spare_part;
    SELECT * FROM spare_parts_sales;
    SELECT * FROM vehicles;
    SELECT * FROM vehicles_sales;
    SELECT * FROM payments;
    SELECT * FROM purchase_orders;
    SELECT * FROM  stock_transactions;
    SELECT * FROM invoices;
    

-- -----------------------------------------------------------------------
-- SECTION 4 :  PROBLEM SOLVE
-- -----------------------------------------------------------------------


-- Problem -1 Generate Monthly Sales Report (Find the best-selling months for vehicles.)
    
    SELECT DATE_FORMAT(Sale_Date,'%Y-%M') AS Month, SUM(total_price) AS Tsale_rev
    FROM Vehicles_Sales GROUP BY month ORDER BY Month DESC LIMIT 5;
    
-- Problem -2 Top Selling Vehicles Report (Find the most popular vehicle models.)
    
    SELECT v.Brand_Name,v.Model_Name,SUM(vs.quantity) as total_sale_quantity,
    COUNT(vs.Vehicles_sale_id) AS Sales
    FROM Vehicles_sales vs
    JOIN Vehicles v ON vs.Vehicle_id=v.Vehicle_id
    GROUP BY 
    v.Brand_Name,v.Model_Name
    ORDER BY 
    Total_Sale_quantity DESC , Sales DESC LIMIT 4;
    
-- Problem -3 Low Stock Alert for Spare Parts (Avoid outofstocks and ensure timely reorders.)
    
    SELECT sp.part_id ,sp.Part_Name,sp.Part_Number,sp.Stock_quantity,sp.reorder_level,
    s.Supplier_Name,s.Contact_Number FROM Spare_part sp 
    JOIN 
    Suppliers s ON sp.Supplier_id=s.Supplier_id
    JOIN 
    spare_parts_sales sps ON sps.part_id=sp.part_id
    WHERE 
    5 <= (sp.stock_quantity-sps.quantity) 
    ORDER BY 
    sp.stock_quantity ASC;
    
-- Problem -4 Sales Trends Over Time (For Growth Analysis for Track daily sales trends).
   
    SELECT DATE_FORMAT(vs.Sale_Date,'%Y-%M-%D') AS Day ,v.Model_Name,
    SUM(vs.quantity) AS Total_quantity,SUM(vs.Total_Price) AS Total_Amount,
    COUNT(vs.vehicles_sale_id) as Daiy_Sale
    FROM Vehicles_Sales vs 
    JOIN Vehicles v ON vs.vehicle_id=v.vehicle_id
    GROUP BY Day,v.model_name ORDER BY Total_Amount DESC ;
    
    
-- Problem -5 Vehicle Stock Overview (Current Inventory  for Quick dashboard to see how many vehicles are in stock.)
    
    SELECT v.vehicle_id,v.Brand_Name,v.Model_Name,v.stock_quantity ,
    v.stock_quantity-sum(vs.quantity) as Avl_stock
    FROM Vehicles v 
    RIGHT JOIN vehicles_sales vs 
    ON v.vehicle_id = vs.vehicle_id
    GROUP BY v.vehicle_id,v.brand_Name,v.Model_Name,v.stock_quantity;
    
   select * from current_stoctvehicle;

-- Problem -6 Spare Parts Sales Analysis.
   SELECT sp.Part_id,sp.part_Name,sp.Part_Number,
   SUM(sps.quantity) AS Total_quantity ,SUM(sps.Total_price) AS Amounts
   FROM spare_part sp 
   INNER JOIN spare_parts_sales sps
   ON sp.part_id = sps.part_id 
   GROUP BY sp.part_id,sp.part_Name,sp.part_Number ORDER BY Amounts DESC ;
   
   
   
-- Problem -7 Update Vehicle Stock After Sale.
   
   CREATE TABLE Vehicle_stock_After_sale(vehicles_id INT PRIMARY KEY,Model_Name VARCHAR(50),Brand_Name VARCHAR(50),fuel_id INT ,
   Price DECIMAL(15,2),Stock_quantity INT,Currentavl_stock INT);
   DESC Vehicle_stock_After_sale;
   
   DELIMITER //
   CREATE TRIGGER Vehicle_stock_After_Sale
   AFTER UPDATE ON Vehicles
   FOR EACH ROW 
   BEGIN
   INSERT INTO Vehicle_stock_After_sale(vehicles_id,Model_Name,Brand_Name,Fuel_id,Price,stock_quantity,currentavl_stock)
   VALUES(old.vehicle_id,old.model_Name,old.Brand_Name,old.fuel_id,old.price,old.stock_quantity,new.stock_quantity);
   END //
   DELIMITER //
   
   UPDATE vehicles v JOIN (SELECT vs.vehicle_id ,SUM(vs.quantity) AS sale_quantity FROM Vehicles_sales vs GROUP BY vs.vehicle_id ) vss 
   ON v.vehicle_id = vss.vehicle_id 
   SET v.stock_quantity = v.stock_quantity-vss.sale_quantity;
   
   START TRANSACTION;
   
   SELECT * FROM Vehicle_stock_After_Sale;
   
   update vehicles v  JOIN  vehicle_after_sale AS vsa 
   ON v.vehicle_id = vsa.vehicles_id
   SET v.stock_quantity = vsa.stock_quantity;
   
   select * from vehicle_after_sale;
   
-- Problem -8 Update Spare Parts Stock After Sale.

   SELECT s.part_id,s.part_Name,s.part_Number,s.stock_quantity,
   s.stock_quantity-(SELECT SUM(sp.quantity) FROM Spare_Parts_Sales sp WHERE sp.part_id =s.part_id ) AS Avl_stock
   FROM Spare_part s ;
   
-- Problem -9  Vehicle Sales  Generate

     SELECT iv.invoice_id ,iv.vehicles_sale_id,vs.customer_id ,v.Model_Name,
	 iv.issue_date, iv.Amount, iv.Payment_status
	FROM Invoices iv
	JOIN
	  vehicles_sales vs ON iv.vehicles_sale_id = vs.vehicles_sale_id
	JOIN
	  Vehicles v ON v.vehicle_id = vs.Vehicle_id;
      
		-- Spare_part Generate
        
	 SELECT iv.invoice_id,iv.order_id,po.supplier_id,po.part_id,sp.part_Name,sp.Part_Number,iv.issue_date,iv.amount,iv.payment_status
     FROM invoices iv 
     JOIN 
     purchase_orders po ON po.order_id = iv.order_id
     JOIN 
     spare_part sp ON sp.part_id = po.part_id;
   

-- Problem -10. Mark Overdue Invoices for Follow-Up.
    
    SELECT invoice_id,
    CASE
        WHEN payment_status = "Paid" THEN 'Completed'
        WHEN payment_status = "Pending" THEN 'Incomplete'
        ELSE 'Canceled'
    END AS Status
FROM
    invoices;
    

    
    