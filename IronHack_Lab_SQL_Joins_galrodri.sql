-- Question 1 
select distinct t1.name as category_name
	, count(distinct t2.film_id) as film_count
from sakila.category t1
	inner join sakila.film_category t2 
		on t1.category_id = t2.category_id
group by 1
order by film_count desc;

-- Question 2 
select distinct t2.first_name as Name
	, t2.last_name as Surname
	, t1.address as Adress
from sakila.address t1
	inner join sakila.staff t2
		on t1.address_id = t2.address_id;

-- Question 3 
select distinct t1.staff_id 
	, CONCAT(t1.first_name,' ',t1.last_name) as employee_name
	, sum(amount) as `total amount`
from sakila.staff t1
	inner join sakila.payment t2
		on t1.staff_id = t2.staff_id
where (month(t2.payment_date) = 8 and year(t2.payment_date) = 2005)
group by 1,2;

-- Question 4 
select distinct t1.title
	, count(distinct t2.actor_id) as actor_count
from sakila.film t1
	inner join sakila.film_actor t2
		on t1.film_id = t2.film_id
group by 1;

-- Question 5 
select t1.first_name
	, t1.last_name
	, sum(t2.amount) as total_amount
from sakila.customer t1
	inner join sakila.payment t2
		on t1.customer_id = t2.customer_id
group by 1
order by last_name;