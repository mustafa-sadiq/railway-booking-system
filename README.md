# cs336deliverable3

## Due Date: Dec 17, 2020 11:55 pm

### Submission checklist
- [ ] Project code (zip file)
- [ ] Schema SQL file
- [ ] ER Diagram
- [ ] README
  - [ ] EC2 URL
  - [ ] Amazon EC2 and Apache Tomcat credentials (PEM file)
  - [ ] List that apportions credit
  - [ ] Admin credentials to application 
- [ ] Project Checklist
- [ ] Project Video


### Database
endpoint: database-1.ctievvwhg6rk.ca-central-1.rds.amazonaws.com  
port: 3306  
username: cs336database  
password: cs336database  

### EC2 
http://ec2-15-222-65-117.ca-central-1.compute.amazonaws.com:8080/cs336deliverable3/  
username: cs336group30  
password: cs336group30  

### Checklist
#### I. Account functionality (10 points)
- [X] register customers
- [X] login (for all customers, admin, customer reps)
- [X] logout (for all customers, admin, customer reps)

#### II. Browsing and search functionality (15 points)
- [X] search for train schedules by origin, destination, date of travel (5 points)
- [X] browse the resulting schedules (5 points)
  - [X] see all the stops a train will make, fare etc.
- [ ] sort by different criteria (by arrival time, departure time, fare) (5 points)

#### III. Reservations (15 points)
- [X] a customer should be able to make a reservation for a specific route (round-trip/oneway) (5 points)
- [X] get a discount in case of child/senior/disabled (2 points)
- [X] cancel existing reservation (3 points)
- [X] view current and past reservations with their details (separately). (5 points)

#### IV. Admin functions (30 points)
- [X] Admin (create an admin account ahead of time)
  - [X] add, edit and delete information for a customer representative (9 points)
  - [X] obtain sales reports per month (3 points)
  - [X] produce a list of reservations: (5 points)
    - [X] by transit line
    - [X] by customer name
  - [X] produce a listing of revenue per: (5 points)
    - [X] transit line
    - [X] customer name
  - [X] best customer (4 points)
  - [X] best 5 most active transit lines (4 points)

#### VI. Customer representative: (30 points)
- [ ] edit and delete information for train schedules (6 points)
- [X] customers browse questions and answers (4 points)
- [X] customers search questions by keywords (4 points)
- [X] customers send a question to the customer service (3 points)
- [X] reps reply to customer questions (3 points)
- [X] produce a list of train schedules for a given station (as origin/destination) (5 points)
- [ ] produce a list of all customers who have reservations on a given transit line and date. (5 points)

