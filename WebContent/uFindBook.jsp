<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="dao.css">
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<title>uFindBook</title>
</head>
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
<div align="center">
<h1>Find Book</h1><br>
<form action="bookInfor.jsp" method="Post"> 
<table width="500" border="0" cellspacing="0" cellpadding="0" >
    <tr> 
      <td width="300"> 
        The name of the book:
      </td>
      <td width="431">
	  	<input type="text" name="find" class="form-control" placeholder="Input Book Name Of What You Want">
	  </td>
    </tr>
  </table>
  <hr><br>
  <p>
  <input type="submit" name="Mfindbook" value="findbook" class="btn btn-success">
  <input type="reset"  name="reset" value="reset" class="btn btn-warning">
  </p>
</form>
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