function generateMultiplicationTable() {
    const tableElement = document.getElementById('multiplicationTable');
    const maxValue = 12 * 12; // Maximum value in the multiplication table

    // Function to calculate the rainbow color based on the product
    function calculateRainbowColor(value) {
        const f = value / maxValue;
        const a = (1 - f) / 0.2;
        const X = Math.floor(a);
        const Y = Math.floor(255 * (a - X));
        let r = 0, g = 0, b = 0;

        switch (X) {
            case 0: r = 255; g = Y; b = 0; break;
            case 1: r = 255 - Y; g = 255; b = 0; break;
            case 2: r = 0; g = 255; b = Y; break;
            case 3: r = 0; g = 255 - Y; b = 255; break;
            case 4: r = Y; g = 0; b = 255; break;
            case 5: r = 255; g = 0; b = 255; break;
        }

        return `rgb(${r},${g},${b})`;
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
            const bgColor = calculateRainbowColor(product);
            tableRow += `<td style="background-color: ${bgColor}; color: black">${product}</td>`;
        }
        tableRow += '</tr>';
        tableElement.innerHTML += tableRow;
    }
}

generateMultiplicationTable();

