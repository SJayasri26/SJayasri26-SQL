-- 1. Create Database and Use It
CREATE DATABASE  StudentManagementDetails;

USE StudentManagementDetails;

-- 2. Department Table
CREATE TABLE Department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    head_of_department VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO Department (department_name, head_of_department, contact_number, email) 
VALUES 
('Computer Science', 'Dr.V. Kavin', '9876543210', 'hodcs@sscet.edu.in'),
('Information Technology', 'Dr. B.Verma', '8765432109', 'hodit@sscet.edu.in'),
('ECE', 'Dr. C. Kavi', '7654321098', 'hodece@sscet.edu.in'),
('Agriculture', 'Dr. D. Kumar', '6543210987', 'hodagri@sscet.edu.in'),
('BioMedical','Dr.G.Mani','6788459830','hodbme@sscet.edu.in'),
('AI&DS','Dr.R.John','8846579340','hodai&ds@sscet.edu.in');

SELECT * FROM Department;

-- 3. Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department_id INT,
    credits INT,
    level VARCHAR(50),  
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

INSERT INTO Courses (course_name, department_id, credits, level) 
VALUES 
('Database Management Systems', 1, 4, 'Undergraduate'),
('Data Structures and Algorithms', 1, 4, 'Undergraduate'),
('Digital Signal Processing', 3, 3, 'Undergraduate'),
('Microcontrollers and Embedded Systems', 3, 4, 'Undergraduate'),
('Artificial Intelligence', 6, 4, 'Postgraduate'),
('Machine Learning', 6, 4, 'Postgraduate'),
('Agricultural Engineering', 4, 3, 'Undergraduate'),
('Plant Biotechnology', 4, 3, 'Undergraduate'),
('Biomedical Instrumentation', 5, 3, 'Undergraduate'),
('Medical Imaging', 5, 4, 'Postgraduate');

SELECT * FROM Courses;

