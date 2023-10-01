INSERT INTO `customer` (`customerid`, `customername`,
`customeremail`, `phno`, `address`) VALUES
('CID01', 'Farida', 'farida03@gmail.com',
"9986508325","Banashankari-3rd-stage"),
('CID02', 'Sirish', 'sirish134@gmail.com',
"8657823401","Jayanagar-4th-Block"),
('CID03', 'Veena', 've234@gmail.com',"7685903249","Indiranagar"),
('CID04', 'Sumukh', 'sumukhp203@gmail.com',
"9883265703","JPnagar-7th-Phase"),
('CID05', 'Ajay', 'ajay50@gmail.com',
"8876504893","Banashankari-1st-Stage"),
('CID06', 'Preethi', 'preethiag45@gmail.com',
"9090876546","Whitefield"),
('CID07', 'Deeksha', 'deeksha45@gmail.com',
"9098765403","Koramangala"),
('CID08', 'Jyothi', 'jyothier@gmail.com', "6785409325","Bannerghatta");

INSERT INTO `cart` (`cartid`, `customer_id`) VALUES
('CAID01', 'CID01'),
('CAID02', 'CID02'),
('CAID03', 'CID03'),
('CAID05', 'CID05'),
('CAID06', 'CID06'),
('CAID08', 'CID08');
INSERT INTO `item` (`itemid`, `itemname`,`costperkgl`) VALUES
('IM001','Tomato',1),
('IM002','Onion',44),
('IM003','Milk',45),
('IM004','Cabbage',54),
('IM005','Chilli',61),
('IM006','Apple',120),

('IM007','Banana',38),
('IM008','Chicken',400),
('IM009','Guava',100),
('IM010','Coffee',785);
INSERT INTO `payment` (`dateoforder`,
`totalamount`,`orderid`,`customer_id`) VALUES
('2022-09-08',495,'OID001','CID01'),
('2022-06-07',749,'OID002','CID02'),
('2022-01-09',414,'OID003','CID03'),
('2022-04-04',1280,'OID005','CID05'),
('2022-08-02',76,'OID006','CID06'),
('2022-03-05',252,'OID008','CID08');
INSERT INTO `delivery` (`deliverydate`, `order_id`) VALUES
('2022-09-15', 'OID001'),
('2022-06-14', 'OID002'),
('2022-01-16', 'OID003'),
('2022-04-11', 'OID005'),
('2022-08-09', 'OID006'),
('2022-03-13', 'OID008');

INSERT INTO `farmwarehouse` (`quantity`, `item_id`) VALUES
(34,'IM001'),
(48,'IM002'),
(87,'IM003'),
(23,'IM004'),
(78,'IM005'),
(12,'IM006'),
(45,'IM007'),
(90,'IM008'),
(12,'IM009'),
(67,'IM010');
INSERT INTO `formedBy` (`item_id`, `cart_id`,`quantity`) VALUES
('IM001','CAID01',3),
('IM002','CAID01',4),
('IM003','CAID01',4),
('IM002','CAID02',4),
('IM003','CAID02',4),
('IM005','CAID02',4),
('IM003','CAID03',4),
('IM004','CAID03',4),
('IM006','CAID05',4),
('IM008','CAID05',4),
('IM007','CAID06',4),
('IM010','CAID06',4),
('IM002','CAID08',4);