<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="servlet.*" %>
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
		<li><a class="active" href="LHome.jsp">Home</a></li>
		<li><a href="Llendbook.jsp">LendBook</a></li>
		<li><a href="returnbook.jsp">ReturnBook</a></li>
		<!-- add delete edit -->
		<li><a href="book.jsp">ManageBook</a></li>
		<!--show register-reader delete edit  -->
		<li><a href="reader.jsp">Reader</a></li>
		<!-- News -->
		<li><a href="news.jsp">NewsPost</a></li>
		<li><a href="IncomeView.jsp">Income</a></li>

		<li style="float: right"><a href="Llogin.jsp">Exit</a></li>
	</ul>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />

	<sql:update dataSource="${snapshot}" var="result">
  INSERT INTO reader (Rid,Rname,Rpwd,Rphone,Remail,Raccount) VALUES ('<%=request.getParameter("Rphone") %>','<%=request.getParameter("Rname") %>','123456789','<%=request.getParameter("Rphone") %>','<%=request.getParameter("Remail") %>','300');
  </sql:update>
  
  <%
	Code qr = new Code();
	qr.createBarcode(request.getParameter("Rphone"),new File("D:/bookcode/" + request.getParameter("Rphone") + ".jpg"), "R");
	ChartGraphics b=new ChartGraphics();
	    String id =request.getParameter("Rphone");
	    String name=request.getParameter("Rname");
	    try {
	        b.graphicsGeneration(id, name,"D:/bookcode/"+request.getParameter("Rphone")+".jpg");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
  
  
  %>
	<h2 align="center">
		<font size="10" color="yellow">INFORMATION</font>
	</h2>
	<hr>
	<h3 align="center">
		Your have register a reader.ID:<%=request.getParameter("Rphone") %>
	</h3>
	<h3 align="center">
		the Reader name is
		<%=request.getParameter("Rname")%>
	</h3>

<hr>
<center>
<img alt="photo" src="/p/<%= request.getParameter("Rphone")%>.jpg">
</center>
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
</html>