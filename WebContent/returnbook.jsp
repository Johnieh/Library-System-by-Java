<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.util.Date" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>RETURN BOOK</title>
<script type="text/javascript">
	function check(form){
		with(form){
			if(BID.value == ""){
				alert("Book ID不能为空");
				return false;
			}
			if(RID.value == ""){
				alert("Reader ID不能为空");
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
	<h3 align="center">RETURN BOOK</h3>
	<div align="center">
		<form action="returnbookcheck.jsp" method="post" onsubmit="return check(this);">
			<hr>
			<table width="700" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="50"><strong>ID of Book:</strong></td>
					<td width="431"><input type="text" name="BID" id="BID"
						class="form-control" placeholder="LEND ID"></td>
				</tr>
				<tr>
					<td width="50"><strong>ID of Reader:</strong></td>
					<td width="431"><input type="text" name="RID" id="RID"
						class="form-control" placeholder="READER ID"></td>
				</tr>

			</table>
			<br>
			<p>
				<input type="submit" name="deletereader" value="return-book"
					class="btn btn-info"> <input type="reset" name="reset"
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