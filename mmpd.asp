<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>
 <%   
dim conn,connstr,db

	db="../denglu/Test.accdb" 

   Set conn = Server.CreateObject("ADODB.Connection")
   
   connstr="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath(db)

	conn.Open connstr

	%>
<body>
<%   
	set rs = conn.Execute("select * from [User] where us='" & request.QueryString("gh1") & "'")
	if  rs.eof then
	set rs = conn.Execute("select * from teacher where us='" & request.QueryString("gh1") & "'")
    end if  
	if rs.eof then
	set rs = conn.Execute("select * from administrator where us='" & request.QueryString("gh1") & "'")
	end if 
    if  rs.eof then
	%>
	<script>
alert("�˺Ų����ڣ�����������");
window.location.href = "mima.asp";
</script>
<%
 
  end if 
  if request.QueryString("gh2")<>request.QueryString("gh3")then 
  %>
  <script>
alert("�����������벻һ��");
window.location.href="mima.asp"                                                                  /*��ʾע��ɹ�*/
</script>
<%
  else 
  set rs=server.CreateObject("adodb.recordset")   
set rs = conn.Execute("select * from [User] where us='" & request.QueryString("gh1") & "'")
   if not (rs.bof and rs.eof) then 
   set rs=server.CreateObject("adodb.recordset")
	sPassword=request.QueryString("gh2")
	sqll="select * from [User] where us='" & request.QueryString("gh1") & "'"
	rs.open sqll,conn,1,3
	rs("password")=sPassword
	rs.update                                                                        ' �����յ����û���������д��a1��
	set rs=nothing
 		%><script>
alert("�޸ĳɹ�");
window.location.href="addenglu.asp"                                                                  /*��ʾע��ɹ�*/
</script>
    <%
	end if 
	set rs = conn.Execute("select * from teacher where us='" & request.QueryString("gh1") & "'")
	if not (rs.bof and rs.eof)  then 
	set rs=server.CreateObject("adodb.recordset")
	sPassword=request.QueryString("gh2") 
	sqll="select * from teacher where us='" & request.QueryString("gh1") & "'"
    rs.open sqll,conn,1,3
	rs("password")=sPassword
	rs.update                                                                        ' �����յ����û���������д��a1��
	set rs=nothing
			%><script>
alert("�޸ĳɹ�");
window.location.href="addenglu.asp"                                                                  /*��ʾע��ɹ�*/
</script>
    <% end if   
	set rs = conn.Execute("select * from administrator where us='" & request.QueryString("gh1") & "'")
	if not (rs.bof and rs.eof) then
	set rs=server.CreateObject("adodb.recordset")
	sPassword=request.QueryString("gh2")
	 sqll="select * from administrator where us='" & request.QueryString("gh1") & "'"
	 	rs.open sqll,conn,1,3
	rs("password")=sPassword
	rs.update                                                                        ' �����յ����û���������д��a1��
	set rs=nothing
			%> 
			<script>                                                               
alert("�޸ĳɹ�");
window.location.href="addenglu.asp"                                                                  /*��ʾע��ɹ�*/
</script>
<%
end if 
 end if
 rs.close
%>
</body>
</html>
