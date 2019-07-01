<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "com.library.librarian.LloginDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>check login</title>
</head>
<body>
<%
String lId = request.getParameter("LibrarianId");
String lPwd = request.getParameter("password");
LloginDao login = new LloginDao();
boolean t = login.getUser(lId, lPwd);
if(t){
	session.setAttribute("lId",lId);
	response.sendRedirect("LHome.jsp");
}else{
	response.sendRedirect("Llogin.jsp");
}
%>
</body>
</html>