<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>


<div>


    <div class="layui-container">


        <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
            <h3 class="section-title">
                医生详情 </h3>
            <div class="sidebar-widget-body">


                <div class="">
                    <div class="goods-info clearfix">
                        <div class="gallery-list">
                            <div class="swiper-container gallery-top" id="shangpin-galler">
                                <div class="swiper-wrapper">
                                </div>
                            </div>
                        </div>
                        <div class="goods-right-content">
                            <h3 class="title"><h2>${map.yishengxingming}</h2></h3>
                            <div class="descount">
                                <div>
                        <span class="name">
                            医生账号：
                        </span>
                                    <span class="val">
                                        ${map.yishengzhanghao} </span>
                                </div>
                                <div>
                        <span class="name">
                            性别：
                        </span>
                                    <span class="val">
                                        ${map.xingbie} </span>
                                </div>
                                <div>
                        <span class="name">
                            从医时间：
                        </span>
                                    <span class="val">
                                        ${map.congyishijian} </span>
                                </div>


                                <div>
                        <span class="name">
                            医生简介：
                        </span>
                                    <span class="val">
                                        ${map.yishengjianjie} </span>
                                </div>






                            </div>

                        </div>
                    </div>
                    <div class="goods-content" style="text-align:center">
                        <a href="yuyueadd.do?id=${map.id}" class="layui-btn layui-btn-default" style="color: #fff">预约</a>
                        <a href="liuyanadd.do?id=${map.id}" class="layui-btn layui-btn-default" style="color: #fff">发起留言</a>
                    </div>

                    <script>
                        (function () {
                            var images = "${map.yishengzhaopian}".split(",");
                            if (images.length > 0) {
                                for (var i = 0; i < images.length; i++) {
                                    var path = images[i]
                                    var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url(' + path + ')"></div></div></div>';
                                    $('#shangpin-galler .swiper-wrapper').append(src);
                                    $('#shangpin-thumb .swiper-wrapper').append(src);
                                }

                                var thumbsSwiper = new Swiper('#shangpin-thumb', {
                                    spaceBetween: 10,
                                    slidesPerView: 4,
                                    watchSlidesVisibility: true,//防止不可点击
                                })
                                var gallerySwiper = new Swiper('#shangpin-galler', {
                                    spaceBetween: 10,
                                    thumbs: {
                                        swiper: thumbsSwiper,
                                    }
                                })
                            }

                        })();

                    </script>

                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


    </div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>