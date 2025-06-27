<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>
<link href="js/video/video-js.min.css" rel="stylesheet">
<script src="js/video/ie8/videojs-ie8.js"></script>
<script src="js/video/video.min.js"></script>

<div style="padding: 10px" class="admin-content">



<div style="padding: 20px;background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-card">
            <div class="layui-card-header">文章详情</div>
            <div class="layui-card-body">
                <div class="admin-detail clearfix">
                                            <div class="detail detail-longtext">
                <div class="detail-title">
                    文章标题：
                </div>
                <div class="detail-content">
                    ${map.wenzhangbiaoti}
                </div>
            </div>                                            <div class="detail detail-image">
                <div class="detail-title">
                    图片：
                </div>
                <div class="detail-content">
                    <img src="${map.tupian}" style="width: 350px"/>
                </div>
            </div>                                                                                        <div class="detail detail-select">
                <div class="detail-title">
                    分类：
                </div>
                <div class="detail-content">
                    <ssm:sql var="mapwenzhangfenlei4" type="find">SELECT fenleimingcheng FROM wenzhangfenlei where id='${map.fenlei}'</ssm:sql>${mapwenzhangfenlei4.fenleimingcheng}
                </div>
            </div>                                            <div class="detail detail-text">
                <div class="detail-title">
                    发布人：
                </div>
                <div class="detail-content">
                    ${map.faburen}
                </div>
            </div><div class="detail detail-text">
                <div class="detail-title">
                    浏览量：
                </div>
                <div class="detail-content">
                    ${map.liulanliang}
                </div>
            </div>                                                                                        <div class="detail detail-autotime">
                <div class="detail-title">
                    添加时间：
                </div>
                <div class="detail-content">
                    ${map.addtime}
                </div>
            </div>                    
                    <div class="detail detail-video">
                <div class="detail-title">
                    视频：
                </div>
                <div class="detail-content">
                    <video id="example_video_1" class="video-js vjs-default-skin" style="width: 100%;height: 100%;min-height: 320px;" controls="" preload="none" poster="images/play.png" data-setup="{}">
                    <source src="${map.shipin}" type="video/mp4">
                    <track kind="captions" src="../shared/example-captions.vtt" srclang="en" label="English"></track>
                    <!-- Tracks need an ending tag thanks to IE9 -->
                    <track kind="subtitles" src="../shared/example-captions.vtt" srclang="en" label="English"></track>
                    <!-- Tracks need an ending tag thanks to IE9 -->
                    <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
                </source></video>
                </div>
            </div>                                                                                <div class="detail detail-editor">
                <div class="detail-title">
                    文章内容：
                </div>
                <div class="detail-content">
                    ${map.wenzhangneirong}
                </div>
            </div>                </div>

                <div class="button-list mt10">
                    <div class="">
                        <button type="button" class="layui-btn layui-btn-default" onclick="history.go(-1);">
    返回
                        
</button>
                        <button type="button" class="layui-btn layui-btn-default" onclick="window.print()">
    打印本页
                        
</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>






</div>
<%@ include file="foot.jsp" %>
