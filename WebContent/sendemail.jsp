<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  page import="email.SendEmail"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>send email</title>
</head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
		<!-- 查询到期的书籍信息 -->
	<sql:query dataSource="${snapshot}" var="result">
     SELECT * from presentlist where ptime = '0';
    </sql:query>

    <!-- 遍历查询结果 -->

    <c:forEach  var="book" items="${result.rows}">
   
    <sql:query dataSource="${snapshot}" var="user">
     SELECT * from reader where rid = '${book.prid}' ;
    </sql:query>
    <c:forEach var="e" items="${user.rows}">
    <c:set var="email"  value="${e.remail}" scope="page"/>
    <%
    System.out.println(pageContext.getAttribute("email"));
    SendEmail  s = new SendEmail();
    s.send(pageContext.getAttribute("email").toString(),"The books you borrowed have expired, please return them as soon as possible.");
    %>
    </c:forEach>
    </c:forEach>
    
    
</body>
</html>