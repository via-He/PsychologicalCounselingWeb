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
                <div class="more">
                    <a href="liuyanlist.do">更多>></a>
                </div>
                我发起的留言
            </h3>
            <div class="sidebar-widget-body">


                <div class="list-table">
                    ${liuyanlist39 = Query.make("liuyan").where("faqiren", sessionScope.username).limit(100).order("id desc").select();""}

                    <table width="100%" border="1" class="table table-list table-bordered table-hover">
                        <thead>
                        <tr align="center">
                            <th> 医生账号</th>
                            <th> 留言内容</th>
                            <th> 发起人</th>
                            <th> 消息查询</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:set var="$i" value="0"/><c:forEach items="${liuyanlist39}" var="r"><c:set var="$i"
                                                                                                     value="${$i+1}"/>
                            <tr>
                                <td> ${r.yishengzhanghao} </td>
                                <td> ${r.liuyanneirong} </td>
                                <td> ${r.faqiren} </td>

                                <td> <a href="xinxilist.do?liuyanid=${r.id}&yishengxinxiid=${r.yishengxinxiid}">查看消息 </a></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>









            </div>
            <!-- /.sidebar-widget-body -->
        </div>


    </div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>