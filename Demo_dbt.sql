CREATE TABLE customer_branch_A(
    customer_id int,
    first_name varchar,
    last_name varchar,
    location varchar,
    pincode int,
    contact_number varchar

--    CONSTRAINT customer_A_pk PRIMARY KEY (customer_id)
);

CREATE TABLE customer_branch_B(
    customer_id int NOT NULL,
    first_name varchar,
    last_name varchar,
    location varchar,
    pincode int,
    contact_number varchar

--    CONSTRAINT customer_B_pk PRIMARY KEY (customer_id)
);

CREATE TABLE order_branch_A(
	order_id int NOT NULL,
	order_date varchar,
	customer_id int,
	product_id int,
	quantity int
	
--    CONSTRAINT order_A_pk PRIMARY KEY (order_id)
);

CREATE TABLE order_branch_B(
	order_id int NOT NULL,
	order_date varchar,
	customer_id int,
	product_id int,
	quantity int
	
--    CONSTRAINT order_B_pk PRIMARY KEY (order_id)
);


CREATE TABLE products_branch_A(
	product_id int NOT NULL,
	product_name varchar,
	quantity_per_unit int,
	unit varchar,
	unit_price float
	
--    CONSTRAINT product_A_pk PRIMARY KEY (product_id)
);


INSERT INTO customer_branch_A VALUES (1, 'Virat', 'Kholi', 'Delhi', 555666, '9123456789');
INSERT INTO customer_branch_A VALUES (2, 'Rohit', 'Sharma', 'Mumbai', 566766, '8814567890');
INSERT INTO customer_branch_A VALUES (3, 'MS', 'Dhoni', 'Ranchi', 655466, '9714567890');
INSERT INTO customer_branch_A VALUES (4, 'KL', 'Rahul', 'Mangalore', 583566, '8934567890');
INSERT INTO customer_branch_A VALUES (5, 'Yuzi', 'Chahal', 'Haryana', 522233, '9994567890');

INSERT INTO customer_branch_B VALUES (1, 'Rishabh', 'Pant', 'Delhi', 555666, '9123456782');
INSERT INTO customer_branch_B VALUES (2, 'Hardik', 'Panday', 'Mumbai', 566766, '8814567590');
INSERT INTO customer_branch_B VALUES (3, 'Jasprit', 'Bumrah', 'Ranchi', 655466, '9714563890');
INSERT INTO customer_branch_B VALUES (4, 'Manish', 'Pandey', 'Mangalore', 583566, '8936667890');
INSERT INTO customer_branch_B VALUES (5, 'Kuldeep', 'Yadav', 'Haryana', 522233, '9994127890');


INSERT INTO order_branch_A VALUES (1, '2020-09-09', '1', '3', '2');
INSERT INTO order_branch_A VALUES (2, '2020-08-19', '3', '4', '4');
INSERT INTO order_branch_A VALUES (3, '2021-05-01', '5', '3', '1');
INSERT INTO order_branch_A VALUES (4, '2020-09-04', '2', '2', '1');
INSERT INTO order_branch_A VALUES (5, '2020-09-05', '1', '1', '1');

INSERT INTO order_branch_B VALUES (1, '2022-01-09', '2', '3', '2');
INSERT INTO order_branch_B VALUES (2, '2020-12-19', '4', '5', '1');
INSERT INTO order_branch_B VALUES (3, '2021-05-12', '5', '1', '1');
INSERT INTO order_branch_B VALUES (4, '2020-02-09', '2', '2', '3');
INSERT INTO order_branch_B VALUES (5, '2020-11-11', '3', '4', '1');

INSERT INTO products_branch_A VALUES (1, 'Mobile', 1, '1', '6500');
INSERT INTO products_branch_A VALUES (2, 'Laptop', 2, '2', '55000');
INSERT INTO products_branch_A VALUES (3, 'Airdops', 2, '1', '2500');
INSERT INTO products_branch_A VALUES (4, 'Adapter', 1, '3', '600');
INSERT INTO products_branch_A VALUES (5, 'Router', 1, '2', '1200');

--select * from dw_sandbox.announcements limit 10;

--ALTER table order_branch_A add foreign key(customer_id) references customer_branch_A(customer_id);
--ALTER table order_branch_B add foreign key(customer_id) references customer_branch_B(customer_id);
--ALTER table order_branch_A add foreign key(product_id) references products_branch_A(product_id);
--ALTER table order_branch_B add foreign key(product_id) references products_branch_A(product_id);

-- ALTER TABLE order_branch_A DROP CONSTRAINT order_branch_a_customer_id_fkey;
-- ALTER TABLE customer_branch_A DROP CONSTRAINT order_branch_a_customer_id_fkey;


-- drop table products_branch_A;
--drop table order_branch_B;
--drop table order_branch_A;
--drop table customer_branch_A;
--drop table customer_branch_B;


