function validateForm() {
    const macAddressPattern = /^[0-9A-Fa-f]{2}(:[0-9A-Fa-f]{2}){5}$/;
    const macAddress = document.getElementById('macAddress').value;
    if (!macAddressPattern.test(macAddress)) {
        alert('Please enter a valid RPi WiFi MAC address.');
        return false;
    }
    return true;
}
