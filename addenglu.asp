<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
<body>
<form action="zcpd.asp" method="get"><p align="center"><font size="+6" color="#0000FF">请选择相应的身份注册</font></p>
                    <p align="center"><input type="text" id="edtUserName" name="gh0" placeholder="ID"><i>ID</i></p>  
					<p align="center"><input type="text" id="edtUserName" name="gh1" placeholder="Username"><i>账号</i></p>
					<p align="center"><input type="password" id="edtPassWord" name="gh2" placeholder="Password"><i>密码</i></p>
				    <p align="center"> <input name="r" type="radio" value="学生"  checked="checked">学生
				                       <input name="r" type="radio" value="老师">老师</p>
					<p align="center"><input type="submit"  value="注册"></p>
</form>
</body>
</html>
