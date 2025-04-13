function generateMultiplicationTable() {
    const tableElement = document.getElementById('multiplicationTable');
    let maxValue = 12 * 12; // Maximum value in the multiplication table

    // Function to calculate the shade of gray based on the product
    function calculateColor(value) {
        const scale = value / maxValue; // Normalize value to 0-1
        const colorValue = Math.floor(255 - scale * 255); // Calculate the shade of gray
        const textColor = colorValue > 128 ? 'black' : 'white'; // Contrast color for text
        return { bgColor: `rgb(${colorValue}, ${colorValue}, ${colorValue})`, textColor };
    }

    // Create the header row
    let headerRow = '<tr><th>x</th>';
    for (let col = 0; col <= 12; col++) {
        headerRow += `<th>${col}</th>`;
    }
    headerRow += '</tr>';
    tableElement.innerHTML = headerRow;

    // Fill in the table rows
    for (let row = 0; row <= 12; row++) {
        let tableRow = `<tr><th>${row}</th>`;
        for (let col = 0; col <= 12; col++) {
            const product = row * col;
            const { bgColor, textColor } = calculateColor(product);
            tableRow += `<td style="background-color: ${bgColor}; color: ${textColor}">${product}</td>`;
        }
        tableRow += '</tr>';
        tableElement.innerHTML += tableRow;
    }
}

generateMultiplicationTable();
