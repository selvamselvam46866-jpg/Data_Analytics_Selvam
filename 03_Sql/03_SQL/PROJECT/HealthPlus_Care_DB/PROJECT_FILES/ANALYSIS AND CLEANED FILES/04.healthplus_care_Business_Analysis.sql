use healthplus_care_db;


-- 01. which clinics have the highest consultation volume?

select clinic_id,count(*) as total_consultations
from consultations
group by clinic_id
order by total_consultations desc;


-- 02. which specialists have the highest consultation workload?

select specialist_id,count(*) as total_consultations
from consultations
group by specialist_id
order by total_consultations desc;


-- 03. which specializations have the highest activity?

select s.specialization,count(*) as total_consultations
from consultations c
join specialists s on c.specialist_id=s.specialist_id
group by s.specialization
order by total_consultations desc;


-- 04. which members are the most active healthcare users?

select member_id,count(*) as total_consultations
from consultations
group by member_id
order by total_consultations desc;


-- 05. how do consultation modes compare?

select consultation_mode,count(*) as total_consultations
from consultations
group by consultation_mode
order by total_consultations desc;


-- 06. which reasons for visit occur most frequently?

select reason_for_visit,count(*) as total_visits
from consultations
group by reason_for_visit
order by total_visits desc;


-- 07. which consultation statuses require attention?

select status,count(*) as total_consultations
from consultations
group by status
order by total_consultations desc;


-- 08. how many telemedicine sessions are completed, cancelled, or in other statuses?

select session_status,count(*) as total_sessions
from telemedicine_sessions
group by session_status
order by total_sessions desc;


-- 09. which telemedicine platforms and connection-quality categories are most common?

select platform,connection_quality,count(*) as total_sessions
from telemedicine_sessions
group by platform,connection_quality
order by total_sessions desc;


-- 10. what is the average telemedicine session duration?

select avg(timestampdiff(minute,session_start_time,session_end_time))
as average_session_duration
from telemedicine_sessions
where session_start_time is not null
and session_end_time is not null;


-- 11. which chronic conditions have the highest program enrollment?

select condition_name,count(*) as total_programs
from chronic_care_programs
group by condition_name
order by total_programs desc;


-- 12. which specialists manage the most chronic-care programs?

select specialist_id,count(*) as total_programs
from chronic_care_programs
group by specialist_id
order by total_programs desc;


-- 13. which health packages have the highest subscription volume?

select package_id,count(*) as total_subscriptions
from package_subscriptions
group by package_id
order by total_subscriptions desc;


-- 14. which subscriptions are approaching or have passed expiry based on expiry_date?

select subscription_id,member_id,package_id,expiry_date,
case
when expiry_date < curdate() then 'Expired'
when expiry_date <= date_add(curdate(),interval 30 day) then 'Expiring Soon'
else 'Active'
end as subscription_status
from package_subscriptions;


-- 15. which corporates contribute the most enrolled members?

select corporate_id,count(*) as enrolled_members
from corporate_members
group by corporate_id
order by enrolled_members desc;


-- 16. which industries have the greatest corporate healthcare participation?

select c.industry,count(*) as enrolled_members
from corporates c
join corporate_members cm
on c.corporate_id=cm.corporate_id
group by c.industry
order by enrolled_members desc;


-- 17. which medicines are prescribed most frequently?

select medicine_name,count(*) as prescription_count
from prescriptions
group by medicine_name
order by prescription_count desc;


-- 18. which specialists generate the highest prescription volume?

select specialist_id,count(*) as prescription_count
from prescriptions
group by specialist_id
order by prescription_count desc;


-- 19. which lab tests generate the highest total cost?

select test_name,sum(test_cost) as total_test_cost
from lab_tests
group by test_name
order by total_test_cost desc;


-- 20. which clinics have the highest laboratory workload?

select clinic_id,count(*) as total_lab_tests
from lab_tests
group by clinic_id
order by total_lab_tests desc;


-- 21. which insurance providers have the highest claim amount?

select insurance_provider,sum(claim_amount) as total_claim_amount
from claims
group by insurance_provider
order by total_claim_amount desc;


-- 22. what is the distribution of claim statuses?

select claim_status,count(*) as total_claims
from claims
group by claim_status
order by total_claims desc;


-- 23. what is the total billed amount and how is it split among consultation, laboratory, and medicine charges?

select
sum(consultation_charges) as consultation_charges,
sum(lab_charges) as lab_charges,
sum(medicine_charges) as medicine_charges,
sum(total_amount) as total_billed_amount
from billing;


-- 24. what is the total payment amount by payment status and payment mode?

select payment_status,payment_mode,
sum(payment_amount) as total_payment
from payments
group by payment_status,payment_mode
order by total_payment desc;


-- 25. what is the validated collection gap?

select
(select sum(total_amount) from billing) as total_billed_amount,
(select sum(payment_amount) from payments) as total_payment_amount,
(select sum(total_amount) from billing) -
(select sum(payment_amount) from payments) as collection_gap;


-- 26. which clinics or specialists receive the highest and lowest average feedback ratings?

select c.clinic_id,avg(f.rating) as average_rating
from clinics c
join consultations co
on c.clinic_id=co.clinic_id
join feedback f
on co.consultation_id=f.consultation_id
group by c.clinic_id
order by average_rating desc;


-- 27. are there members with consultations but no feedback?

select distinct c.member_id
from consultations c
left join feedback f
on c.consultation_id=f.consultation_id
where f.feedback_id is null;


-- 28. are there registered members with no consultations?

select m.member_id
from members m
left join consultations c
on m.member_id=c.member_id
where c.consultation_id is null;


-- 29. which business areas show high activity but weak financial or experience indicators?

select c.clinic_id,
count(distinct co.consultation_id) as consultation_activity,
sum(b.total_amount) as total_billed_amount,
avg(f.rating) as average_rating
from clinics c
join consultations co
on c.clinic_id=co.clinic_id
left join billing b
on co.consultation_id=b.consultation_id
left join feedback f
on co.consultation_id=f.consultation_id
group by c.clinic_id
order by consultation_activity desc;