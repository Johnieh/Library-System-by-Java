<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
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
       <div align="right">
        <a href="lfindpwd.jsp"><button class="btn btn-info">Find My Password</button></a>
       </div> 
 <form action="LloginCheck.jsp" method="post" onsubmit="return check(this);">

     <h1>Librarian Login</h1>
     
     <hr/>
     <table align="center">
     
         <tr>
             <td>ID：</td>
             <td><input type="text" name="LibrarianId" class="form-control" id="username"></td>
         </tr>
         <tr>
             <td>Password：</td>
             <td><input type="password" name="password" class="form-control" id="password"></td>
         </tr>
         <tr>
             <td colspan="1">
             </td>
             <td>
                 <input type="submit" class="btn btn-success" value="login"/>
                 <input type="reset" class="btn btn-success" value="reset"/>
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