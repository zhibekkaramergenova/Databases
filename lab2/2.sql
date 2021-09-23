 create table customers(
    id               integer primary key,
    full_name        varchar(50) not null,
    timestamp        timestamp not null,
    delivery_address text not null
);

create table products(
    id          varchar primary key,
    name        varchar unique not null,
    description text,
    price       double precision not null check (price > 0)
);

create table orders(
    code        integer primary key,
    customer_id integer,
    total_sum   double precision  check (total_sum > 0) not null,
    is_paid     boolean not null,
    foreign key (customer_id) references customers
);

create table order_items(
    order_code integer unique,
    product_id varchar unique,
    quantity   integer not null check (quantity > 0),
    primary key (order_code, product_id),
    foreign key (order_code) references orders,
    foreign key (product_id) references products
);