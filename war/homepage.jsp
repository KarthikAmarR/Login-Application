<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<body background="\images\home.jpg">
<% String user=(String)session.getAttribute("user"); 
if(user==null)
{
	response.sendRedirect("login.jsp");
}
else
{
%>


<br><br><br><br><br>
<h3 align="center">Hello<font color="cadetblue"> <%=user%></font>. Logged in successfully..!!</h3>
<br><br><br><br><br>
<p align="center"><a href="logoutjsp.jsp">Logout</a></p>

<%} %>

</body>
</html>