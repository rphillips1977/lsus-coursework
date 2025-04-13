/*
    Author: Robert Lovelace
    Course: CSC 635 Programming with Internet Technologies
    Semester: Spring 2024
    File: create_lsus_registration.sql
    Description: Creates the LSUS registration database and its primary table for 
                 storing Raspberry Pi device registrations submitted by students.
*/

-- Create a new database for LSUS registration system
CREATE DATABASE lsus_registration;

-- Select the newly created database for use
USE lsus_registration;

-- ===============================================
-- Table: registrations
-- Description: Stores student details and associated Raspberry Pi info
-- ===============================================
CREATE TABLE registrations (
    id INT AUTO_INCREMENT PRIMARY KEY,                 -- Unique identifier for each record
    firstName VARCHAR(50) NOT NULL,                    -- Student's first name
    lastName VARCHAR(50) NOT NULL,                     -- Student's last name
    studentID VARCHAR(8) NOT NULL,                     -- 8-digit LSUS student ID
    email VARCHAR(100) NOT NULL,                       -- LSUS email address
    macAddress VARCHAR(17) NOT NULL,                   -- MAC address of the Raspberry Pi (format: AA:BB:CC:DD:EE:FF)
    rpiType VARCHAR(20) NOT NULL,                      -- Raspberry Pi model (e.g., RPi 4, RPi Zero)
    courses VARCHAR(100),                              -- Optional: Courses associated with this device
    academicLevel VARCHAR(20),                         -- Optional: Student’s academic level (e.g., Junior, Graduate)
    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp of when the registration was submitted
);
