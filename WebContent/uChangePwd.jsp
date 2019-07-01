<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Change pwd</title>
<script type="text/javascript">
	function check(form){
		with(form){
			if(changePwd.value == ""){
				alert("Password不能为空");
				return false;
			}
			if(confirmPwd.value == ""){
				alert("ConfirmPassword不能为空");
				return false;
			}
			return true;
		}
	}
</script>

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
		<h2>CHANGE PASSWORD</h2>
		<hr>
		<form action="uChangePwdOk.jsp" method="GET" onsubmit="return check(this);">
			<table width="700" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td width="50"><strong>New Password:</strong></td>
					<td width="431"><input type="password" name="changePwd" id="changePwd"
						class="form-control" placeholder="NEWPASSWORD"></td>
				</tr>

				<tr>
					<td width="300"><strong>Confirm Again:</strong></td>
					<td width="431"><input type="password" name="confirmPwd" id="confirmPwd"
						class="form-control" placeholder="CONFIRMAGAIN"></td>
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