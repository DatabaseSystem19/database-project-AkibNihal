-- 1907096
-- Value Insertion into table DOCTOR

INSERT INTO DOCTOR VALUES(1907001,'Professor Dr. A. B. M. Yunus','Professor','25/3, Green Road, Dhaka - 1205, Bangladesh','+880-2-8610313','Male','11-NOV-94','Hematology');
INSERT INTO DOCTOR VALUES(1907002,'Professor Dr. A.A. Quoreshi','Professor','462/3, Khigaon, Dhaka - 1212, Bangladesh','+880-2-9896165','Male','12-JUL-90','Psychiatry');
INSERT INTO DOCTOR VALUES(1907003,'Professor Dr. Sirajul Haque','Professor','12/4 Dhanmondi, Dhaka - 1219, Bangladesh','+880-2- 9131207','Male','14-JUN-90','Hematology');
INSERT INTO DOCTOR VALUES(1907004,'Professor Dr. Ashfaqur Rahman','Professor','25/3, Banani Road, Dhaka - 1209, Bangladesh','+880-2-8610316','Male','14-NOV-89','Hematology');
INSERT INTO DOCTOR VALUES(1907005,'Professor Dr. Sakib Ahmad','Professor','109/3, Green Road, Dhaka - 1205, Bangladesh','+880-2-8610319','Male','14-NOV-94','Hematology');
INSERT INTO DOCTOR VALUES(1907006,'Professor Dr. Imtiag Joy','Professor','403/4, Banani Road, Dhaka - 1209, Bangladesh','+880-2-9896164','Male','12-JUL-80','Psychiatry');
INSERT INTO DOCTOR VALUES(1907007,'Professor Dr. Abtahe Alam','Professor','34/2 Dhanmondi, Dhaka - 1219, Bangladesh','+880-2- 9131202','Male','12-JUL-85','Hematology');
INSERT INTO DOCTOR VALUES(1907008,'Professor Dr. Robiul Islam','Professor','23/3, Green Road, Dhaka - 1205, Bangladesh','+880-2-8610393','Male','23-DEC-84','Hematology');
INSERT INTO DOCTOR VALUES(1907009,'Professor Dr. Tahim Sarkar','Professor','29/4 Dhanmondi, Dhaka - 1219, Bangladesh','+880-2-8610317','Male','19-JUN-88','Hematology');
INSERT INTO DOCTOR VALUES(1907010,'Professor Dr. Bill Gates','Professor','470/4, Khilgaon, Dhaka - 1212, Bangladesh','+880-2-9896169','Male','12-FEB-87','Psychiatry');



-- Value Insertion into table PATIENT

INSERT INTO PATIENT VALUES(10001,'A F M Anowar Hossain','21/3, Green Road, Dhaka - 1205, Bangladesh',39,'+880-2-9660095','Male');
INSERT INTO PATIENT VALUES(10002,'A H M Mahmudul Hasan','Khulna - 2206, Bangladesh',32,'+880-2-9689280','Male');
INSERT INTO PATIENT VALUES(10003,'A H M Shahidul Islam','Pabna - 6650, Bangladesh',43,'+880-2-9660115','Male');
INSERT INTO PATIENT VALUES(10004,'Professor Karim','Kushtia - 4105, Bangladesh',33,'+880-2-8610313','Male');
INSERT INTO PATIENT VALUES(10005,'Mahmudul Hasan','12/2 Dhanmondi, Dhaka - 1219, Bangladesh',29,'+880-2-9660215','Male');
INSERT INTO PATIENT VALUES(10006,'Shureed Ahmad','270/3, Khilgaon, Dhaka - 1212, Bangladesh',31,'+880-2-9609080','Male');
INSERT INTO PATIENT VALUES(10007,'Dr. Saifuddin','Rajshahi - 3290, Bangladesh',26,'+880-2-9660315','Male');
INSERT INTO PATIENT VALUES(10008,'Abdul Kalam','Banani Road, Dhaka - 1219, Bangladesh',25,'+880-2-8610513','Male');
INSERT INTO PATIENT VALUES(10009,'Imtiaz Mahmud','Kushtia - 4155, Bangladesh',47,'+880-2-9660415','Male');
INSERT INTO PATIENT VALUES(10010,'Hasnain Hasan','Khulna - 2309, Bangladesh',32,'+880-2-9669420','Male');



-- Value Insertion into table APPOINTMENT

INSERT INTO APPOINTMENT VALUES(1907001,10001,'25-AUG-21');
INSERT INTO APPOINTMENT VALUES(1907002,10003,'18-MAR-22');
INSERT INTO APPOINTMENT VALUES(1907003,10002,'15-NOV-21');
INSERT INTO APPOINTMENT VALUES(1907004,10004,'04-JAN-22');
INSERT INTO APPOINTMENT VALUES(1907005,10005,'23-FEB-21');
INSERT INTO APPOINTMENT VALUES(1907006,10009,'11-DEC-21');
INSERT INTO APPOINTMENT VALUES(1907007,10010,'15-JAN-22');
INSERT INTO APPOINTMENT VALUES(1907008,10006,'03-MAR-21');
INSERT INTO APPOINTMENT VALUES(1907009,10007,'25-SEP-22');
INSERT INTO APPOINTMENT VALUES(1907010,10008,'10-APR-22');



-- Value Insertion into table ROOM

INSERT INTO ROOM VALUES(1001,10001,'Single Bed, Non AC','General Ward');
INSERT INTO ROOM VALUES(3023,10003,'Double Bed, AC','ICU Ward');
INSERT INTO ROOM VALUES(2011,10002,'Double Bed, Non AC','Emergency Ward');
INSERT INTO ROOM VALUES(4011,10004,'Single Bed, AC','General Ward');
INSERT INTO ROOM VALUES(1021,10005,'Single Bed, Non AC','General Ward');
INSERT INTO ROOM VALUES(2043,10009,'Double Bed, AC','ICU Ward');
INSERT INTO ROOM VALUES(3061,10010,'Double Bed, Non AC','Emergency Ward');
INSERT INTO ROOM VALUES(4081,10006,'Single Bed, AC','General Ward');
INSERT INTO ROOM VALUES(1019,10007,'Single Bed, Non AC','General Ward');
INSERT INTO ROOM VALUES(3031,10008,'Double Bed, AC','ICU Ward');



-- Value Insertion into table BILL

INSERT INTO BILL VALUES('A-232',10001,5000.50,2000);
INSERT INTO BILL VALUES('H-567',10003,2300.50,4000);
INSERT INTO BILL VALUES('D-397',10002,4500,1000);
INSERT INTO BILL VALUES('E-566',10004,3000,2000);
INSERT INTO BILL VALUES('P-112',10005,5000.50,2000);
INSERT INTO BILL VALUES('F-867',10009,2300.50,4000);
INSERT INTO BILL VALUES('C-297',10010,4500,1000);
INSERT INTO BILL VALUES('B-212',10006,5000.50,2000);
INSERT INTO BILL VALUES('A-367',10007,2300.50,4000);
INSERT INTO BILL VALUES('P-897',10008,4500,1000);


DBMS_OUTPUT.PUT_LINE('Data Inserted in each table');


--Select operation of the tables

SELECT * FROM DOCTOR;
SELECT * FROM PATIENT;
SELECT * FROM APPOINTMENT;
SELECT * FROM ROOM;
SELECT * FROM BILL;