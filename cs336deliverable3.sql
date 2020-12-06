create database if not exists cs336deliverable3;
use cs336deliverable3;

drop table if exists reservation_destination;
drop table if exists reservation_origin;
drop table if exists reservation_on;
drop table if exists reserves;
drop table if exists reservation;
drop table if exists stops;
drop table if exists support;
drop table if exists questions;
drop table if exists customers;
drop table if exists employees;
drop table if exists schedules;
drop table if exists stations;

create table customers (cust_first varchar(25), cust_last varchar(25), cust_email varchar(50),
cust_username varchar(30), cust_password varchar(30), 
primary key(cust_username));

create table employees (employee_ssn varchar (11), employee_first varchar(25), 
employee_last varchar(25), employee_username varchar(30), employee_password varchar(30),
isManager boolean,
primary key(employee_username));

create table questions(cust_username varchar(30), question_id int, cust_question varchar(1000), 
primary key (question_id, cust_username),
foreign key (cust_username) references customers(cust_username));

create table support (employee_username varchar(30), question_id int, cust_username varchar(30), 
support_date date, employee_ans varchar(1000),
primary key (employee_username, question_id, cust_username),
foreign key (employee_username) references employees(employee_username),
foreign key (question_id, cust_username) references questions(question_id, cust_username));

--
-- Train schedules
--

create table schedules(train_id int(4), transit_name varchar(20), day_of_week int, 
primary key (train_id, transit_name, day_of_week));

create table stations(station_id int, station_name varchar(20), station_state varchar(20), 
station_city varchar(20),
primary key (station_id));

create table stops (train_id int(4), transit_name varchar(20), day_of_week int,
station_id int, stop_departure time, stop_arrival time, stop_fare float,
primary key (train_id, transit_name, day_of_week, station_id),
foreign key (train_id, transit_name, day_of_week) references schedules(train_id, transit_name, day_of_week),
foreign key (station_id) references stations(station_id));

--
-- customer reservation
--

create table reservation (reservation_num int, reservation_fare float, reservation_date date,
primary key (reservation_num));

create table reserves (reservation_num int, cust_username varchar(30),
primary key (reservation_num),
foreign key (reservation_num) references reservation(reservation_num),
foreign key (cust_username) references customers(cust_username));
-- possibly redundant since transit_name and train_id can be derived from origin and destination
create table reservation_on (reservation_num int, transit_name varchar(20), train_id int(4),
day_of_week int,
primary key (reservation_num, transit_name, train_id),
foreign key (reservation_num) references reservation(reservation_num),
foreign key (train_id, transit_name, day_of_week) references schedules(train_id, transit_name, day_of_week));

create table reservation_origin (reservation_num int, transit_name varchar(20), train_id int(4),
day_of_week int, station_id int,
primary key (reservation_num),
foreign key (reservation_num) references reservation(reservation_num),
foreign key ( train_id, transit_name, day_of_week, station_id) references stops( train_id, transit_name, day_of_week, station_id));

create table reservation_destination (reservation_num int, transit_name varchar(20), train_id int(4),
day_of_week int, station_id int,
primary key (reservation_num),
foreign key (reservation_num) references reservation(reservation_num),
foreign key ( train_id, transit_name, day_of_week, station_id) references stops( train_id, transit_name, day_of_week, station_id));

--
-- sample values
--

Insert into customers values ("Parth", "Patel", "parth@parth.com", "parth123", "parth123"),
							("Mustafa", "Sadiq", "mustu@mustu.com", "mustu123", "mustu123"),
                            ("John", "Doe", "john@john.com", "john123", "john123");

Insert into employees values ("111-11-1111", "Gary", "Gary", "employee1", "employee1", false),
							("222-22-2222", "Jerry", "Jerry", "employee2", "employee2", false),
							("333-33-3333", "Terry", "Terry", "employee3", "employee3", true);

Insert into questions values ("parth123", 1, "hello?"),
							("mustu123", 2, "hi?");

Insert into support values ("employee1", 1, "parth123", "12-02-2020", "sup"),
						("employee2", 2, "mustu123", "12-02-2020", "sup?");
                        
Insert into schedules values (0001, "North", 1),
							(0001, "North", 2),
							(0002, "South", 3);

Insert into stations values (100, "Tomato", "NJ", "Union"),
						(101, "Onion", "NJ", "Elizabeth"),
						(102, "Potato", "NJ", "Roselle Park");
                        
Insert into stops values (0001, "North", 1, 100, "9:00:00", "8:45:00:", 0.00),
						(0001, "North", 1, 101, "10:00:00", "9:45:00:", 10.15),
                        (0001, "North", 2, 101, "9:00:00", "8:45:00:", 0.00),
                        (0001, "North", 2, 102, "10:00:00", "9:45:00:", 10.15),
                        (0002, "South", 3, 102, "9:00:00", "8:45:00:", 0.00),
                        (0002, "South", 3, 101, "10:00:00", "9:45:00:", 10.15),
                        (0002, "South", 3, 100, "11:00:00", "10:45:00:", 10.15);
                        
Insert into reservation values (1000, 10.15, "12-02-2020"),
						(1001, 10.15, "12-02-2020");

Insert into reserves values (1000, "parth123"),
							(1001, "mustu123");
                            
Insert into reservation_on values (1000, "North", 0001, 1),
								(1001, "South", 0002, 3);
                                
Insert into reservation_origin values (1000, "North", 0001, 1, 100),
									(1001, "South", 0002, 3, 102);
                                    
Insert into reservation_destination values (1000, "North", 0001, 1, 101),
									(1001, "South", 0002, 3, 101);
