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
<title>librarian Add Book</title>
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



	<!-- 数据库读取location和type -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />

	<sql:query dataSource="${snapshot}" var="re">
          SELECT * from location ;
    </sql:query>

	<sql:query dataSource="${snapshot}" var="type">
          SELECT * from type ;
    </sql:query>


	<!--显示内容-->
	<div align="center">
		<h2>ADD NEW BOOK IN LIBRARY</h2>
		<hr>
		<form action="addbookok.jsp" method="GET"
			onsubmit="return check(this);">
			<table width="700" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td width="300"><strong>Name of book:</strong></td>
					<td width="431"><input type="text" name="Bname" id="ABname"
						class="form-control" placeholder="BOOK NAME" required /></td>
				</tr>

				<tr>
					<td width="300"><strong>Author of book:</strong></td>
					<td width="431"><input type="text" name="Bauthor"
						id="ABauthor" class="form-control" placeholder="THE AUTHOR"
						required /></td>
				</tr>

				<tr>
					<td width="300"><strong>ISBN of Book</strong></td>
					<td width="431"><input type="text" name="Bisbn" id="ABisbn"
						class="form-control" placeholder="THE ISBN OF THE BOOK" required /></td>
				</tr>

				<!-- 				<tr>
					<td width="300"><strong>Num of Book</strong></td>
					<td width="431"><input type="text" name="Bnum"
						class="form-control" placeholder="THE NUMBER OF THE BOOK">
					</td>
				</tr> -->

				<tr>
					<td width="50"><strong>ID of location:</strong></td>
					<td width="431"><select name="Blocation" class="form-control">
							<c:forEach var="i" items="${re.rows}">
								<option value="${i.name}">${i.name}</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<td width="50"><strong>ID of Class:</strong></td>
					<td width="431"><select name="Bclass" class="form-control">
							<c:forEach var="i" items="${type.rows}">
								<option value="${i.tname}">${i.tname}</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<td width="300"><strong>Number of Book</strong></td>
					<td width="431"><input type="text" name="num" id="ABclass"
						class="form-control" placeholder="NUMBER OF THE BOOK" required />
					</td>
				</tr>

			</table>
			<br>
			<p>
				<input type="submit" name="actionbook" value="Add-Book"
					class="btn btn-primary"> <input type="reset" name="reset"
					value="reset" class="btn btn-warning">
			</p>
		</form>
	</div>
	<hr>
	<!-- 添加书籍的位置 -->
	<div align="center">
		<h2>Add Book's Location</h2>
		<hr>
		<form action="addlocation.jsp" method="GET">
			<table width="700" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="300"><strong>New Location</strong></td>
					<td width="431"><input type="text" name="location" id="location"
						class="form-control" placeholder="NEW LOCATION" required /></td>
				</tr>
			</table>
			<br>
			<p>
				<input type="submit" name="action" value="Add-Location"
					class="btn btn-info">
			</p>
		</form>
	</div>
	<hr>

	<!-- 添加书籍的类别 -->
	<div align="center">
		<h2>Add Book's Class</h2>
		<hr>
		<form action="addclass.jsp" method="GET">
			<table width="700" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="300"><strong>New Class:</strong></td>
					<td width="431"><input type="text" name="class" id="ABclass"
						class="form-control" placeholder="INPUT NEW TYPE" required /></td>
				</tr>
			</table>
			<br>
			<p>
				<input type="submit" name="action" value="Add-Class"
					class="btn btn-info">
			</p>
		</form>
	</div>
	<hr>
	<!-- 页脚  -->
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
</html>