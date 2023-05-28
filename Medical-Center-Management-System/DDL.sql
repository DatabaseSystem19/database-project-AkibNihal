-- 1907096
-- Delete the following table if they exist in the 
-- database priviously

DROP TABLE BILL;
DROP TABLE ROOM;
DROP TABLE APPOINTMENT;
DROP TABLE PATIENT;
DROP TABLE DOCTOR;

-- creation of the TABLE DOCTOR
CREATE TABLE DOCTOR(
	doctorId		number(10) NOT NULL,
	name			varchar(30) NOT NULL,
	designation		varchar(25),
	address			varchar(50),
	phoneNo			varchar(20),
	gender			varchar(6),
	birthDate		date,
	dept			varchar(30)
);


ALTER TABLE DOCTOR RENAME COLUMN dept TO department;
ALTER TABLE DOCTOR DROP COLUMN department;
ALTER TABLE DOCTOR ADD department varchar(30);
--Adding CONSTRAINT into TABLE DOCTOR
ALTER TABLE DOCTOR ADD  CONSTRAINT DOCTOR_PK PRIMARY KEY(doctorId);

-- creation of the TABLE PATIENT
CREATE TABLE PATIENT(
	patientId		number(5) NOT NULL,
	name			varchar(30) NOT NULL,
	address			varchar(50),
	age				number(3),
	phoneNo			varchar(20) UNIQUE,
	gender			varchar(6),
	CONSTRAINT PATIENT_PK PRIMARY KEY(patientId)
);

--Modification using alter
ALTER TABLE PATIENT MODIFY patientId number(5) check(patientId>10000);


--Dropping and Adding CONSTRAINT into TABLE PATIENT
ALTER TABLE PATIENT DROP CONSTRAINT PATIENT_PK;
ALTER TABLE PATIENT ADD  CONSTRAINT PATIENT_PK PRIMARY KEY(patientId);

-- creation of the TABLE APPOINTMENT
CREATE TABLE APPOINTMENT(
	doctorId		number(7) NOT NULL,
	patientId		number(5) NOT NULL,
	appointmentDate date
	--primary key (doctorId,patientId),
	--foreign key (doctorId) references DOCTOR(doctorId) ON DELETE CASCADE,
	--foreign key (patientId) references PATIENT(patientId) ON DELETE CASCADE
);

--Adding CONSTRAINT into TABLE APPOINTMENT

ALTER TABLE APPOINTMENT ADD CONSTRAINT APPOINTMENT_PK 
	PRIMARY KEY(doctorId,patientId);

ALTER TABLE APPOINTMENT ADD CONSTRAINT APPOINTMENT_FK1 
	FOREIGN KEY(doctorId) references DOCTOR(doctorId) ON DELETE CASCADE;

ALTER TABLE APPOINTMENT ADD CONSTRAINT APPOINTMENT_FK2 
	FOREIGN KEY(patientId) references PATIENT(patientId) ON DELETE CASCADE;




-- creation of the TABLE ROOM
CREATE TABLE ROOM(
	roomId			number(4) NOT NULL,
	patientId		number(5) NOT NULL,
	type			varchar(20),
	varietyWard		varchar(20)
	--primary key (roomId),
	--foreign key (patientId) references PATIENT (patientId)
);

--Adding CONSTRAINT into TABLE ROOM

ALTER TABLE ROOM ADD CONSTRAINT ROOM_PK PRIMARY KEY(roomId);

ALTER TABLE ROOM ADD CONSTRAINT ROOM_FK FOREIGN KEY(patientId)
	 references PATIENT(patientId) ON DELETE CASCADE;

-- creation of the TABLE BILL
CREATE TABLE BILL(
	billNo			varchar(5) NOT NULL,
	patientId		number(5) NOT NULL,
	doctorCharge	number(8,2),
	roomCharge		number(8,2)
);

--Adding CONSTRAINT into TABLE BILL

ALTER TABLE BILL ADD CONSTRAINT BILL_PK PRIMARY KEY(billNo);

ALTER TABLE BILL ADD CONSTRAINT BILL_FK FOREIGN KEY(patientId)
	 references PATIENT(patientId) ON DELETE CASCADE;

--Use of Disable and enable of constraint

ALTER TABLE BILL DISABLE CONSTRAINT BILL_PK;

ALTER TABLE BILL ENABLE CONSTRAINT BILL_PK;

describe DOCTOR;
describe PATIENT;
describe APPOINTMENT;
describe ROOM;
describe BILL;