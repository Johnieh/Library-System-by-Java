<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.library.reader.loginDao" %>
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
  	<li style="float:right"><a href="login.jsp">Exit</a></li>
</ul>
<%
String uId = request.getParameter("userId");
String uPwd = request.getParameter("password");
loginDao login = new loginDao();
boolean t = login.getUser(uId, uPwd);
if(t){
	session.setAttribute("uId",uId);
	response.sendRedirect("uHome.jsp");
}else{
%>
<div align="center">
<form action="uLogin.jsp">
<h1>PASSWORD ERROR</h1>
<input type="submit" align="center"  class="btn btn-warning" value="return"/>
</form>
</div>

<!-- <script LANGUAGE=javascript >
	alert("密码错误")
	//window.open('page.html','newwindow','height=100,width=400,top=0,left=0,toobar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
</script> -->

<%
	//response.sendRedirect("uLogin.jsp");
}
%>
</body>
</html>