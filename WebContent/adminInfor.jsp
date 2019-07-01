<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.library.admin.librarianInforDao"%>
<%@page import="com.library.admin.timeDao"%>
<%@page import="com.library.admin.systemDao"%>
<%@page import="com.library.admin.fineDao"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>librarian infor</title>
<%
String librarianName = session.getAttribute("librarianName").toString();
HashMap<String,String> librarian = new HashMap<String,String>();
librarianInforDao librarianInfor= new librarianInforDao();
librarian = librarianInfor.librarianInformation(librarianName);
final String id = librarian.get("lid");
final String name = librarian.get("lname");
final String password = librarian.get("lpwd");
final String email = librarian.get("lemail");
final String phone = librarian.get("lphone");
final String priority = librarian.get("lpriority");
%>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a class="active" href="Admin.jsp">Admin</a></li>
		<li style="float: right"><a class="active" href="login.jsp">Exit</a></li>
	</ul>
	<div>
		<h3 align="center">Adminstration</h3>
		<!-- 插入搜索框 -->
		<hr>
		<div>
			<div class="btn-group" align="left">
				<form action="findLibrarianCheck.jsp" method="Post">
				<table>
					<tr>
						<td><input type="text" size=40 name="findlibrarianinput"
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
							class="btn btn-info">EDIT</button></a> <a href="deleterd.jsp"><button
							type="button" class="btn btn-danger">DELETE</button></a>
				</div>
			</div>
		</div>
		<!-- <div align="right">
		<div class="btn-group" align="right">
			<a href="AdminAddLibrarian.jsp"><button type="button"
					class="btn btn-primary">REGISTER</button></a> <a href="editlibrarian.jsp"><button
					type="button" class="btn btn-info">EDIT</button></a> 
					<a href="deleterd.jsp"><button type="button" class="btn btn-danger">DELETE</button></a>
		</div>
	</div> -->
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
				<tr>
					<td><%=id%></td>
					<td><%=name %></td>
					<td><%=password%></td>
					<td><%=email%></td>
					<td><%=phone%></td>
					<td><%=priority%></td>
				</tr>
			</table>
		</div>
		<!-- 注释原有设置librarian的界面代码-DJR -->
		<!-- <tr>
  		<td>Librarian1</td>
  		<td><input type="radio" name="check1" value="1" >Grant</td>
  		<td><input type="radio" name="check1" value="0">Revoke</td>
	</tr>
 	<tr>
 		<td>Librarian2</td>
  		<td><input type="radio" name="check2" value="1" >Grant</td>
 		<td><input type="radio" name="check2" value="0">Revoke</td>
 	</tr>
  	<tr>
 		<td>Librarian3</td>
  		<td><input type="radio" name="check3" value="1" >Grant</td>
 		<td><input type="radio" name="check3" value="0">Revoke</td>
	</tr>
	<tr>
 		<td>Librarian4</td>
  		<td><input type="radio" name="check4" value="1" >Grant</td>
  		<td><input type="radio" name="check4" value="0">Revoke</td>
 	</tr> -->
		<hr />
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
<!-- 获得librarian信息 -->