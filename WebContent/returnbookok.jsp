<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.manageBook.manageBookDao" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>RETURN BOOK</title>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a class="active" href="home.jsp">Home</a></li>
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
<!-- 接收三个参数 -->
	<%
		String bookID = request.getParameter("BID");
		String readerID = request.getParameter("RID");	
		String indate = request.getParameter("InDate");
		pageContext.setAttribute("indate",indate);
	%>	

<!-- 数据库操作 -->

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
		
<!-- 删除presentlist的数据 -->

<!-- 1.在historylist插入数据-->

	<sql:query dataSource="${snapshot}" var="result">
		SELECT * from presentlist where pbid = '<%=bookID %>' and prid = '<%=readerID %>';
	</sql:query>

	<c:forEach var="row" items="${result.rows}">
   		<c:set var="bid" value="${row.pbid }"/>
   		<c:set var="rid" value="${row.prid }"/>
   		<c:set var="outdate" value="${row.poutdate }"/>
   		<c:set var="fine" value="${row.pfine }"/>
   		<c:set var="name" value="${row.pbname }"/>
   		
   	<sql:update dataSource="${snapshot}" var="result">
		INSERT INTO historylist (hbid,hrid,hbname,houtdate,hindate,hfine) VALUES (?, ?, ? , ?, ?, ?);
		<sql:param value="${bid}" />
		<sql:param value="${rid}" />
		<sql:param value="${name}" />
		<sql:param value="${outdate}" />
		<sql:param value="${indate}" />
		<sql:param value="${fine}" />
	</sql:update>
	</c:forEach>
	

	



<!-- 2.删除presentlist的借阅-->
	 <sql:update dataSource="${snapshot}" var="count">
        DELETE FROM presentlist WHERE prid = '<%=readerID %>' and pbid ='<%=bookID %>';
     </sql:update>
       

<!-- 3.更新book的可借阅状态 -->
	
 
	<sql:update dataSource="${snapshot}" var="state">
  UPDATE book SET bable = '1' WHERE bid = ?
  <sql:param value="${bid}" />
</sql:update>



<div align="center">
<h3><font color="green">Return the Book Successfully!</font></h3>
<h3>the information of the book </h3>
<img alt="tupian" src="/p/<%=request.getParameter("BID")%>.jpg">
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