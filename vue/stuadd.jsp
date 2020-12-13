<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="com.util.*"%>
<%@ page import="com.model.*"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加</strong></div>
  <div class="body-content">
    <form action="<%=path %>/stuadd.action" method="post" name="userLogin" class="form-x">
      <div class="form-group">
        <div class="label">
          <label> 学号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="stuno" id="stuno" data-validate="required:请输入学号" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label> 密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="password" id="password" data-validate="required:请输入密码" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label> 姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="realname"  id="realname" data-validate="required:请输入姓名" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label> 电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="tel" id="tel" data-validate="required:请输入电话" />
          <div class="tips"></div>
        </div>
      </div>
        <div class="form-group">
          <div class="label">
            <label>性别：</label>
          </div>
          <div class="field">
            <select name="sex" id="sex" class="input w50">
              <option value="男">男</option>
              <option value="女">女</option>
            </select>
            <div class="tips"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>地址：</label>
          </div>
          <div class="field">
            <input type="text" class="input w50" value="" name="ss" id="ss" data-validate="required:请输入地址" />
          <div class="tips"></div>
            <div class="tips"></div>
          </div>
        </div>
    
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>