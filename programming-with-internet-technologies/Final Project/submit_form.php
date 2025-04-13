<?php
// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $firstName = htmlspecialchars($_POST['firstName']);
    $lastName = htmlspecialchars($_POST['lastName']);
    $studentID = htmlspecialchars($_POST['studentID']);
    $email = htmlspecialchars($_POST['email']);
    $macAddress = htmlspecialchars($_POST['macAddress']);
    $rpiType = htmlspecialchars($_POST['rpiType']);
    $courses = $_POST['courses'];
    $academicLevel = htmlspecialchars($_POST['academicLevel']);

    // Create an HTML document with the submitted data
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

    // List courses
    foreach ($courses as $course) {
        $htmlContent .= "<li>{$course}</li>";
    }

    $htmlContent .= "</ul>
    <p><strong>Academic Level:</strong> {$academicLevel}</p>
</body>
</html>";

    // Save the HTML to a file
    file_put_contents('registration.html', $htmlContent);

    // Optionally, you can send the user to a confirmation page or back to the form
    echo 'Registration confirmed. <a href="registration.html">View confirmation</a>';
}
?>
