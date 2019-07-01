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
			if(ALid.value == ""){
				alert("ID不能为空");
				return false;
			}
			if(ALname.value == ""){
				alert("Name不能为空");
				return false;
			}
			if(ALemail.value == ""){
				alert("Email不能为空");
				return false;
			}
			if(ALphone.value == ""){
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
		<li><a class="active" href="Admin.jsp">Admin</a></li>
		<li style="float: right"><a class="active" href="login.jsp">Exit</a></li>
	</ul>
<body>
	<div align="center">
		<h2>REGISTER A LIBRARIAN</h2>
		<hr>
		<form action="addlibrarianok.jsp" method="GET" onsubmit="return check(this);">
			<table width="700" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="50"><strong>ID of Librarian:</strong></td>
					<td width="431"><input type="text" name="Lid" id="ALid"
						class="form-control" placeholder="Librarian ID"></td>
				</tr>

				<tr>
					<td width="300"><strong>Name of Librarian:</strong></td>
					<td width="431"><input type="text" name="Lname" id="ALname"
						class="form-control" placeholder="Librarian NAME"></td>
				</tr>
				
				<!-- 使用默认密码00010001，故这里不给出密码的设置 -->
				<!-- <tr>
					<td width="300"><strong>Pwd of Reader:</strong></td>
					<td width="431"><input type="text" name="Rpwd"
						class="form-control" placeholder="READER PWD"></td>
				</tr> -->

				<tr>
					<td width="50"><strong>Email of Librarian:</strong></td>
					<td width="431"><input type="text" name="Lemail" id="ALemail"
						class="form-control" placeholder="Librarian EMAIL"></td>
				</tr>


				<tr>
					<td width="300"><strong>Phone of Librarian:</strong></td>
					<td width="431"><input type="text" name="Lphone" id="ALphone"
						class="form-control" placeholder="Librarian PHONE"></td>
				</tr>
				
				<!-- 权限默认为1（即拥有权限），故这里不给出设置 -->

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