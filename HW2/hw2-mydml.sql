-- 2
select p.first_name, p.last_name, p.idnumber, count(pn.phone_number_id) as bla from persons p, phone_numbers pn where
	pn.person_id=p.id group by pn.person_id having count(pn.phone_number_id)>1;

-- 3    
select p.first_name, p.last_name, p.idnumber, pn.number_prefix, pn.number_base, count(c.id) 
	from phone_numbers pn, call_logs c, persons p where p.id=pn.person_id and pn.phone_number_id=c.phone_number_id
    group by c.phone_number_id order by count(c.phone_number_id) desc limit 5;

-- 4    
select p.first_name, p.last_name, p.idnumber, pn.number_prefix, pn.number_base, count(c.id) 
	from phone_numbers pn, call_logs c, persons p where p.id=pn.person_id and pn.phone_number_id=c.phone_number_id
    group by c.phone_number_id having count(c.id)=
    (select max(bla) from (select count(*) as bla from call_logs group by phone_number_id) s);

-- 5
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT 
    a.settlement_type,
	a.settlement_name,
    COUNT(n.phone_number_id) as 'number of users'
FROM
    persons p
        INNER JOIN
    person_addresses a ON  a.person_id=p.id
        LEFT JOIN
    phone_numbers n ON a.person_id = n.person_id
GROUP BY a.settlement_name;

-- 6    
select p.first_name, p.last_name, p.idnumber, pn.number_prefix, pn.number_base,
	sum(case c.call_log_type when 'in' then c.call_duration else 0 end) as 'in',
    sum(case c.call_log_type when 'out' then c.call_duration else 0 end) as 'out'
	from persons p, call_logs c, phone_numbers pn where p.id=pn.person_id and pn.phone_number_id=c.phone_number_id
	group by pn.phone_number_id;
    
-- 7
select p.first_name, p.last_name, p.idnumber, pn.number_prefix, pn.number_base,
	sum(case c.call_log_type when 'in' then c.call_duration else 0 end) as in_
	from persons p, call_logs c, phone_numbers pn, person_addresses pa where p.id=pn.person_id and pn.phone_number_id=c.phone_number_id and 
    pa.person_id=p.id and pa.settlement_name='ქუთაისი' and p.first_name like 'ნ%'
    group by pn.phone_number_id having in_ between 1 and 90;
    
-- 8
select number_prefix, count(*) as 'sold numbers' from phone_numbers group by number_prefix having 
	count(*)=(select max(bla) from (select count(*) as bla from phone_numbers group by number_prefix) s);
    
-- 9
delimiter //
create trigger call_price after insert on call_logs
for each row
begin
	if new.call_log_type='out' then
		update phone_number_balances
        set balance_used=balance_used+new.call_duration*new.call_cost
        where new.phone_number_id=phone_number_id;
	end if;
end
//
delimiter ;		
    
-- 10
delimiter //
create function has_balance(number_id int) returns boolean
begin
if (select balance_total from phone_number_balances where phone_number_id=number_id)-(select balance_used from phone_number_balances 
	where phone_number_id=number_id)>0 then return true;
    else return false;
    end if;
    end;
//
delimiter ;