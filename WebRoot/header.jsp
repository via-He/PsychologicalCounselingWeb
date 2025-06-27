<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav id="header-box">
    <div class="layui-container">

        <a href="{url home}" class="logo">
            大学生心理健康咨询
        </a>

        <!-- ==========  Top navigation ========== -->

        <div class="navigation navigation-top clearfix">
            <ul>
                <!--add active class for current page-->
                <li class="left-side">
                    <img src="images/logo.png" width="250px">
                </li>
                <!--<li class="left-side"><a href="email-template.html">Email template</a></li>-->

                <c:choose>
                    <c:when test="${sessionScope.username != null && sessionScope.username !=  '' }">

                        <li><a href="main.do"><i class="icon icon-user"></i>${sessionScope.username},${sessionScope.cx}
                        </a></li>
                        <li><a href="logout.do"><i class="fa fa-sign-out"></i>退出</a></li>
                    </c:when><c:otherwise>
                    <li><a href="javascript:void(0);" class="open-login"><i class="icon icon-user"></i> 登录</a></li>
                </c:otherwise></c:choose>

                <li><a href="javascript:void(0);" class="open-search"><i class="icon icon-magnifier"></i></a></li>

                <!--<li><a href="javascript:void(0);" class="open-cart"><i class="icon icon-cart"></i> <span>4</span></a></li>-->
            </ul>
        </div>

        <!-- ==========  Main navigation ========== -->

        <div class="navigation navigation-main">
            <a href="#" class="open-login"><i class="icon icon-user"></i></a>
            <!--<a href="#" class="open-search"><i class="icon icon-magnifier"></i></a>
            <a href="#" class="open-cart"><i class="icon icon-cart"></i> <span>4</span></a>-->
            <a href="#" class="open-menu"><i class="icon icon-menu"></i></a>

            <div class="floating-menu">
                <!--mobile toggle menu trigger-->
                <div class="close-menu-wrapper">
                    <span class="close-menu"><i class="icon icon-cross"></i></span>
                </div>
                <ul id="navbar-str">
                    <li>
                        <a href="./">首页
                        </a>
                    </li>
                    <li>
                        <a href="yishengxinxilist.do">医生
                        </a>
                    </li>
                    <li>
                        <a href="tiezilist.do">情感驿站
                            <span class="open-dropdown"><i class="fa fa-angle-down"></i></span>
                        </a>
                        <div class="navbar-dropdown navbar-dropdown-single">
                            <div class="navbar-box">
                                <div class="box-full">
                                    <div class="box clearfix">
                                        <ul>
                                            <li><a href="tieziadd.do">发布帖子</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="xinlicepinglist.do">心理评测
                        </a>
                    </li>
                    <li>
                        <a href="liuyanlist.do">我的留言
                        </a>
                    </li>
                    <li>
                        <a href="gonggaolist.do">公告
                        </a>
                    </li>
                    <li>
                        <a href="wenzhanglist.do">文章
                            <span class="open-dropdown"><i class="fa fa-angle-down"></i></span>
                        </a>
                        <div class="navbar-dropdown navbar-dropdown-single">
                            <div class="navbar-box">
                                <div class="box-full">
                                    <div class="box clearfix">
                                        <ul>
                                            <ssm:sql var="mapwenzhangfenlei1"
                                                     type="select">SELECT id,fenleimingcheng FROM wenzhangfenlei</ssm:sql>
                                            <c:forEach items="${mapwenzhangfenlei1}" var="m">
                                                <li><a href="wenzhanglist.do?fenlei=${m.id}">${m.fenleimingcheng}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="yonghuadd.do">用户注册
                        </a>
                    </li>


                    <c:choose>
                        <c:when test="${null == sessionScope.username }">
                            <li>
                                <a href="login.do">后台入口
                                </a>
                            </li>
                        </c:when>
                    </c:choose>





                </ul>
            </div>
        </div>

        <!-- ==========  Search wrapper ========== -->
        <div class="search-wrapper">
            <form action="wenzhanglist.do">
                <input type="text" value="${param.wenzhangbiaoti}" name="wenzhangbiaoti" class="form-control"
                       placeholder="输入搜索关键字"/>
                <button class="btn btn-outline-dark btn-sm">搜索</button>
            </form>
        </div>

        <!-- ==========  Login wrapper ========== -->

        <div class="login-wrapper">
            <!--<div class="h5">登录系统</div>-->
            <form class="layui-form" action="authLogin.do?a=a" method="post">

                <div class="layui-form-item">


                    <input type="text" class="layui-input" name="username" placeholder="输入帐号"/>

                </div>

                <div class="layui-form-item">


                    <input type="password" class="layui-input" name="pwd" placeholder="密码"/>

                </div>

                <input type="hidden" name="cx" value="用户">

                <div class="layui-form-item">


                    <div class="layui-input-group">

                        <input type="text" class="layui-input" name="pagerandom" placeholder="输入验证码"/>


                        <span class="input-group-addon"><img src="captcha.do"
                                                             style="width: 60px;height: 20px;max-width: none; max-height: none;"
                                                             onclick="this.src='captcha.do?rand='+new Date().getTime()"/></span>
                    </div>

                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"> </label>
                    <div class="layui-input-block">

                        <button type="submit" class="layui-btn">
                            登录
                        </button>

                    </div>
                </div>


            </form>

        </div>

        <!-- ==========  Cart wrapper ========== -->


    </div>

    <script>
        $(function () {
            var objSearch = $('#header-box .search-wrapper'),
                objLogin = $('#header-box .login-wrapper'),
                objCart = $('#header-box .cart-wrapper'),
                objMenu = $('#header-box .floating-menu'),
                objMenuLink = $('#header-box .floating-menu a'),
                $search = $('#header-box .open-search'),
                $login = $('#header-box .open-login'),
                $cart = $('#header-box .open-cart'),
                $menu = $('#header-box .open-menu'),
                $openDropdown = $('#header-box .open-dropdown'),
                $close = $('#header-box .close-menu'),
                $settingsItem = $('#header-box .nav-settings .nav-settings-list li');

            // Open/close login

            $login.on('click', function () {
                toggleOpen($(this));
                objLogin.toggleClass('open');
                closeSearch();
                closeCart();
            });

            // Open/close search bar

            $search.on('click', function () {
                toggleOpen($(this));
                objSearch.toggleClass('open');
                objSearch.find('input').focus();
                closeLogin();
                closeCart();
            });

            // Open/close cart

            $cart.on('click', function () {
                toggleOpen($(this));
                objCart.toggleClass('open');
                closeLogin();
                closeSearch();
            });

            // Settings language & currency dropdown

            $settingsItem.on('click', function () {
                var $value = $(this).closest('.nav-settings').find('.nav-settings-value');
                $value.text($(this).text());
            });


            // Mobile menu open/close

            $menu.on('click', function () {
                objMenu.addClass('expanded');
                closeSearch();
                closeLogin();
                closeCart();
            });

            // Floating menu hyperlink
            if ($('nav').hasClass('navbar-single-page')) {
                objMenuLink.on('click', function () {
                    objMenu.removeClass('expanded');
                });
            }

            // Open dropdown/megamenu

            $openDropdown.on('click', function (e) {

                e.preventDefault();

                var liParent = $(this).parent().parent(),
                    liDropdown = liParent.find('.navbar-dropdown');

                liParent.toggleClass('expanded');

                if (liParent.hasClass('expanded')) {
                    liDropdown.slideDown();
                } else {
                    liDropdown.slideUp();
                }
            });

            // Close menu (mobile)

            $close.on('click', function () {
                $('nav').find('.expanded').removeClass('expanded');
                $('nav').find('.navbar-dropdown').slideUp();
            });

            // Global functions

            function toggleOpen(el) {
                $(el).toggleClass('open');
            }

            function closeSearch() {
                objSearch.removeClass('open');
                $search.removeClass('open');
            }

            function closeLogin() {
                objLogin.removeClass('open');
                $login.removeClass('open');
            }

            function closeCart() {
                objCart.removeClass('open');
                $cart.removeClass('open');
            }

            // Sticky header
            // ----------------------------------------------------------------

            var navbarFixed = $('nav.navbar-fixed');

            // When reload page - check if page has offset
            if ($(document).scrollTop() > 94) {
                navbarFixed.addClass('navbar-sticked');
            }
            // Add sticky menu on scroll
            $(document).on('bind ready scroll', function () {
                var docScroll = $(document).scrollTop();
                if (docScroll >= 10) {
                    navbarFixed.addClass('navbar-sticked');
                } else {
                    navbarFixed.removeClass('navbar-sticked');
                }
            });
        })
        (function () {
            var path = location.pathname.substr(1);
            var search = location.search;
            if (search != '') {
                path += decodeURIComponent(search);
            }
            if (path == '') {
                $('#navbar-str li:eq(0)').addClass('active');
            } else {
                $('#navbar-str>li').each(function () {
                    var href = $(this).find('>a').attr('href');
                    if (href == path) {
                        $(this).addClass('active');
                    }
                    if ($(this).find('.navbar-dropdown').length > 0) {
                        var that = this;
                        $(this).find('a').each(function () {
                            var href = $(this).attr('href');
                            if (href == path) {
                                $(this).addClass('active');
                                $(that).addClass('active');
                            }
                        })
                    }
                })
            }
        })();
    </script>
</nav>



