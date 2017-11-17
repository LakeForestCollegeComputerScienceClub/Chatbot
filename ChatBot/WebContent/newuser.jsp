<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Club Chatbot</title>
</head>

<body>
<%@ page import="java.sql.*"%>
<%


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
		out.println("Your login has been created! Please return to the <a href = index.html>main page</a> and login.");
	else
		out.println("User already exists. Try another username.");
	conn.close();
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>