CREATE DATABASE lsus_registration;
USE lsus_registration;

CREATE TABLE registrations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    studentID VARCHAR(8) NOT NULL,
    email VARCHAR(100) NOT NULL,
    macAddress VARCHAR(17) NOT NULL,
    rpiType VARCHAR(20) NOT NULL,
    courses VARCHAR(100),
    academicLevel VARCHAR(20),
    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
