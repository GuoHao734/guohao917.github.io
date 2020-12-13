 <%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
 <%   
dim conn,connstr,db

	db="../denglu/Test.accdb" 

   Set conn = Server.CreateObject("ADODB.Connection")
   
   connstr="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath(db)

	conn.Open connstr
	%>
<meta http-equiv="content-type" content="text/html" charset="utf-8" />
<title>判断语句</title>
</head>
<body>
<%   if request.QueryString("gh1")="" then
%>
	<script>
	alert("用户名为空");
	window.location.href="../denglu/enter.asp"
	</script>
<% end if
	if request.QueryString("r") = "学生" then
	set rs = conn.Execute("select * from [User] where us='" & request.QueryString("gh1") & "' and [password]='" & request.QueryString("gh2") & "'")
		if  rs.eof then
	%>
	<script>
alert("账号或密码错误，请重新输入");
window.location.href = "../denglu/enter.asp";
</script>
	<%
	else
		response.Redirect("stu.asp")
	end if
	end if
	%>
	<%
	if request.QueryString("r") = "老师" then
	set rs = conn.Execute("select * from teacher where us='" & request.QueryString("gh1") & "' and [password]='" & request.QueryString("gh2") & "'")
	end if	
			if  rs.eof then
	%>
	<script>
alert("账号或密码错误，请重新输入");
window.location.href = "../denglu/enter.asp";
</script>
	<%
	else
		response.Redirect("teacher.asp")
	end if
	%>
	<%
	if request.QueryString("r") = "管理员" then
	set rs = conn.Execute("select * from [administrator] where us='" & request.QueryString("gh1") & "' and [password]='" & request.QueryString("gh2") & "'")
	if  rs.eof then
	%>
	<script>
alert("账号或密码错误，请重新输入");
window.location.href = "../denglu/enter.asp";
</script>
	<%
	else
		response.Redirect("administrator.asp")
	end if
	end if	
	%>
 </body>
 </html>
