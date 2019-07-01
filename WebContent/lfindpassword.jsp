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

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
	
	<sql:query dataSource="${snapshot}" var="result">
       SELECT * from librarian where lid='<%=request.getParameter("userId") %>';
    </sql:query>
    
    <c:forEach var="i" items="${result.rows}">
    <c:set var="pwd" value="${i.lpwd}" scope="session"/>
    <c:set var="name" value="${i.lname}" scope="session"/>
    <c:set var="email" value="${i.lemail}" scope="session"/>
    </c:forEach>
<!-- 栾文飞得到 Email -->
<%
String email =(String)session.getAttribute("email");
String name =(String)session.getAttribute("name");
String pwd =(String)session.getAttribute("pwd");
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