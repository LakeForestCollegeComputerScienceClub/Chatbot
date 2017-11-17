<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chat with the bot</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
  
  <style>
  .user
  {
  	color: #FF0000;
  	font-family: sans-serif;
  	
  }
  .output
  {
  	font-family: sans-serif;
  }
  #displayText
  {
  	width:100%;
  	height:250px;
  	border: 1px solid #000000;
  	overflow: scroll;
  }
  .bot
  {
  	color: #0000FF;
  	font-family: sans-serif;
  }
  </style>
<script type="text/javascript">
$(document).ready(function(){
	$("#sub").click(function(){
	var userText = $('#deText').val();
	$("#displayText").append("<div class='one_user_message_container'><span class='user'><b>You:</b> </span><span class='output'>" + userText + "</span></div><br>");
	$.ajax({
		type:'POST',
		data:{userText: userText},
		url: 'AJAXER',
		success: function(result)
		{
			$("#displayText").append("<div class='one_bot_message_container'><span class='bot'><b>Bot:</b> </span><span class='output'>" + result + "</span></div><br>");
		}
	});
	document.getElementById("deText").value = "";
	});
});
</script>
</head>
<body>

<div id="displayText"></div>

<form>
	<input type="text" id="deText" placeholder="Chat with the bot...">
	<input type="button" id="sub" value="Send">
</form>

</body>
</html>