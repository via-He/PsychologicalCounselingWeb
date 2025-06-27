<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="htstyle/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="htstyle/css/skin_/main.css"/>
    <link rel="stylesheet" type="text/css" href="htstyle/css/jquery.dialog.css"/>
    <link rel="stylesheet" type="text/css" href="htstyle/css/skin_/nav.css"/>


    <script type="text/javascript" src="htstyle/js/jquery.js"></script>
    <script type="text/javascript" src="htstyle/js/global.js"></script>
    <script type="text/javascript" src="htstyle/js/clock.js"></script>
    <title>大学生心理健康咨询后台管理模板</title>
</head>

<body>
<div id="container">
    <div id="hd">
        <div class="hd-top">
            <h1 class="logo">大学生心理健康咨询</h1>
            <div class="user-info">

                <span class="user-name">${sessionScope.username}，${sessionScope.cx}</span> <span style="width: 20px">.</span> <span><a href="./" target="_blank" style="color: #fff">网站首页</a></span>

            </div>
            <div class="setting ue-clear">
                <ul class="setting-main ue-clear">
                    <!--<li><a href="javascript:;">桌面</a></li>
                    <li><a href="javascript:;">设置</a></li>
                    <li><a href="javascript:;">帮助</a></li>-->
                    <li><a href="javascript:;" class="close-btn exit"></a></li>
                </ul>
            </div>
        </div>
<%--        <div class="hd-bottom">--%>
<%--            <i class="home"><a href="javascript:;"></a></i>--%>
<%--            <div class="nav-wrap">--%>
<%--                <ul class="nav ue-clear">--%>

<%--                    <!-- 这里可以放多个内容 -->--%>

<%--&lt;%&ndash;                    <li style="width: 320px"><a href="javascript:;" id="clockTime11"></a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <script>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        $(function () {&ndash;%&gt;--%>
<%--&lt;%&ndash;                            showcal('clockTime11');&ndash;%&gt;--%>
<%--&lt;%&ndash;                        })&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </script>&ndash;%&gt;--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--            <div class="nav-btn">--%>
<%--                <a href="javascript:;" class="nav-prev-btn"></a>--%>
<%--                <a href="javascript:;" class="nav-next-btn"></a>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
    <div id="bd" style="box-sizing: border-box">

        <div class="sidebar">
            <div class="sidebar-bg"></div>
<%--            <i class="sidebar-hide"></i>--%>
            <!--<h2><a href="javascript:;"><i class="h2-icon" title="切换到树型结构"></i><span>安全管理</span></a></h2>-->
            <ul class="nav">
                <li class="nav-li" href="javascript:;">
                    <a href="javascript:;" class="ue-clear">
                        <i class="subnav-icon"></i>
                        <span class="subnav-text">后台主页</span>
                    </a>
                    <ul class="subnav">
                        <li class="subnav-li" href="sy.do" data-id="sy"><a href="javascript:;" class="ue-clear">
                            <i class="subnav-icon"></i><span class="subnav-text">后台主页</span></a>
                        </li>
                    </ul>
                </li>

                <c:choose>
                    <c:when test="${'管理员' == sessionScope.cx }">

                        <%@ include file="left_guanliyuan.jsp" %>
                    </c:when></c:choose>
                <c:choose>
                    <c:when test="${'学生' == sessionScope.cx }">

                        <%@ include file="left_xuesheng.jsp" %>
                    </c:when></c:choose>
                <c:choose>
                    <c:when test="${'医生' == sessionScope.cx }">

                        <%@ include file="left_yisheng.jsp" %>
                    </c:when></c:choose>
                <c:choose>
                    <c:when test="${'白领' == sessionScope.cx }">

                        <%@ include file="left_xuesheng.jsp" %>
                    </c:when>
                </c:choose>
            </ul>
            <div class="tree-list outwindow">
                <div class="tree ztree"></div>
            </div>
        </div>
        <div class="main">
            <div class="title">
                <i class="sidebar-show"></i>
                <ul class="tab ue-clear">

                </ul>
                <i class="tab-more"></i>
                <i class="tab-close"></i>
            </div>
            <div class="content">
            </div>
        </div>

        <!--<iframe width="100%" height="100%" id="mainIframe" src="nav.html" frameborder="0"></iframe>-->
    </div>
