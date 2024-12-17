
CREATE DATABASE airtransportation;
use airtransportation;

CREATE TABLE airlines(
id int primary key auto_increment,
name varchar(32),
class varchar(32)
);

CREATE TABLE pilot(
id int primary key auto_increment,
name varchar(32),
surname varchar(32),
airlines_id int,
FOREIGN KEY (airlines_id) REFERENCES airlines (id)
);

CREATE TABLE clients (
id integer primary key auto_increment,
name varchar(32),
surname varchar(32)
);

CREATE TABLE operators (
id integer primary key auto_increment,
name varchar(32),
surname varchar(32),
alias varchar(16)
);

CREATE TABLE service_classes (
type varchar(16) primary key, 
descr varchar(64)
);

CREATE TABLE orders (
id integer primary key auto_increment,
start varchar(255),
finish varchar(255),
state varchar(255),
payment_method varchar(255),
amount integer,
pilot_id integer,
operator_id integer,
service_type varchar(16),
client_id integer,
FOREIGN KEY (pilot_id) REFERENCES pilot (id),
FOREIGN KEY (operator_id) REFERENCES operators (id),
FOREIGN KEY (service_type) REFERENCES service_classes (type),
FOREIGN KEY (client_id) REFERENCES clients (id)
);

CREATE TABLE feedbacks (
id integer primary key auto_increment,
feedback varchar(255),
order_id integer unique,
FOREIGN KEY (order_id) REFERENCES orders (id)
);
