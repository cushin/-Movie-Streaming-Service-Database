/*
 * By: Christian Wall
 * UWid: Cushin
 * TCSS 445 Final Project
 */
import java.sql.*;
import java.io.*;
import java.util.Scanner;

public class Main {
	
	/*
	Main program driver and all of the source code. This program connects to the 
	SQL Database that I have written and then Prompts the user to choose information 
	in the Database to look through. The input will then be converted into SQL query
	statements where the output of those statements will be displayed in the console.
	*/
	public static void main(String[] args) throws IOException {
		 
        Connection conn = null;
        String choice = null;
        String choice1 = "";
        String chosenTitle = "";
    	String genre = "";
    	String countryOrigin = "";
    	String languages = "";
    	String actor = "";
    	String character = "";
    	String summary = "";
        Scanner scan = new Scanner(System.in);
 
        	int count = 0;
            String dbURL = "jdbc:sqlserver://CHRISTIAN-MK-2\\CUSHIN;databaseName=wall_christian_db";
            String user = "sa";
            String pass = "ABCDEFG";
        try {  
        	//Connect to SQL server
            conn = DriverManager.getConnection(dbURL, user, pass);
            if (conn != null) {
                DatabaseMetaData dm = (DatabaseMetaData) conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion() + "\n");
                
                //Start program
                System.out.println("Welcome to our Movie Streaming Service!");
                System.out.println("Choose between Movie or Show:");
                //Get user input
                while (scan.hasNext()) {
                	choice = scan.nextLine();
                	if (choice.equals("Movie")|| choice.equals("Show")) {
                		choice1 = choice;
                		break;
                	}
                	else {
                		System.out.println("Wrong input, please try again!");
                	}
                }
                System.out.println();
                //Create SQL statement from input
                String sql = "SELECT *\r\n" + 
                		"FROM " + choice;       		
                Statement st = conn.createStatement();
                ResultSet result = st.executeQuery(sql);
                String[] titleArr = new String[20];
                
                //Display SQL statement
                while (result.next()) {
                	count++;
                	String title = result.getString("title");
                	titleArr[count] = title;
                	System.out.printf("Title %d: %s\n", count, title);
                }
                //reset counter
                count = 0;
                //scan for next input
                System.out.println("\nChoose a Title to learn more details about it:");
                while (scan.hasNext()) {
                	choice = scan.nextLine();
                	
                	for (int i = 1; i < titleArr.length; i++) {
                	String checkInput = titleArr[i];
                		if (choice.equals(checkInput)) {
                			chosenTitle = choice;
                		}
                	}
                	
                	if (choice.equals(chosenTitle)) {
                		System.out.printf("\nChosen Title: %s", chosenTitle);
                		break;
                	}
                	else {
                		System.out.println("Wrong input, please try again!");
                	}
                }

                //Create SQL statement from input
                sql = "SELECT * From " + choice1 + " WHERE Title LIKE '%" + chosenTitle + "%'";
                st = conn.createStatement();
                ResultSet result2 = st.executeQuery(sql);
                
                //Display SQL statement
                while (result2.next()) {
                	count++;
                	genre = result2.getString("GenreID");
                	countryOrigin = result2.getString("CountryName");
                	languages = result2.getString("AvailableLanguages");
                	System.out.printf("\nGenre: %s \nCountry of Origin: %s\nAvailiable Languages: %s\n", genre, countryOrigin, languages);
                }
                count = 0;
                
                //Get User input for details on a Title from SQL
                System.out.println("\nChoose a Title to show its cast and its actors:");
                while (scan.hasNext()) {
                	choice = scan.nextLine();

                	for (int i = 1; i < titleArr.length; i++) {
                	String checkInput = titleArr[i];
                		if (choice.equals(checkInput)) {
                			chosenTitle = choice;
                		}
                	}
                	
                	if (choice.equals(chosenTitle)) {
                		System.out.printf("\nChosen Title: %s", chosenTitle);
                		break;
                	}
                	else {
                		System.out.println("Wrong input, please try again!");
                	}
                }
                
                //Long sql statement
                sql = "SELECT ActorName, CharacterName FROM " + choice1 + ", " + choice1 + "Cast, Actor WHERE Actor.ActorID = " 
                + choice1 + "Cast.ActorID AND " + choice1 + "Cast." + choice1 + "ID = " + choice1 
                + "." + choice1 + "ID AND " + choice1 + ".Title LIKE '%" + chosenTitle + "%'";
                st = conn.createStatement();
                ResultSet result3 = st.executeQuery(sql);
                
                //Display SQL statement
                while (result3.next()) {
                	count++;
                	actor = result3.getString("ActorName");
                	character = result3.getString("CharacterName");
                	System.out.printf("\nActor: %s \nCharacter: %s\n", actor, character);
                }
                count = 0;
                
                
                //scan for next input
                System.out.println("\nChoose a Title to obtain its Summary:");
                for (int i = 1; i < titleArr.length; i++) {
                	String checkInput = titleArr[i];
                		if (checkInput != null) {
                			System.out.println(i + ": " + checkInput);
                		}
                	}
                while (scan.hasNext()) {
                	choice = scan.nextLine();
                	
                	for (int i = 1; i < titleArr.length; i++) {
                	String checkInput = titleArr[i];
                		if (choice.equals(checkInput)) {
                			chosenTitle = choice;
                		}
                	}
                	
                	if (choice.equals(chosenTitle)) {
                		System.out.printf("\nChosen Title: %s", chosenTitle);
                		break;
                	}
                	else {
                		System.out.println("Wrong input, please try again!");
                	}
                }

                //Create SQL statement from input
                sql = "SELECT * From " + choice1 + " WHERE Title LIKE '%" + chosenTitle + "%'";
                st = conn.createStatement();
                ResultSet result4 = st.executeQuery(sql);
                
                //Display SQL statement
                while (result4.next()) {
                	count++;
                	summary = result4.getString("Summary");
                	System.out.printf("\nSumamry: %s \n", summary);
                }
                count = 0;
                
                
                System.out.println("\nThank you for testing my program! I connected it to the SQL server to test different SQL Query input!");
                System.out.println("If you would like to test the program again with different input, please restart it!");
                scan.close();
            }
 
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

}
