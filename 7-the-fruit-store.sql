drop database if exists fruit_store;
create database if not exists fruit_store;
use fruit_store;

create table if not exists purchases (
  id BIGINT unsigned primary key auto_increment,
  customer varchar(255) not null,
  item varchar(255) not null,
  quantity decimal(12,2) not null,
  price_per_kg decimal(12,2) not null,
  created_at datetime default current_timestamp,
  updated_at datetime default current_timestamp on update current_timestamp
);


insert into purchases
(customer, item, quantity, price_per_kg)
values
("Jack","Pears", 0.75, 4.25),
("Jules","Apples", 3.2, 2.75),
("Josephine","Oranges", 1.8, 4.49),
("Jill","Bananas", 2, 2.99),
("Jack","Mangoes", 0.5, 8.25),
("Jane","Oranges", 0.8, 6.25),
("Jim","Apples", 1.5, 4.45);


SELECT * FROM purchases;

SELECT 5*334235425235 AS some_number;

SELECT customer, SUM(quantity)
FROM purchases
GROUP BY customer;

SELECT MIN(customer) FROM purchases;

SELECT UPPER(item) FROM purchases;
SELECT SUBSTR(customer, 1,1) FROM purchases;


SELECT quantity, FLOOR(quantity), CEIL(quantity) FROM purchases;

SELECT customer, item, ROUND(quantity * price_per_kg, 2) FROM purchases;


SELECT customer, item, ROUND(quantity * price_per_kg, 2) as item_total FROM purchases;

SELECT item, AVG(price_per_kg) FROM purchases GROUP BY item ORDER BY item;

SELECT item, price_per_kg FROM purchases ORDER BY item;


/*  This is not a normalised table, so this query makes sense: */
SELECT item, AVG(price_per_kg) FROM purchases GROUP BY item;

SELECT price_per_kg FROM purchases WHERE price_per_kg > AVG(price_per_kg);

SELECT AVG(price_per_kg) FROM purchases;

/* (Who's paying too much?) */

SELECT item, customer, price_per_kg
FROM purchases
WHERE price_per_kg > (
	SELECT AVG(price_per_kg) FROM purchases
);


/* (Who's paying too much -- for apples?) */

SELECT item, customer, price_per_kg
FROM purchases
WHERE item = "Apples"
and price_per_kg > (
	SELECT AVG(price_per_kg) FROM purchases WHERE item = "Apples"
);

/* Note the double use of apples */
/* What if I want this grouped by item?  That's a next week concern! */



SELECT item, customer FROM purchases WHERE item SOUNDS LIKE "wares";

SELECT item, customer FROM purchases WHERE item SOUNDS LIKE "pairs";

SELECT item, customer FROM purchases WHERE item SOUNDS LIKE "peers";

/* I conclude that I don't understand sounds like. */

