create table customer
(
    id         integer primary key,
    address    varchar(50) NOT NULL ,
    name       varchar(50) NOT NULL ,
    phone      varchar(50) NOT NULL
);
create table company
(
    id             integer primary key,
    name           varchar(50) NOT NULL
);

create table product
(
    id          integer primary key,
    amount      varchar(50) NOT NULL DEFAULT 1,
    type        varchar(50) NOT NULL ,
    name        varchar(50) NOT NULL ,
    cost        integer NOT NULL
);
  
create table account
(
    id             integer primary key,
    login          varchar(50) NOT NULL ,
    credit_card_id integer NOT NULL ,
    customer_id    integer references customer(id) NOT NULL
);

create table credit_card
(
    id              integer primary key,
    cvv             numeric(3) NOT NULL ,
    expiration_date date NOT NULL ,
    full_name       varchar(50) NOT NULL ,
    ch_price_id     integer references ch_price(id) ,
    date            date NOT NULL
);


create table ch_price
(
    id          integer primary key,
    total_price integer
);

create table prices
(
    cost         integer NOT NULL ,
    product_type varchar(50) NOT NULL UNIQUE
); 

create table transport
(
    name               varchar(50) UNIQUE ,
    price_for_delivery integer NOT NULL
);

create table shipment
(
    id                     integer primary key,
    customer_id            integer references customer(id),
    company_id             integer references company(id),
    product_id             integer references product(id),
    ch_price_id            integer references ch_price(id),
    transport_name         varchar(50),
    order_date             date,
    delivery_date          date
);

create table track(
    track_id       integer primary key  references shipment(id),
    status         varchar(50) NOT NULL ,
    vehicle        varchar(50) NOT NULL ,
    start_loc      varchar(50) NOT NULL ,
    current_loc    varchar(50) NOT NULL ,
    end_loc        varchar(50) NOT NULL

);

create table history(
    id         integer references track(track_id),
    date       date NOT NULL ,
    location   varchar(50) NOT NULL
);




create table defective_product
(
    type         varchar(50) NOT NULL ,
    product_id   integer references product

);

create table international_shipment
(
    declaration_id integer primary key
);

CREATE INDEX product_quantity ON product(amount);
CREATE INDEX product_type ON product(type);
CREATE INDEX total_price_of_ch_price ON ch_price(total_price);
CREATE INDEX status_of_track ON track(status);


INSERT INTO customer (id, address, name, phone) VALUES (101, '202 Pyramid Valley Road', 'Angela', '+77012003040');
INSERT INTO customer (id, address, name, phone) VALUES (102, '574 Airplane Avenue', 'Zola', '+77089800101');
INSERT INTO customer (id, address, name, phone) VALUES (105, '3669 Davis Street', 'Freda', '+77012307856');
INSERT INTO customer (id, address, name, phone) VALUES (104, '4856 Thompson Drive', 'Steven', '+77055000505');
INSERT INTO customer (id, address, name, phone) VALUES (109, '3695 Langtown Road', 'Vicky', '+77096780909');
INSERT INTO customer (id, address, name, phone) VALUES (112, '2101 Camden Street', 'Crystal', '+77012004389');
INSERT INTO customer (id, address, name, phone) VALUES (113, '1865 Junior Avenue', 'Sue', '+77055934567');
INSERT INTO customer (id, address, name, phone) VALUES (110, '1865 Junior Avenue', 'Lola', '+77032347890');
INSERT INTO customer (id, address, name, phone) VALUES (111, '4855 Thompson Drive', 'Mike', '+7086781220');
INSERT INTO customer (id, address, name, phone) VALUES (117, '1487 Whitetail Lane', 'Dennis', '+77056708040');
INSERT INTO customer (id, address, name, phone) VALUES (118, '1142 Five Points', 'Shannon', '+77089300102');
INSERT INTO customer (id, address, name, phone) VALUES (119, '201 Pyramid Valley Road', 'Jone', '+77017192054');
INSERT INTO customer (id, address, name, phone) VALUES (114, '3669 Davis Street', 'Gretchen', '+77072309876');
INSERT INTO customer (id, address, name, phone) VALUES (115, '1365 Heather Sees Way', 'Ethier', '+77001002340');
INSERT INTO customer (id, address, name, phone) VALUES (120, '1364 Heather Sees Way', 'Retha', '+77013214567');
INSERT INTO customer (id, address, name, phone) VALUES (121, '1364 Heather Sees Way', 'Retha', '+77013214567');
INSERT INTO customer (id, address, name, phone) VALUES (122, '1364 Heather Sees Way', 'Retha', '+77013214567');


