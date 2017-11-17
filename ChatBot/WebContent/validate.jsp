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
///String usernameInput=request.getParameter("username");
///String passwordInput=request.getParameter("password");
String url = "jdbc:mysql://localhost:3306/chatbot_userlist";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "Sdea3789";
try{
    String usernameInput = request.getParameter("username");   
    String passwordInput = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatbot_userlist?" + "user=root&password=Sdea3789");    
    PreparedStatement pst = conn.prepareStatement("SELECT username,user_password FROM users WHERE username=? AND user_password=?;");
    pst.setString(1, usernameInput);
    pst.setString(2, passwordInput);
    ResultSet rs = pst.executeQuery();                        
    if(rs.next())
    {
       out.println("Valid login credentials. Welcome, "+usernameInput);
       out.println("Click <a href = chat.jsp>here</a> to chat with the chatbot.");
       session.setAttribute("session_username", usernameInput);
    }
    else
       out.println("Invalid login credentials");            
}
catch(Exception e){
	out.println("Something went wrong! Please try again.");
	out.println(e);
}
%>

</body>
</html>