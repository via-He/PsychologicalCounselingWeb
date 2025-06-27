<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>


<div>


    <div class="layui-container">


        <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
            <h3 class="section-title">
                感情驿站 </h3>
            <div class="sidebar-widget-body">


                <div>
                    <div class="baidu">
                        <div class="baidu_l">
                            ${user = Query.make("yonghu").where("username", map.faburen).find();""}
                            <div class="louzhubiaoshi_wrap">
                                <div class="beMember_fl"></div>
                            </div>
                            <ul class="p_author">
                                <li class="icon">
                                    <div class="icon_relative ">
                                        <a class="p_author_face " href="javascript:;">
                                            <c:choose>
                                                <c:when test="${user.touxiang == null || '' == user.touxiang }">

                                                    <img src="./images/default.gif" alt=""/>
                                                </c:when><c:otherwise>
                                                <img src="${user.touxiang}"/>
                                            </c:otherwise></c:choose>
                                        </a>
                                    </div>
                                </li>
                                <li class="d_nameplate"></li>
                                <li class="d_name">
                        <span class="d_name_icon">
                            <a href="javascript:;" class="icon-crown-year-v5"></a>
                        </span>
                                    <a href="javascript:;" class="vip_red ">

                                        ${map.faburen}

                                    </a>
                                </li>

                            </ul>
                        </div>

                        <div class="baidu_r clearfix">
                            <div class="d_post_content_main ">
                                <div class="p_content">
                                    <div class="d_post_content ">



                                        <c:choose>
                                            <c:when test="${map.tupian !='' }">


                                                <img src="${map.tupian}" style="width: 350px"/>



                                            </c:when>
                                        </c:choose>



                                        ${map.neirong}


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

                                                </c:when>
                                            </c:choose>






                                    </div>
                                </div>
                                <div class="core_reply ">
                                    <div class="core_reply_tail clearfix">
                                        <div class="post-tail-wrap">
                                            <!--<span>
                                                <a href="javascript:;" class="tail-info">
                                                    <img class="icon-jubao" src="./images/jubao.png" alt="">
                                                </a>
                                            </span>-->
                                            <span class="tail-info">${map.addtime}</span>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        var page = '${param.page}';
                        if (page == '' || page == 'null') {
                            page = 1;
                        }
                        var pagesize = 10;
                        page = Math.max(Math.floor(page), 1);
                        var index = (page - 1) * pagesize + 1;
                    </script>
                    ${list = Query.make("pinglun").where("tieziid", map.id).order("addtime asc").page(10);""}

                    <c:set var="i" value="0"/><c:forEach items="${list}" var="reply"><c:set var="i" value="${i+1}"/>
                    <div class="baidu">
                        <div class="baidu_l">






                            <ul class="p_author">
                                <li class="icon">
                                    <div class="icon_relative ">
                                            ${user = Query.make("yonghu").where("username", reply.pinglunren).find();""}
                                        <a class="p_author_face " href="javascript:;">
                                            <c:choose>
                                                <c:when test="${user.touxiang == null || '' == user.touxiang }">
                                                    <img src="./images/default.gif" alt=""/>
                                                </c:when><c:otherwise>
                                                <img src="${user.touxiang}"/>
                                            </c:otherwise></c:choose>
                                        </a>
                                    </div>
                                </li>

                                <li class="d_name">
                        <span class="d_name_icon">
                            <a href="javascript:;" class="icon-crown-year-v5"></a>
                        </span>
                                    <a href="javascript:;" class="vip_red ">
                                            ${reply.pinglunren}
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="baidu_r clearfix">
                            <div class="d_post_content_main">
                                <div class="p_content">
                                    <div class="d_post_content ">${reply.huifuneirong}</div>
                                </div>
                                <div class="core_reply ">
                                    <div class="core_reply_tail clearfix">
                                        <div class="post-tail-wrap">
                                            <a class="r-reply" title="回复此楼" href="javascript:;"
                                               onclick="postreply(this);">回复</a>
                                            <div style="display: none">
                                                <p>回【
                                                    <script>document.write(index)</script>
                                                    楼】（${user.xingming}）的帖子
                                                </p>

                                                    ${reply.huifuneirong}
                                            </div>
                                            <!--<span>
                                                <a href="javascript:;" class="tail-info">
                                                    <img class="icon-jubao" src="./images/jubao.png" alt="">
                                                </a>
                                            </span>-->
                                            <span class="tail-info">${reply.addtime}</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                    <div class="">
                        ${page.info}
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.username != null && '' !=  sessionScope.username }">

                            <div class="t" style="padding:0;margin-bottom:0;">
                                <form name="FORM" method="post" action="pingluninsert.do" id="anchor">
                                    <div class="b h" style="border-top:0;">快速回复</div>
                                    <table width="100%" class="floot" style="table-layout:inherit;">
                                        <tbody>
                                        <tr class="vt">
                                            <td class="floot_left">
                                                <div class="floot_leftdiv">
                                                    <div>
                                                        <p class="b">${sessionScope.name}</p>
                                                    </div>
                                                    <div class="cc">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.touxiang == null || '' == sessionScope.touxiang }">
                                                                <div class="face_img">
                                                                    <img class="pic" src="images/default.gif" width="120" height="120" border="0"/>
                                                                </div>
                                                            </c:when><c:otherwise>
                                                            <div class="face_img">
                                                                <img class="pic" src="${sessionScope.touxiang}" width="120" height="120" border="0"/>
                                                            </div>
                                                        </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </td>
                                            <td style="padding:10px 0 10px 10px;">
                                                <div class="c mb10">
                                                    <div class="" style="display: none">

                                                            ${readMap = Query.make("tiezi").where("id", param.id).find();""}
                                                        <input type="hidden" name="tieziid" value="${param.id}"/>
                                                         <input type="hidden" id="biaoti" name="biaoti" value="${Info.html(readMap.biaoti)}"/>
                                                         <input type="hidden" id="pinglunren" name="pinglunren" value="${sessionScope.username}"/>
                                                                <input type="hidden" id="faburen" name="faburen" value="${map.faburen}"/>
                                                    </div>

                                                    <input name="referer" id="referer" value="" type="hidden"/>
                                                    <script>
                                                        $('#referer').val(location.href);
                                                    </script>

                                                    <textarea id="huifuneirong" style="width: 100%;height: 120px;" name="huifuneirong"></textarea>


                                                </div>
                                                <div>
                                    <span class="mr20">
                                        <span class="bt" style="margin:0;">
                                            <span>
                                                <button type="submit" class="layui-btn" name="Submit">
     发 布 
</button>
                                            </span>
                                        </span>
                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <script>
                                    function stripscript(s) {
                                        return s.replace(/<script.*?>.*?<\/script>/sig, '');
                                    }

                                    function postreply(obj) {
                                        var content = stripscript($(obj).next().html());
                                        content = content.replace(/【(.*?)([0-9]+)(.*?)】/sig, function ($0, $1, $2) {
                                            return '【' + $2 + '楼】'
                                        })
                                        content = '<blockquote>' + content + '</blockquote><p>&nbsp;</p>';
                                        var editor = UM.getEditor('huifuneirong');
                                        editor.setContent(content);
                                        $(window).scrollTop(99999);
                                        editor.focus();
                                    }

                                    UM.getEditor('huifuneirong');
                                </script>
                            </div>
                        </c:when></c:choose>
                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


    </div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>