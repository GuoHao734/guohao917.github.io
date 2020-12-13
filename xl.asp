<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
 <%   
dim conn,connstr,db

	db="../denglu/Test.accdb" 

   Set conn = Server.CreateObject("ADODB.Connection")
   
   connstr="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath(db)

	conn.Open connstr
	%>
<body><%
if request.QueryString("r") = "管理员" then
 set rs = conn.Execute("select * from administrator where us='" & request.QueryString("gh1") & "' and [password]='" & request.QueryString("gh2") & "'")
 if  rs.eof then
	%>
	<script>
alert("账号或密码错误，请重新输入");
window.location.href = "../denglu/enter.asp";
</script>
	<%
	else
		response.Redirect("addenglu.asp")
	end if
	end if	
	%>
</body>
</html>
