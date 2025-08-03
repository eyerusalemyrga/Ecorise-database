






12:52
create schema ecorise_company;
create table ecorise_company.trader(
trader_id VARCHAR(10) primary key,
name VARCHAR(100) not null,
email VARCHAR(100) not null,
phone_number INT not null,
password VARCHAR(100) not null,
created_at TIMESTAMP not NULL
);
create table ecorise_company.recycling_company(
recycler_id VARCHAR(10) primary key,
name VARCHAR(100) not null,
email VARCHAR(100) not null,
phone INT not null,
password VARCHAR(100) not null,
created_at TIMESTAMP not NULL
);
create table ecorise_company.material_pricing(
material_id VARCHAR(10) primary key not null,
type VARCHAR(50) not null,
price_per_kg INT NOT null,
created_at TIMESTAMP not NULL
);
create table ecorise_company.pickup(
request_id VARCHAR(10) PRIMARY key not NULL,
trader_id VARCHAR(10) not null,
material_id VARCHAR(10) not null,
name VARCHAR(50) not NULL,
Phone_number INT not NULL,
location VARCHAR(50) not NULL,
material VARCHAR(100) not NULL,
quantity INT not NULL,
constraint fk_trader_id
foreign key (trader_id)
references ecorise_company.trader(trader_id),
constraint fk_material_id
foreign key (material_id)
references ecorise_company.material_pricing(material_id)
);
create table ecorise_company.pick_up_confirmation(
confirmation_id VARCHAR(10) primary key not null,
request_id VARCHAR(10) not null,
material_id VARCHAR(10) not null,
recycler_id VARCHAR(10) not NULL,
trader_id VARCHAR(10) not null,
name VARCHAR(50) not null,
phone_number INT not null,
location VARCHAR(50) not null,
confirmed_at TIMESTAMP not null,
material VARCHAR(10) not null,
quantity INT not null,
constraint fk_request_id
foreign key (request_id)
references ecorise_company.pickup(request_id),
constraint fk_trader_id
foreign key (trader_id)
references ecorise_company.trader(trader_id),
constraint fk_material_id
foreign key (material_id)
references ecorise_company.material_pricing(material_id),
constraint fk_recycler_id
foreign key (recycler_id)
references ecorise_company.recycling_company
);
create table ecorise_company.feedback(
feedback_id VARCHAR(10) PRIMARY key not NULL,
trader_id VARCHAR(10) not NULL,
feedback_at TIMESTAMP,
feedback VARCHAR(300) not null,
constraint fk_trader_id
foreign key (trader_id)
references ecorise_company.trader(trader_id )
);
create table ecorise_company.points(
point_id VARCHAR(10) primary key not NULL,
trader_id VARCHAR(10) not NULL,
confirmation_id VARCHAR(10) not NULL,
points INT not NULL,
points_at TIMESTAMP not NULL,
constraint fk_trader_id
foreign key (trader_id)
references ecorise_company.trader(trader_id),
constraint fk_confirmation_id
foreign key (confirmation_id)
references ecorise_company.pick_up_confirmation(confirmation_id)
);
create table ecorise_company.product(
recycled_clothes_id VARCHAR primary key not NULL,
quantity INT not null,
type VARCHAR(50) not null,
price INT not null,
listed_at TIMESTAMP not NULL
);
create table ecorise_company.reward(
reward_id VARCHAR(10) primary key not NULL,
trader_id VARCHAR(10) not NULL,
recycled_clothes_id VARCHAR(10) not NULL,
point_id VARCHAR(10) not NULL,
reward VARCHAR(100) not NULL,
reward_at TIMESTAMP not NULL,
constraint fk_trader_id
foreign key (trader_id)
references ecorise_company.trader(trader_id ),
constraint fk_recycled_clothes_id
foreign key (recycled_clothes_id)
references ecorise_company.product(recycled_clothes_id),
constraint fk_point_id
foreign key (point_id)
references ecorise_company.points(point_id)
);
create table ecorise_company.payment_details(
payment_id VARCHAR(10) primary key not NULL,
trader_id VARCHAR(10) not NULL,
recycler_id VARCHAR(10) not NULL,
material_id VARCHAR(10) not null,
confirmation_id VARCHAR(10) not null,
amount INT not NULL,
payment_method VARCHAR(30) not NULL,
payment_status VARCHAR(30) not NULL,
phone_number INT not NULL,
mpesa_receipt_number VARCHAR(100) not NULL,
paid_at TIMESTAMP not NULL,
updated_at TIMESTAMP not NULL,
constraint fk_trader_id
foreign key (trader_id )
references ecorise_company.trader(trader_id ),
constraint fk_recycler_id
foreign key (recycler_id)
references ecorise_company.recycling_company,
constraint fk_confirmation_id
foreign key (confirmation_id)
references ecorise_company.pick_up_confirmation(confirmation_id),
constraint fk_material_id
foreign key (material_id)
references ecorise_company.material_pricing(material_id)
);