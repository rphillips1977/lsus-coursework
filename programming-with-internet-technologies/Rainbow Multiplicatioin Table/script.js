// Main function to generate a multiplication table from 0x0 to 12x12
function generateMultiplicationTable() {
    // Get the table element from the HTML where the multiplication table will be rendered
    const tableElement = document.getElementById('multiplicationTable');

    // The maximum value that can appear in the table (12 x 12 = 144)
    const maxValue = 12 * 12;

    // Function to calculate a rainbow gradient color based on the product value
    function calculateRainbowColor(value) {
        // Normalize the value between 0 and 1
        const f = value / maxValue;

        // Map the normalized value to a color range
        const a = (1 - f) / 0.2;
        const X = Math.floor(a);            // Segment of the color scale
        const Y = Math.floor(255 * (a - X)); // Interpolation factor within the segment

        // Initialize RGB color channels
        let r = 0, g = 0, b = 0;

        // Assign colors based on segment index (X)
        switch (X) {
            case 0: r = 255; g = Y; b = 0; break;         // Red to yellow
            case 1: r = 255 - Y; g = 255; b = 0; break;   // Yellow to green
            case 2: r = 0; g = 255; b = Y; break;         // Green to cyan
            case 3: r = 0; g = 255 - Y; b = 255; break;   // Cyan to blue
            case 4: r = Y; g = 0; b = 255; break;         // Blue to violet
            case 5: r = 255; g = 0; b = 255; break;       // Violet to red/pink
        }

        // Return the color in CSS-compatible rgb() format
        return `rgb(${r},${g},${b})`;
    }

    // Create the header row (top row of the table: 0 to 12)
    let headerRow = '<tr><th>x</th>'; // First cell as a label
    for (let col = 0; col <= 12; col++) {
        headerRow += `<th>${col}</th>`;
    }
    headerRow += '</tr>';

    // Set the initial table header
    tableElement.innerHTML = headerRow;

    // Loop through each row (0 to 12)
    for (let row = 0; row <= 12; row++) {
        let tableRow = `<tr><th>${row}</th>`; // First column as row header

        // Loop through each column (0 to 12)
        for (let col = 0; col <= 12; col++) {
            const product = row * col;                        // Calculate the multiplication product
            const bgColor = calculateRainbowColor(product);   // Get a color for the background
            tableRow += `<td style="background-color: ${bgColor}; color: black">${product}</td>`;
        }

        tableRow += '</tr>';

        // Append the constructed row to the table
        tableElement.innerHTML += tableRow;
    }
}

// Call the function once the script loads to generate the table
generateMultiplicationTable();
