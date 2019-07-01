<%@page import="com.library.admin.systemDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="servlet.AddCode"%>
<%@ page import="servlet.Code"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
	user="root" password="123456" />
<%
if(request.getParameter("changePwd").equals(request.getParameter("confirmPwd"))){
%>
<sql:update dataSource="${snapshot}" var="result">
  update reader set rpwd='<%=request.getParameter("changePwd")%>' where rid='<%=session.getAttribute("uId").toString()%>';
</sql:update>
<%	
	response.sendRedirect("login.jsp");
}
else{
	response.sendRedirect("uChangePwd.jsp");
}
%>
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