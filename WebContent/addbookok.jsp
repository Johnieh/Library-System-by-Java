<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="servlet.AddCode"%>
<%@ page import="servlet.Code"%>
<%@ page import="servlet.BookCode" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!-- 修改-功能：自动生成num-栾文飞 -->	
<%@ page import="com.library.book.bookNumDao" %>
<!-- 修改-功能：自动生成num-栾文飞 -->	
<!-- 修改-功能：自动生成id-栾文飞 -->
<%@ page import = "com.library.book.bookIdDao" %>
<!-- 修改-功能：自动生成id-栾文飞 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>Add Book OK or Not</title>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a class="active" href="LHome.jsp">Home</a></li>
		<li><a href="Llendbook.jsp">LendBook</a></li>
		<li><a href="returnbook.jsp">ReturnBook</a></li>
		<!-- add delete edit -->
		<li><a href="book.jsp.jsp">ManageBook</a></li>
		<!--show register-reader delete edit  -->
		<li><a href="reader.jsp">Reader</a></li>
		<!-- News -->
		<li><a href="news.jsp">NewsPost</a></li>
		<li><a href="IncomeView.jsp">Income</a></li>

		<li style="float: right"><a href="Llogin.jsp">Exit</a></li>
	</ul>
<!-- 修改-功能：自动生成id-栾文飞 -->
<%
int num =Integer.parseInt(request.getParameter("num"));
String[] IdList =new String[num]; 
for(int i=0;i<num;i++)
{
  bookIdDao bookId = new bookIdDao();
  String bookIsbn = request.getParameter("Bisbn");
  final String id = bookId.createId(bookIsbn);
  IdList[i]=id;
%>
<!-- 修改-功能：自动生成id-栾文飞 -->

<!-- 修改-功能：自动生成num-栾文飞 -->	
<%
bookNumDao bookNum = new bookNumDao();
final String bookNumString = bookNum.count(request.getParameter("Bisbn"));
%>
<!-- 修改-功能：自动生成num-栾文飞 -->	
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
		
<!-- 修改-功能：自动生成id-栾文飞 -->
	<sql:update dataSource="${snapshot}" var="result">
  INSERT INTO book (Bid,Bname,Bauthor,Bisbn,Bnum,blocation,bclass,bable) VALUES ('<%=id%>','<%=request.getParameter("Bname")%>','<%=request.getParameter("Bauthor")%>','<%=request.getParameter("Bisbn")%>','<%=bookNumString%>','<%=request.getParameter("Blocation")%>','<%=request.getParameter("Bclass")%>','1');
  </sql:update>
  <sql:update dataSource="${snapshot}" var="result">
  update book set bnum ='<%=bookNumString %>' where bisbn ='<%=request.getParameter("Bisbn")%>';
  </sql:update>
<!-- 修改-功能：自动生成id-栾文飞 -->
	<br>
	<h3 align="center">
		You have add a new book whose id is
		<%=id%></h3>

	<%
		Code qr = new Code();
		qr.createBarcode(id,new File("D:/bookcode/"+id+".jpg"), "B");
		 BookCode b=new BookCode();
		    String isbn =request.getParameter("Bisbn");
		    String name=request.getParameter("Bname");
		    String author=request.getParameter("Bauthor");
		    String location=request.getParameter("Blocation");
		    try {
		        b.graphicsGeneration(id, name, author,isbn,location,"D:/bookcode/"+id+".jpg");
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
}
	%>
	<c:forEach var="t" items="<%=IdList%>">
	<center>
	 <img alt="photo" src="/p/${t}.jpg">
    </center>
    </c:forEach>
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