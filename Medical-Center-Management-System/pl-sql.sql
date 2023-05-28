-- 1907096
-- Showing maximum bill including their disCountCharge using PL/SQL

SET SERVEROUTPUT ON
DECLARE
    totalCharge BILL.roomCharge%type;
    maxBillNo   BILL.billNo%type;
    maxBillPatientId BILL.patientId%type;
    disCountCharge number(8,2);
BEGIN
    SELECT MAX(doctorCharge + roomCharge) INTO totalCharge 
    FROM BILL;
    
    SELECT billNo, patientId INTO maxBillNo, maxBillPatientId 
    FROM (
        SELECT billNo, patientId
        FROM BILL 
        WHERE (doctorCharge + roomCharge) = totalCharge
        ORDER BY billNo -- Add an appropriate column to order the rows
    )
    WHERE ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE('The maximum charge of a patient is: '|| totalCharge ||' with Patient billNo: '|| maxBillNo ||' and ID No: '|| maxBillPatientId);
    
    IF totalCharge <= 3000 THEN
        disCountCharge := totalCharge - totalCharge * 0.10;
    ELSIF totalCharge <= 10000 THEN
        disCountCharge := totalCharge - totalCharge * 0.15;
    ELSIF totalCharge <= 50000 THEN
        disCountCharge := totalCharge - totalCharge * 0.20;
    ELSIF totalCharge <= 100000 THEN
        disCountCharge := totalCharge - totalCharge * 0.25;
    ELSE
        disCountCharge := totalCharge - totalCharge * 0.30;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('The disCountCharge charge of a patient is: '|| disCountCharge);
END;
/


--showing room description of the patient whose room type is Single Bed, AC using CURSOR

SET SERVEROUTPUT ON
DECLARE
	CURSOR roomCursor IS SELECT roomId,patientId,type,varietyWard FROM ROOM WHERE type='Single Bed, AC';
	accessVar	roomCursor%ROWTYPE;
	rowCounting int;
BEGIN
	OPEN roomCursor;
	SELECT COUNT(*) INTO rowCounting 
	FROM  ROOM 
	WHERE type='Single Bed, AC';
	DBMS_OUTPUT.PUT_LINE('roomId  patientId       type            varietyWard');
	DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
	LOOP

		FETCH roomCursor INTO accessVar;
		DBMS_OUTPUT.PUT_LINE(accessVar.roomId || '      ' || accessVar.patientId || '    ' || accessVar.type || '      ' || accessVar.varietyWard);
		DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
EXIT WHEN roomCursor%ROWCOUNT>rowCounting-1;
	END LOOP;
	CLOSE roomCursor;
END;
/


--Insertion into APPOINTMENT table using PROCEDURE

CREATE OR REPLACE PROCEDURE InsertIntoAppointment(docId DOCTOR.doctorId%type,patId PATIENT.patientId%type,appoinDate APPOINTMENT.appointmentDate%type) IS
BEGIN
	INSERT INTO APPOINTMENT VALUES(docId,patId,appoinDate);
	commit;
END InsertIntoAppointment;
/


--Calling the PROCEDURE for Inserting into APPOINTMENT

SET SERVEROUTPUT ON
BEGIN
	InsertIntoAppointment(1907009,10001,'21-APR-22');
END;
/

SELECT * FROM APPOINTMENT;

--Update into PATIENT table using PROCEDURE

CREATE OR REPLACE PROCEDURE UpdateIntoPatient(pId PATIENT.patientId%type,newAdd PATIENT.address%type,newPhone PATIENT.phoneNo%type,newAge PATIENT.age%type) IS
BEGIN
	UPDATE PATIENT 
	SET address=newAdd,phoneNo=newPhone,age=newAge 
	WHERE patientId=pId;
	
	commit;

END UpdateIntoPatient;
/


--Calling the PROCEDURE for Updating into PATIENT

SET SERVEROUTPUT ON
BEGIN
	UpdateIntoPatient(10001,'K/C Road, Khulna','+8801734754585',65);
END;
/


SELECT * FROM PATIENT ;


--DelEting from PATIENT table using PROCEDURE

CREATE OR REPLACE PROCEDURE DeletingPatient(dId NUMBER) IS
BEGIN
	DELETE FROM PATIENT 
	WHERE patientId=dId;
	commit;
END DeletingPatient;
/


--Calling the PROCEDURE for DelEting from PATIENT

SET SERVEROUTPUT ON
BEGIN
	DeletingPatient(10002);
END;
/


SELECT * FROM PATIENT;


--Finding totalCharge for a PATIENT  using FUNCTION

CREATE OR REPLACE FUNCTION TreatmentCharge(bNo BILL.billNo%type) RETURN NUMBER IS
	totCharge BILL.roomCharge%type;
BEGIN
	SELECT (doctorCharge+roomCharge) INTO totCharge FROM BILL WHERE billNo=bNo;
	RETURN totCharge;
END TreatmentCharge;
/


--Calling the FUNCTION for Calculating totalCharge for PATIENT
--id :='&billNo';

SET SERVEROUTPUT ON
DECLARE
	id BILL.billNo%type;
BEGIN
	DBMS_OUTPUT.PUT_LINE('The total for Patient ID ' ||'A-212' ||' is : '||TreatMentCharge('A-212'));
END;
/


--Second Highest roomCharge FROM BILL

SELECT MAX(roomCharge) 
FROM BILL 
WHERE roomCharge NOT IN(SELECT MAX(roomCharge) 
						FROM BILL);