</div>

<div class="exitDialog">
    <div class="content">
        <div class="ui-dialog-icon"></div>
        <div class="ui-dialog-text">
            <p class="dialog-content">你确定要退出系统？</p>
            <p class="tips">如果是请点击“确定”，否则点“取消”</p>

            <div class="buttons">
                <input type="button" class="button long2 ok" onclick="location.href='logout.do'" value="确定"/>
                <input type="button" class="button long2 normal" value="取消"/>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript" src="htstyle/js/core.js"></script>
<script type="text/javascript" src="htstyle/js/jquery.dialog.js"></script>
<script type="text/javascript" src="htstyle/js/nav.js"></script>
<script type="text/javascript" src="htstyle/js/Menu.js"></script>


<script type="text/javascript">
    $("#bd").height($(window).height() - $("#hd").outerHeight());

    $(window).resize(function (e) {
        $("#bd").height($(window).height() - $("#hd").outerHeight());
    });

    var menu = new Menu({
        defaultSelect: $('#bd .nav').find('li[data-id="sy"]')
    });

    $('.exitDialog').Dialog({
        title: '提示信息',
        autoOpen: false,
        width: 400,
        height: 200
    });

    $('.exit').click(function () {
        $('.exitDialog').Dialog('open');
    });

    $('.exitDialog input[type=button]').click(function (e) {
        $('.exitDialog').Dialog('close');
    });

    (function () {
        var totalWidth = 0, current = 1;

        $.each($('.hd-bottom .nav').find('li'), function () {
            totalWidth += $(this).outerWidth();
        });

        $('.hd-bottom .nav').width(totalWidth);

        function currentLeft() {
            return -(current - 1) * 93;
        }

        $('.nav-btn a').click(function (e) {
            var tempWidth = totalWidth - (Math.abs($('.hd-bottom .nav').css('left').split('p')[0]) + $('.nav-wrap').width());
            if ($(this).hasClass('nav-prev-btn')) {
                if (parseInt($('.hd-bottom .nav').css('left').split('p')[0]) < 0) {
                    current--;
                    Math.abs($('.hd-bottom .nav').css('left').split('p')[0]) > 93 ? $('.hd-bottom .nav').animate({'left': currentLeft()}, 200) : $('.hd-bottom .nav').animate({'left': 0}, 200);
                }
            } else {

                if (tempWidth > 0) {

                    current++;
                    tempWidth > 93 ? $('.hd-bottom .nav').animate({'left': currentLeft()}, 200) : $('.hd-bottom .nav').animate({'left': $('.hd-bottom .nav').css('left').split('p')[0] - tempWidth}, 200);
                }
            }
        });


        $.each($('.skin-opt li'), function (index, element) {
            if ((index + 1) % 3 == 0) {
                $(this).addClass('third');
            }
            $(this).css('background', $(this).attr('attr-color'));
        });

        $('.setting-skin').click(function (e) {
            $('.skin-opt').show();
        });

        $('.skin-opt').click(function (e) {
            if ($(e.target).is('li')) {
                alert($(e.target).attr('attr-color'));
            }
        });

        $('.hd-top .user-info .more-info').click(function (e) {
            $(this).toggleClass('active');
            $('.user-opt').toggle();
        });


        hideElement($('.user-opt'), $('.more-info'), function (current, target) {

            $('.more-info').removeClass('active');
        });

        hideElement($('.skin-opt'), $('.switch-bar'));

        hideElement($('.system-switch'), $('.logo-icon'), function (current, target) {

            $('.logo-icon').removeClass('active');
        });
    })();
</script>
<script>
    setInterval(function () {
        $.post("./", "", function () {

        });
    }, 60 * 1000);
</script>

</body>


</html>
