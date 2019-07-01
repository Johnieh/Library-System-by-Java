<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>EDIT Book</title>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a href="LHome.jsp">Home</a></li>
		<li><a href="Llendbook.jsp">LendBook</a></li>
		<li><a href="returnbook.jsp">ReturnBook</a></li>
		<!-- add delete edit -->
		<li><a href="book.jsp">ManageBook</a></li>
		<!--show register-reader delete edit  -->
		<li><a href="reader.jsp">Reader</a></li>
		<!-- News -->
		<li><a href="news.jsp">NewsPost</a></li>
		<li><a href="IncomeView.jsp">Income</a></li>

		<li style="float: right"><a href="Llogin.jsp">Exit</a></li>
	</ul>
<body>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
		user="root" password="123456" />
	
	<sql:query dataSource="${snapshot}" var="result">
       SELECT * from book where bid='<%=request.getParameter("Bid") %>';
    </sql:query>
    
    <sql:query dataSource="${snapshot}" var="re">
          SELECT * from location ;
    </sql:query> 
    
     <sql:query dataSource="${snapshot}" var="type">
          SELECT * from type ;
    </sql:query> 
    
    <c:forEach var="row" items="${result.rows}">

    <c:set var="Bid" value="${row.bid}" scope="request"/>
    <c:set var="iBname" value="${row.bname}" scope="request"/>
    <c:set var="iBauthor" value="${row.bauthor}" scope="request"/>
    <c:set var="iBisbn" value="${row.bisbn}" scope="request"/>
    <c:set var="iBnum" value="${row.bnum}" scope="request"/>
    <c:set var="iBlocation" value="${row.blocation}" scope="request"/>
    <c:set var="iBclass" value="${row.bclass}" scope="request"/>
 
	<div align="center">
		<h2>EDIT A BOOK</h2>
		<hr>
		<form action="editbookok.jsp" method="GET">
			<table width="700" border="0" cellspacing="0" cellpadding="0">

				<tr>
					<td width="50"><strong>ID of book:</strong></td>
					<td width="431"><input type="text" name="Bid"
						class="form-control" placeholder="<%=request.getParameter("Bid") %>" value="<%=request.getParameter("Bid") %>"></td>
				</tr>

				<tr>
					<td width="300"><strong>ID of Name:</strong></td>
					<td width="431"><input type="text" name="Bname"
						class="form-control" placeholder="${row.bname}" value="${row.bname}"></td>
				</tr>

				<tr>
					<td width="300"><strong>Author of book:</strong></td>
					<td width="431"><input type="text" name="Bauthor"
						class="form-control" placeholder="${row.bauthor}" value="${row.bauthor}"></td>
				</tr>

				<tr>
					<td width="300"><strong>ISBN of Book</strong></td>
					<td width="431"><input type="text" name="Bisbn"
						class="form-control" placeholder="${row.bisbn}"  value="${row.bisbn}"></td>
				</tr>

				<tr>
					<td width="300"><strong>Num of Book</strong></td>
					<td width="431"><input type="text" name="Bnum"
						class="form-control" placeholder="${row.bnum}"   value="${row.bnum}">
					</td>
				</tr>
      
             <tr>
					<td width="50"><strong>ID of location:</strong></td>
					<td width="431">
					<select name="Blocation" class="form-control" > 
                    <c:forEach var="i" items="${re.rows}">  
                    <c:if test="${i.name eq row.blocation}" var="location">
                    <option value="${i.name}" selected="selected">${i.name}</option>   
                    </c:if> 
                    <c:if test="${not location}">
                    <option value="${i.name}">${i.name}</option> 
                    </c:if>
                    </c:forEach> 
                    </select> 
                    </td>
			</tr>     
      
            <tr>
					<td width="50"><strong>ID of location:</strong></td>
					<td width="431">
					<select name="Bclass" class="form-control" > 
                    <c:forEach var="i" items="${type.rows}">  
                    <c:if test="${i.tname eq row.bclass}" var="type">
                    <option value="${i.tname}" selected="selected">${i.tname}</option>   
                    </c:if> 
                    <c:if test="${not type}">
                    <option value="${i.tname}">${i.tname}</option> 
                    </c:if>
                    </c:forEach> 
                    </select> 
                    </td>
			</tr> 
			
			<tr>
					<td width="300"><strong>Status of Book</strong></td>
					<td width="431">
					<select name="Bstatus" class="form-control" > 
					<option value="1" selected="selected">Normal</option>
					<option value="0">Damaged</option>
					<option value="0">Lost</option>
					</td>
			</tr>
			      
			</table>
			<br>
			<p>
				<input type="submit" name="actionbook" value="edit-Book"
					class="btn btn-primary"> <input type="reset" name="reset"
					value="reset" class="btn btn-warning">
			</p>
		</form>
	</div>
</c:forEach>



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