select * from `rapido.rides`;

select* from `rapido.users`;

Select user_id , count(*) as total_ride
from `rapido.users`
group by user_id;


select vehicle_type, count (*) as total_ride
from `rapido.rides`
group by vehicle_type
having vehicle_type is not null;


-- Calculate the total distance traveled by each user and return only those users who traveled more than 20 km in total, sorted by user_id

select user_id ,round(sum(distance_km),2) as total_distance
from `rapido.rides`
group by user_id
having total_distance > 20
order by user_id asc;

-- Calculate the average distance per ride for each vehicle type and return only the vehicle types where the average distance is greater than 8 km.
 select vehicle_type, round(avg(distance_km),2) as avg_distance
 from `rapido.rides`
 group by vehicle_type
 having  avg_distance > 8;

--  Find all users who have more than two rides and display the total number of rides per user, sorted by user_id
select user_id,  count(ride_id) as total_ride
from `rapido.rides`
group by user_id
having total_ride > 2
order by user_id asc;

-- List all users who have never taken a ride, sorted by user_id (Hint: total 53 users)
-- SELECT column1
-- FROM table1
-- WHERE column1 IN (
--     SELECT column2
--     FROM table2
--     WHERE condition
-- );

select user_id , 
from `rapido.users`
where user_id NOT IN (select user_id from `rapido.rides`)
order by user_id asc;

-- Identify all the user(s) who signed up on the earliest signup date. How many such users are there? 

select * 
from `rapido.users`
where signup_date = "2024-07-31";


select*
from `rapido.users`
where signup_date = ( select signup_date from  `rapido.users` order by signup_date limit 1 );




-- 2nd approch 
select*
from `rapido.users`
where user_id = (select max(user_id) from `rapido.users`
);
 
-- Find users who took at least one ride longer than 10 km. How many such users are there? (Total 27 users)

select user_id ,count(*)
from `rapido.rides`
group by user_id
having max(distance_km) > 10
order by user_id asc;

