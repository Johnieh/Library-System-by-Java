<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  page import="email.SendEmail"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="com.library.reader.userDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>send password</title>
</head>
<body background="img/background.jpg" 
style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

	<ul>
		<li style="float: right"><a href="ulogin.jsp">Exit</a></li>
	</ul>
<h2>Mail has been sent! Please remember to check!</h2>

<!-- 栾文飞得到 Email -->
<%
userDao userinfor = new userDao();
String uId = request.getParameter("userId").toString();
HashMap<String,String> user = new HashMap<String,String>();
user = userinfor.userInformation(uId);
final String id = user.get("id");
final String name = user.get("name");
final String email = user.get("email");
final String number = user.get("num");
final String pwd=user.get("pwd");
final String account = user.get("account");
System.out.println(email);
SendEmail  s = new SendEmail();
s.send(email, "Name:"+name+",Password:"+pwd);
%>
<!-- 栾文飞得到 Email -->
<%
    //SendEmail  s = new SendEmail();
    //s.setRECEIVE_EMAIL_ACCOUNT(request.getParameter("${result}"));
    //System.out.println(pageContext.findAttribute("pwd").toString());
%>
</body>
</html>