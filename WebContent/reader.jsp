<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Reader</title>
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
	<br>
	<h2 align="center">THE READERS LIST</h2>
	<hr>
	<div align="right">
		<div class="btn-group" align="right">
			<a href="LAddReader.jsp"><button type="button"
					class="btn btn-primary">REGISTER</button></a> <a href="toeditreader.jsp"><button
					type="button" class="btn btn-info">EDIT</button></a> 
					<a href="deleterd.jsp"><button type="button" class="btn btn-danger">DELETE</button></a>
		</div>
	</div>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />

	<sql:query dataSource="${snapshot}" var="result">
       SELECT Rid,Rname,Remail,Rphone,Raccount from reader;
    </sql:query>
	<div align="center" style="width: 100%">

		<table class="table table-striped table-hover table-bordered">
			<tr class="info">
				<th>READER ID:</th>
				<th>NAME:</th>
				<th>EMAIL:</th>
				<th>PHONENUMBER:</th>
				<th>ACCOUNT:</th>
			</tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.Rid}" /></td>
					<td><c:out value="${row.Rname}" /></td>
					<td><c:out value="${row.Remail}" /></td>
					<td><c:out value="${row.Rphone}" /></td>
					<td><c:out value="${row.Raccount}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>

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