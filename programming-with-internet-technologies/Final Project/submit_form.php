<?php
// Ensure the script only runs when accessed via a POST request
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // === Input Sanitization ===
    // Use htmlspecialchars() to prevent XSS attacks by escaping HTML special characters
    $firstName     = htmlspecialchars($_POST['firstName']);
    $lastName      = htmlspecialchars($_POST['lastName']);
    $studentID     = htmlspecialchars($_POST['studentID']);
    $email         = htmlspecialchars($_POST['email']);
    $macAddress    = htmlspecialchars($_POST['macAddress']);
    $rpiType       = htmlspecialchars($_POST['rpiType']);
    $courses       = $_POST['courses']; // This is an array, no need to sanitize here—handled below
    $academicLevel = htmlspecialchars($_POST['academicLevel']);

    // === Build HTML Confirmation Content ===
    $htmlContent = "<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <title>Registration Confirmation</title>
</head>
<body>
    <h1>LSUS RPi Registration Confirmation</h1>
    <p><strong>First Name:</strong> {$firstName}</p>
    <p><strong>Last Name:</strong> {$lastName}</p>
    <p><strong>Student ID:</strong> {$studentID}</p>
    <p><strong>Email:</strong> {$email}</p>
    <p><strong>MAC Address:</strong> {$macAddress}</p>
    <p><strong>RPi Type:</strong> {$rpiType}</p>
    <p><strong>Courses RPi Used For:</strong></p>
    <ul>";

    // Loop through selected courses and escape each entry before output
    foreach ($courses as $course) {
        $htmlContent .= "<li>" . htmlspecialchars($course) . "</li>";
    }

    $htmlContent .= "</ul>
    <p><strong>Academic Level:</strong> {$academicLevel}</p>
</body>
</html>";

    // === Save Confirmation to a File ===
    // Save the generated confirmation to an HTML file (overwrites each time)
    file_put_contents('registration.html', $htmlContent);

    // === Output Confirmation Message ===
    echo 'Registration confirmed. <a href="registration.html" target="_blank">View confirmation</a>';
}
?>
