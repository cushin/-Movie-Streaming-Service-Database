In order to get SQL working with java, this is what I had to do.

Start the Windows service "SQL Server Browser" on the Microsoft SQL server Configuration Manger, 
and set it to "AUTOMATIC".
Also set SQL SERVER AGENT to AUTOMATIC
START all SQL Server Services
RESTART the programs using right click
Then To run it on java I did this:

    Download latest MSSQL JDBC driver from here: http://msdn.microsoft.com/en-us/sqlserver/aa937724.aspx

    Referenced the 2 JAR files in my project: sqljdbc.jar and sqljdbc4.jar (I'm not yet sure if both of the above are required or just one..)

    Make sure the SQL Server Browser windows service is running

    Open SQL Server Configuration Manager and go to Protocols for SQLEXPRESS under SQL Server Network Configuration. 
	Right-click on TCP/IP and choose Properties. Set Enabled = YES.

    While you're there, click on IP Addresses tab and find the section IP All. Set TCP Port to 1433.

	In Eclipse, select the project, go under properties, go under Java Build Path Libraries tab
	
	Select ClassPath, Add External JARs, then add the downloaded MSSQL JDBC drivers.


PROGRAM START
---------------------------------------------------------------------------------------------------------------------------------------------
The Source Code Sent is the Project, Import this Project into your preferred workspace.

Once this is all set up, You can edit the lines at 
            String dbURL = "jdbc:sqlserver://CHRISTIAN-MK-2\\CUSHIN;databaseName=wall_christian_db";
            String user = "sa";
            String pass = "ABCDEFG";
Where it says 'CHRISTIAN-MK-2\\CUSHIN' please put your own Microsoft SQL server info
And your own username and password in order to connect.

THE UI is implemented through the Java Console!

Please Run the Main.Java class in the default package under src.

If you get the program running there will be several different steps that will allow you
to input information into the console that will then be converted to SQL statements and
will display the information back into java

1st you will choose between a Movie or a Show by inputing into the console "Movie" or "Show"
After choosing the titles of the movies or shows will be displayed from SQL.

2nd you will choose a title to get information from by inputing the title name into the console
After correctly putting the title name, The show's Genre, Country of Origin, and Languages will be displayed from SQL.

3rd you will be asked to put in another title from the list of titles displayed before
After inputing the title correctly, it will then display the Cast and Actors from the title from SQL.

Lastly, you will be asked to put in another title from the list of titles displayed before
After inputing the title correctly, it will then show the summary of the title from SQL.

You will be then be prompted to run the program again if you want to try different input.


