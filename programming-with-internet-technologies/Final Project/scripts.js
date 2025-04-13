/**
 * Author: Robert Lovelace
 * Course: CSC 635 Programming with Internet Technologies
 * Semester: Spring 2024
 * File: scripts.js
 * Description: Validates the format of the MAC address input before allowing the 
 *              LSUS RPi registration form to be submitted. Ensures that users 
 *              follow the proper hexadecimal format (e.g., XX:XX:XX:XX:XX:XX).
 */

/**
 * Validates the MAC address input format before allowing form submission.
 * Ensures users follow the proper hexadecimal format (e.g., XX:XX:XX:XX:XX:XX).
 * 
 * @returns {boolean} True if valid, otherwise false (prevents form submission).
 */
function validateForm() {
    // Regular expression to match MAC address format (6 pairs of hex digits separated by colons)
    const macAddressPattern = /^[0-9A-Fa-f]{2}(:[0-9A-Fa-f]{2}){5}$/;

    // Get the entered MAC address value from the input field
    const macAddress = document.getElementById('macAddress').value;

    // If the MAC address format does not match the pattern, show an alert and block form submission
    if (!macAddressPattern.test(macAddress)) {
        alert('Please enter a valid RPi WiFi MAC address in the format XX:XX:XX:XX:XX:XX.');
        return false;
    }

    // If all checks pass, allow the form to submit
    return true;
}
