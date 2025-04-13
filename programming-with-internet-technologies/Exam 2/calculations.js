// Ensure the DOM is fully loaded before executing any JavaScript logic
document.addEventListener('DOMContentLoaded', () => {
    // Select all text input elements inside the containerMetrics section
    const inputs = document.querySelectorAll('#containerMetrics input[type="text"]');
    
    // Select the calculate button and results display container
    const calculateBtn = document.getElementById('calculate');
    const resultsDiv = document.getElementById('results');

    /**
     * Enables or disables the "Calculate" button based on whether all input fields are filled
     * with valid numeric values.
     */
    const updateButtonState = () => {
        calculateBtn.disabled = !Array.from(inputs).every(input => input.value.trim() && !isNaN(input.value));
    };

    // Add input event listeners to all fields for real-time validation
    inputs.forEach(input => {
        input.addEventListener('input', updateButtonState);
    });

    /**
     * Handles the "click" event on the Calculate button.
     * Extracts input values, parses them to floats, and triggers result display.
     */
    calculateBtn.addEventListener('click', () => {
        const width = parseFloat(document.getElementById('width').value);
        const height = parseFloat(document.getElementById('height').value);
        const depth = parseFloat(document.getElementById('depth').value);
        displayResults(width, height, depth);
    });

    /**
     * Calculates the volume of a rectangular container.
     * @returns {string} Volume rounded to two decimal places
     */
    function calculateVolume(width, height, depth) {
        return (width * height * depth).toFixed(2);
    }

    /**
     * Calculates the surface area of a rectangular container.
     * @returns {string} Surface area rounded to two decimal places
     */
    function calculateSurfaceArea(width, height, depth) {
        return (2 * (width * height + width * depth + height * depth)).toFixed(2);
    }

    /**
     * Calculates the total length of all 12 edges of the container.
     * @returns {string} Edge length rounded to two decimal places
     */
    function calculateEdgeLength(width, height, depth) {
        return (4 * (width + height + depth)).toFixed(2);
    }

    /**
     * Returns the weight density of water in g/cm³ for a given temperature (°C).
     * Uses hardcoded example data for educational purposes.
     * @param {number} temp - Temperature in Celsius
     * @returns {string} Weight density rounded to two decimal places
     */
    function calculateWeightDensity(temp) {
        const densities = {
            0: 999.84,
            50: 988.04,
            100: 958.4,
            150: 917.02,
            200: 864.07,
            250: 799.53,
            300: 721.15,
            350: 626.95
        };
        return densities[temp].toFixed(2);
    }

    /**
     * Displays all calculated results in a formatted HTML table within the resultsDiv.
     * @param {number} width - Width of the container
     * @param {number} height - Height of the container
     * @param {number} depth - Depth of the container
     */
    function displayResults(width, height, depth) {
        const volume = calculateVolume(width, height, depth);
        const surfaceArea = calculateSurfaceArea(width, height, depth);
        const edgeLength = calculateEdgeLength(width, height, depth);

        // Generate string of weight densities for a range of temperatures
        const densities = [0, 50, 100, 150, 200, 250, 300, 350]
            .map(temp => `${temp}°C: ${calculateWeightDensity(temp)} g/cm³`)
            .join(', ');

        // Inject results as a styled HTML table
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
