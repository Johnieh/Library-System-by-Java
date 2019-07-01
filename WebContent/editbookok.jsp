<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
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
<title>edit Book</title>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a class="active" href="home.jsp">Home</a></li>
		<li><a href="Llendbook.jsp">LendBook</a></li>
		<li><a href="returnbook.jsp">ReturnBook</a></li>
		<!-- add delete edit -->
		<li><a href="toeditbook.jsp">ManageBook</a></li>
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
	<!-- 更新书的名字 -->

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE book SET bname = '<%=request.getParameter("Bname")%>' WHERE bid = '<%=request.getParameter("Bid")%>'
	</sql:update>


	<!-- 更新书的作者 -->

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE book SET bauthor = '<%=request.getParameter("Bauthor")%>' WHERE bid = '<%=request.getParameter("Bid")%>'
	</sql:update>


	<!-- 更新书的ISBN -->

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE book SET bisbn = '<%=request.getParameter("Bisbn")%>' WHERE bid = '<%=request.getParameter("Bid")%>'
	</sql:update>


	<!-- 更新书的ISBN -->

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE book SET bnum = '<%=request.getParameter("Bnum")%>' WHERE bid = '<%=request.getParameter("Bid")%>'
	</sql:update>


	<!-- 更新书的位置location -->

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE book SET blocation = '<%=request.getParameter("Blocation")%>' WHERE bid = '<%=request.getParameter("Bid")%>'
	</sql:update>


	<!-- 更新书的类别class -->

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE book SET bclass = '<%=request.getParameter("Bclass")%>' WHERE bid = '<%=request.getParameter("Bid")%>'
	</sql:update>
	
		<!-- 更新书的类别状态 -->

	<sql:update dataSource="${snapshot}" var="result">
  UPDATE book SET bable = '<%=request.getParameter("Bstatus")%>' WHERE bid = '<%=request.getParameter("Bid")%>'
	</sql:update>


	<br>
	<h3 align="center">
		You have edit the book whose id is
		<%=request.getParameter("Bid")%></h3>
	<hr>

	<!--输出修改后的书籍信息  -->
	<center>
	<div align="center" style="width: 40%">

		<table class="table table-striped table-hover table-bordered">
			<tr class="info">
				<th>BOOK ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("Bid")%></th>
			</tr>
			<tr class="info">
				<th>NAME:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("Bname")%></th>
			</tr>
			<tr class="info">
				<th>AUTHOR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("Bauthor")%></th>
			</tr>
			<tr class="info">
				<th>ISBN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("Bisbn")%></th>
			</tr>
			<tr class="info">
				<th>NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("Bnum")%></th>
			</tr>
			<tr class="info">
				<th>Location:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("Blocation")%></th>
			</tr>
			<tr class="info">
				<th>Class:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("Bclass")%></th>
			</tr>
		</table>
	</div>
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