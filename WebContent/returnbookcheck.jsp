<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>RETURN BOOK CHECK</title>
</head>

<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
<% 
String bookID = request.getParameter("BID");
String readerID = request.getParameter("RID");
%>
<h1 align="center">Pay Fine</h1>

<!-- 获取系统当前时间，单位：ms -->
<%
	Date dNow = new Date( );
	long returntime = dNow.getTime();
    pageContext.setAttribute("returntime",returntime);
%>

<br/>

<!-- 数据库操作 -->

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
		
	bookID：<%=bookID %>
	<br/>
	readerID：<%=readerID%>	
	<br/>
	
	<sql:query dataSource="${snapshot}" var="result">
		SELECT * from presentlist where pbid = '<%=bookID %>' and prid = '<%=readerID%>'
	</sql:query>
	
	
    <c:forEach var="row" items="${result.rows}">
    	<c:set var="lendtime" value="${row.ptime}"/>
		<!--<c:out value="${lendtime/86400000}"></c:out>-->
		<br/>
	<c:set var="keeptime" value="${returntime-lendtime }"></c:set>
		<!--<c:out value="${keeptime}"></c:out>-->
		<br/>
    	<c:if test="${keeptime <= 2592000000}">
    		<jsp:forward page="returnbookok.jsp">
    			<jsp:param name="BID" value='<%=bookID %>'  />
    			<jsp:param name="RID" value='<%=readerID %>' />
    			<jsp:param name="InDate" value='${returntime}' />
    		</jsp:forward>	
    	</c:if>
    	<c:set var="fine" value="${(keeptime-2592000000)/86400000}"></c:set>
    	<fmt:parseNumber integerOnly="true" value="${fine/576}" var="mfine" /> 
    	
    	<!-- 计算罚金并写入数据库 -->
    	<sql:update dataSource="${snapshot}" var="state">
  			UPDATE presentlist SET pfine = ? WHERE pbid = '<%=bookID %>' and prid = '<%=readerID%>'
  			<sql:param value="${mfine}" />
		</sql:update>
		
    	<sql:update dataSource="${snapshot}" var="time">
  			UPDATE presentlist SET ptime = '0' WHERE pbid = '<%=bookID %>' and prid = '<%=readerID%>'
		</sql:update>
	</c:forEach>


 

you have to pay the fine:${mfine} yuan
<br>
<a href="returnbookok.jsp?RID=<%=readerID%>&&BID=<%=bookID%>&&InDate=${returntime} " >
After the fine has been paid, click here to return book</a>
		








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