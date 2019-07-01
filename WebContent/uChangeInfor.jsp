<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.HashMap" %>
    <%@ page import="com.library.reader.userDao" %>
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
	<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>Change infor</title>
</head>
<body background="img/background.jpg" 
style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<ul>
  <li><a class="active" href="uHome.jsp">Home</a></li>
  <!-- <li><a href="uBookList.jsp">BookList</a></li> -->
  <li><a href="uFindBook.jsp">FindBook</a>
  <li style="float:right"><a href="uLogin.jsp">Exit</a></li>
</ul>
</body>
	<div align="center">
		<h2>CHANGE INFORMATION</h2>
	    <hr>
		<!-- 连接数据库 -->
		
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
		<sql:query dataSource="${snapshot}" var="information">
			select rname,remail,rphone from reader where rid = '<%=session.getAttribute("uId")%>';
		</sql:query>
		
		<!-- 连接数据库 -->
		
		<c:forEach var="row" items="${information.rows}">
		<form action="uChangeInforOk.jsp" method="post">
			<table width="700" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td width="50"><strong>NAME:</strong></td>
					<td width="431"><input type="text" name="changeName"
						class="form-control" value="${row.rname}"></td>
				</tr>
				
				<tr>
					<td width="50"><strong>EMAIL:</strong></td>
					<td width="431"><input type="text" name="changeEmail"
						class="form-control" value="${row.remail}"></td>
				</tr>

				<tr>
					<td width="300"><strong>PHONE:</strong></td>
					<td width="431"><input type="text" name="changePhone"
						class="form-control" value="${row.rphone}"></td>
				</tr>
			</table>
			<br>
			<p>
				<input type="submit" name="actionbook" value="OK"
					class="btn btn-primary"> 
				<input type="reset" name="reset" value="CANCEL" 
					class="btn btn-warning">
			</p>
		</form>
		</c:forEach>
	</div>

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