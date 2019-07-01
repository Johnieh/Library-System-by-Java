<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>Delete LIBRARIAN</title>
<script type="text/javascript">
	function check(form){
		with(form){
			if(DeLid.value == ""){
				alert("ID不能为空");
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
		<li style="float: right"><a class="active" href="login.jsp">Exit</a></li>
	</ul>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
	<h3 align="center">DELETE LIBRARIAN</h3>
	<div align="center">
		<form action="deleteLibrarianok.jsp" method="GET" onsubmit="return check(this);">
			<hr>
			<table width="700" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="50"><strong>ID of Librarian:</strong></td>
					<td width="431"><input type="text" name="Lid" id="DeLid"
						class="form-control" placeholder="LIBRARIAN ID"></td>
				</tr>
			</table>
			<br>
			<p>
				<input type="submit" name="deletelibrarian" value="delete-librarian" 
					class="btn btn-danger"> <input type="reset" name="reset"
					value="reset" class="btn btn-warning">
			</p>
		</form>
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