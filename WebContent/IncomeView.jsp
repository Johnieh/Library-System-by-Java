<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>Income View</title>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a class="active" href="LHome.jsp">Home</a></li>
		<li><a href="Llendbook.jsp">LendBook</a></li>
		<li><a href="returnbook.jsp">ReturnBook</a></li>
		<li><a href="book.jsp">ManageBook</a></li>
		<li><a href="reader.jsp">Reader</a></li>
		<li><a href="news.jsp">NewsPost</a></li>
		<li><a href="IncomeView.jsp">Income</a></li>
		<li style="float: right"><a href="Llogin.jsp">Exit</a></li>
	</ul>

	<h3 align="center">Income History</h3><br/><br/>

<!-- 数据库操作 -->
	
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
		
<!-- 1.Paid -->
	<sql:query dataSource="${snapshot}" var="result">
		SELECT * from historylist 
	</sql:query>
		<h3 align="center">Fine Record(Paid)</h3>
	<c:set var="total" value="0"></c:set>
	<c:forEach  var="row" items="${result.rows }">
    	<c:set var="total" value="${total+row.hfine }"></c:set>
	</c:forEach>
	 <h5> Total Fine Income: <c:out value="${total }"></c:out> yuan</h5>
	<br>

	<div align="center" style="width: 100%">

		<table class="table table-striped table-hover table-bordered">
			<tr class="info">
				<th>No</th>
				<th>Book ID</th>
				<th>Reader ID</th>
				<th>Lend Date</th>
				<th>Return Date</th>
				<th>Income</th>
			</tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.hid}" /></td>
					<td><c:out value="${row.hbid}" /></td>
					<td><c:out value="${row.hrid}" /></td>
					<td><c:out value="${row.houtdate}" /></td>
					<td><c:out value="${row.hindate}" /></td>
					<td><c:out value="${row.hfine}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
<!-- 2.Not Paid -->
	<sql:query dataSource="${snapshot}" var="result">
		SELECT * from presentlist where pfine <> 0 
	</sql:query>
		<br/><br/><h3 align="center">Fine Record(Not Paid)</h3>
	<c:set var="total" value="0"></c:set>
	<c:forEach  var="row" items="${result.rows }">
    	<c:set var="total" value="${total+row.hfine }"></c:set>
	</c:forEach>
	 <h5> Total Fine Income(Not Paid): <c:out value="${total }"></c:out> yuan</h5>
	<br>

<div align="center" style="width: 100%">

		<table class="table table-striped table-hover table-bordered">
			<tr class="info">
				<th>No</th>
				<th>Book ID</th>
				<th>Reader ID</th>
				<th>Lend Date</th>
				<th>Income</th>
			</tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.pid}" /></td>
					<td><c:out value="${row.pbid}" /></td>
					<td><c:out value="${row.prid}" /></td>
					<td><c:out value="${row.poutdate}" /></td>
					<td><c:out value="${row.pfine}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>