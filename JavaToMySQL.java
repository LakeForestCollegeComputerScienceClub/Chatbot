import java.sql.*;
import java.util.Scanner;

public class JavaToMySQL 
{

	public static void main(String[] args) 
	{
		//set up a connection to the database
		
		/********************************************************************************
		IMPORTANT: you'll need to double-check the database file path and root password
		for your computer if you want to copy/paste this code to run it yourself
		*********************************************************************************/
		String url = "jdbc:mysql://localhost:3306/chatbot_userlist";
		//String dbName = "C:\\Users\\emmaj\\Desktop\\mysql sample database\\chatbot_userlist";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "insert your root password here";
		try {
			//connect to the database
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Class.forName(driver).newInstance();
			Connection conn = DriverManager.getConnection(url,userName,password);
			
			//execute some MySQL statements
			Statement st = conn.createStatement();
			st.executeQuery("USE chatbot_userlist;");
			
			//use user input to create a new user profile in the database
			//(eventually we'll be taking this from the user of the web app,
			//but for now we'll just use a scanner object to take this input from the console)
			Scanner scan = new Scanner(System.in);
			System.out.println("------Create a new user------");
			System.out.println("Enter a username:");
			String usernameInput = scan.nextLine();
			System.out.println("Enter a password:");
			String passwordInput = scan.nextLine();
			System.out.println("Enter a first name:");
			String firstNameInput = scan.nextLine();
			System.out.println("Enter a last name:");
			String lastNameInput = scan.nextLine();
			
			//put that user data into the database if the username doesn't exist already
			ResultSet existingUsers = st.executeQuery("SELECT * FROM  users WHERE username = '" + usernameInput + "';");
			int check = 0;
			if(!existingUsers.next()) //if there's not already a user w/ the same username, insert this entry
			{
				check = st.executeUpdate("INSERT into users VALUES"
					+"('"+usernameInput+"','"+passwordInput+"','"+firstNameInput+"','"+lastNameInput+"');");
			}
			if(check==1)
				System.out.print("Successfully inserted value");
			else
				System.out.println("User already exists. Try another username.");
			
			
			//for retrieving user data:
			ResultSet results = st.executeQuery("SELECT * FROM  users WHERE username = '" + usernameInput + "';");
			while (results.next()) {
				String currentUsername = results.getString("username");
				String currentPassword = results.getString("password");
				System.out.println("User: " + currentUsername + "\t" + currentPassword);
			}
			
			
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
