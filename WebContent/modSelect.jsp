<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="dao.css">
	<link rel="stylesheet" type="text/css" href="bootstrap.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>user login</title>
 </head>
<body background="img/background.jpg" 
style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<ul>
  	<li style="float:right"><a href="modSelect.jsp">Exit</a></li>
</ul>
<div align="left">
<img alt="tupian" src="img/logo.png">
</div>
    <div align="right">
   <table>
    <tr>
	<td>
	<a href="uLogin.jsp"><button type="button" class="btn btn-info">READER-login</button></a>
    <a href="loginAdmin.jsp"><button type="button" class="btn btn-info">ADMIN-login</button></a>
    <a href="Llogin.jsp"><button type="button" class="btn btn-info">LIBRARIAN-login</button></a>
	</td>
    </tr>
   </table>
</div>
<br>
	<div align="center">
	<h1>FIND BOOK</h1>
		<form action="HbookInfor.jsp" method="post">
			<table width="500" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="300">the infomation of the book:</td>
					<td width="431"><input type="text" name="find" id="find"
						class="form-control" placeholder="Input What You Want"></td>
				</tr>
			</table>
			<br>
			<p>
				<input type="submit" name="Mfindbook" value="findbook"
					class="btn btn-success"> <input type="reset" name="reset"
					value="reset" class="btn btn-warning">
			</p>
		</form>
	</div>
	<hr>
	<!-- 在用户登陆饥界面展示通知--聂俊 -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />

	<sql:query dataSource="${snapshot}" var="result">
     SELECT * from news;
    </sql:query>
  <hr>
<center>
<h3>Notice:</h3>
	<div align="center" style="width: 80%">
    <table class="table table-striped table-hover table-bordered">
    <c:forEach var="row" items="${result.rows}">
     <tr>
       <th><c:out value="${row.ntitle}"/>:<c:out value="${row.ncontent}"/></th>
        <td align="right"><c:out value="${row.ndate}"/></td>
     </tr>
    </c:forEach>
		
    </table>
	</div>
</center>

	<div class="fixed">
		<ul>
			<p align="center">
				<font color="white">Copyright@Joh Nieh 1998-2018 All Rights
					Reserved</font><br>
					<font color="white">Email:123@qq.com Address:NPU</font>
			</p>
		</ul>
	</div>

</body>
</html>