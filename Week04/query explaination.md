# 1. Retrieve all students who enrolled in a specific course
```ruby
SELECT s.student_id, s.first_name, s.last_name, s.email 
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_code = 'CS101';
```
## Explaination
- Retrieves all students that enrolled in the course with course 'CS101'.
- JOIN enrollments: Links students to enrollment records.
- JOIN courses: Links enrollment records to courses.
- WHERE c.course_code = 'CS101': Filters the students enrolled in 'CS101'.

# 2. Find all faculty members in a particular department.
```ruby
SELECT f.faculty_id, f.teacher_name, f.email 
FROM faculty f
JOIN departments d ON f.department_id = d.department_id
WHERE d.department_name = 'Computer Science';
```
## Explaination
Retrieves all faculty members from the 'Computer Science' department.
JOIN departments: Connects faculty with its departments.
WHERE d.department_name = 'Computer Science': Filters only the Computer Science department.

# 3. List all courses a particular student is enrolled in.
```ruby
SELECT c.course_id, c.course_name, c.course_code 
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.student_id
WHERE s.first_name = 'Vat' AND s.last_name = 'Vannaden';
```
## Explaination
Finds all courses where a student named 'Vat Vannaden' is enrolled.
JOIN enrollments: Connects courses with all enrollment records.
JOIN students: Links enrollments to student.
WHERE s.first_name = 'Vat' AND s.last_name = 'Vannaden': Filters by the student's full name.

# 4. Retrieve students who have not enrolled in any course.
```ruby
SELECT s.student_id, s.first_name, s.last_name, s.email
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
```
## Explaination
Finds students who are not enrolled in any course.
LEFT JOIN enrollments: Includes all students, even those with no enrollments.
WHERE e.student_id IS NULL: Filters out students who have no records in enrollments.

# 5. Find the average grade of students in a specific course.
```ruby
SELECT c.course_name, c.course_code, AVG(e.grade) AS average_grade
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
WHERE c.course_code = 'MATH201';
```
## Explaination
Calculates the average grade of students in 'MATH201'.
JOIN enrollments: Connects courses with student grades.
AVG(e.grade): Calculate the average grade.
WHERE c.course_code = 'MATH201': Filters to include only 'MATH201'.
