<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>edit librarian</title>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a class="active" href="Admin.jsp">Admin</a></li>
		<li style="float: right"><a class="active" href="login.jsp">Exit</a></li>
	</ul>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
	<%
  try{
  %>

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE librarian SET lname = '<%=request.getParameter("Lname") %>' WHERE lid = <%=request.getParameter("Lid") %>
	</sql:update>

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE librarian SET lpwd = '<%=request.getParameter("Lpassword") %>' WHERE lid = <%=request.getParameter("Lid") %>
	</sql:update>

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE librarian SET lemail = '<%=request.getParameter("Lemail") %>' WHERE lid = <%=request.getParameter("Lid") %>
	</sql:update>

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE librarian SET lphone = <%=request.getParameter("Lphone") %> WHERE lid = <%=request.getParameter("Lid") %>
	</sql:update>
	
	<sql:update dataSource="${snapshot}" var="result">
  UPDATE librarian SET lpriority = <%=request.getParameter("Lpriority") %> WHERE lid = <%=request.getParameter("Lid") %>
	</sql:update>
	

	<h2 align="center">
		<font size="10" color="YELLOW">NOTICE!</font>
	</h2>
	<hr>
	<h3 align="center">Your have update a librarian.</h3>
	<h3 align="center">
		the Librarian id is
		<%=request.getParameter("Lid")%>
	</h3>
	<%
  }catch(Exception o)
  {
	  out.println("the librarian id : "+ request.getParameter("Lid") +" is not exist");
  }
%>

	<div class="fixed">
		<ul>
			<p align="center">
				<font color="white">Copyright@Joh Nieh 1998-2018 All Rights
					Reserved</font>
			</p>
			<p align="center">
				<font color="white">Email:123@qq.com Address:NPU</font>
			</p>
		</ul>
	</div>

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