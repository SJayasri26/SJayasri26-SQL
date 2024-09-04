CREATE DATABASE AttendanceAutomation;

USE AttendanceAutomation;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE LeaveType (
    LeaveTypeID INT PRIMARY KEY AUTO_INCREMENT,
    LeaveTypeName VARCHAR(50) NOT NULL,
    LeaveDescription VARCHAR(255)
);

CREATE TABLE ODType (
    ODTypeID INT PRIMARY KEY AUTO_INCREMENT,
    ODTypeName VARCHAR(50) NOT NULL,
    ODDescription VARCHAR(255)
);

CREATE TABLE LeaveRequest (
    LeaveRequestID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    LeaveTypeID INT,
    StartDate DATE,
    EndDate DATE,
    LeaveStatus VARCHAR(20) DEFAULT 'Pending',
    RequestDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (LeaveTypeID) REFERENCES LeaveType(LeaveTypeID)
);

CREATE TABLE ODRequest (
    ODRequestID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ODTypeID INT,
    ODDate DATE,
    ODStatus VARCHAR(20) DEFAULT 'Pending',
    RequestDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ODTypeID) REFERENCES ODType(ODTypeID)
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    AttendanceDate DATE,
    Status VARCHAR(50), 
    RequestID INT, 
    RequestType VARCHAR(50), 
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

CREATE TABLE LeaveBalance (
    LeaveBalanceID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    LeaveTypeID INT,
    TotalLeaves INT,
    UsedLeaves INT DEFAULT 0,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (LeaveTypeID) REFERENCES LeaveType(LeaveTypeID)
);

INSERT INTO Student (FirstName, LastName, Department, Email, PhoneNumber)
VALUES 
('Jayasri', 'S', 'Sales', 'jayasri@example.com', '1234568938'),
('Dhanush', 'P', 'Marketing', 'dhanush@example.com', '9876543212'),
('Viji', 'S', 'HR', 'viji@example.com', '4567891230'),
('Devan', 'S', 'IT', 'devan@example.com', '3216540987');

SELECT * FROM Student;

INSERT INTO LeaveType (LeaveTypeName, LeaveDescription)
VALUES 
('Annual Leave', 'Yearly allocated leave for vacation'),
('Sick Leave', 'Leave for health-related issues'),
('Maternity Leave', 'Leave for maternity purposes'),
('Paternity Leave', 'Leave for paternity purposes');

SELECT * FROM LeaveType;

INSERT INTO ODType (ODTypeName, ODDescription)
VALUES 
('Client Visit', 'Visit to client site for business purposes'),
('Training', 'On-site or off-site training sessions'),
('Conference', 'Attendance at a professional conference');

SELECT * FROM ODType;

INSERT INTO LeaveRequest (StudentID, LeaveTypeID, StartDate, EndDate)
VALUES 
(1, 1, '2024-09-01', '2024-09-05'), 
(2, 2, '2024-09-10', '2024-09-12'),
(3, 3, '2024-10-01', '2024-12-31'); 

SELECT * FROM LeaveRequest;

INSERT INTO ODRequest (StudentID, ODTypeID, ODDate)
VALUES 
(4, 1, '2024-09-15'), 
(1, 2, '2024-09-20'), 
(2, 3, '2024-09-25'); 

SELECT * FROM ODRequest;

INSERT INTO Attendance (StudentID, AttendanceDate, Status, RequestID, RequestType)
VALUES 
(1, '2024-09-01', 'Leave', 1, 'Leave'), 
(2, '2024-09-10', 'Leave', 2, 'Leave'), 
(1, '2024-09-20', 'On-Duty', 2, 'On-Duty'), 
(2, '2024-09-25', 'On-Duty', 3, 'On-Duty'); 

SELECT * FROM Attendance;

INSERT INTO LeaveBalance (StudentID, LeaveTypeID, TotalLeaves, UsedLeaves)
VALUES 
(1, 1, 20, 5),  
(2, 2, 10, 3),  
(3, 3, 90, 0),  
(4, 1, 15, 0);

SELECT * FROM LeaveBalance;
