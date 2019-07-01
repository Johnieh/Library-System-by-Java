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
<title>EDIT LIBRARIAN</title>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a class="active" href="Admin.jsp">Admin</a></li>
		<li style="float: right"><a class="active" href="login.jsp">Exit</a></li>
	</ul>
<body>
	<div align="center">
		<h2>EDIT A LIBRARIAN</h2>
		<hr>
		<form action="editlibrarianok.jsp" method="GET">
			<table width="700" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td width="50"><strong>Librarian ID:</strong></td>
					<td width="431"><input type="text" name="Lid"
						class="form-control" placeholder="LIBRARIAN ID"></td>
				</tr>

				<tr>
					<td width="50"><strong>New Name:</strong></td>
					<td width="431"><input type="text" name="Lname"
						class="form-control" placeholder="LIBRARIAN Name"></td>
				</tr>

				<tr>
					<td width="300"><strong>New Password:</strong></td>
					<td width="431"><input type="text" name="Lpassword"
						class="form-control" placeholder="LBRARIAN PASSWORD"></td>
				</tr>

				<tr>
					<td width="300"><strong>New Email:</strong></td>
					<td width="431"><input type="text" name="Lemail"
						class="form-control" placeholder="LIBRARIAN EMAIL"></td>
				</tr>

				<tr>
					<td width="300"><strong>New Phone:</strong></td>
					<td width="431"><input type="text" name="Lphone"
						class="form-control" placeholder="LIBRARIAN PHONE"></td>
				</tr>
				
				<tr>
					<td width="300"><strong>New Priority:</strong></td>
					<td width="431"><input type="text" name="Lpriority"
						class="form-control" placeholder="LIBRARIAN PRIORITY"></td>
				</tr>

			</table>
			<br>
			<p>
				<input type="submit" name="actionlibrarian" value="edit-librarian"
					class="btn btn-primary"> <input type="reset" name="reset"
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