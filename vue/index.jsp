<%@ page language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String types=request.getSession().getAttribute("userType").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>班级通讯录信息管理系统</title>  
    <link rel="stylesheet" href="<%=path %>/css/pintuer.css">
    <link rel="stylesheet" href="<%=path %>/css/admin.css">
    <script src="<%=path %>/js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="<%=path %>/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />班级通讯录信息管理系统</h1>
  </div>
  <div class="head-l">
   &nbsp;&nbsp;
  &nbsp;&nbsp;
  <a class="button button-little bg-red" href="<%=path %>/loginout.action"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
  <%if(types.equals("1")){ %>
    <li><a href="<%=path %>/ggmana.action" target="right"><span class="icon-caret-right"></span>公告管理</a></li>
    <li><a href="<%=path %>/stumana.action" target="right"><span class="icon-caret-right"></span>学生管理</a></li>
   <%}else{ %>
    <li><a href="<%=path %>/selfmodifybefore.action" target="right"><span class="icon-caret-right"></span>信息修改</a></li>
     <li><a href="<%=path %>/ggmana2.action" target="right"><span class="icon-caret-right"></span>公告查看</a></li>
    <li><a href="<%=path %>/stumana2.action" target="right"><span class="icon-caret-right"></span>同学查询</a></li>
     <li><a href="<%=path %>/lymana.action" target="right"><span class="icon-caret-right"></span>我的留言</a></li> 
      <li><a href="<%=path %>/lymana2.action" target="right"><span class="icon-caret-right"></span>给我的留言</a></li> 
   
    <%} %>
  </ul>   
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="info.html" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>