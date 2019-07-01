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
<title>EDIT NEWS</title>
<script type="text/javascript">
	function check(form){
		with(form){
			if(Ntitle.value == ""){
				alert("Title不能为空");
				return false;
			}
			if(Ncontent.value == ""){
				alert("Content不能为空");
				return false;
			}
			return true;
		}
	}
	
	function check1(form){
		with(form){
			if(DNews.value == ""){
				alert("Please Input Title!");
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
		<h2>ADD A NEWS</h2>
		<hr>
		<form action="addnews.jsp" method="GET" onsubmit="return check(this);">
			<table width="700" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td width="50"><strong>Title:</strong></td>
					<td width="431"><input type="text" name="title" id="Ntitle"
						class="form-control" placeholder="NEWS TITLE"></td>
				</tr>

				<tr>
					<td width="50"><strong>Content:</strong></td>
					<td width="431"><textarea rows="10" cols="30" name="content" id="Ncontent"
							class="form-control" placeholder="INPUT THE CONTENT OF NEWS......"></textarea></td>
				</tr>

			</table>
			<br>
			<p>
				<input type="submit" name="actionbook" value="add-News"
					class="btn btn-primary"> 
					<input type="reset" name="reset"
					value="reset" class="btn btn-warning">
			</p>
		</form>
		<hr>
		
		<form action="deletenews.jsp" method="GET" onsubmit="return check1(this);">
			<table width="700" border="0" cellspacing="0" cellpadding="0">
	
		        <tr>
					<td width="50"><strong>Title:</strong></td>
					<td width="431"><input type="text" name="ntitle" id="DNews"
						class="form-control" placeholder="Input the title of the news what you want to delete"></td>
				</tr>
			</table>
			<input type="submit" name="actionbook" value="delete-News" 
					class="btn btn-danger"> 
		</form>
		


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