INSERT INTO company (id, name) VALUES ('002', 'Apple');
INSERT INTO company (id, name) VALUES ('009', 'Oppo');
INSERT INTO company (id, name) VALUES ('011', 'Goggle');
INSERT INTO company (id, name) VALUES ('005', 'Samsung');
INSERT INTO company (id, name) VALUES ('007', 'Amazon');


INSERT INTO product (id, amount, type, name, cost) VALUES (301,32, 'big', 'cupboard', 678 );
INSERT INTO product (id, amount, type, name, cost) VALUES (302,1, 'big', 'board', 8423 );
INSERT INTO product (id, amount, type, name, cost) VALUES (303,4, 'medium', 'notebook', 534 );
INSERT INTO product (id, amount, type, name, cost) VALUES (304,3, 'big', 'car', 678 );
INSERT INTO product (id, amount, type, name, cost) VALUES (305,24, 'big', 'car', 4333 );
INSERT INTO product (id, amount, type, name, cost) VALUES (306,100, 'big', 'car', 6543);
INSERT INTO product (id, amount, type, name, cost) VALUES (307,1, 'medium', 'Iphone 13', 600 );
INSERT INTO product (id, amount, type, name, cost) VALUES (308,35, 'small', 'AirPods', 960 );
INSERT INTO product (id, amount, type, name, cost) VALUES (309,67, 'small', 'watch', 554 );
INSERT INTO product (id, amount, type, name, cost) VALUES (300,13, 'big', 'keyboard', 2210 );
INSERT INTO product (id, amount, type, name, cost) VALUES (310,17, 'big', 'keyboard', 2210 );
INSERT INTO product (id, amount, type, name, cost) VALUES (311,35, 'big', 'keyboard', 2210 );
INSERT INTO product (id, amount, type, name, cost) VALUES (312,19, 'small', 'bag', 4750 );
INSERT INTO product (id, amount, type, name, cost) VALUES (313,78, 'big', 'computer', 4520 );
INSERT INTO product (id, amount, type, name, cost) VALUES (314,6, 'medium', 'keyboard', 65 );


INSERT INTO account(id, login,  credit_card_id, customer_id) VALUES (234,  'angela_kk', 7656877, 101);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (235,  'zola_77', 7653660, 102);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (226,  'freda_kashin', 4356789, 105);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (245,  'steven_mars', 3452116, 104);
INSERT INTO account(id,  login, credit_card_id, customer_id) values (299,  'vicky_01', 4433678, 109);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (266,  'crystal_mash', 7654567, 112);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (231,  'sue1.mk',0013450, 113 );
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (232,  'lolaaa2', 2456099, 110);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (236,  'mike_vaz', 4500901, 111);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (237, 'denniska', 1200563, 117);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (238,  'shannon_9', 2368743, 118);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (239,  'jone.bone', 7632643, 119);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (240,  'greta_kakv_skazke', 3724633, 114);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (243,  'Ethier_lk', 7237232,115);
INSERT INTO account(id,  login, credit_card_id, customer_id) VALUES (244,  'rethaa', 2638763,120);


INSERT INTO ch_price (id, total_price) VALUES ('901', '567');
INSERT INTO ch_price (id, total_price) VALUES ('902', '1275');
INSERT INTO ch_price (id, total_price) VALUES ('903', '870');
INSERT INTO ch_price (id, total_price) VALUES ('904', '1500');
INSERT INTO ch_price (id, total_price) VALUES ('905', '600');
INSERT INTO ch_price (id, total_price) VALUES ('906', '15000');
INSERT INTO ch_price (id, total_price) VALUES ('907', '3000');
INSERT INTO ch_price (id, total_price) VALUES ('908', '99');
INSERT INTO ch_price (id, total_price) VALUES ('909', '500');
INSERT INTO ch_price (id, total_price) VALUES ('910', '2000');
INSERT INTO ch_price (id, total_price) VALUES ('911', '450');
INSERT INTO ch_price (id, total_price) VALUES ('912', '155');
INSERT INTO ch_price (id, total_price) VALUES ('913', '780');
INSERT INTO ch_price (id, total_price) VALUES ('914', '567');
INSERT INTO ch_price (id, total_price) VALUES ('915', '2780');


