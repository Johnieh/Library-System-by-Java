<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
 <html>
 <head>
 <link rel="stylesheet" type="text/css" href="bootstrap.css">
 <link rel="stylesheet" type="text/css" href="dao.css">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>REGISTER</title>
 </head>
 <body background="img/background.jpg" 
 style=" background-repeat:no-repeat ;
 background-size:100% 100%;
 background-attachment: fixed;">
 <ul>
 <li style="float:right"><a href="login.jsp">Exit</a></li>
 </ul>

 <br><br>
 <style type="text/css">
 h1{text-align:center;}
 </style>
 	<h1>user registration</h1>
  	<form action="registerCheck.jsp" method="post">
  	<table align="center"> 
  	<tr>
   	<td>IdYouWant：</td>
   	<td> <input class="form-control" type="text" name="userid"></td>
   	</tr>
  	<tr>
   	<td>username：</td>
   	<td> <input class="form-control" type="text" name="username"></td>
   	</tr>
   	<tr>        
    <td>password：</td>
    <td><input class="form-control" type="password" name="password"></td>>
    </tr>
    <tr>
	<td>confirm the password：</td>
	<td><input class="form-control" type="password" name="password2"></td></tr>
	<tr>
   	<td>phone：</td>
   	<td> <input class="form-control" type="tel" name="phone"></td>
   	</tr>
   	<tr>  
	<tr>
   	<td>email：</td>
   	<td> <input class="form-control" type="email" name="email"></td>
   	</tr>
   	<tr>  
	<tr>
    <td colspan="1">
    </td>
    <td>       
    <input type="submit" class="btn btn-info" value="submit">
    <input type="reset" class="btn btn-success" value="reset">
    </td>
    </tr> 
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