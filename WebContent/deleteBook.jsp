<%@page import="com.library.manageBook.Getdate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>have deleten book</title>
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
	<!--
     JDBC 驱动名及数据库 URL 
             数据库的用户名与密码，需要根据自己的设置
     useUnicode=true&characterEncoding=utf-8 防止中文乱码
     -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
		
	<sql:query dataSource="${snapshot}" var="result">
          SELECT * from presentlist where pbid ='<%=request.getParameter("Bid")%>';
    </sql:query>
    <c:if test="${result.rowCount == 0}" var="deletebook">
	<%
			Getdate t= new Getdate();
			String date=t.getdate();
			session.setAttribute("time", date);
	%>
	<sql:query dataSource="${snapshot}" var="result">
     SELECT * from book where bid ='<%=request.getParameter("Bid")%>';
    </sql:query>
    
    <c:forEach var="i" items="${result.rows}">
     <c:set var="name" value="${i.bname}"/>
     <c:set var="author" value="${i.bauthor}"/>
    </c:forEach>
    
	<sql:update dataSource="${snapshot}" var="in">
    INSERT INTO deletebook (did,dbname,dbauthor,ddate) VALUES ('<%=request.getParameter("Bid")%>','${name}', '${author}', '<%=session.getAttribute("time") %>');
    </sql:update>
    
	<c:forEach var="row" items="${result.rows}">
	<sql:update dataSource="${snapshot}" var="count">
    UPDATE deletebook SET dbname = "${row.bname}" WHERE dId = '<%=request.getParameter("Bid")%>';
   </sql:update>
   
   	<sql:update dataSource="${snapshot}" var="count1">
    UPDATE deletebook SET dbauthor = "${row.bauthor}" WHERE dId = '<%=request.getParameter("Bid")%>';
   </sql:update>
	</c:forEach>

	<sql:update dataSource="${snapshot}" var="count">
  DELETE FROM book WHERE bid = '<%=request.getParameter("Bid")%>'
	</sql:update>
		<h2 align="center">
		<font size="10" color="yellow">Notice:</font>
	</h2>
	<hr>
	<h3 align="center">Your have deleten the book .</h3>
	<h3 align="center">
		the book id is
		<%=request.getParameter("Bid")%>
	</h3>
	</c:if>
	<c:if test="${not deletebook}">
	<br><br>
	<h1 align="center"><font color="red">Warning!</font></h1>
	<br><br>
	<h3 align="center">
	<font color="red">The book has been borrowed! Can't delete it now!</font>
	</h3>
	</c:if>
	



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