<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>


<div>


    <div class="layui-container">


        <div style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
            <div class="news_show">
            <span class="show_t">
                ${map.wenzhangbiaoti}
            </span>
                <span class="fa_time">
                                分类:<ssm:sql var="mapwenzhangfenlei5"
                                            type="find">SELECT fenleimingcheng FROM wenzhangfenlei where id='${map.fenlei}'</ssm:sql>${mapwenzhangfenlei5.fenleimingcheng}   
                                发布人:${map.faburen}   
                                浏览量:${map.liulanliang}   
                                添加时间:${map.addtime}   
                
                </span>
                <div>




                    <c:choose>
                        <c:when test="${map.shipin !='' }">




                            <video id="example_video_1" class="video-js vjs-default-skin" style="width: 100%;height: 100%;min-height: 320px;" controls="" preload="none" poster="images/play.png" data-setup="{}">
                                <source src="${map.shipin}" type="video/mp4">
                                <track kind="captions" src="../shared/example-captions.vtt" srclang="en" label="English"></track>
                                <!-- Tracks need an ending tag thanks to IE9 -->
                                <track kind="subtitles" src="../shared/example-captions.vtt" srclang="en" label="English"></track>
                                <!-- Tracks need an ending tag thanks to IE9 -->
                                <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
                                </source></video>


                        </c:when></c:choose>


                    ${map.wenzhangneirong}

                </div>
                <div class="s_x clearfix">
                    <ssm:sql var="prev"
                             type="find">SELECT * FROM wenzhang WHERE id<'${map.id}' ORDER BY id desc</ssm:sql>
                    <c:choose>
                        <c:when test="${prev.id != null}">

                            <a href="wenzhangdetail.do?id=${prev.id}" class="s_prev">上一篇：${prev.wenzhangbiaoti}</a>
                        </c:when><c:otherwise>
                        <a href="javascript:;" class="s_prev">上一篇：没有了</a>
                    </c:otherwise></c:choose>
                    <ssm:sql var="next"
                             type="find">SELECT * FROM wenzhang WHERE id>'${map.id}' ORDER BY id asc</ssm:sql>
                    <c:choose>
                        <c:when test="${next.id != null}">

                            <a href="wenzhangdetail.do?id=${next.id}">下一篇：${next.wenzhangbiaoti}</a>
                        </c:when><c:otherwise>
                        <a href="javascript:;">下一篇：没有了</a>
                    </c:otherwise></c:choose>
                </div>
            </div>
        </div>


    </div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>