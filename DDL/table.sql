-- Customer
CREATE TABLE `customer` (
`customerid` varchar(5) NOT NULL,
`customername` varchar(10) NOT NULL,
`customeremail` varchar(30) DEFAULT NULL,
`phno` varchar(10) DEFAULT NULL,
`address` varchar(70),
PRIMARY KEY (customerid)
);
-- Cart
CREATE TABLE `cart` (
`cartid` varchar(6) NOT NULL,
`customer_id` varchar(5) NOT NULL,
PRIMARY KEY (cartid),
FOREIGN KEY (customer_id) REFERENCES customer(customerid)
);
-- Item
CREATE TABLE `item` (
`itemid` varchar(5) NOT NULL,
`itemname` varchar(30) NOT NULL,
`costperkgl` int NOT NULL,
PRIMARY KEY (itemid)
);
-- Payment
CREATE TABLE `payment` (
`dateoforder` date NOT NULL,

`totalamount` int NOT NULL,
`orderid` varchar(6) NOT NULL,
`customer_id` varchar(5) NOT NULL,
PRIMARY KEY (orderid),
FOREIGN KEY (customer_id) REFERENCES customer(customerid)
);
-- Delivery
CREATE TABLE `delivery` (
`deliverydate` date NOT NULL,
`order_id` varchar(6) NOT NULL,
FOREIGN KEY (order_id) REFERENCES payment(orderid)
);
-- Farmwarehouse
CREATE TABLE `farmwarehouse` (
`quantity` int NOT NULL,
`item_id` varchar(5) NOT NULL,
FOREIGN KEY (item_id) REFERENCES item(itemid)
);

-- formedby
CREATE TABLE `formedby` (
`item_id` varchar(5) NOT NULL,
`cart_id` varchar(6) NOT NULL,
`quantity` int NOT NULL,
FOREIGN KEY (item_id) REFERENCES item(itemid),
FOREIGN KEY (cart_id) REFERENCES cart(cartid)
);