CREATE TABLE Teacher (
	id SERIAL  NOT NULL PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	gender VARCHAR(255) NOT NULL,
	subject VARCHAR(255) NOT NULL
);

CREATE TABLE Pupil (
	id SERIAL  NOT NULL PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	gender VARCHAR(255) NOT NULL,
	class VARCHAR(255) NOT NULL
);

CREATE TABLE Teacher_Pupil(
	id SERIAL  NOT NULL PRIMARY KEY,
	pupil_id INTEGER REFERENCES Pupil(id) NOT NULL,
	teacher_id INTEGER REFERENCES Teacher(id) NOT NULL,
	UNIQUE(pupil_id, teacher_id)
);

SELECT DISTINCT t1.* FROM Teacher_Pupil
INNER JOIN Pupil ON Pupil.id = Teacher_Pupil.pupil_id
INNER JOIN Teacher t1 ON t1.id = Teacher_Pupil.teacher_id
WHERE Pupil.first_name = 'გიორგი';
