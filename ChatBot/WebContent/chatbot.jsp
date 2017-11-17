<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>CS Club Chatbot</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).on("submit","#usertext", function(event)
			{
			$.ajax({
				url : "ChatbotLogic",
				data : {
					userText : $("#userTextBox").val()
				},
				success : function(responseText){
					$("#displaytext").text(responseText);
				}
			});
		});
	
			
			/*
			var $form = $(this);
			$.post($form.attr("action"), $form.serialize(), function(responseText)
				{
				$("#somediv").text(responseText);
				});
			event.preventDefault();
			});*/
	</script>
</head>

<body>
	<div id="displaytext"></div>
	<form id="usertext" method="post">
		<textarea rows="4" cols="50" id="userTextBox"></textarea>
		<input type="submit" name="submit" value="Submit"/>
	</form>

<%@ page import="java.sql.*"%>

<%
String url = "jdbc:mysql://localhost:3306/chatbot_userlist";
String driver = "com.mysql.jdbc.Driver";
String userName = "root";
String password = "Sdea3789";
try{
	String session_username = (String)(session.getAttribute("session_username"));
    String usernameInput = request.getParameter("username");
    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatbot_userlist?" + "user=root&password=Sdea3789");    
    PreparedStatement pst = conn.prepareStatement("SELECT username,user_password FROM users WHERE username=?;");
    pst.setString(1, session_username);
    out.println("Your username is "+session_username);
}
catch(Exception e){
	out.println("Something went wrong! Please try again.");
	out.println(e);
}
%>

<!-- The chatbot program we ran locally with Java
to do: figure out how to print & display the last few chat messages
get it to connect to the mysql database of users
create login/sign in pages & figure out error pages
potentially get chatbot to remember more about you-->
<%
/*
String uText = request.getParameter(""); //fix these three lines
txtChat.append("You: " + uText + "\n");
txtEnter.setText("");
*/
//these 'if' statements are the logic of the chatbot
//add more 'if' blocks to make it respond to more phrases
/*
if(uText.contains("hi"))
{
	txtChat.append("AI: Hello there.\n");
}
else if(uText.contains("how are you"))
{
	txtChat.append("AI: I'm fine, thanks.\n");
}
else
{
	//you can use random number generation, as below, to make the bot's responses seem less static
	int decider = (int) (Math.random() * 3 + 1);
	if(decider == 1)
	{
		txtChat.append("AI: I didn't get that.\n");
	}
	else if(decider == 2)
	{
		txtChat.append("AI: Please rephrase that.\n");
	}
	else if(decider == 3)
	{
		txtChat.append("AI: I don't understand.\n");
	}
}
*/
%>


</body>
</html>