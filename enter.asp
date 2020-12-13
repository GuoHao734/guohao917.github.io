	
<!DOCTYPE html>
<html>
    <head
	>
	<p align="center"><font size="+4" color="#33FFFF">教务系统</font></p>
        <meta name="viewport" content="width=device-width,initial-scale=1.33,minimum-scale=1.0,maximum-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
        <title>教务系统</title>
        <style> body{color:#;}a{color:#;}a:hover{color:#;}.bg-black{background-color:#;}.tx-login-bg{background:url(img/bg.jpg) no-repeat 0 0;}</style>
    </head>
    <body class="tx-login-bg" bgcolor=>
	<div>
	<form action="../ym/pd.asp" method="get">
					<p  align="center"><input type="text" id="edtUserName" name="gh1" placeholder="Username" class="tx-input"><i>学号</i>
					<p align="center"><input type="password" id="edtPassWord" name="gh2" placeholder="Password"><i>密码</i></p>
					<p align="center"><input type="submit"  value="登录">&nbsp;&nbsp;&nbsp;
					<p align="center"><input name="r" type="radio" value="学生" checked="checked">学生
					<input name="r" type="radio" value="老师">老师
					<input name="r" type="radio" value="管理员">管理员</p>
					<a href="zhuce.asp"><p  align="center">新用户注册</p></a>
					<a href="mima.asp"><p  align="center">更改密码</p></a>

					</form>
					</div>
            
    </body>