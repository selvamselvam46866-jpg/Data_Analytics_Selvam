use HospitalAnalyticsDB;


-- 01. Which hospitals have the highest patient and operational activity?

select hospital_id,count(*) as total_appointments
from appointments
group by hospital_id
order by total_appointments desc;


-- 02. Which departments experience the highest appointment and admission workload?

select department_id,count(*) as total_admissions
from admissions
group by department_id
order by total_admissions desc;


-- 03. How is doctor workload distributed based on available appointment or treatment data?

select doctor_id,count(*) as total_appointments
from appointments
group by doctor_id
order by total_appointments desc;


-- 04. Which patients have the highest healthcare service activity?

select patient_id,count(*) as total_appointments
from appointments
group by patient_id
order by total_appointments desc;


-- 05. Which hospitals and departments record the highest admissions?

select hospital_id,department_id,count(*) as total_admissions
from admissions
group by hospital_id,department_id
order by total_admissions desc;


-- 06. What are the patterns in admission type and admission status?

select admission_type,admission_status,count(*) as total_admissions
from admissions
group by admission_type,admission_status
order by total_admissions desc;


-- 07. What is the average patient length of stay where admission and discharge dates are available?

select avg(datediff(discharge_date,admission_date))
as average_length_of_stay
from admissions
where admission_date is not null
and discharge_date is not null;


-- 08. How are rooms distributed by type and status?

select room_type,room_status,count(*) as total_rooms
from rooms
group by room_type,room_status
order by total_rooms desc;


-- 09. Which treatments generate the highest activity and treatment costs?

select treatment_name,count(*) as treatment_count,
sum(treatment_cost) as total_treatment_cost
from treatments
group by treatment_name
order by treatment_count desc;


-- 10. Which laboratory tests or services generate the highest volume and cost?

select test_name,count(*) as total_tests,
sum(test_cost) as total_test_cost
from laboratory
group by test_name
order by total_tests desc;


-- 11. Which medicines generate the highest pharmacy activity or revenue?

select medicine_id,count(*) as total_sales,
sum(quantity) as total_quantity,
sum(total_price) as total_revenue
from pharmacy
group by medicine_id
order by total_revenue desc;


-- 12. How much revenue is billed across the healthcare network?

select sum(total_amount) as total_billed_amount
from billing;


-- 13. How do room, doctor, medicine, laboratory, and other charges contribute to billing?

select
sum(room_charges) as room_charges,
sum(doctor_charges) as doctor_charges,
sum(medicine_charges) as medicine_charges,
sum(lab_charges) as lab_charges,
sum(other_charges) as other_charges
from billing;


-- 14. How much of the billed amount has been collected through payments?

select
(select sum(total_amount) from billing) as total_billed_amount,
(select sum(payment_amount) from payments) as total_collected_amount;


-- 15. Where are the largest gaps between billed amounts and payment collections?

select bill_id,total_amount as billed_amount,
(select sum(payment_amount)
 from payments p
 where p.bill_id=b.bill_id) as collected_amount,
total_amount -
coalesce((select sum(payment_amount)
          from payments p
          where p.bill_id=b.bill_id),0) as payment_gap
from billing b
order by payment_gap desc;


-- 16. How do payment methods and payment status affect collection performance?

select payment_mode,payment_status,
sum(payment_amount) as total_payment
from payments
group by payment_mode,payment_status
order by total_payment desc;