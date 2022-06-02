CREATE TABLE Teacher (
	id  INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	gender VARCHAR(255) NOT NULL,
	subject VARCHAR(255) NOT NULL
);

CREATE TABLE Pupil (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	gender VARCHAR(255) NOT NULL,
	class VARCHAR(255) NOT NULL
);

CREATE TABLE Teacher_Pupil(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	pupil_id INTEGER REFERENCES Pupil(id) NOT NULL,
	teacher_id INTEGER REFERENCES Teacher(id) NOT NULL,
	UNIQUE(pupil_id, teacher_id)
);
--
--
--INSERT INTO Pupil(first_name, last_name, gender, class) VALUES('saba', 'zedginidze', 'male', 'mexute');
--INSERT INTO Pupil(first_name, last_name, gender, class) VALUES('გიორგი', 'zedginidze', 'female', 'mexute');
--INSERT INTO Pupil(first_name, last_name, gender, class) VALUES('გიორგი', 'zedginidze', 'male', 'meeqvse');
--
--INSERT INTO Teacher(first_name, last_name, gender, subject) VALUES('saba', 'mindadze', 'male', 'science');
--INSERT INTO Teacher(first_name, last_name, gender, subject) VALUES('saba', 'mindadze', 'male', 'MATH');
--
--INSERT INTO Teacher_Pupil(pupil_id, teacher_id) VALUES(1, 1);
--INSERT INTO Teacher_Pupil(pupil_id, teacher_id) VALUES(1, 1);
--INSERT INTO Teacher_Pupil(pupil_id, teacher_id) VALUES(3, 2);

SELECT DISTINCT t1.* FROM Teacher_Pupil
INNER JOIN Pupil ON Pupil.id = Teacher_Pupil.pupil_id
INNER JOIN Teacher t1 ON t1.id = Teacher_Pupil.teacher_id
WHERE Pupil.first_name = 'saba';
