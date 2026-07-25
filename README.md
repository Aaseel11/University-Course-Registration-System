# University Course Registration System

A database system designed to manage student course registrations, track academic performance, and generate comprehensive reports using Oracle SQL.

**Author:** Aseel Alanzi  
**Database:** Oracle SQL (Live SQL)

> **All project files, SQL scripts, and documentation are included in this repository.**

## Project Overview

The University Course Registration System is a relational database designed to manage the relationship between students and courses within a university. The system enables:

- Registration of student information
- Management of available courses
- Linking students to courses per semester with grade tracking
- Fast retrieval of enrollment status and academic performance data

## Features

✓ Student data management — name, email, major  
✓ Course management — course names and credit hours  
✓ Enrollment tracking — link students to courses per semester  
✓ Grade recording — track student performance in each course  
✓ Analytics queries — retrieve student performance reports  
✓ Pre-built views — `Student_Report` for comprehensive enrollment summaries  
✓ Database indexes — optimized query performance  
✓ Foreign key constraints — data integrity and relationships  
✓ Many-to-Many relationships — students to courses mapping  
✓ Comprehensive SQL documentation included  

## Database Design

The system uses three linked tables with relational constraints:

| Table | Purpose |
|-------|---------|
| **Students** | Store student records (ID, name, email, major) |
| **Courses** | Store course information (ID, name, credit hours) |
| **Enrollments** | Link students to courses with semester and grade data |

### Tables Structure

**Students**
- `student_id` (PK) — Primary key
- `name` — Student name (required)
- `email` — Unique email address
- `major` — Field of study

**Courses**
- `course_id` (PK) — Primary key
- `course_name` — Course name (required)
- `credit` — Credit hours

**Enrollments** (Junction Table)
- `enrollment_id` (PK) — Primary key
- `student_id` (FK) — Foreign key → Students
- `course_id` (FK) — Foreign key → Courses
- `semester` — Semester of enrollment
- `grade` — Student grade/assessment

### Entity Relationship Diagram

```
Students (1) ────< Enrollments >──── (1) Courses
           student_id      course_id
```

The `Enrollments` table resolves the Many-to-Many relationship between students and courses, allowing multiple students per course and multiple courses per student.

## Tools and Technologies

- **Database System:** Oracle SQL
- **Development Platform:** Oracle Live SQL
- **SQL Features Used:**
  - Foreign Key Constraints
  - Primary Keys & Indexes
  - Views (`CREATE VIEW`)
  - Complex Joins
  - Aggregate Functions
  - Group By Clauses

## How to Use

### Setup & Installation

1. Open an account on [Oracle Live SQL](https://livesql.oracle.com) or use a local Oracle Database
2. Execute the `CREATE TABLE` statements for Students, Courses, and Enrollments (in that order)
3. Insert sample data using `INSERT` statements
4. Create views and indexes for optimized performance

### Sample Queries

**View students with their enrolled courses and grades:**
```sql
SELECT s.name, c.course_name, e.semester, e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON c.course_id = e.course_id;
```

**Count students enrolled per course:**
```sql
SELECT c.course_name, COUNT(*) AS total_students
FROM Enrollments e
JOIN Courses c ON c.course_id = e.course_id
GROUP BY c.course_name;
```

**View comprehensive student enrollment report:**
```sql
SELECT * FROM Student_Report;
```

### Important Notes

- Create `Students` and `Courses` tables first
- Create `Enrollments` table after, as it references both tables via foreign keys
- Maintain the execution order to ensure referential integrity

## Live Demo & Resources

Try the SQL scripts directly on [Oracle Live SQL](https://livesql.oracle.com) (requires free Oracle account)

All SQL code, documentation, and scripts are available in this repository.

## Author

**Aseel Alanzi**

[GitHub](https://github.com/Aaseel11) • [LinkedIn](https://www.linkedin.com/in/aseel-alanazi410)

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
