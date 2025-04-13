/**
 * Generates a 13x13 multiplication table (0–12) and populates it in the HTML element
 * with dynamic background colors based on the product value.
 */
function generateMultiplicationTable() {
    // Get reference to the target <table> element
    const tableElement = document.getElementById('multiplicationTable');

    // The highest product in a 12x12 table (used for color normalization)
    const maxValue = 12 * 12;

    /**
     * Converts a numeric product value into a rainbow gradient color.
     * The color becomes more saturated as the product increases.
     *
     * @param {number} value - The multiplication product
     * @returns {string} - RGB string for inline CSS background-color
     */
    function calculateRainbowColor(value) {
        const f = value / maxValue;           // Normalize value to 0–1
        const a = (1 - f) / 0.2;              // Segment calculator
        const X = Math.floor(a);              // Determines color band
        const Y = Math.floor(255 * (a - X));  // Interpolation within the band

        let r = 0, g = 0, b = 0;              // Initialize RGB values

        // Map color segment to an RGB value (smooth rainbow gradient)
        switch (X) {
            case 0: r = 255; g = Y; b = 0; break;           // Red to yellow
            case 1: r = 255 - Y; g = 255; b = 0; break;     // Yellow to green
            case 2: r = 0; g = 255; b = Y; break;           // Green to cyan
            case 3: r = 0; g = 255 - Y; b = 255; break;     // Cyan to blue
            case 4: r = Y; g = 0; b = 255; break;           // Blue to violet
            case 5: r = 255; g = 0; b = 255; break;         // Violet to red/pink
        }

        return `rgb(${r},${g},${b})`; // Return the RGB color string
    }

    // === Build the Header Row ===
    let headerRow = '<tr><th>x</th>'; // Top-left corner label
    for (let col = 0; col <= 12; col++) {
        headerRow += `<th>${col}</th>`; // Column headers: 0–12
    }
    headerRow += '</tr>';
    tableElement.innerHTML = headerRow;

    // === Build the Table Body ===
    for (let row = 0; row <= 12; row++) {
        let tableRow = `<tr><th>${row}</th>`; // Row header: 0–12

        for (let col = 0; col <= 12; col++) {
            const product = row * col;
            const bgColor = calculateRainbowColor(product); // Generate dynamic background
            tableRow += `<td style="background-color: ${bgColor}; color: black">${product}</td>`;
        }

        tableRow += '</tr>';                     // Close row
        tableElement.innerHTML += tableRow;      // Append row to table
    }
}

// Run the function on script load
generateMultiplicationTable();