INSERT INTO transport (name, price_for_delivery) VALUES ('Truck', 300);
INSERT INTO transport (name, price_for_delivery) VALUES ('Truck123', 350);
INSERT INTO transport (name, price_for_delivery) VALUES ('Plane', 800);
INSERT INTO transport (name, price_for_delivery) VALUES ('Plane2', 1200);
INSERT INTO transport (name, price_for_delivery) VALUES ('Rail', 100);
INSERT INTO transport (name, price_for_delivery) VALUES ('Rail2', 200);
INSERT INTO transport (name, price_for_delivery) VALUES ('Rail3', 600);
INSERT INTO transport (name, price_for_delivery) VALUES ('Plane3', 690);
INSERT INTO transport (name, price_for_delivery) VALUES ('Truck', 657);
INSERT INTO transport (name, price_for_delivery) VALUES ('Truck3', 370);
INSERT INTO transport (name, price_for_delivery) VALUES ('Truck', 785);
INSERT INTO transport (name, price_for_delivery) VALUES ('Rail', 940);
INSERT INTO transport (name, price_for_delivery) VALUES ('Plane', 600);
INSERT INTO transport (name, price_for_delivery) VALUES ('Plane2', 600);
INSERT INTO transport (name, price_for_delivery) VALUES ('Rail', 1010);


INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (45, 101, 002,301, 901, 'Truck', '16-05-2021', '05-06-2021' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (46, 102, 009,302, 902, 'Truck123', '30-06-2019', '01-07-2019');
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (47, 105, 011,303, 903, 'Plane', '11-04-2019', '18-04-2019' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (48, 104, 005,304, 904, 'Plane2', '20-06-2020', '25-06-2020' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (49, 109, 007,305, 905, 'Rail',  '25-06-2020', '30-06-2020' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (50, 112, 002,306, 906, 'Rail2', '08-01-2021', '13-02-2021' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (51, 113, 002,307, 907, 'Rail3', '17-09-2020', '25-09-2020' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (52, 110, 007,308, 908, 'Plane3', '22-10-2021', '01-11-2021' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (53, 111, 007,309, 909, 'Truck123', '16-12-2019', '25-12-2019' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (54, 117, 007,300, 910, 'Truck123', '17-12-2019', '26-12-2019' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (55, 119, 005,310, 911, 'Truck123', '18-08-2020', '29-10-2020' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (56, 118, 011,311, 912, 'Truck123', '26-09-2020', '02-10-2020' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (57, 114, 011,312, 913, 'Truck123', '13-01-2021', '17-01-2021' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (58, 115, 007,313, 914, 'Truck123', '08-08-2021', '19-08-2021' );
INSERT INTO shipment (id, customer_id, company_id, product_id, ch_price_id, transport_name,order_date, delivery_date) VALUES (59, 120, 005,314, 915, 'Truck123', '30-08-2021', '05-09-2021' );

INSERT INTO track(track_id, status, vehicle, start_loc, current_loc, end_loc) VALUES (45, 'delivered', 'Truck', 'Kiev', 'Moscow', 'Moscow');
INSERT INTO track(track_id, status, vehicle, start_loc, current_loc, end_loc) VALUES (46, 'delivered', 'Truck123', 'USA', 'Turkey', 'Turkey');
INSERT INTO track(track_id, status, vehicle, start_loc, current_loc, end_loc) VALUES (47, 'on the way', 'Plane', 'USA', 'Georgia', 'Turkey');
INSERT INTO track(track_id,start_loc,current_loc,end_loc,vehicle,status) VALUES (48,'Denmark','German','Kazakhstan','Plane2','on the way');
INSERT INTO track(track_id,start_loc,current_loc,end_loc,vehicle,status) VALUES (49,'Italy','German','Kazakhstan','Rail','on the way');
INSERT INTO track(track_id,start_loc,current_loc,end_loc,vehicle,status) VALUES (50,'Canada','Switzerland','Kazakhstan','Rail2','on the way');
INSERT INTO track(track_id,start_loc,current_loc,end_loc,vehicle,status) VALUES (51,'Japan','China','China','Rail3','delivered');
INSERT INTO track(track_id,start_loc,current_loc,end_loc,vehicle,status) VALUES (52,'Spain','Kiev','Kazakhstan','Plane3','delivered');
INSERT INTO track(track_id,start_loc,current_loc,end_loc,vehicle,status) VALUES (53,'Kazakhstan','Turkey','Turkey','Truck123','on the way');
INSERT INTO track(track_id,start_loc,current_loc,end_loc,vehicle,status) VALUES (54,'Kazakhstan','Turkey','Turkey','Truck123','on the way');
INSERT INTO track(track_id,start_loc,current_loc,end_loc,vehicle,status) VALUES (55,'Kazakhstan','Turkey','Turkey','Truck123','on the way');
INSERT INTO track(track_id, status, vehicle, start_loc, current_loc, end_loc) VALUES (56, 'delivered', 'Truck123', 'USA', 'Turkey', 'Turkey');
INSERT INTO track(track_id, status, vehicle, start_loc, current_loc, end_loc) VALUES (57, 'delivered', 'Truck123', 'Brazil', 'Africa', 'China');
INSERT INTO track(track_id, status, vehicle, start_loc, current_loc, end_loc) VALUES (58, 'delivered', 'Truck123', 'Norway', 'Germany', 'Kazakhstan');
INSERT INTO track(track_id, status, vehicle, start_loc, current_loc, end_loc) VALUES (59, 'delivered', 'Truck123', 'Kazakhstan', 'Kazakhstan', 'Mongolia');


INSERT INTO history (id, date, location) VALUES (45, '16-05-2021', 'Kiev');
INSERT INTO history (id, date, location) VALUES (45, '03-06-2021', 'Moscow');
INSERT INTO history (id, date, location) VALUES (45, '05-06-2021', 'Moscow');
INSERT INTO history(id, date, location) VALUES (46, '30-06-2019', 'USA');
INSERT INTO history(id, date, location) VALUES (46, '30-06-2019', 'Turkey');
INSERT INTO history(id, date, location) VALUES (46, '01-07-2019', 'Turkey');
INSERT INTO history(id, date, location) VALUES (47, '11-04-2020', 'USA');
INSERT INTO history(id, date, location) VALUES (47, '15-04-2020', 'Georgia');
INSERT into history(id,location,date) values(48,'Denmark','20-06-2020');
INSERT into history(id,location,date) values(48,'German','23-06-2020');
INSERT into history(id,location,date) values(49,'Italy','25-06-2020');
INSERT into history(id,location,date) values(49,'German','29-06-2020');
INSERT into history(id,location,date) values(50,'Canada','08-01-2021');
INSERT into history(id,location,date) values(50,'Switzerland','09-02-2021');
INSERT into history(id,location,date) values(50,'Kazakhstan','11-02-2021');
INSERT into history(id,location,date) values(51,'Japan','17-09-2020');
INSERT into history(id,location,date) values(51,'China','22-09-2020');
INSERT into history(id,location,date) values(51,'China','25-09-2020');
INSERT into history(id,location,date) values(52,'Spain','22-10-2021');
INSERT into history(id,location,date) values(52,'Kiev','25-10-2021');
INSERT into history(id,location,date) values(52,'Kazakhstan','01-11-2021');
INSERT into history(id,location,date) values(53,'Kazakhstan','16-12-2019');
INSERT into history(id,location,date) values(53,'Turkey','17-12-2021');
INSERT into history(id,location,date) values(53,'Kazakhstan','17-12-2019');
INSERT into history(id,location,date) values(53,'Turkey','20-12-2021');
INSERT into history(id,location,date) values(55,'Kazakhstan','18-08-2020');
INSERT into history(id,location,date) values(55,'Turkey','20-08-2020');
INSERT INTO history(id, date, location) VALUES (56, '26-09-2020', 'USA');
INSERT INTO history(id, date, location) VALUES (56, '28-09-2020', 'Turkey');
INSERT INTO history(id, date, location) VALUES (56, '01-10-2020', 'Turkey');
INSERT INTO history(id, date, location) VALUES (57, '13-01-2021', 'USA');
INSERT INTO history(id, date, location) VALUES (57, '15-01-2021', 'Turkey');
INSERT INTO history(id, date, location) VALUES (57, '16-01-2021', 'Turkey');
INSERT INTO history(id, date, location) VALUES (58, '08-08-2021', 'USA');
INSERT INTO history(id, date, location) VALUES (58, '10-08-2021', 'Turkey');
INSERT INTO history(id, date, location) VALUES (58, '18-08-2021', 'Turkey');
INSERT INTO history(id, date, location) VALUES (59, '30-08-2021', 'Kazakhstan');
INSERT INTO history(id, date, location) VALUES (59, '01-09-2021', 'Kazakhstan');
INSERT INTO history(id, date, location) VALUES (59, '04-09-2021', 'Mongolia');

--credit card
INSERT INTO credit_card (id, cvv, expiration_date, full_name, ch_price_id, date) VALUES (870, 668, '2021-04-10', 'Angela O.Prima', 901, '16-05-2021');
INSERT INTO credit_card (id, cvv, expiration_date, full_name, ch_price_id, date) VALUES (890, 345, '2026-05-05', 'Zola L.Gearhart', 902, '30-06-2019');
INSERT INTO credit_card (id, cvv, expiration_date, full_name, ch_price_id, date) VALUES (876, 789, '2026-12-15', 'Freda D.Gallardo', 903, '11-04-2020');
INSERT INTO credit_card (id, cvv, expiration_date, full_name, ch_price_id, date) VALUES (871, 456, '2023-10-06', 'Steven J.Proskal', 904, '20-06-2020');
INSERT INTO credit_card (id, cvv, expiration_date, full_name, ch_price_id, date) VALUES (872, 409, '2021-12-26', 'Vicky J.Gladden', 905, '25-06-2020');
INSERT INTO credit_card (id, cvv, expiration_date, full_name, ch_price_id, date) VALUES (873, 901, '2020-05-16', 'Crystal T.McNeil', 906, '08-01-2021');
INSERT INTO credit_card (id, cvv, expiration_date, full_name, ch_price_id, date) VALUES (874, 101,'2025-03-12', 'Sue M.Stoddard', 907, '17-09-2020');
INSERT INTO credit_card (id, cvv, expiration_date, full_name, ch_price_id, date) VALUES (875, 203, '2026-10-02', 'Lola H.Wahl', 908, '22-10-2021');

--prices
INSERT into prices(cost, product_type) values(500,'small_pack');
INSERT into prices(cost, product_type) values(2000, 'small');
INSERT into prices(cost, product_type) values(1550,'express');
INSERT into prices(cost, product_type) values(1500,'big_pack');

--defective_product
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product1');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product2');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product3');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product4');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product5');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product6');
INSERT INTO defective_product (type, product_id) VALUES ('no defective product', 'product7');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product8');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product9');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product10');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product11');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product12');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product13');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product14');
INSERT INTO defective_product(type, product_id) VALUES ('no defective product', 'product15');

--international shipment
INSERT INTO international_shipment(declaration_id) VALUES ('Declaration1');

--1 . Assume truck 1721 is destroyed in a crash. Find all customers who had a product on that truck at the time of the crash.
-- Find all recipients who had a product on that truck at the time of the crash.
-- Find the last successful delivery by that truck prior to the crash.

select customer.id, customer.name
from customer inner join shipment on customer.id = shipment.customer_id
where shipment.id in (
    select track_id
    from track
    where vehicle = 'Rail' and status = 'on the way'
    );

select track_id, start_loc, end_loc, vehicle
from track
where vehicle = 'Truck' and status = 'delivered';

--2 . Find the customer who has shipped the most products in the past year.
SELECT customer.name
FROM customer
WHERE customer.id in (
    select customer_id
    from shipment inner join product on shipment.product_id = product.id
    WHERE product.amount = (
        select max(amount)
        from product
        )
);

--3 . Find the customer who has spent the most money on shipping in the past year.
SELECT customer.name
FROM customer
WHERE customer.id in (
    SELECT customer_id
    FROM shipment, ch_price
    WHERE shipment.ch_price_id  = ch_price_id and ch_price.total_price = (
        select max(ch_price.total_price)
        from ch_price
        ) and shipment.order_date in (
            select order_date
            from shipment
            where extract(year from order_date) = 2020
        )
    );

--4 . Find the street with the most customers.
SELECT address, number
FROM (
     SELECT address, count(address) as number
     FROM customer
    GROUP BY address
         ) sub
       WHERE number in (
           SELECT max(count)
           from (
                SELECT address, count(address)
                FROM customer
                GROUP BY address
                    ) sub
           );

--5 . Find those products that were not delivered within the promised time
select product.id, product.name
from product
where product.id in (
    select shipment.product_id
    from shipment,history
    where  shipment.id = history.id and shipment.delivery_date < history.date
    );

--6 . Generate the ch_price for each customer for the past month. Consider creating several types of bills.
select shipment.ch_price_id, product.amount * product.cost  as tot_sum, transport.price_for_delivery as tot_veh_sum,
       prices.cost as tot_type_sum, ch_price.total_price as tot_ch_price_sum
from shipment, product, ch_price, transport, prices
where shipment.product_id = product_id and shipment.delivery_date = transport.name and product.type = prices.product_type
and ch_price.id = shipment.ch_price_id
