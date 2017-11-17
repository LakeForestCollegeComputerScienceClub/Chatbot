import java.sql.Connection;
import java.sql.DriverManager;

public class User
{
	private static int userCount;
	private static int entriesStored = 15;
	private int userID;
	private String firstName;
	private String lastName;
	private String[] recentEntries;
	
	public User(int userID, String first, String last)
	{
		this.userID = userID;
		this.firstName = first;
		this.lastName = last;
		this.recentEntries = new String[entriesStored];
		userCount++;
	}
	
	public int getID()
	{
		return userID;
	}
	
	public String getFirstName()
	{
		return firstName;
	}
	
	public String getLastName()
	{
		return lastName;
	}
	
	public void saveRecentEntries(String mostRecent)
	{
		//shift all entries back one
		for(int i = 0; i<(entriesStored-1) ; i++)
		{
			recentEntries[i] = recentEntries[i+1];
		}
		//save the latest entry
		recentEntries[entriesStored-1] = mostRecent;
	}
	
	//not sure about this next part
	
	public Connection getConnection()
	{		
		Connection con;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost/test_db","root","");
			return con;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
}
