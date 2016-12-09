use BUWA_DB;--Use the created DB

--CREATE TABLE FOR LECTURERS
CREATE TABLE Lecturer(
LID   int,
FNAME varchar(50),
LNAME varchar(50),
email varchar(100),
PRIMARY KEY(LID)
);

--SELECT Lecturer TABLE
SELECT * 
FROM Lecturer;

--INSERT VALUES TO Lecturer TABLE
INSERT INTO Lecturer 
VALUES(1,'Aalaf','Zacky','abc@gmail.com');

--INSERT VALUES TO Lecturer TABLE
INSERT INTO Lecturer 
VALUES(2,'Muzawir','Ahamed','MA@gmail.com');

--INSERT VALUES TO Lecturer TABLE
INSERT INTO Lecturer 
VALUES(3,'Dinesh','Khan','DK@gmail.com');

--INSERT VALUES TO Lecturer TABLE
INSERT INTO Lecturer 
VALUES(4,'Buwa','Silva','BS@gmail.com');

--DELETE TABLE
DROP TABLE Lecturer;

--SELECT Lecturer Course
CREATE TABLE Course(
CID int,
Name varchar(50),
fee int,
LIC  int,
FOREIGN KEY(LIC) REFERENCES Lecturer
);

--ADD Duration into Course
ALTER TABLE Course 
ADD Duration Varchar(25);

--INSERT VALUES TO Course TABLE
INSERT INTO Course 
VALUES (1,'HND Computing',200000,3);

--INSERT VALUES TO Course TABLE
INSERT INTO Course 
VALUES (2,'HND Business',250000,2);

--INSERT VALUES TO Course TABLE
INSERT INTO Course 
VALUES (3,'HND Networking',200000,4);

--SELECT Course TABLE
SELECT * 
FROM Course;

--DELETING fee COLUMN FROM Course
ALTER TABLE Course DROP COLUMN fee;

--DELETE 3RD ROW  FROM Course
DELETE FROM Course 
WHERE CID=3; 

--UPDATE 12 hours in Course ID 1
UPDATE Course 
SET Duration='12 Hours' 
WHERE CID =1;

-- Join and find lecturer incharge of course
SELECT l.LID,l.FNAME,l.LNAME,c.CID,c.NAME 
FROM Lecturer l,Course c
WHERE l.LID=c.LIC;
