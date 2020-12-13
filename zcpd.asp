<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
 <%   
dim conn,connstr,db

	db="Test.accdb" 

   Set conn = Server.CreateObject("ADODB.Connection")
   
   connstr="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath(db)

	conn.Open connstr
	'sName = Request.QueryString("gh0")
	 '  suser=request.QueryString("gh1")
	  ' spassword=request.QueryString("gh2")
	  if request.QueryString("r")="学生" then
	  set rs = conn.Execute("select * from [User] where us='" & request.QueryString("gh1") & "' ")
	if not (rs.bof and rs.eof) then
	  %>
	  		<script>
alert("该用户已经存在");
window.location.href="addenglu.asp"
</script>
<%
	else 
	sID=request.QueryString("gh0")
	sUser=request.QueryString("gh1") 
	sPassword=request.QueryString("gh2")
		set rs=server.CreateObject("adodb.recordset")
	sqll="select * from [User]"                                                            '打到zc_dl.mdb文件中a1表
	rs.open sqll,conn,1,3
	rs.addnew
	rs("ID")=sID
	rs("us")=sUser
	rs("password")=sPassword
	rs.update                                                                        ' 将接收到的用户名和密码写入a1表
	rs.close
	set rs=nothing  
	'conn.close
	%>
		<script>
alert("注册成功");
window.location.href="zhuce.asp"                                                                             /*提示注册成功*/
</script>
	<%
		end if 
	end if
	%>
		   <%
	  	   if request.QueryString("r") = "老师" then
	set rs = conn.Execute("select * from teacher where us='" & request.QueryString("gh1") & "' ")
	if not (rs.bof and rs.eof) then
	%>
		<script>
alert("该用户已经存在");
window.location.href="zhuce.asp"
</script>
	<%
	else 
	sID=request.QueryString("gh0")
	sUser=request.QueryString("gh1") 
	sPassword=request.QueryString("gh2")
		set rs=server.CreateObject("adodb.recordset")
	sqll="select * from teacher"                                                            '打到zc_dl.mdb文件中a1表
	rs.open sqll,conn,1,3
	rs.addnew
	rs("ID")=sID
	rs("us")=sUser
	rs("password")=sPassword
	rs.update                                                                        ' 将接收到的用户名和密码写入a1表
	rs.close
	set rs=nothing  
	'conn.close
	%>
	<script>
alert("注册成功");
window.location.href="addenglu.asp"                                                                             /*提示注册成功*/
</script>
	<%
		end if 
	end if
	conn.close
	%>
<body>
</body>
</html>
