<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="com.util.*"%>
<%@ page import="com.model.*"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	Pagination p = (Pagination)request.getAttribute("page");
	int totleNum = p.getTotle();
	int totlePage = p.getTotlePage();
	int currentPage = p.getIndex();
	List list = p.getData();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="<%=path %>/css/pintuer.css">
<link rel="stylesheet" href="<%=path %>/css/admin.css">
<script src="<%=path %>/js/jquery.js"></script>
<script src="<%=path %>/js/pintuer.js"></script>
<script type="text/javascript">
        function ExportToExcel() //读取表格中每个单元到EXCEL中  
{ 
    try{       
            var curTbl = document.getElementById("tb1"); 
            var oXL = new ActiveXObject("Excel.Application"); 
            //创建AX对象excel  
            var oWB = oXL.Workbooks.Add(); 
            //获取workbook对象  
            var oSheet = oWB.ActiveSheet; 
           
            var lenRow = curTbl.rows.length; 
            //取得表格行数  
            for (i = 0; i < lenRow; i++) 
            { 
                var lenCol = curTbl.rows(i).cells.length; 
                //取得每行的列数  
                for (j = 0; j < lenCol; j++) 
                { 
                    oSheet.Cells(i + 1, j + 1).value = curTbl.rows(i).cells(j).innerText;  
                     
                } 
            } 
            oXL.Visible = true; 
            //设置excel可见属性  
      }catch(e){ 
            if((!+'\v1')){ //ie浏览器  
              alert("无法启动Excel，请确保电脑中已经安装了Excel!\n\n如果已经安装了Excel，"+"请调整IE的安全级别。\n\n具体操作：\n\n"+"工具 → Internet选项 → 安全 → 自定义级别 → ActiveX 控件和插件 → 对未标记为可安全执行脚本的ActiveX 控件初始化并执行脚本 → 启用 → 确定"); 
           }else{ 
               alert("请使用IE浏览器进行“导入到EXCEL”操作！");  //方便设置安全等级，限制为ie浏览器  
           } 
       } 
}  
        function frist()
		{
		 	with (document.getElementById("memberForm")) {
	            method = "post";
	            action = "<%=path %>/stumana.action?index=1";
	            submit();
	        }
		}
        
        
		function back()
		{
		    var pageNo= '<%=currentPage%>';
		    if(pageNo<2){
		 	   alert("当前已经是第一页");
		 	   return;
		    }else{
		 	   pageNo=Number(pageNo)-1;
		    }
				 with (document.getElementById("memberForm")) {
			            method = "post";
			             action = "<%=path %>/stumana.action?index="+pageNo;
			            submit();
			        }
		}
        
		function next()
		{
			   var pageNo= '<%=currentPage%>';
			   var totlePage='<%=totlePage%>';
		    if(pageNo==totlePage){
		 	   alert("当前已经是最后一页");
		 	   return;
		    }else{
		 	   pageNo=Number(pageNo)+1;
		    }  
		    with (document.getElementById("memberForm")) {
		        method = "post";
		        action = "<%=path %>/stumana.action?index="+pageNo;
		        submit();
		    }
		}
        
        function last()
		{ 
		   var totlePage='<%=totlePage%>';
			with (document.getElementById("memberForm")) {
	            method = "post";
	            action = "<%=path %>/stumana.action?index="+totlePage;
	            submit();
	        }
		}
		
		function changesearch()
		{
			with (document.getElementById("memberForm")) {
	            method = "post";
	            action = "<%=path %>/stumana.action?index=1";
	            submit();
	        }
		}
	
		function modify(id){
			window.location.href="<%=path %>/stumodifybefore.action?id="+id;
		}
		function bmyg(id){
			window.location.href="<%=path %>/bmygmana.action?bmid="+id;
		}
		function del(id){
			window.location.href="<%=path %>/studel.action?id="+id;
		}
		</script>
</head>
<body>
<form id="memberForm">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="<%=path %>/stuadd.jsp"> 添加</a> </li>
          <li> <a class="button border-main icon-plus-square-o" href="<%=path %>/stuex.jsp"> 导入</a> </li>
            <li> <a class="button border-main icon-plus-square-o" href="#" onclick="ExportToExcel()"> 导出</a> </li>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center" id="tb1">
      <tr>
        <th>学号</th>
        <th>密码</th>
        <th>姓名</th>
        <th>电话</th>
         <th>性别</th>
           <th>地址</th>
        <th width="310">操作</th>
      </tr>
       <%
			for(int i = 0;i<list.size();i++){
				Stu bean = (Stu)list.get(i);
			%>
         <tr>
          <td><%=bean.getStuno() %></td>
          <td><%=bean.getPassword() %></td>
          <td><%=bean.getRealname() %></td>
         <td><%=bean.getTel() %></td>
           <td><%=bean.getSex() %></td>
            <td><%=bean.getSs() %></td>
          <td><div class="button-group"> 
          <a class="button border-main" href="<%=path %>/stumodifybefore.action?id=<%=bean.getId()%>"><span class="icon-edit"></span> 修改</a>
           <a class="button border-red" href="<%=path %>/studel.action?id=<%=bean.getId()%>" >
           <span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
        <%} %>
      <tr>
        <td colspan="8"><div class="pagelist">
         <a href="#" onclick="frist()">首页</a> <a href="#" onclick="back()">上一页</a> <a href="#" onclick="next()">下一页</a><a href="#"  onclick="last()">尾页</a> 
         </div></td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>