<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.HashMap" %>
    <%@ page import="com.library.reader.userDao" %>
    <%@ page import="java.util.ArrayList"%>
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
<title>Home</title>
</head>
<body background="img/background.jpg" 
style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<ul>
  <li><a class="active" href="uHome.jsp">Home</a></li>
  <!-- <li><a href="uBookList.jsp">BookList</a></li> -->
  <li><a href="uFindBook.jsp">FindBook</a>
  <li style="float:right"><a href="uLogin.jsp">Exit</a></li>
</ul>
</body>
<h2>Information</h2>
<hr>
<!-- 获取读者信息 -->
<%
userDao userinfor = new userDao();
String uId = session.getAttribute("uId").toString();
HashMap<String,String> user = new HashMap<String,String>();
user = userinfor.userInformation(uId);
final String id = user.get("id");
final String name = user.get("name");
final String email = user.get("email");
final String number = user.get("num");
final String account = user.get("account");
%>
<!-- 显示读者信息 -->
<%-- <form action="uFindBook.jsp" method="Post">
  	<table> 
  	<tr>
   	<td>ID:</td>
   	<td><%=id%></td>
   	</tr>
   	<tr>        
    <td>NAME:</td>
    <td><%=name%></td>
    </tr>
    <tr>
	<td>E-MAIL:</td>
	<td><%=email%></td></tr>
	<tr>
   	<td>PHONE:</td>
   	<td><%=number%></td>
   	</tr>
   	<tr>
   	<td>ACCOUNT:</td>
   	<td><%=account%></td>
   	</tr>  
    </table> --%>
    <!-- 修改--栾文飞 -->
		
    
	<div align="center" style="width: 100%">
    <table class = "table table-striped table-hover table-bordered">
    	<tr>
    		<th>ID</th>
    		<th>NAME</th>
    		<th>EMAIL</th>
    		<th>PHONE</th>
    		<th>ACCOUNT</th>
    	</tr>
    	<tr>
    	<td><%=id%></td>
    	<td><%=name%></td>
    	<td><%=email%></td>
    	<td><%=number%></td>
    	<td><%=account%></td>
    	</tr>
    </table>
	</div>
	
<table align="center">
<tr>
<td>
<form action=uChangePwd.jsp method="post">
<div align="center">
	<input type="submit" class="btn btn-warning" value="CHANGE PWD"/>
</div>
</form>
</td>
<td>
<form action=uChangeInfor.jsp method="post">
<div align="center">
	<input type="submit" class="btn btn-warning" value="CHANGE INFOR"/>
</div>
</form>
</td>
</tr>
</table>	


<hr>
<h2>Present</h1>
<!-- 连接数据库 -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
user="root" password="123456" />
<sql:query dataSource="${snapshot}" var="presentBook">
	select * from presentlist where prid = '<%=id%>';
</sql:query>
<hr>
	<table class = "table table-striped table-hover table-bordered">
	<th>ID</th>
	<th>NAME</th>
	<th>DATE</th>
	<th>TIME</th>
	<th>FINE</th>
	<c:forEach var="row" items="${presentBook.rows}">
	<tr>
	<td><c:out value="${row.pbid}"/></td>
	<td><c:out value="${row.pbname}"/></td>
	<td><c:out value="${row.poutdate}"/></td>
	<td><c:out value="${row.ptime}"/></td>
	<td><c:out value="${row.pfine}"/></td>
	</tr>
	</c:forEach>
	</table>
<hr>
<h2>History</h2>
<sql:query dataSource="${snapshot}" var="historyBook">
	select hbid,hbname,houtdate,hindate,hfine from historylist where hrid = '<%=id%>';
</sql:query>
<hr>
	<table class = "table table-striped table-hover table-bordered">
	<th>ID</th>
	<th>NAME</th>
	<th>BORROW</th>
	<th>RETURN</th>
	<th>FINE</th>
	<c:forEach var="row" items="${historyBook.rows}">
	<tr>
	<td><c:out value="${row.hbid}"/></td>
	<td><c:out value="${row.hbname}"/></td>
	<td><c:out value="${row.houtdate}"/></td>
	<td><c:out value="${row.hindate}"/></td>
	<td><c:out value="${row.hfine}"/></td>
	</tr>
	</c:forEach>
	</table>
<form action="uDeleteHistory.jsp" method="post">
<div align="center">
	<input type = "submit" class="btn btn-warning" value="DELETE ALL"/>
</div>
</form>
<hr>
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