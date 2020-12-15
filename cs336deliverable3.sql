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
    answer varchar(1000) default ' ',
    primary key (message_id),
    foreign key (username) references CUSTOMERS(cust_username),
    foreign key (employee_username) references EMPLOYEES(employee_username)
);

--
-- Train schedules
--

drop table if exists SCHEDULES;
create table SCHEDULES(schedule_id int(10), train_id int(4), transit_name varchar(20),
fare float(5,2), 
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
-- customer reservation. trip_type true for round trips and false for one-way
--

drop table if exists RESERVATION;
create table RESERVATION (reservation_num int not null auto_increment, reservation_fare float(5,2), reservation_date date,
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
                        
Insert into SCHEDULES values (1, 0001, "North express", 100),
							(2, 0002, "South express", 100),
                            (3, 0003, "NJ express", 150);

Insert into STATIONS values (100, "Union station", "NJ", "Union"),
						(101, "Elizabeth station", "NJ", "Elizabeth"),
						(102, "Roselle station", "NJ", "Roselle Park"),
                        (103, "Edison station", "NJ", "Edison"),
                        (104, "New Bruns station", "NJ", "New Brunswick"),
                        (105, "Piscataway station", "NJ", "Piscataway");
                        
Insert into STOPS values (1, 100, 101, 1, "9:00:00", "10:00:00"),
						(1, 101, 102, 2, "10:15:00", "11:15:00"),
                        (1, 102, 103, 3, "11:30:00", "12:30:00"),
                        (1, 103, 104, 4, "13:00:00", "14:00:00"),
                        (1, 104, 105, 5, "14:30:00", "15:30:00"),
                        (2, 105, 104, 1, "11:00:00", "12:00:00"),
                        (2, 104, 103, 2, "12:30:00", "13:45:00"),
                        (2, 103, 102, 3, "14:00:00", "14:30:00"),
                        (2, 102, 101, 4, "14:45:00", "15:15:00"),
                        (2, 101, 100, 5, "15:30:00", "16:00:00"),
                        (3, 101, 103, 1, "10:00:00", "11:30:00"),
                        (3, 103, 105, 2, "12:00:00", "13:30:00"),
                        (3, 105, 103, 3, "14:00:00", "15:30:00"),
                        (3, 103, 100, 4, "16:00:00", "18:00:00");
