<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.HashMap" %>
    <%@ page import="com.library.reader.bookInforDao" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>book infor</title>
</head>
<body background="img/background.jpg" 
style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<ul>
  <li style="float:right"><a href="modSelect.jsp">Exit</a></li>
</ul>
<style type="text/css">
 h1{text-align:center;}
</style>
<!-- 获得书籍信息 -->
<%
/* String bookname = session.getAttribute("bookname").toString();
HashMap<String,String> book = new HashMap<String,String>();
bookInforDao bookInfor = new bookInforDao();
book = bookInfor.bookInformation(bookname);
final String id = book.get("id");
final String name = book.get("name");
final String author = book.get("author");
final String isbn = book.get("isbn");
final String number = book.get("num"); */
%>
<!-- 显示书籍信息 -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf8"
user="root" password="123456" />
 	<h1>BOOK INFORMATION</h1>
<%
final String find ="%"+request.getParameter("find")+"%";
%>
<sql:query dataSource="${snapshot}" var="allBook">
	<%-- select bid,bname,bauthor,bisbn,bnum from book where bname like '<%=request.getParameter("find") %>'; --%>
	select * from book where ( bname like '<%=find %>' or bauthor like '<%=find %>' ) and bable='1';
</sql:query>
<hr>
	<table class = "table table-striped table-hover table-bordered">
	<th>ID</th>
	<th>NAME</th>
	<th>AUTHOR</th>
	<th>ISBN</th>
	<th>Location</th>
	<th>Class</th>
	<c:forEach var="row" items="${allBook.rows}">
	<tr>
	<td><c:out value="${row.bid}"/></td>
	<td><c:out value="${row.bname}"/></td>
	<td><c:out value="${row.bauthor}"/></td>
	<td><c:out value="${row.bisbn}"/></td>
	<td><c:out value="${row.blocation}"/></td>
	<td><c:out value="${row.bclass}"/></td>
	</c:forEach>
	</table>
</form>
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