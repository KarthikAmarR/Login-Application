<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<script>

$(document).ready(function(){
		$("#usname").focus(function(){
		    $("#usjq").slideDown();
		  });
		  $("#usname").blur(function(){
		    $("#usjq").slideUp();
		  });
	});
	
$(document).ready(function(){
	$("#psword").focus(function(){
	    $("#psjq").slideDown();
	  });
	  $("#psword").blur(function(){
	    $("#psjq").slideUp();
	  });
	});
	
var usname=
$(document).ready(function(){
	  $("#btn1").click(function(){
		  var usname=$("#usname").val();
		  var psword=$("#psword").val();
	    $.post("logapp",
	    {
	      username:usname,
	      password:psword
	    },
	    function(success){
	    	if(success=="true")
	    		{
	    		window.location.href="homepage.jsp";
	    		}
	    	else
	    		{
	    		window.location.href="login.jsp";
	    		}
	      });
	  });
	});
	
</script>


<script>
function validateform()
{

	   if( document.sform.uname.value == "" )
	   {
	     alert( "Please provide your name!" );
	     document.sname.uname.focus() ;
	     return false;
	   }
	   if( document.sform.pword.value == "" )
	   {
	     alert( "Please provide a password!" );
	     document.sform.pword.focus() ;
	     return false;
	   }
		   var x = document.sform.mail.value;
		    var atpos = x.indexOf("@");
		    var dotpos = x.lastIndexOf(".");
		    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length) {
		        alert("Not a valid e-mail address");
		        return false;
		    
	   }
	   if( document.sform.phone.value == "-1" || isNaN( document.sname.mail.value))
	   {
	     alert( "Please provide your phone number!" );
	     return false;
	   }
}

</script>

</head>
<body background="\images\logbg.jpg">


<%if(session.getAttribute("loggedin")==null)
	{%>
	
	<br><br><br><br><br>
	<h3 align="center"><font>Login Application</font></h3>
	<br><br>
	<div id="ajaxdiv" align="center">
	<table>
	<tr>
		<td>
	<input id="usname" type="text" required><p id="usjq"  style="display:none">Enter your name</p>
	
		</td>
	</tr>
	<tr>
		<td>
	<input id="psword" type="password" required><p id="psjq"  style="display:none">Enter your password</p>
		</td>
	</tr>
	<tr>
	<td colspan="2">
	
	<button id="btn1" >Login</button>
	<td>
	</tr>
	</table>
	</div>
	
	
	<br><br><br><br><br>
	<div align="center">
	<p><strong>Sign Up</strong></p>
	<form name="sform" action="signapp" method="post" onsubmit="return validateform();">
	<table>
	<tr>
		<td>
			Name:
		</td>
		<td>
			<input type="text" name="uname" placeholder="Enter Your name" >
		</td>
		</tr>
	<tr>
		<td>
			Password:
		</td>
		<td>
			<input type="password" name="pword" placeholder="Enter password" >
		</td>
	</tr>
	<tr>
		<td>
			e-mail:
		</td>
		<td>
			<input type="text" name="mail" placeholder="Enter your email id">
		</td>
	</tr>
	<tr>
		<td>
			Phone:
		</td>
		<td>
			<input type="text" name="phone" placeholder="Enter your phone number">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" name="sign up">
		</td>
	</tr>
	</table>
	</form>
	</div>
<% }
	else
	{
		response.sendRedirect("homepage.jsp");	
	}

%>
	
	
</body>
</html>