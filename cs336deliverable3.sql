--
-- create database
-- 
drop database if exists cs336deliverable3;
create database if not exists cs336deliverable3;
use cs336deliverable3;

--
-- customers and employees
--
drop table if exists CUSTOMERS; 
create table CUSTOMERS (cust_first varchar(25), cust_last varchar(25), cust_email varchar(50),
cust_username varchar(30), cust_password varchar(30), 
primary key(cust_username));

drop table if exists EMPLOYEES;
create table EMPLOYEES (employee_ssn varchar (11), employee_first varchar(25), 
employee_last varchar(25), employee_username varchar(30), employee_password varchar(30),
isManager boolean,
primary key(employee_username));

drop table if exists FORUM;
create table FORUM (
	message_id int(10) not null auto_increment,
    username varchar (20) default null,
     question_subject varchar (100) default null,
    question varchar(1000),
    employee_username varchar (20) default null,
    answer varchar(1000) default 'not answered yet',
    primary key (message_id),
    foreign key (username) references CUSTOMERS(cust_username),
    foreign key (employee_username) references EMPLOYEES(employee_username)
);

--
-- Train schedules
--

drop table if exists SCHEDULES;
create table SCHEDULES(schedule_id int(10), train_id int(4), transit_name varchar(20),
fare float, 
primary key (schedule_id));

drop table if exists STATIONS;
create table STATIONS(station_id int(10), station_name varchar(20), station_state varchar(20), 
station_city varchar(20),
primary key (station_id));

drop table if exists STOPS;
create table STOPS (scheduled int(10), start_station int(10), stop_station int(10), 
stop_num int(10), stop_departure time, stop_arrival time,
primary key (scheduled, stop_num),
foreign key (scheduled) references SCHEDULES(schedule_id),
foreign key (start_station) references STATIONS(station_id),
foreign key (stop_station) references STATIONS(station_id));

--
-- customer reservation
--

drop table if exists RESERVATION;
create table RESERVATION (reservation_num int, reservation_fare float, reservation_date date,
cust_username varchar(30), origin int(10), destination int(10), scheduled int(10),
trip_type boolean,employee varchar (20) default null,
primary key (reservation_num),
foreign key(cust_username) references CUSTOMERS(cust_username),
foreign key (scheduled) references SCHEDULES(schedule_id),
foreign key (origin) references STATIONS(station_id),
foreign key(employee) references EMPLOYEES(employee_username),
foreign key (destination) references STATIONS(station_id));

--
-- sample values
--

Insert into CUSTOMERS values ("Parth", "Patel", "parth@parth.com", "parth123", "parth123"),
							("Mustafa", "Sadiq", "mustu@mustu.com", "mustu123", "mustu123"),
                            ("John", "Doe", "john@john.com", "john123", "john123");

Insert into EMPLOYEES values ("111-11-1111", "Gary", "Gary", "employee1", "employee1", false),
							("222-22-2222", "Jerry", "Jerry", "employee2", "employee2", false),
							("333-33-3333", "Terry", "Terry", "employee3", "employee3", true);

Insert into FORUM values (1, "parth123", "hello", "hello", "employee1", "yo"),
						(2, "mustu123", "hi", "hi", "employee2", "hola");
                        
Insert into SCHEDULES values (1, 0001, "NJ express", 100),
							(2, 0002, "NJ expressv2", 100);

Insert into STATIONS values (100, "Tomato", "NJ", "Union"),
						(101, "Onion", "NJ", "Elizabeth"),
						(102, "Potato", "NJ", "Roselle Park");
                        
Insert into STOPS values (1, 100, 101, 1, "9:00:00", "10:00:00"),
						(1, 101, 102, 2, "10:15:00", "11:15:00"),
                        (2, 100, 101, 1, "11:00:00", "12:00:00");
Insert into RESERVATION values(1,5.1,'2020-12-9','parth123',100,101,1,true,'employee1'),
							(2,5.2,'2020-12-8','mustu123',101,100,1,true,'employee1'),
                            (3,5.3,'2020-12-7','parth123',100,102,1,true,'employee1');