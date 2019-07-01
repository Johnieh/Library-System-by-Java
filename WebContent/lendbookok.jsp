<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.library.manageBook.manageBookDao" %>
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
<title>lend Book OK or Not</title>
</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a class="active" href="home.jsp">Home</a></li>
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
          SELECT * from presentlist where prid ='<%=request.getParameter("Lrid")%>';
        </sql:query>
        
        <sql:query dataSource="${snapshot}" var="re">
          SELECT * from book where bid ='<%=request.getParameter("LBid")%>';
        </sql:query>
        
        <c:forEach var="i" items="${re.rows}">
           <c:set var="able" value="${i.bable}"/>
        </c:forEach>
        
<!-- 数据库操作 -->
<c:if test="${(able eq '-1') or (able eq '1')}"  var="isable">
<c:if test="${result.rowCount < 3 }"  var="exam">
<%

String lbid=request.getParameter("LBid");
String lrid= request.getParameter("Lrid");
String check= request.getParameter("sub");
manageBookDao manage = new manageBookDao();




request.setAttribute("check", check);


%>
<c:if test="${requestScope.check=='no'}" var="condition" scope="request">
<%String asan=manage.sBook(lbid);request.setAttribute("asan", asan); %>
<c:if test="${requestScope.asan=='asan'}" var="condition1" scope="request">
<script>


    alert("this book has been subscribed");
    location.href="Llendbook.jsp";
</script>
</c:if>
<c:if test="${empty asan}"> <% 	manage.lendBook(request.getParameter("LBid"), request.getParameter("Lrid")); %></c:if>
</c:if>
<c:if test="${requestScope.check=='yes'}" var="condition4" scope="request">
<%String asan1=manage.sBook1(lbid);request.setAttribute("asan1", asan1);
 %>
<c:if test="${empty asan1}" var="condition3" scope="request">

<script>

    alert("the book you have subscribed is overtime");
    location.href="Llendbook.jsp";
</script>

</c:if>

<c:if test="${requestScope.asan1=='asan'}"> <% 	manage.lendBook(request.getParameter("LBid"), request.getParameter("Lrid"));%></c:if>

</c:if>
<%-- if(check=="no"){%>
	
	<% if(asan=="asan"){%>
		<% out.println("this book has been subscribed");
	}
	if(asan==null){%>
<% 	manage.lendBook(request.getParameter("LBid"), request.getParameter("Lrid"));	
	}
}
if(check=="yes")
{%>
<%	if(asan1==null){ %>
		<% out.println("the book you have subscribed is overtime");
	}
	if(asan1=="asan"){%>
		<% manage.lendBook(request.getParameter("LBid"), request.getParameter("Lrid"));	
	}
}   


%> --%>
<!-- 鏁版嵁搴撴搷浣?-->
<div align="center">
<h3><font color="Yellow">Lend the Book Successfully!</font></h3>
<h3>the information of the book </h3>
<img alt="tupian" src="/p/<%=request.getParameter("LBid")%>.jpg">
</div>
</c:if>

<c:if test="${not exam}">
<h3 align="center">The reader has borrowing  3 books!</h3>
</c:if>
</c:if>
<c:if test ="${ not isable}">
<h3 align="center">The book has been  borrowed or damaged!</h3>
</c:if>
	<div class="fixed">
		<ul>
			<p align="center">
				<font color="white">Copyright@Joh Nieh 1998-2018 All Rights
					Reserved</font>
			</p>
			<p align="center">
				<font color="white">Email:123@qq.com Address:NPU</font>
			</p>
		</ul>
	</div>

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