# 1. Retrieve all students who enrolled in a specific course
```ruby
		SELECT s.student_id, s.first_name, s.last_name, s.email 
		FROM students s
		JOIN enrollments e ON s.student_id = e.student_id
		JOIN courses c ON e.course_id = c.course_id
		WHERE c.course_code = 'CS101';
```
## Explaination
```
Retrieves all students that enrolled in the course with course 'CS101'.
JOIN enrollments: Links students to enrollment records.
JOIN courses: Links enrollment records to courses.
WHERE c.course_code = 'CS101': Filters the students enrolled in 'CS101'.
```
