
-- Quantity of items each customer has in his cart
select * from cart right join formedby on cart.cartid=formedby.cart_id;

-- List of details of customers who were delivered before May 2022
select customerid,customername from customer c inner join payment p
on c.customerid=p.customer_id inner join delivery d on
p.orderid=d.order_id where d.deliverydate<'2022-05-01';

-- List of customers who have not brought anything from the market select c.customerid from customer c WHERE NOT EXISTS (select
ca.customer_id from cart ca where c.customerid=ca.customer_id);

-- Count of customers who ordered a particular item(example here taken as IM010
select count(*) from customer WHERE EXISTS(select cart_id from
formedby where item_id="IM010");

-- Customers who have ordered for more than 500 rupees
select * from customer where customerid in (Select customer_id from
payment where totalamount > 500);

-- Name of customers who have ordered a particular item
select customername from customer where customerid in (select
customer_id from cart where cartid in (select cart_id from formedby
where item_id="IM002"));

-- Selecting the item that is costliest per kg
select * from item where costperkgl in (select max(costperkgl) from item);

-- Number of items in each cart
select cart_id,sum(quantity) from formedby group by cart_id;

-- Select customers who have either IM001 or IM003 in their cart
select customer_id from cart,formedby where cart.cartid =
formedby.cart_id and item_id="IM001"
UNION
select customer_id from cart,formedby where cart.cartid =
formedby.cart_id and item_id="IM003";

-- Select customers who have either IM001 and IM003 in their cart
select customer_id from cart,formedby where cart.cartid =
formedby.cart_id and item_id="IM001"
INTERSECT
select customer_id from cart,formedby where cart.cartid =
formedby.cart_id and item_id="IM003";

-- Creating a view of item_id and cart_id having item id as “IM003”
create view view1 as select item_id,cart_id from formedby where
item_id=”IM003”;

-- Creating view of customer,cart and formedby
create view view2 as select c.customername,f.item_id,f.cart_id from
customer c inner join cart ca on c.customerid=ca.customer_id inner join
formedby f on ca.cartid=f.cart_id;

-- Function to view which orders are eligible for a discount based on total amount

DELIMITER $$
CREATE FUNCTION discount(
totalamount INT
)
RETURNS VARCHAR(20)
BEGIN
DECLARE disceli VARCHAR(20);
IF totalamount > 500 THEN
SET disceli ='Eligible';
ELSEIF totalamount <= 500 THEN
SET disceli = 'NOT ELIGIBLE';
END IF;
RETURN disceli;
END$$
DELIMITER;

-- Trigger to update farm warehouse quantities of that particular item that will be added to the cart

DELIMITER $$
CREATE TRIGGER quanttrigger AFTER INSERT ON formedBy FOR EACH
ROW
BEGIN
UPDATE farmwarehouse
SET farmwarehouse.quantity=farmwarehouse.quantity-NEW.quantity
WHERE farmwarehouse.item_id=NEW.item_id;
END $$
DELIMITER;