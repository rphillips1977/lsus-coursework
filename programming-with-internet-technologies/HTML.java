// Import necessary Java I/O classes
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 * HTMLTableGenerator
 * -------------------
 * This program reads a CSV file passed via command-line argument,
 * and outputs an HTML file structure with the CSV data printed in table format.
 */
public class HTMLTableGenerator {

    public static void main(String[] args) {
        // Ensure a file path is provided
        if (args.length == 0) {
            System.out.println("Usage: java HTMLTableGenerator <csv-file-path>");
            return;
        }

        String line;

        try {
            // Create a BufferedReader to read the CSV file line-by-line
            BufferedReader br = new BufferedReader(new FileReader(args[0]));

            // Begin HTML structure
            System.out.println("<!DOCTYPE html>");
            System.out.println("<html>");
            System.out.println("  <head>");
            System.out.println("    <title>HTML Output</title>");
            System.out.println("    <style>");
            System.out.println("      table { border-collapse: collapse; width: 100%; }");
            System.out.println("      td, th { border: 1px solid #000; padding: 8px; text-align: left; }");
            System.out.println("    </style>");
            System.out.println("  </head>");
            System.out.println("  <body>");
            System.out.println("    <h2>CSV Data as HTML Table</h2>");
            System.out.println("    <table>");

            // Read each line of the CSV file
            while ((line = br.readLine()) != null) {
                String[] strTokens = line.split(",");

                // Start a new row for each line
                System.out.println("      <tr>");
                for (String token : strTokens) {
                    // Output each cell as a <td>
                    System.out.println("        <td>" + token.trim() + "</td>");
                }
                System.out.println("      </tr>");
            }

            // Close table and HTML structure
            System.out.println("    </table>");
            System.out.println("  </body>");
            System.out.println("</html>");

            br.close(); // Always close the BufferedReader
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
