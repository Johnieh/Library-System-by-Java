<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.library.admin.timeDao"%>
<%@page import="com.library.admin.systemDao"%>
<%@page import="com.library.admin.fineDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Admin</title>
<script type="text/javascript">
	function check(form){
		with(form){
			if(FLinput.value == ""){
				alert("Please Input Librarian Name!");
				return false;
			}
			return true;
		}
	}
</script>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a class="active" href="Admin.jsp">Admin</a></li>
		<li><a class="active" href="adminChangePwd.jsp">ChangePassword</a></li>
		<li style="float: right"><a class="active" href="loginAdmin.jsp">Exit</a></li>
	</ul>
	<div>
		<h3 align="center">Adminstration</h3>
		<!-- 插入搜索框，搜索按钮-djr -->
		<hr>
		<div>
			<div class="btn-group" align="left">
				<form action="findLibrarianCheck.jsp" method="Post" onsubmit="return check(this);">
				<table>
					<tr>
						<td><input type="text" size=40 name="findlibrarianinput" id="FLinput"
							class="form-control"
							placeholder="Input Librarian Name Of What You Want"></td>
						<td><input type="submit" name="findLibrarian" value="SEARCH" class="btn btn-success"></td>
					</tr>
				</table>
				</form>
			</div>
			<div align="right">
				<div class="btn-group" align="right">
					<a href="AdminAddLibrarian.jsp"><button type="button"
							class="btn btn-primary">REGISTER</button></a> <a
						href="editlibrarian.jsp"><button type="button"
							class="btn btn-info">EDIT</button></a> <a href="deleteLibrarian.jsp"><button
							type="button" class="btn btn-danger">DELETE</button></a>
				</div>
			</div>
		</div>
		<!-- 插入reader.jsp的设置账户部分代码并进行修改-djr -->
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
			user="root" password="123456" />

		<sql:query dataSource="${snapshot}" var="result">
	SELECT lid,lname,lpwd,lemail,lphone,lpriority from librarian;
    </sql:query>
		<div align="center" style="width: 100%">

			<table class="table table-striped table-hover table-bordered">
				<tr class="info">
					<th>LIBRARIAN ID:</th>
					<th>NAME:</th>
					<th>PASSWORD:</th>
					<th>EMAIL:</th>
					<th>Phone:</th>
					<th>PRIORITY:</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.lid}" /></td>
						<td><c:out value="${row.lname}" /></td>
						<td><c:out value="${row.lpwd}" /></td>
						<td><c:out value="${row.lemail}" /></td>
						<td><c:out value="${row.lphone}" /></td>
						<td><c:out value="${row.lpriority}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 处理表单 -->
		<%
			String updateFine = request.getParameter("fine");
			String updateTime = request.getParameter("time");
			if (updateFine != null) {
				fineDao finedao = new fineDao();
				finedao.changeFine(updateFine);
			}
			if (updateTime != null) {
				timeDao timedao = new timeDao();
				timedao.changeTime(updateTime);
			}
		%>
		<!-- 从数据库读取数据 -->
		<%
			systemDao system = new systemDao();
			String fine = system.find().get("fine");
			String time = system.find().get("time");
			String bond = system.find().get("bond");
		%>
		<form action="Admin.jsp" method="POST">
			<table align="center" style="font-size: 18px">
				<h3 align="center">FINE</h3>
				<td><input type="text" name="fine" class="form-control"
					value="<%=fine%>"></td>
				<td>&nbsp;RMB</td>
				<td>&nbsp;</td>
				<td><input type="submit" class="btn btn-success" value="save"></td>
			</table>
			<hr />
			<table align="center" style="font-size: 18px">
				<form action="/demo/demo_form.asp">
					<h3 align="center">DAY</h3>
					<td><input type="text" name="time" class="form-control"
						value="<%=time%>"></td>
					<td>&nbsp;DAY</td>
					<td>&nbsp;</td>
					<td><input type="submit" class="btn btn-success" value="save"></td>
			</table>
			<hr />
			<table align="center" style="font-size: 18px">
				<form action="/demo/demo_form.asp">
					<h3 align="center">SECYRITY DEPOSIT</h3>
					<td><input type="text" name="bond" class="form-control"
						value="<%=bond%>"></td>
					<td>&nbsp;RMB</td>
					<td>&nbsp;</td>
					<td><input type="submit" class="btn btn-success" value="save"></td>
			</table>
		</form>
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