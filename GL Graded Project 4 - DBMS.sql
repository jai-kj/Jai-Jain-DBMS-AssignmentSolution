create database TravelOnTheGo;

use TravelOnTheGo;

create table price (
	bus_type varchar(20) not null,
	distance int not null,
    price int not null
);

desc price;

insert into price values("Sleeper", 350, 770);
insert into price values("Sleeper", 500, 1100);
insert into price values("Sleeper", 600, 1320);
insert into price values("Sleeper", 700, 1540);
insert into price values("Sleeper", 1000, 2200);
insert into price values("Sleeper", 1200, 2640);
insert into price values("Sleeper", 1500, 2700);
insert into price values("Sitting", 500, 620);
insert into price values("Sitting", 600, 744);
insert into price values("Sitting", 700, 868);
insert into price values("Sitting", 1000, 1240);
insert into price values("Sitting", 1200, 1488);
insert into price values("Sitting", 1500, 1860);

create table passenger(
	passenger_name varchar(100) not null,
    category varchar(10) not null,
    gender char(1) not null,
    boarding_city varchar(100) not null,
    destination_city varchar(100) not null,
    distance int not null,
    bus_type varchar(20) not null
);

desc passenger;

insert into passenger values("Sejal", "AC", "F", "Bengaluru", "Chennai", 350, "Sleeper");
insert into passenger values("Anmol", "Non-AC", "M", "Mumbai", "Hyderabad", 700, "Sitting");
insert into passenger values("Pallavi", "AC", "F", "Panaji", "Bengaluru", 600, "Sleeper");
insert into passenger values("Khusboo", "AC", "F", "Chennai", "Mumbai", 1500, "Sleeper");
insert into passenger values("Udit", "Non-AC", "M", "Trivandrum", "Panaji", 1000, "Sleeper");
insert into passenger values("Ankur", "AC", "M", "Nagpur", "Hyderabad", 500, "Sitting");
insert into passenger values("Hemant", "Non-AC", "M", "Panaji", "Mumbai", 700, "Sleeper");
insert into passenger values("Manish", "Non-AC", "M", "Hyderabad", "Bengaluru", 500, "Sitting");
insert into passenger values("Piyush", "AC", "M", "Pune", "Nagpur", 700, "Sitting");

# Query3
select gender, count(gender) as count from passenger where distance >= 600 group by gender;

# Query4
select bus_type, min(price) from price where bus_type = "Sleeper";

# Query5
select passenger_name from passenger where passenger_name like 'S%';

# Query6
select passenger_name, boarding_city, destination_city, passenger.bus_type, price 
from passenger, price
where passenger.bus_type = price.bus_type
and passenger.distance = price.distance;

# Query7
select passenger_name, price as `Ticket Price`
from passenger, price
where passenger.bus_type = price.bus_type
and passenger.distance = price.distance
and passenger.distance = 1000;

# Query8
select price.bus_type, price 
from price, passenger
where passenger.distance = price.distance
and boarding_city = "Panaji"
and destination_city = "Bengaluru";

# Query9
select distinct(distance) from passenger order by distance desc;

# Query10
select passenger_name, concat(round((distance / (select sum(distance) from passenger)) * 100, 2), '%') as `Percentage Travelled` 
from passenger;

# Query11
select distance, price, 
case
	when price >= 500 and price <= 1000 then "Average Cost"
	when price > 1000 then "Expensive"
    end as `Pricing`
from price;


