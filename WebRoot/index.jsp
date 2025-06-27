<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>
<link href="js/owl/owl.carousel.min.css" rel="stylesheet">
<script src="js/owl/owl.carousel.min.js"></script>


<div>


    <div class="layui-container">


        ${bhtList = Query.make("lunbotu").order("id desc").limit(5).select();""}


        <div class="swiper-container" id="banner62" style="margin:10px 0px 10px 0px">
            <div class="swiper-wrapper">
                <c:forEach items="${bhtList}" var="bht">
                    <div class="swiper-slide">
                        <div class="decoimg_b2">
                            <a class="layui-btn layui-btn-" href="${bht.url}"
                               style="background-image: url('${bht.image}'); height: 460px"></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- 如果需要分页器 -->
            <div class="swiper-pagination"></div>
            <!-- 如果需要导航按钮 -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>


        <script style="margin:10px 0px 10px 0px">
            var mySwiper = new Swiper('#banner62', {
                loop: true, // 循环模式选项
                autoplay: {
                    delay: 3000,
                    disableOnInteraction: false
                },
                // 如果需要分页器
                pagination: {
                    el: '.swiper-pagination',
                },
                // 如果需要前进后退按钮
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                // 如果需要滚动条
                /*scrollbar: {
                    el: '.swiper-scrollbar',
                },*/
            })
        </script>


    </div>


</div>
<div>


    <div class="layui-container">


        <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
            <h3 class="section-title">
                公告 </h3>
            <div class="sidebar-widget-body">


                <div class="hotnews class1">
                    ${gonggaolist66 = Query.make("gonggao").limit(4).order("id desc").select();""}
                    <ul class="a">
                        <c:set var="i" value="0"/><c:forEach items="${gonggaolist66}" var="r"><c:set var="i"
                                                                                                     value="${i+1}"/>
                        <li>

                            <a href="gonggaodetail.do?id=${r.id}" class="clearfix">
                                <span class="shijian">${r.addtime}</span>
                                    ${r.gonggaobiaoti}

                            </a>
                        </li>
                    </c:forEach>
                    </ul>
                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


    </div>


</div>
<div>


    <div class="layui-container">

        <div class="layui-row layui-col-space20">


            <div class="layui-col-md6">


                <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
                    <h3 class="section-title">
                        心理美文 </h3>
                    <div class="sidebar-widget-body">


                        <div class="hotnews class1">
                            ${wenzhanglist71 = Query.make("wenzhang").where("fenlei=2").limit(5).order("id desc").select();""}
                            <ul class="a">
                                <c:set var="i" value="0"/><c:forEach items="${wenzhanglist71}" var="r"><c:set var="i"
                                                                                                              value="${i+1}"/>
                                <li>

                                    <a href="wenzhangdetail.do?id=${r.id}" class="clearfix">
                                        <span class="shijian">${r.addtime}</span>
                                            ${r.wenzhangbiaoti}

                                    </a>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>


                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>


            </div>
            <div class="layui-col-md6">


                <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
                    <h3 class="section-title">
                        心理手册 </h3>
                    <div class="sidebar-widget-body">


                        <div class="hotnews class1">
                            ${wenzhanglist74 = Query.make("wenzhang").where("fenlei=3").limit(5).order("id desc").select();""}
                            <ul class="a">
                                <c:set var="i" value="0"/><c:forEach items="${wenzhanglist74}" var="r"><c:set var="i"
                                                                                                              value="${i+1}"/>
                                <li>

                                    <a href="wenzhangdetail.do?id=${r.id}" class="clearfix">
                                        <span class="shijian">${r.addtime}</span>
                                            ${r.wenzhangbiaoti}

                                    </a>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>


                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>


            </div>


        </div>


    </div>


