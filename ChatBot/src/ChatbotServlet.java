import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatbotServlet
 */
@WebServlet("/ChatbotServlet")
public class ChatbotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatbotServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//type stuff here
		String usernameInput=request.getParameter("username");
		String passwordInput=request.getParameter("password");
		String url = "jdbc:mysql://localhost:3306/chatbot_userlist";
		//String dbName = "C:\\Users\\emmaj\\Desktop\\mysql sample database\\chatbot_userlist";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "Sdea3789";
		try {
			//connect to the database
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Class.forName(driver).newInstance();
			Connection conn = DriverManager.getConnection(url,userName,password);
			
			//execute some MySQL statements
			Statement st = conn.createStatement();
			st.executeQuery("USE chatbot_userlist;"); 
			//put that user data into the database if the username doesn't exist already
			ResultSet existingUsers = st.executeQuery("SELECT * FROM  users WHERE username = '" + usernameInput + "';");
			int check = 0;
			if(!existingUsers.next()) //if there's not already a user w/ the same username, insert this entry
			{
				check = st.executeUpdate("INSERT into users VALUES"
					+"('"+usernameInput+"','"+passwordInput+"','','');");
			}
			if(check==1)
				System.out.print("Successfully inserted value");
			else
				System.out.println("User already exists. Try another username.");
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
