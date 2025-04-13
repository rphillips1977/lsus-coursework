<?php
/**
 * Author: Robert Lovelace
 * Course: CSC 635 Programming with Internet Technologies
 * Semester: Spring 2024
 * File: db_connect.php
 * Description: Establishes a connection to the LSUS registration MySQL database using MySQLi.
 *              This file should be included wherever database interaction is needed.
 */

// Database configuration
$servername = "localhost";          // Server hosting the database (typically localhost)
$username   = "your_username";      // Replace with your MySQL username
$password   = "your_password";      // Replace with your MySQL password
$dbname     = "lsus_registration";  // Database name to connect to

// Create a new MySQLi connection instance
$conn = new mysqli($servername, $username, $password, $dbname);

// Check if the connection was successful
if ($conn->connect_error) {
    // Terminate script and display error message (recommended only for development)
    die("Connection failed: " . $conn->connect_error);
}

// If no error, the connection is ready to use
?>
