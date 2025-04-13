<?php
// Database configuration
$servername = "localhost";          // Server hosting the database (usually localhost for local dev)
$username   = "your_username";      // Replace with your MySQL username
$password   = "your_password";      // Replace with your MySQL password
$dbname     = "lsus_registration";  // Name of the database to connect to

// Create a new MySQLi connection instance
$conn = new mysqli($servername, $username, $password, $dbname);

// Check if the connection was successful
if ($conn->connect_error) {
    // Terminate script and output connection error (for development only)
    die("Connection failed: " . $conn->connect_error);
}

// Connection established successfully
// You can now use $conn to perform database queries
?>
