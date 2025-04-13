//=============================================================================
// Author: Robert Lovelace
// Course: CSC 635 Programming with Internet Technologies
// Assignment: CSV to HTML Table Generator
// Description:
//     This Java program reads a CSV file passed as a command-line argument
//     and outputs the content as an HTML page with a styled table.
// Semester: Spring 2024
//=============================================================================

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 * HTMLTableGenerator
 * -------------------
 * Converts CSV input into an HTML table format and prints it to the console.
 */
public class HTMLTableGenerator {

    public static void main(String[] args) {
        // Ensure a CSV file path is provided as a command-line argument
        if (args.length == 0) {
            System.out.println("Usage: java HTMLTableGenerator <csv-file-path>");
            return;
        }

        String line;

        try {
            // Open the CSV file using BufferedReader
            BufferedReader br = new BufferedReader(new FileReader(args[0]));

            // Begin HTML structure and inline styling
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

            // Read each line, split by commas, and format as table rows
            while ((line = br.readLine()) != null) {
                String[] strTokens = line.split(",");

                System.out.println("      <tr>");
                for (String token : strTokens) {
                    System.out.println("        <td>" + token.trim() + "</td>");
                }
                System.out.println("      </tr>");
            }

            // Close table and HTML document
            System.out.println("    </table>");
            System.out.println("  </body>");
            System.out.println("</html>");

            br.close(); // Properly close file resource
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