-- 4. Students Details Table
CREATE TABLE Studentsdetails (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    Firstname VARCHAR(100),
    Lastname VARCHAR(100),
    gender ENUM('Male', 'Female'),
    age INT,
    course_id INT,
    year_of_study INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Example Insertion (Replace course_id with actual IDs from Courses table)
INSERT INTO Studentsdetails (Firstname, Lastname, Gender, Age, course_id, Year_of_study, department_id) 
VALUES 
('Gomathi','Murugan', 'Female', 21, 2, 4, 2), -- Assuming course_id 2 is 'Data Structures and Algorithms'
('Janarthini','Srinivasan', 'Female', 20, 2, 3, 2),
('Moulidharan','Thirumoorthy', 'Male', 20, 1, 3, 1),
('MadhanRaj','Sekar', 'Male', 21, 1, 4, 1),
('Arun','Senthil', 'Male', 19, 1, 2, 1),
('Jayasri','Seenu', 'Female', 20, 2, 3, 2),
('Thamayanthi','Jayaprakash', 'Female', 19, 2, 2, 2),
('Devisri','Sadhasivam', 'Female', 19, 2, 2, 2),
('Viji','Subhramani', 'Female', 18, 5, 1, 6),
('Deepa','Selvakumar', 'Female', 18, 5, 1, 6),
('Dhanush','Ponnusamy', 'Male', 20, 5, 3, 6),
('Aarumugam','Pandi', 'Male', 20, 5, 3, 6),
('IndiranKumar','SenthilKumar', 'Male', 19, 5, 2, 6),
('Ravi','Chandran', 'Male', 18, 3, 1, 3),
('Janarthanan','Rangarajan', 'Male', 20, 7, 3, 4),
('Glory Joy','Christopher', 'Female', 20, 7, 3, 4),
('Gowtham','Natarajan', 'Male', 19, 7, 2, 4),
('Gopika','Govindhsamy', 'Female', 19, 7, 2, 4),
('Anitha','Palaniyappan', 'Female', 19, 3, 2, 3),
('Sowmiya','Manikandan', 'Female', 21, 9, 4, 5),
('Swetha','VenuGopal', 'Female', 20, 9, 3, 5),
('AswinRaj','Karthikeyan', 'Male', 20, 2, 3, 2);

SELECT * FROM Studentsdetails;

-- 5. Fees Table
CREATE TABLE Fees (
    fee_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Studentsdetails(student_id)
);

INSERT INTO Fees (student_id, amount, due_date, status, payment_date) 
VALUES
(1, 500.00, '2024-09-01', 'Paid', '2024-08-15'),
(2, 650.00, '2024-09-05', 'Unpaid', NULL),
(3, 700.00, '2024-09-10', 'Paid', '2024-08-20'),
(4, 450.00, '2024-09-15', 'Unpaid', NULL),
(5, 500.00, '2024-09-20', 'Paid', '2024-08-25'),
(6, 300.00, '2024-09-25', 'Overdue', NULL),
(7, 550.00, '2024-09-01', 'Paid', '2024-08-28'),
(8, 600.00, '2024-09-05', 'Unpaid', NULL),
(9, 700.00, '2024-09-10', 'Paid', '2024-08-30'),
(10, 800.00, '2024-09-15', 'Paid', '2024-09-01'),
(11, 350.00, '2024-09-20', 'Unpaid', NULL),
(12, 400.00, '2024-09-25', 'Overdue', NULL),
(13, 500.00, '2024-09-01', 'Paid', '2024-08-10'),
(14, 750.00, '2024-09-05', 'Paid', '2024-08-15'),
(15, 650.00, '2024-09-10', 'Unpaid', NULL),
(16, 900.00, '2024-09-15', 'Paid', '2024-09-02'),
(17, 850.00, '2024-09-20', 'Unpaid', NULL),
(18, 950.00, '2024-09-25', 'Overdue', NULL),
(19, 600.00, '2024-09-01', 'Paid', '2024-08-12'),
(20, 700.00, '2024-09-05', 'Paid', '2024-08-22'),
(21, 450.00, '2024-09-10', 'Unpaid', NULL);
-- Removed student_id 22

SELECT * FROM Fees;

-- 6. Staff Table (Revised without 'department' column)
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    gender ENUM('Male', 'Female'),
    age INT,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

INSERT INTO Staff (firstname, lastname, gender, age, contact_number, email, department_id) 
VALUES 
('Ravi', 'Kumar', 'Male', 45, '1234567890', 'ravi.kumar@university.edu',6),
('Anita', 'Sharma', 'Female', 38, '2345678901', 'anita.sharma@university.edu',1),
('Sunil', 'Patel', 'Male', 47, '5678901234', 'sunil.patel@university.edu',5),
('Priya', 'Rao', 'Female', 29, '6789012345', 'priya.rao@university.edu',3),
('Rajesh', 'Gupta', 'Male', 42, '7890123456', 'rajesh.gupta@university.edu',3),
('Suman', 'Joshi', 'Female', 36, '8901234567', 'suman.joshi@university.edu',5),
('Deepak', 'Singh', 'Male', 33, '9012345678', 'deepak.singh@university.edu',2),
('Alok', 'Das', 'Male', 55, '0123456789', 'alok.das@university.edu',5),
('Geeta', 'Reddy', 'Female', 28, '1230984567', 'geeta.reddy@university.edu',2),
('Manoj', 'Desai', 'Male', 50, '8900987654', 'manoj.desai@university.edu',3);

SELECT * FROM Staff;

-- 7. Exam Cell Table
CREATE TABLE ExamCell (
    exam_cell_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_cell_incharge VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

INSERT INTO ExamCell (exam_cell_incharge, department_id)
VALUES 
('Dr.V. Kavin', 1),
('Dr. B.Verma', 2),
('Dr. C. Kavi', 3),
('Dr. D. Kumar', 4),
('Dr.G.Mani', 5),
('Dr.R.John', 6);

SELECT * FROM ExamCell;

-- 8. Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    publication_year INT,
    category VARCHAR(100),
    copies_available INT
);

INSERT INTO Books (title, author, publication_year, category, copies_available) 
VALUES 
('Database System Concepts', 'Abraham Silberschatz', 2020, 'Database', 3),
('Introduction to Algorithms', 'Thomas H. Cormen', 2019, 'Algorithms', 5),
('Digital Signal Processing', 'John G. Proakis', 2018, 'Signal Processing', 2),
('Embedded Systems Design', 'Frank Vahid', 2017, 'Embedded Systems', 4),
('Artificial Intelligence: A Modern Approach', 'Stuart Russell', 2021, 'AI', 3),
('Machine Learning Yearning', 'Andrew Ng', 2019, 'Machine Learning', 4),
('Principles of Agricultural Engineering', 'Michael Smith', 2015, 'Agriculture', 2),
('Plant Biotechnology', 'Neha Sharma', 2017, 'Biotechnology', 3),
('Biomedical Instrumentation and Measurements', 'Leslie Cromwell', 2020, 'Biomedical', 4),
('Medical Imaging Techniques', 'Richard Szeliski', 2018, 'Medical Imaging', 2);

SELECT * FROM Books;

-- 9. Library Table
CREATE TABLE Library (
    library_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Studentsdetails(student_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Library (student_id, book_id, issue_date, return_date, status) 
VALUES 
(1, 1, '2024-08-01', '2024-08-15', 'Returned'),
(2, 2, '2024-08-05', NULL, 'Issued'),
(3, 3, '2024-08-10', NULL, 'Issued'),
(4, 4, '2024-08-12', '2024-08-26', 'Returned'),
(5, 5, '2024-08-15', NULL, 'Issued'),
(6, 6, '2024-08-20', '2024-09-03', 'Returned'),
(7, 7, '2024-08-25', NULL, 'Issued'),
(8, 8, '2024-08-28', NULL, 'Issued'),
(9, 9, '2024-09-01', NULL, 'Issued'),
(10, 10, '2024-09-05', NULL, 'Issued');

SELECT * FROM Library;

-- 10. Hostel Table
CREATE TABLE Hostel (
    hostel_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    room_number VARCHAR(10) NOT NULL,
    hostel_name VARCHAR(100),
    fees DECIMAL(10, 2) NOT NULL,
    payment_status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Studentsdetails(student_id)
);

INSERT INTO Hostel (student_id, room_number, hostel_name, fees, payment_status) 
VALUES 
(4, 'A101', 'Hostel A', 5000.00, 'Paid'),
(7, 'B201', 'Hostel B', 4500.00, 'Unpaid'),
(9, 'C301', 'Hostel C', 4800.00, 'Paid'),
(11, 'D401', 'Hostel D', 4700.00, 'Unpaid'),
(13, 'E501', 'Hostel E', 4600.00, 'Paid'),
(15, 'F601', 'Hostel F', 4900.00, 'Paid'),
(17, 'G701', 'Hostel G', 4700.00, 'Unpaid'),
(18, 'H801', 'Hostel H', 4500.00, 'Paid'),
(19, 'I901', 'Hostel I', 4800.00, 'Paid'),
(21, 'J1001', 'Hostel J', 4900.00, 'Unpaid');

SELECT * FROM Hostel;

-- 11. Placement Table
CREATE TABLE Placement (
    placement_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    company_name VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    package DECIMAL(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Studentsdetails(student_id)
);

INSERT INTO Placement (student_id, company_name, position, package, status) 
VALUES 
(1, 'TechCorp', 'Software Developer', 60000.00, 'Placed'),
(2, 'InfoTech', 'Data Analyst', 55000.00, 'Not Placed'),
(3, 'SoftSolutions', 'System Engineer', 58000.00, 'Placed'),
(4, 'NetSolutions', 'Network Engineer', 56000.00, 'Not Placed'),
(5, 'HealthCare Inc.', 'Biomedical Engineer', 62000.00, 'Placed'),
(6, 'AgriTech Ltd.', 'Agricultural Engineer', 53000.00, 'Placed'),
(7, 'BioMed Corp.', 'Research Scientist', 65000.00, 'Not Placed'),
(8, 'AutoMotive', 'Mechanical Engineer', 59000.00, 'Placed'),
(9, 'PlantTech', 'Plant Engineer', 54000.00, 'Not Placed'),
(10, 'ElectroSoft', 'Embedded Systems Engineer', 61000.00, 'Placed');

SELECT * FROM Placement;

-- 12. Transport Table
CREATE TABLE Transport (
    transport_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    route_number VARCHAR(10) NOT NULL,
    pickup_point VARCHAR(100),
    transport_fees DECIMAL(10, 2) NOT NULL,
    payment_status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Studentsdetails(student_id)
);

INSERT INTO Transport (student_id, route_number, pickup_point, transport_fees, payment_status) 
VALUES 
(1, 'R101', 'Station A', 1200.00, 'Paid'),
(2, 'R102', 'Station B', 1100.00, 'Unpaid'),
(3, 'R103', 'Station C', 1150.00, 'Paid'),
(4, 'R104', 'Station D', 1250.00, 'Paid'),
(5, 'R105', 'Station E', 1300.00, 'Unpaid'),
(6, 'R106', 'Station F', 1350.00, 'Paid'),
(7, 'R107', 'Station G', 1400.00, 'Paid'),
(8, 'R108', 'Station H', 1450.00, 'Unpaid'),
(9, 'R109', 'Station I', 1500.00, 'Paid'),
(10, 'R110', 'Station J', 1550.00, 'Unpaid');

SELECT * FROM Transport;

-- 13. Non-Teaching Staff Table
CREATE TABLE NonTeachingStaff (
    non_teaching_staff_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_name VARCHAR(100),
    gender ENUM('Male', 'Female'),
    age INT,
    designation VARCHAR(50),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

INSERT INTO NonTeachingStaff (staff_name, gender, age, designation, contact_number, email, department_id) 
VALUES 
('Ramesh', 'Male', 40, 'Lab Assistant', '1234567890', 'ramesh.lab@university.edu', 1),
('Sita', 'Female', 35, 'Library Assistant', '2345678901', 'sita.lib@university.edu', 2),
('Ganesh', 'Male', 42, 'Technician', '3456789012', 'ganesh.tech@university.edu', 3),
('Meera', 'Female', 30, 'Clerk', '4567890123', 'meera.clerk@university.edu', 4),
('Ravi', 'Male', 50, 'Electrician', '5678901234', 'ravi.electrician@university.edu', 5),
('Lakshmi', 'Female', 28, 'Office Assistant', '6789012345', 'lakshmi.office@university.edu', 6);

SELECT * FROM NonTeachingStaff;

-- 14. Queries

-- a. Books Issued to Students
SELECT 
    s.student_id,
    s.Firstname,
    s.Lastname,
    b.title,
    l.issue_date,
    l.return_date,
    l.status
FROM 
    Studentsdetails s
JOIN 
    Library l ON s.student_id = l.student_id
JOIN 
    Books b ON l.book_id = b.book_id
WHERE 
    l.status = 'Issued';

-- b. Student Details with Fees Details
SELECT 
    s.student_id,
    s.Firstname,
    s.Lastname,
    f.amount,
    f.status,
    f.payment_date
FROM 
    Studentsdetails s
JOIN 
    Fees f ON s.student_id = f.student_id;

-- c. Placed Students Details
SELECT 
    s.student_id,
    s.Firstname,
    s.Lastname,
    p.company_name,
    p.position,
    p.package,
    p.status
FROM 
    Studentsdetails s
JOIN 
    Placement p ON s.student_id = p.student_id
WHERE 
    p.status = 'Placed';

-- d. Student Details with Corresponding Department and Course Details   
SELECT 
    s.student_id,
    s.Firstname,
    s.Lastname,
    d.department_name,
    c.course_name
FROM 
    Studentsdetails s
JOIN 
    Department d ON s.department_id = d.department_id
JOIN 
    Courses c ON s.course_id = c.course_id;

-- e. Student Details with Department and Fees
SELECT 
    s.student_id,
    s.Firstname,
    s.Lastname,
    d.department_name,
    f.amount,
    f.status
FROM
    Studentsdetails s 
JOIN 
    Department d ON s.department_id = d.department_id
JOIN
    Fees f ON s.student_id = f.student_id;
