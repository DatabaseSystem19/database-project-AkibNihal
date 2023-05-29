-- 1907096
-- Different types of operation

SELECT DISTINCT(department) AS DISTINCT_DEPARTMENT 
FROM DOCTOR;

SELECT department AS department_Like_Hemato 
FROM DOCTOR 
WHERE department LIKE '%Hemato%';

SELECT department AS department_Like_Hemato
FROM DOCTOR 
WHERE department LIKE '%Phych%';

SELECT doctorId,name,department 
FROM DOCTOR 
ORDER BY doctorId ASC;

SELECT doctorId,name,department 
FROM DOCTOR 
ORDER BY doctorId DESC;

SELECT patientId,name,age 
FROM PATIENT 
ORDER BY age ASC;

SELECT patientId,name,age 
FROM PATIENT 
ORDER BY age DESC;

--The patient whose total bill is between 5000 and 7000

SELECT patientId,name 
FROM PATIENT 
WHERE patientId IN(SELECT patientId 
				   FROM BILL 
				   WHERE (roomCharge+doctorCharge) BETWEEN 5000 AND 7000);

--The patient whose total bill is not between 5000 and 7000

SELECT patientId,name FROM PATIENT 
WHERE patientId IN(SELECT patientId 
				   FROM BILL 
				   WHERE (roomCharge+doctorCharge) NOT BETWEEN 5000 AND 7000);

--The patient whose total bill is not between 5000 and 7000 using aliasing

SELECT p.patientId,p.name 
FROM PATIENT p 
WHERE p.patientId IN(SELECT b.patientId 
					 FROM BILL b 
					 WHERE (b.roomCharge+b.doctorCharge)<5000 OR (b.roomCharge+b.doctorCharge)>7000);

--SELECT doctorId,name,department FROM DOCTOR GROUP BY department HAVING doctorId>1207001;

SELECT type 
FROM ROOM 
GROUP BY type 
HAVING type='Single Bed, AC';

--Use of different aggregate function

SELECT COUNT(*),COUNT(doctorCharge),SUM(doctorCharge),AVG(doctorCharge),AVG(NVL(doctorCharge,0)),MAX(doctorCharge),MIN(roomCharge),SUM(roomCharge) 
FROM BILL;

--All the doctor's and patient's name,address,phoneNo,gender information  using UNION ALL

SELECT name,address,phoneNo,gender 
FROM DOCTOR 
UNION ALL 
SELECT name,address,phoneNo,gender 
FROM PATIENT;


--All the doctor's and patient's name,address,phoneNo,gender information  using and UNION

SELECT name,address,phoneNo,gender 
FROM DOCTOR 
UNION 
SELECT name,address,phoneNo,gender 
FROM PATIENT;


--All the doctor's name,address,phoneNo,gender information whose is not in patient's using INTERSECT

SELECT name,address,phoneNo,gender 
FROM DOCTOR 
INTERSECT 
SELECT name,address,phoneNo,gender 
FROM PATIENT;

--All the doctor's name,address,phoneNo,gender information whose is not in patient's using MINUS

SELECT name,address,phoneNo,gender 
FROM DOCTOR 
MINUS 
SELECT name,address,phoneNo,gender 
FROM PATIENT;

--------------------All Appointment date of each Patient under the doctor name-------------

SELECT p.name,d.name,a.appointmentDate AS AppDate 
FROM DOCTOR d,PATIENT p,APPOINTMENT a 
WHERE d.doctorId=a.doctorId AND a.patientId=p.patientId;


--Bill description of each patient by JOIN

SELECT p.patientId,b.patientId,p.name,b.billNo,b.doctorCharge,b.roomCharge 
FROM PATIENT p 
JOIN 
BILL b 
ON p.patientId=b.patientId;

--------------------Bill description of each patient by JOIN and USING------------------

SELECT patientId,p.name,b.billNo,b.doctorCharge,b.roomCharge 
FROM PATIENT p 
JOIN 
BILL b 
USING (patientId);

--Bill description of each patient by NATURAL JOIN

SELECT patientId,p.name,b.billNo,b.doctorCharge,b.roomCharge 
FROM PATIENT p 
NATURAL JOIN 
BILL b;


--Bill description of each patient by INNER JOIN same as JOIN

SELECT p.patientId,b.patientId,p.name,b.billNo,b.doctorCharge,b.roomCharge 
FROM PATIENT p 
INNER JOIN 
BILL b 
ON p.patientId=b.patientId;


--Bill description of each patient by LEFT OUTER JOIN

SELECT p.patientId,b.patientId,b.billNo,b.doctorCharge,b.roomCharge 
FROM PATIENT p 
LEFT OUTER JOIN 
BILL b 
ON p.patientId=b.patientId;


--Bill description of each patient by RIGHT OUTER JOIN

SELECT p.patientId,b.patientId,b.billNo,b.doctorCharge,b.roomCharge 
FROM PATIENT p 
RIGHT OUTER JOIN 
BILL b 
ON p.patientId=b.patientId;


--Bill description of each patient by FULL OUTER JOIN

SELECT p.patientId,b.patientId,b.billNo,b.doctorCharge,b.roomCharge 
FROM PATIENT p 
FULL OUTER JOIN 
BILL b 
ON p.patientId=b.patientId;



--The Room charge in  Bill using SELF JOIN
SELECT b1.roomCharge,b2.roomCharge 
FROM BILL b1 
JOIN 
BILL b2 
ON b1.roomCharge=b2.roomCharge;



--Retrieve the appointment details along with the associated doctor and patient information from the view.

CREATE OR REPLACE VIEW AppointmentDetails AS
SELECT A.doctorId, D.name AS doctorName, P.name AS patientName, A.appointmentDate, B.doctorCharge, B.roomCharge
FROM APPOINTMENT A
JOIN DOCTOR D ON A.doctorId = D.doctorId
JOIN PATIENT P ON A.patientId = P.patientId
JOIN BILL B ON A.patientId = B.patientId;


-- once created this view can be used like regular table
SELECT *
FROM AppointmentDetails;
