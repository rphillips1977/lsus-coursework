/**
 * Dynamically generates a 12x12 multiplication table
 * with background shading based on product value.
 */
function generateMultiplicationTable() {
    const tableElement = document.getElementById('multiplicationTable');

    // Define the maximum possible product in the table (12 x 12 = 144)
    const maxValue = 12 * 12;

    /**
     * Calculates background and text color for each cell based on product.
     * Applies a grayscale effect to visually represent magnitude.
     *
     * @param {number} value - The product value of the current cell
     * @returns {object} - An object containing background color and contrasting text color
     */
    function calculateColor(value) {
        const scale = value / maxValue; // Normalize product to a range of 0–1
        const colorValue = Math.floor(255 - scale * 255); // Convert scale to a grayscale value (darker for higher values)
        const textColor = colorValue > 128 ? 'black' : 'white'; // Ensure readable contrast
        return {
            bgColor: `rgb(${colorValue}, ${colorValue}, ${colorValue})`,
            textColor
        };
    }

    // === Generate Table Header ===
    let headerRow = '<tr><th>x</th>';
    for (let col = 0; col <= 12; col++) {
        headerRow += `<th>${col}</th>`; // Add column headers from 0 to 12
    }
    headerRow += '</tr>';
    tableElement.innerHTML = headerRow; // Set header row in the table

    // === Generate Table Body ===
    for (let row = 0; row <= 12; row++) {
        let tableRow = `<tr><th>${row}</th>`; // Row header for the current row

        for (let col = 0; col <= 12; col++) {
            const product = row * col;
            const { bgColor, textColor } = calculateColor(product); // Get color styling based on value

            // Add cell with calculated styles and product value
            tableRow += `<td style="background-color: ${bgColor}; color: ${textColor}">${product}</td>`;
        }

        tableRow += '</tr>';
        tableElement.innerHTML += tableRow; // Append row to the table
    }
}

// Initialize the multiplication table once script loads
generateMultiplicationTable();
