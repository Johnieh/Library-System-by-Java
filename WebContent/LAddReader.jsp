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
<title>REGISTER READER</title>
<script type="text/javascript">
	function check(form){
		with(form){
			if(ARid.value == ""){
				alert("ID不能为空");
				return false;
			}
			if(ARname.value == ""){
				alert("Reader Name不能为空");
				return false;
			}
			if(ARpwd.value == ""){
				alert("Password不能为空");
				return false;
			}
			if(ARemail.value == ""){
				alert("Email不能为空");
				return false;
			}
			if(ARphone.value == ""){
				alert("Phone不能为空");
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
	<div align="center">
		<h2>REGISTER A READER</h2>
		<hr>
		<form action="addreaderok.jsp" method="GET" onsubmit="return check(this);">
			<table width="700" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td width="300"><strong>Name of Reader:</strong></td>
					<td width="431"><input type="text" name="Rname" id="ARname"
						class="form-control" placeholder="READER NAME"></td>
				</tr>

				<tr>
					<td width="50"><strong>Email of Reader:</strong></td>
					<td width="431"><input type="text" name="Remail" id="ARemail"
						class="form-control" placeholder="READER EMAIL"></td>
				</tr>

				<tr>
					<td width="300"><strong>Phone of Reader:</strong></td>
					<td width="431"><input type="text" name="Rphone" id="ARphone"
						class="form-control" placeholder="READER PHONE"></td>
				</tr>

			</table>
			<br>
			<p>
				<input type="submit" name="actionbook" value="register"
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