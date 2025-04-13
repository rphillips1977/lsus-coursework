<?php
// Check if the form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $firstName = htmlspecialchars($_POST['firstName']);
    $lastName = htmlspecialchars($_POST['lastName']);
    $studentID = htmlspecialchars($_POST['studentID']);
    $email = htmlspecialchars($_POST['email']);
    $macAddress = htmlspecialchars($_POST['macAddress']);
    $rpiType = htmlspecialchars($_POST['rpiType']);
    $academicLevel = htmlspecialchars($_POST['academicLevel']);

    // Retrieve all selected courses
    $courses = $_POST['courses'] ?? []; // Using null coalescing operator to avoid undefined index notice
    $coursesList = !empty($courses) ? implode(", ", $courses) : 'None';

    // Generate HTML to display the data
    echo "<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Submission Summary</title>
</head>
<body>
    <h1>Registration Summary</h1>
    <p><strong>First Name:</strong> {$firstName}</p>
    <p><strong>Last Name:</strong> {$lastName}</p>
    <p><strong>Student ID:</strong> {$studentID}</p>
    <p><strong>Email:</strong> {$email}</p>
    <p><strong>RPi WiFi MAC Address:</strong> {$macAddress}</p>
    <p><strong>RPi Type:</strong> {$rpiType}</p>
    <p><strong>Academic Level:</strong> {$academicLevel}</p>
    <p><strong>Courses RPi used for:</strong> {$coursesList}</p>
</body>
</html>";
} else {
    // Form not submitted, redirect to the form page or show an error
    echo "<p>Form submission error. Please go back and try again.</p>";
}
?>
