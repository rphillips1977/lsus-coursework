-- Create a new database for LSUS registration system
CREATE DATABASE lsus_registration;

-- Select the newly created database for use
USE lsus_registration;

-- Create the 'registrations' table to store student RPi registration details
CREATE TABLE registrations (
    id INT AUTO_INCREMENT PRIMARY KEY,           -- Unique identifier for each record
    firstName VARCHAR(50) NOT NULL,              -- Student's first name
    lastName VARCHAR(50) NOT NULL,               -- Student's last name
    studentID VARCHAR(8) NOT NULL,               -- 8-digit LSUS student ID
    email VARCHAR(100) NOT NULL,                 -- LSUS email address
    macAddress VARCHAR(17) NOT NULL,             -- MAC address of the Raspberry Pi (format: AA:BB:CC:DD:EE:FF)
    rpiType VARCHAR(20) NOT NULL,                -- Type/model of the Raspberry Pi (e.g., RPi 4, RPi Zero)
    courses VARCHAR(100),                        -- Optional: Course codes associated with this registration
    academicLevel VARCHAR(20),                   -- Optional: Student's academic level (e.g., Undergraduate, Graduate)
    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Auto-filled timestamp of registration
);
