<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<link rel="stylesheet" type="text/css" href="htstyle/css/style.css" />
<link rel="stylesheet" type="text/css" href="htstyle/css/skin_/login.css" />
<script type="text/javascript" src="htstyle/js/jquery.js"></script>
<script type="text/javascript" src="htstyle/js/jquery.select.js"></script>
<title>大学生心理健康咨询-用户登录</title>
</head>

<body>
<form action="authAdminLogin.do?a=a" method="post">
<div id="container">
    <div id="bd">
    	<div id="main">
        	<div class="login-box">

                <h1>
                    大学生心理健康咨询后台管理
                </h1>
                <div class="input username" id="username">
                    <label for="userName">用户名</label>
                    <span></span>
                    <input type="text" tabindex="1" name="username" id="userName" />
                </div>
                <div class="input psw" id="psw">
                    <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                    <span></span>
                    <input type="password" tabindex="2" id="password" name="pwd" />
                </div>
                <div class="input validate" id="validate">
                    <label for="valiDate">验证码</label>
                    <input type="text" tabindex="4" id="valiDate" name="pagerandom" />
                    <div class="value">
                        <img alt="看不清请点我！" name="randImage" onclick="this.src='captcha.do?rand='+Math.floor(Math.random()*100000)" id="randImage"
                             src="captcha.do" width="60" height="20" border="1" align="middle">
                    </div>
                </div>
                <input type="hidden" name="cx" id="cx" value="用户">
<%--                <div class="styleArea">--%>
<%--                    <div class="styleWrap">--%>
<%--                        <select name="cx" tabindex="3">--%>
<%--                            <option value="用户">用户</option>                        </select>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div id="btn" class="loginButton">
                    <input type="submit" tabindex="5" class="button" value="登录"  />
                </div>
            </div>
        </div>
        <div id="ft">CopyRight&nbsp&nbsp&nbsp 大学生心理健康咨询</div>
    </div>
   
</div>
</form>
</body>
<script type="text/javascript">
	var height = $(window).height() > 445 ? $(window).height() : 445;
	$("#container").height(height);
	var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
	$('#bd').css('padding-top', bdheight);
	$(window).resize(function(e) {
        var height = $(window).height() > 445 ? $(window).height() : 445;
		$("#container").height(height);
		var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
		$('#bd').css('padding-top', bdheight);
    });
	$('select').select();

</script>

</html>
