// Ensure DOM is fully loaded before running script
document.addEventListener('DOMContentLoaded', () => {
    // Select inputs and calculate button
    const inputs = document.querySelectorAll('#containerMetrics input[type="text"]');
    const calculateBtn = document.getElementById('calculate');
    const resultsDiv = document.getElementById('results');

    // Function to enable/disable the calculate button based on input validation
    const updateButtonState = () => {
        calculateBtn.disabled = !Array.from(inputs).every(input => input.value.trim() && !isNaN(input.value));
    };

    // Attach event listeners to input fields for real-time validation
    Array.from(inputs).forEach(input => {
        input.addEventListener('input', updateButtonState);
    });

    // Attach click event listener to calculate button
    calculateBtn.addEventListener('click', () => {
        const width = parseFloat(document.getElementById('width').value);
        const height = parseFloat(document.getElementById('height').value);
        const depth = parseFloat(document.getElementById('depth').value);
        displayResults(width, height, depth);
    });

    // Calculate volume of the container
    function calculateVolume(width, height, depth) {
        return (width * height * depth).toFixed(2);
    }

    // Calculate surface area of the container
    function calculateSurfaceArea(width, height, depth) {
        return (2 * (width * height + width * depth + height * depth)).toFixed(2);
    }

    // Calculate total length of the container's edges
    function calculateEdgeLength(width, height, depth) {
        return (4 * (width + height + depth)).toFixed(2);
    }

    // Calculate the weight density of water at different temperatures
    function calculateWeightDensity(temp) {
        const densities = {0: 999.84, 50: 988.04, 100: 958.4, 150: 917.02, 200: 864.07, 250: 799.53, 300: 721.15, 350: 626.95}; // Example values
        return densities[temp].toFixed(2);
    }

    // Display calculated results in the results div
    function displayResults(width, height, depth) {
        const volume = calculateVolume(width, height, depth);
        const surfaceArea = calculateSurfaceArea(width, height, depth);
        const edgeLength = calculateEdgeLength(width, height, depth);
        const densities = [0, 50, 100, 150, 200, 250, 300, 350].map(temp => `${temp}°C: ${calculateWeightDensity(temp)} g/cm³`).join(', ');

        resultsDiv.innerHTML = `
            <table>
                <tr><th>Measurement</th><th>Value</th></tr>
                <tr><td>Width (cm)</td><td>${width}</td></tr>
                <tr><td>Height (cm)</td><td>${height}</td></tr>
                <tr><td>Depth (cm)</td><td>${depth}</td></tr>
                <tr><td>Volume (cm³)</td><td>${volume}</td></tr>
                <tr><td>Surface Area (cm²)</td><td>${surfaceArea}</td></tr>
                <tr><td>Length of Edges (cm)</td><td>${edgeLength}</td></tr>
                <tr><td>Weight Density of Water</td><td>${densities}</td></tr>
            </table>
        `;
    }
});