</div>
<div>


    <div class="layui-container">


        <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px">
            <h3 class="section-title">
                <div class="more">
                    <a href="wenzhanglist.do">更多>></a>
                </div>
                恋爱心理
            </h3>
            <div class="sidebar-widget-body">


                <div class="blog_carousel clearfix">
                    ${wenzhanglist79 = Query.make("wenzhang").where("fenlei=6").limit(4).order("id desc").select();""}

                    <div class="row clearfix">
                        <c:forEach items="${wenzhanglist79}" var="r">
                            <div class="article-col col-md-3 col-xs-12">
                                <article class="single_blog">
                                    <figure>
                                        <div class="blog_thumb">
                                            <a href="wenzhangdetail.do?id=${r.id}" class="img-box pb80">
                                                <div class="img" style="background-image: url('${r.tupian}')">
                                                </div>
                                            </a>
                                        </div>
                                        <figcaption class="blog_content">
                                            <h4 class="post_title">
                                                <a href="wenzhangdetail.do?id=${r.id}">
                                                        ${Info.subStr(r.wenzhangbiaoti, 20)}
                                                </a>
                                            </h4>
                                            <div class="articles_date">
                                                <span><i class="fa fa-calendar"
                                                         aria-hidden="true"></i> ${r.addtime}</span>
                                            </div>
                                            <p class="post_desc">
                                                    ${Info.subStr(r.wenzhangneirong, 45)}
                                            </p>
                                            <a href="wenzhangdetail.do?id=${r.id}" class="btn-see"> + 查看详情</a>
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                        </c:forEach>
                    </div>

                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


    </div>


</div>
<div>


    <div class="layui-container">

        <div class="layui-row layui-col-space20">


            <div class="layui-col-md6">


                <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
                    <h3 class="section-title">
                        人际关系 </h3>
                    <div class="sidebar-widget-body">


                        <div class="hotnews class1">
                            ${wenzhanglist84 = Query.make("wenzhang").where("fenlei=4").limit(5).order("id desc").select();""}
                            <ul class="a">
                                <c:set var="i" value="0"/><c:forEach items="${wenzhanglist84}" var="r"><c:set var="i"
                                                                                                              value="${i+1}"/>
                                <li>

                                    <a href="wenzhangdetail.do?id=${r.id}" class="clearfix">
                                        <span class="shijian">${r.addtime}</span>
                                            ${r.wenzhangbiaoti}

                                    </a>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>


                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>


            </div>
            <div class="layui-col-md6">


                <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
                    <h3 class="section-title">
                        智商情商 </h3>
                    <div class="sidebar-widget-body">


                        <div class="hotnews class1">
                            ${wenzhanglist87 = Query.make("wenzhang").where("fenlei=5").limit(4).order("id desc").select();""}
                            <ul class="a">
                                <c:set var="i" value="0"/><c:forEach items="${wenzhanglist87}" var="r"><c:set var="i"
                                                                                                              value="${i+1}"/>
                                <li>

                                    <a href="wenzhangdetail.do?id=${r.id}" class="clearfix">
                                        <span class="shijian">${r.addtime}</span>
                                            ${r.wenzhangbiaoti}

                                    </a>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>


                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>


            </div>


        </div>


    </div>


</div>
<div>


    <div class="layui-container">


        <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
            <h3 class="section-title">
                情感驿站最新帖子 </h3>
            <div class="sidebar-widget-body">


                <div class="bmw">
                    ${tiezilist92 = Query.make("tiezi").limit(5).order("id desc").select();""}
                    <div class="th">
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <!--<td class="by">序号</td>-->
                                <th colspan="2">
                                    <div>标题</div>
                                </th>
                                <td class="by">发布人</td>
                                <td class="num">回复/查看</td>
                                <td class="by">最后回复人</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="bm_c">
                        <table>
                            <c:set var="i" value="0"/><c:forEach items="${tiezilist92}" var="reply"><c:set var="i"
                                                                                                           value="${i+1}"/>
                            <tbody>
                            <tr>
                                <!--<td class="by">
                        ${reply.id}
                    </td>-->
                                <th colspan="2" class="common">
                                    <a href="tiezidetail.do?id=${reply.id}">
                                            ${reply.biaoti}
                                    </a>
                                </th>
                                <td class="by">
                                    <span>${reply.faburen}</span><br></br>
                                    <span>${Info.subStr(reply.addtime, 10, "")}</span>
                                </td>
                                    ${rep = Query.make("pinglun").where("tieziid", reply.id).order("addtime desc").find();""}
                                <ssm:sql var="count"
                                         type="find">SELECT count(*) count from pinglun WHERE tieziid='${reply.id}'</ssm:sql>

                                <td class="num">
                        <span>
                                ${count.count}
                        </span>
                                </td>
                                <td class="by">
                                    <c:choose>
                                        <c:when test="${rep.pinglunren != null && rep.pinglunren !=  '' }">

                                            <span>${rep.pinglunren}</span><br></br>
                                            <span>${Info.subStr(rep.addtime, 10, "")}</span>
                                        </c:when><c:otherwise>
                                        无回复
                                    </c:otherwise></c:choose>
                                </td>
                            </tr>
                            </tbody>
                        </c:forEach>
                        </table>
                    </div>
                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


    </div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>