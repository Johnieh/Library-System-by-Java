<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.library.admin.adminPasswordDao"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
<%
/* if(session.getAttribute("adminLogin").toString().equals("1")){
	if(request.getParameter("adminId").equals("88888888")&&request.getParameter("adminPassword").equals(pwdOfAdmin)){
		response.sendRedirect("Admin.jsp");
	}
	else{
		response.sendRedirect("loginAdmin.jsp");
		}
}else{
	if(request.getParameter("adminNewPwd").equals(request.getParameter("adminConfirmPwd"))){
		pwdOfAdmin =request.getParameter("adminNewPwd").toString();
		response.sendRedirect("loginAdmin.jsp");
	}else{
		response.sendRedirect("adminChangePwd.jsp");
	}
} */
%>
<%
		String aId = request.getParameter("adminId");
		String aPwd = request.getParameter("adminPassword");
		adminPasswordDao adminlogin = new adminPasswordDao();
		boolean t = adminlogin.getAdmin(aId, aPwd);
		if (t) {
			session.setAttribute("aPwd", aPwd);
			response.sendRedirect("Admin.jsp");
		} else {
			response.sendRedirect("loginAdmin.jsp");
		}
	%>
</body>
</html>