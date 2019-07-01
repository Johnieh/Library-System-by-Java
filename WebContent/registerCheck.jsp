<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
String JDBC_DRIVER = "com.mysql.jdbc.Driver";
String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
String USER = "root";
String PWD = "123456";
Connection conn = DriverManager.getConnection(DB_URL,USER,PWD);
PreparedStatement pst;
String userId = request.getParameter("userid");
String userName = request.getParameter("username");
String password = request.getParameter("password");
String confirm = request.getParameter("password2");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

if(password.equals(confirm)){
	pst = conn.prepareStatement("insert into reader values(?,?,?,?,?,?)");
	pst.setString(1, userId);
	pst.setString(2, userName);
	pst.setString(3, password);
	pst.setString(4, phone);
	pst.setString(5, email);
	pst.setString(6, "1000");
	pst.executeUpdate();
	response.sendRedirect("login.jsp");
}else{
	//显示弹窗“密码不一致”
	response.sendRedirect("login.jsp");
}
%>
</body>
</html>