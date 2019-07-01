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
  	<li style="float:right"><a href="modSelect.jsp">Exit</a></li>
</ul>
<br><br>

 <style type="text/css">
 h1{text-align:center;}

</style>
<script type="text/javascript">
	function check(form){
		with(form){
			if(username.value == ""){
				alert("username不能为空");
				return false;
			}
			if(password.value == ""){
				alert("password不能为空");
				return false;
			}
			return true;
		}
	}
</script>
</head>
 
 <body>
 <h1 align="center">Reader Login</h1>
     <div align="right">
     <a href="findpwd.jsp"><button class="btn btn-info">Find Password</button></a>
     </div>
 <form action="loginCheck.jsp" method="post" onsubmit="return check(this);">

     
     <hr>
     
     <hr/>
     <table align="center">
         <tr>
             <td>ID：</td>
             <td><input type="text" name="userId" class="form-control" id="username"></td>
         </tr>
         <tr>
             <td>Password：</td>
             <td><input type="password" name="password" class="form-control" id="password"></td>
         </tr>
     </table>
     <br>
     <div align="center">
     <table>
     	<tr>
                 <td><input type="submit" class="btn btn-success" value="login"/></td>
                 <td>&nbsp;&nbsp;&nbsp;</td>  
                 <td><input type="reset" class="btn btn-warning" value="reset" /></td>
        </tr>
     </table>
     </div>
</form>
  	
<!-- 在用户登陆饥界面展示通知--聂俊 -->


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