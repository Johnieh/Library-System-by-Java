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
<title>EDIT READER</title>
<script type="text/javascript">
	function check(form){
		with(form){
			if(ERid.value == ""){
				alert("ID不能为空");
				return false;
			}
			if(ERphone.value == ""){
				alert("Phone不能为空");
				return false;
			}
			if(ERname.value == ""){
				alert("Name不能为空");
				return false;
			}
			if(ERemail.value == ""){
				alert("Email不能为空");
				return false;
			}
			if(ERaccount.value == ""){
				alert("Account不能为空");
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
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
	
	<sql:query dataSource="${snapshot}" var="result">
       SELECT * from reader where Rid='<%=request.getParameter("Rid") %>';
    </sql:query>
    
     <c:forEach var="row" items="${result.rows}">
     
    <c:set var="rid" value="${row.rid}" scope="request"/>
    <c:set var="rname" value="${row.rname}" scope="request"/>
    <c:set var="rpwd" value="${row.rpwd}" scope="request"/>
    <c:set var="remail" value="${row.remail}" scope="request"/>
    <c:set var="rphone" value="${row.rphone}" scope="request"/>
    <c:set var="raccount" value="${row.raccount}" scope="request"/>
    
	<div align="center">
		<h2>EDIT A READER</h2>
		<hr>
		<form action="editreaderok.jsp" method="GET" onsubmit="return check(this);">
			<table width="700" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td width="50"><strong>Reader ID:</strong></td>
					<td width="431"><input type="text" name="Rid" id="ERid"
						class="form-control" placeholder="${rid}" value="${rid}"></td>
				</tr>

				<tr>
					<td width="50"><strong>Reader New Phone:</strong></td>
					<td width="431"><input type="text" name="Rphone" id="ERphone"
						class="form-control" placeholder="${rphone}" value="${rphone}"></td>
				</tr>

				<tr>
					<td width="300"><strong>Name of Reader:</strong></td>
					<td width="431"><input type="text" name="Rname" id="ERname"
						class="form-control" placeholder="${rname}" value="${rname}"></td>
				</tr>

				<tr>
					<td width="300"><strong>New Email:</strong></td>
					<td width="431"><input type="text" name="Remail" id="ERemail"
						class="form-control" placeholder="${reamil}" value="${remail }"></td>
				</tr>

				<tr>
					<td width="300"><strong>Update Account</strong></td>
					<td width="431"><input type="text" name="Raccount" id="ERaccount"
						class="form-control" placeholder="${raccount}" value="${raccount}"></td>
				</tr>

			</table>
			<br>
			<p>
				<input type="submit" name="actionbook" value="edit-reader"
					class="btn btn-primary"> <input type="reset" name="reset"
					value="reset" class="btn btn-warning">
			</p>
		</form>
	</div>
	</c:forEach>
	<hr>
	<!-- 展示该用户现在的借阅书籍信息 -->
	<h3 align="center">Current Borrowing</h3>
	<sql:query dataSource="${snapshot}" var="result">
       SELECT pbid,pbname,poutdate,ptime,pfine from presentlist where prid ='<%=request.getParameter("Rid") %>';
    </sql:query>
	<div align="center" style="width: 100%">

		<table class="table table-striped table-hover table-bordered">
			<tr class="info">
				<th>Book ID:</th>
				<th>Book Name:</th>
				<th>Loaned time:</th>
				<th>Remaining time:</th>
				<th>Fine:</th>
			</tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.pbid}" /></td>
					<td><c:out value="${row.pbname}" /></td>
					<td><c:out value="${row.poutdate}" /></td>
					<td><c:out value="${row.ptime}" /></td>
					<td><c:out value="${row.pfine}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 展示该用户现在的借阅书籍信息 -->
	<hr>
	<!-- 用户历史借阅书籍信息 -->
	<h3 align="center"> Historical Borrowing</h3>
	<sql:query dataSource="${snapshot}" var="result">
       SELECT hbid,hbname,houtdate,hindate,hfine from historylist where hrid ='<%=request.getParameter("Rid") %>';
    </sql:query>
	<div align="center" style="width: 100%">

		<table class="table table-striped table-hover table-bordered">
			<tr class="info">
				<th>Book ID:</th>
				<th>Book Name:</th>
				<th>Loaned time:</th>
				<th>Return time:</th>
				<th>Fine:</th>
			</tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.hbid}" /></td>
					<td><c:out value="${row.hbname}" /></td>
					<td><c:out value="${row.houtdate}" /></td>
					<td><c:out value="${row.hindate}" /></td>
					<td><c:out value="${row.hfine}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- 用户历史借阅书籍信息 -->

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