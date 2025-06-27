<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>


<div>


    <div class="layui-container">


        <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
            <h3 class="section-title">
                文章 </h3>
            <div class="sidebar-widget-body">


                <div class="snick clearfix">
                    <div style="margin-bottom: 20px">


                        <form action="?" class="search">
                            <table class="jd-search">
                                <tbody>
                                <tr>
                                    <td class="label1">
                                        文章标题
                                    </td>
                                    <td>

                                        <input type="text" class="layui-input" style="width: 150px"
                                               name="wenzhangbiaoti" value="${param.wenzhangbiaoti}"
                                               placeholder="请输入关键词"/>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="label1">
                                        分类
                                    </td>
                                    <td>
                                        <p class="search-radio">
                                            <input type="hidden" name="fenlei" value="${param.fenlei}"/>
                                            <c:choose>
                                                <c:when test="${param.fenlei == null || '' == param.fenlei }">

                                                    <a href="javascript:;" data-value="" onclick="selectRadio(this)"
                                                       class="active">全部</a>
                                                </c:when><c:otherwise>
                                                <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                                            </c:otherwise></c:choose>
                                            <ssm:sql var="mapwenzhangfenlei3"
                                                     type="select">SELECT id,fenleimingcheng FROM wenzhangfenlei</ssm:sql>
                                            <c:forEach items="${mapwenzhangfenlei3}" var="r">
                                                <c:choose>
                                                    <c:when test="${r.id == param.fenlei }">

                                                        <a href="javascript:;" data-value="${r.id}"
                                                           onclick="selectRadio(this)"
                                                           class="active">${r.fenleimingcheng}</a>
                                                    </c:when><c:otherwise>
                                                    <a href="javascript:;" data-value="${r.id}"
                                                       onclick="selectRadio(this)">${r.fenleimingcheng}</a>
                                                </c:otherwise></c:choose>
                                            </c:forEach>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <button type="submit" class="layui-btn layui-btn-default">
                                            搜索
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>


                    </div>
                    <div class="row">
                        <c:forEach items="${list}" var="r">
                            <div class="snock col-md-3">
                                <a href="wenzhangdetail.do?id=${r.id}">
                                    <div class="services">
                                        <div class="img-box snocks pb100">
                                            <div class="img" style="background-image: url('${r.tupian}')"></div>
                                        </div>
                                        <h2>${Info.subStr(r.wenzhangbiaoti, 12)}</h2>
                                        <p>${Info.subStr(r.wenzhangneirong, 15)}</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


    </div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>