<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="dao.css">
	<link rel="stylesheet" type="text/css" href="bootstrap.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>user login</title>
 
<body background="img/background.jpg" 
style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<ul>
  	<li style="float:right"><a href="uLogin.jsp">Exit</a></li>
</ul>
<br><br>
</head>
 
 <body>
<h2 align="center">Find Password</h2>
 <form action="findpassword.jsp" method="post">
     <hr>
     <hr/>
     <table align="center">
         <tr>
             <td>ID：</td>
             <td><input type="text" name="userId" class="form-control" id="username" placeholder="Input Your ID"></td>
         </tr>
     </table>
     <br>
     <div align="center">
     <table>
     	<tr>
                 <td><input type="submit" class="btn btn-success" value="FindPass"/></td>
                 <td>&nbsp;&nbsp;&nbsp;</td>  
                 <td><input type="reset" class="btn btn-warning" value="reset" /></td>
        </tr>
     </table>
     </div>
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