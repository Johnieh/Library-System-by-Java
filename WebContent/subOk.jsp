<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="com.library.manageBook.BDate"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf8"
	user="root" password="123456" />
<%
    String dateTime;
    BDate date=new BDate();
    dateTime=date.getDateTime();
   
%>
<sql:update dataSource="${snapshot}" var="result">
  update book  set bable= '-1' WHERE bid = '<%=request.getParameter("bid")%>'
  
</sql:update>
<sql:update dataSource="${snapshot}" var="result">
 INSERT INTO sbook VALUES('<%=request.getParameter("bid")%>','<%=request.getParameter("bname")%>','<%=request.getParameter("bauthor")%>','<%=request.getParameter("bisbn")%>','<%=request.getParameter("bnum")%>','<%=request.getParameter("blocation")%>','<%=request.getParameter("bclass")%>','<%=request.getParameter("bable")%>','<%=dateTime %>')
  
</sql:update>

<script>

    alert("success");
    location.href="uFindBook.jsp";
</script>

</body>
</html>