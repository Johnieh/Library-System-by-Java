<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>REGISTER</title>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
<ul>
	<li><a class="active" href="uHome.jsp">Home</a></li>
  	<!-- <li><a href="uBookList.jsp">BookList</a></li> -->
  	<li><a href="uFindBook.jsp">FindBook</a>
  	<li style="float:right"><a href="uLogin.jsp">Exit</a></li>
</ul>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
user="root" password="123456" />
<sql:update dataSource="${snapshot}" var="result">
	update reader set rname='<%=request.getParameter("changeName") %>' where rid='<%=session.getAttribute("uId")%>';
</sql:update>
<sql:update dataSource="${snapshot}" var="result">
	update reader set remail='<%=request.getParameter("changeEmail") %>' where rid='<%=session.getAttribute("uId")%>';
</sql:update>
<sql:update dataSource="${snapshot}" var="result">
	update reader set rphone='<%=request.getParameter("changePhone") %>' where rid='<%=session.getAttribute("uId") %>';
</sql:update>
<%
response.sendRedirect("uHome.jsp");
%>
</body>
<!-- 页脚 -->
	<div class="fixed">
		<ul>
			<p align="center">
				<font color="white">Copyright@Joh Nieh 1998-2018 All Rights
					Reserved</font><br>
					<font color="white">Email:123@qq.com Address:NPU</font>
			</p>
		</ul>
	</div>
</html>