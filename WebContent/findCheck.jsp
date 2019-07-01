<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "com.library.reader.findBookDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>check book</title>
</head>
<body>
<%
String bookName;
bookName = request.getParameter("find");
findBookDao bookCheck = new findBookDao();
if(bookCheck.checkBook(bookName)){
	session.setAttribute("bookname",bookName);
	response.sendRedirect("bookInfor.jsp");
}else{
	response.sendRedirect("uFindBook.jsp");
}
%>
</body>
</html>