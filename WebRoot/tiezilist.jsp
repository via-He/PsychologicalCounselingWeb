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
                情感驿站 </h3>
            <div class="sidebar-widget-body">


                <div class="bmw">
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
                            <c:set var="i" value="0"/><c:forEach items="${list}" var="reply"><c:set var="i"
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