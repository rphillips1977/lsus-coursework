<?php
// =======================
// LSUS RPi Registration Submission Handler
// =======================

// Check if the form was submitted using the POST method
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // === SANITIZE USER INPUT ===
    // Convert special characters to HTML entities to prevent XSS attacks
    $firstName     = htmlspecialchars($_POST['firstName']);
    $lastName      = htmlspecialchars($_POST['lastName']);
    $studentID     = htmlspecialchars($_POST['studentID']);
    $email         = htmlspecialchars($_POST['email']);
    $macAddress    = htmlspecialchars($_POST['macAddress']);
    $rpiType       = htmlspecialchars($_POST['rpiType']);
    $academicLevel = htmlspecialchars($_POST['academicLevel']);

    // === HANDLE MULTI-SELECT CHECKBOX INPUT ===
    // Use null coalescing operator to default to an empty array if 'courses' is not set
    $courses = $_POST['courses'] ?? [];

    // Sanitize each selected course and convert to comma-separated list
    $coursesList = !empty($courses)
        ? implode(", ", array_map('htmlspecialchars', $courses))
        : 'None';

    // === GENERATE HTML OUTPUT TO DISPLAY SUBMITTED DATA ===
    echo "<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Submission Summary</title>
    <style>
        /* Inline styling for quick visual formatting */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 30px;
            color: #333;
        }
        .summary-box {
            background: #fff;
            border: 1px solid #ccc;
            padding: 25px;
            max-width: 600px;
            margin: 0 auto;
            border-radius: 6px;
        }
        h1 {
            color: #4b0082; /* LSU Purple */
        }
        p {
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <div class='summary-box'>
        <h1>Registration Summary</h1>
        <p><strong>First Name:</strong> {$firstName}</p>
        <p><strong>Last Name:</strong> {$lastName}</p>
        <p><strong>Student ID:</strong> {$studentID}</p>
        <p><strong>Email:</strong> {$email}</p>
        <p><strong>RPi WiFi MAC Address:</strong> {$macAddress}</p>
        <p><strong>RPi Type:</strong> {$rpiType}</p>
        <p><strong>Academic Level:</strong> {$academicLevel}</p>
        <p><strong>Courses RPi used for:</strong> {$coursesList}</p>
    </div>
</body>
</html>";

} else {
    // If the page was accessed without submitting the form, show an error message
    echo "<p>Form submission error. Please go back and try again.</p>";
}
?>
