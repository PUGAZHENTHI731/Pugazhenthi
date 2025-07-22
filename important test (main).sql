create table customers (customer_id int ,name varchar(20),email varchar(30))
insert into customers values (101,'pugal','pugalpugal984@gmail.com')
insert into customers values (102,'dinesh','dinesh2005@gmail.com')
insert into customers values (103,'mani','mani2006@gmail.com')
--------------------------------1
create table orders (ordre_id int,customer_id int,order_date date,total_amount int )
insert into orders values (1,101,'2025-02-10',5000)
insert into orders values (2,102,'2025-07-10',7000)
insert into orders values (3,101,'2025-03-30',6000)


--------------------------------100000
create table orderitems (order_items_id int , order_id int,prodect_id int,quantity int ,price int)
insert into orderitems values (100001,1,1001,2,100),(100002,2,1003,3,210)
insert into orderitems values (100003,1,1002,1,200),(100004,3,1004,2,900)

----------------------------------------1000
create table products (product_id int ,name varchar(20),category_id int ,price int)
insert into products values (1001,'pulb',10001,50),(1002,'pipe',10001,200)
insert into products values (1003,'powder',10002,70),(1004,'sent',10002,450)

--------------------------------electrical 10001,cosmotics 10002,toys 10003

create table categorys (category_id int ,name varchar(20))
insert into categorys values (10001,'electrical'),(10002,'cosmotics'),(10003,'toys')



select * from customers
select * from orders
select * from orderitems
select * from products
select * from categorys


----------------------------------------------


--1 question

select * from customers where customer_id =
(select customer_id from orders where ordre_id in
(select order_id from orderitems where prodect_id in(select product_id from products where category_id =
(select category_id from categorys where name ='electrical'))))

---------------------------2 question

select top 3total from 
(select sum(total_amount)as total from orders group by customer_id  )as total_spent order by total desc


----------------------------------3 question

select c.category_id,c.name,count(P.product_id)as quantity from products p right join categorys c on p.category_id=c.category_id group by c.category_id ,c.name


------------------------------------4 question

select * from customers where customer_id not in (select distinct(customer_id) from orders)


------------------------------------5 question

select quantity,count(ORDER_ID )as how_much_sale_products from orderitems group by quantity






