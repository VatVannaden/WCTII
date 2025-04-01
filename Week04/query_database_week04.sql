CREATE DATABASE lab05;
USE lab05;

CREATE TABLE students (
    student_id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    email VARCHAR(50) UNIQUE NOT NULL,
    department_id INT NOT NULL,
    teacher_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    faculty_id INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade DECIMAL(5,2) NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- Insert information
INSERT INTO students (first_name, last_name, date_of_birth, email) VALUES
('Sun', 'Kimsrun', '2002-03-15', 'Kimsrun@example.com'),
('Loem', 'Theankou', '2001-07-22', 'theankou@example.com'),
('Sok', 'Sochetra', '2003-01-10', 'sochetra@example.com'),
('Sean', 'Sulong', '2000-11-05', 'sulong@example.com'),
('Ra', 'Panha', '2002-09-18', 'panha@example.com'),
('Yem', 'Davit', '2001-04-30', 'davit@example.com'),
('Vat', 'Vannaden', '2003-06-12', 'vannaden@example.com');

INSERT INTO departments (department_name) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Information Technology Engineering');

INSERT INTO faculty (email, department_id, teacher_name) VALUES
('sokha@example.com', 1, 'Chen Sokha'),
('vanna@example.com', 2, 'Lim Vanna'),
('rithy@example.com', 3, 'Sok Rithy'),
('lanbok@example.com', 4, 'Lok Ban');

INSERT INTO courses (course_name, course_code, faculty_id, department_id) VALUES
('Database Systems', 'CS101', 1, 1),
('Matrix', 'MATH201', 2, 2),
('Quantum Mechanics', 'PHYS301', 3, 3),
('Computer Graphic', 'CPG401', 4, 4);

INSERT INTO enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2025-02-01', 85.50),
(2, 1, '2025-02-02', 90.00),
(1, 2, '2025-02-03', 88.75),
(4, 3, '2025-02-04', 79.00),
(5, 4, '2025-02-05', 92.25),
(6, 2, '2025-02-06', 40.50),
(7, 3, '2025-02-07', 80.00);

-- 1. Retrieve all students who enrolled in a specific course.
		SELECT s.student_id, s.first_name, s.last_name, s.email 
		FROM students s
		JOIN enrollments e ON s.student_id = e.student_id
		JOIN courses c ON e.course_id = c.course_id
		WHERE c.course_code = 'CS101';

-- 2. Find all faculty members in a particular department.
SELECT f.faculty_id, f.teacher_name, f.email 
FROM faculty f
JOIN departments d ON f.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

-- 3. List all courses a particular student is enrolled in.
SELECT c.course_id, c.course_name, c.course_code 
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.student_id
WHERE s.first_name = 'Vat' AND s.last_name = 'Vannaden';

-- 4. Retrieve students who have not enrolled in any course.
SELECT s.student_id, s.first_name, s.last_name, s.email
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- 5. Find the average grade of students in a specific course.
SELECT c.course_name, c.course_code, AVG(e.grade) AS average_grade
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
WHERE c.course_code = 'MATH201';
