 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Home</title>

</head>
<body background="img/background.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<ul>
		<li><a class="active" href="LHome.jsp">Home</a></li>
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
	<!-- 发送到达还书时间且还未还书的reader的Email -->
	<%@include file="sendemail.jsp"%>
	<div id="myCarousel" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" align="center">
			<div class="item active">
				<img src="img/p1.jpg" alt="First slide" height="1000px"
					width="700px">
				<div class="carousel-caption">
				</div>
			</div>
			<div class="item">
				<img src="img/p2.jpg" alt="Second slide" height="1000px"
					width="700px">
				<div class="carousel-caption">
					<h3>WELCOME TO OUR LIBRARY!</h3>
				</div>
			</div>
			<div class="item">
				<img src="img/p3.jpg" alt="Third slide" height="1000px"
					width="700px">
				<div class="carousel-caption">
					<h3>Enjoy Your Time During Reading!</h3>
				</div>
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<br>
	<div align="center">
		<form action="bookInfor.jsp" method="post" onsubmit="return check(this);">
			<table width="500" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="300">the infomation of the book:</td>
					<td width="431"><input type="text" name="find" id="find"
						class="form-control" placeholder="Input What You Want" required/></td>
				</tr>
			</table>
			<br>
			<p>
				<input type="submit" name="Mfindbook" value="findbook"
					class="btn btn-success"> <input type="reset" name="reset"
					value="reset" class="btn btn-warning">
			</p>
		</form>
	</div>
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

</body>
</html>