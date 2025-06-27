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
                    <a href="xinxilist.do">更多>></a>
                </div>
                信息
            </h3>
            <div class="sidebar-widget-body">


                <div class="list-table">


                    <table width="100%" border="1" class="table table-list table-bordered table-hover">
                        <thead>
                        <tr align="center">
                            <th width="60" align="center" bgcolor="CCFFFF">序号</th>
                            <th> 消息内容</th>
                            <th> 发送人</th>
                            <th> 添加时间</th>

                        </tr>
                        </thead>
                        <tbody>

                        <c:set var="$i" value="0"/>
                        <c:forEach items="${list}" var="r">
                            <c:set var="$i" value="${$i+1}"/>
                            <tr>
                                <td width="30" align="center">${r.id}</td>
                                <td> ${r.xiaoxineirong} </td>
                                <td> ${r.fasongren} </td>
                                <td> ${Info.subStr(r.addtime , 19 , "")} </td>


                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>


                ${page.info}










                <div class="layui-tab-item layui-show">
                    <form class="layui-form layui-input-form" action="xinxiinsert.do" method="post" name="form1" id="form1">

                        <input type="hidden" name="liuyanid" value="${param.liuyanid}"/>
                        <input type="hidden" name="yishengxinxiid" value="${param.yishengxinxiid}"/>
                        <div class="layui-form-item">
                            <label class="layui-form-label">消息内容</label>
                            <div class="layui-input-block">

                        <textarea style="width:80%;height:150px;max-width: 90%;min-height: 120px" class="layui-textarea"
                                  placeholder="输入消息内容" id="xiaoxineirong" name="xiaoxineirong"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">发送人</label>
                            <div class="layui-input-block">

                                <input type="text" class="layui-input" placeholder="输入发送人" style="width:150px;"
                                       readonly="readonly" id="fasongren" name="fasongren" value="${sessionScope.username}"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label"> </label>
                            <div class="layui-input-block">


                                <input name="referer" value="" type="hidden"/>

                                <button type="submit" class="layui-btn" lay-filter="form1" lay-submit="" name="Submit">
                                    提交
                                </button>
                                <button type="reset" class="layui-btn layui-btn-default" name="Submit2">
                                    重置
                                </button>


                            </div>
                        </div>

                    </form>
                </div>




















            </div>
            <!-- /.sidebar-widget-body -->
        </div>


    </div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>