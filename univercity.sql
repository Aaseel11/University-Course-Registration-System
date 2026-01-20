/*
Database: Oracle SQL (Live SQL)
Project: University Course Registration System
Author: Aseel Alanzi
Year: 2026
*/

-- =====================
-- Students Table
-- =====================
CREATE TABLE Students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    major VARCHAR2(50)
);

-- =====================
-- Courses Table
-- =====================
CREATE TABLE Courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100) NOT NULL,
    credit NUMBER
);

-- =====================
-- Enrollments Table
-- =====================
CREATE TABLE Enrollments (
    enrollment_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    semester VARCHAR2(20),
    grade VARCHAR2(5),
    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    CONSTRAINT fk_course
        FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);

-- =====================
-- Insert Data
-- =====================
INSERT INTO Students VALUES
(1, 'Aseel', 'aseel@email.com', 'Computer Science');

INSERT INTO Students VALUES
(2, 'Sara', 'sara@email.com', 'Information Technology');

INSERT INTO Courses VALUES
(1, 'Database Systems', 3);

INSERT INTO Courses VALUES
(2, 'Operating Systems', 4);

INSERT INTO Enrollments VALUES
(1, 1, 1, 'Fall 2025', 'A');

INSERT INTO Enrollments VALUES
(2, 2, 2, 'Fall 2025', 'B+');

-- =====================
-- Queries
-- =====================

-- Students and their courses
SELECT s.name, c.course_name, e.semester, e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON c.course_id = e.course_id;

-- Number of students per course
SELECT c.course_name, COUNT(*) AS total_students
FROM Enrollments e
JOIN Courses c ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Students with grade A
SELECT name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Enrollments
    WHERE grade = 'A'
);

-- =====================
-- View
-- =====================
CREATE VIEW Student_Report AS
SELECT s.name, s.major, c.course_name, e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON c.course_id = e.course_id;

-- =====================
-- Indexes
-- =====================
CREATE INDEX idx_student ON Enrollments(student_id);
CREATE INDEX idx_course ON Enrollments(course_id);