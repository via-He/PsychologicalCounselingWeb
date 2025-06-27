<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>



<div >

    

<div class="layui-container">

                    

    

<div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
        <h3 class="section-title">
                        心理医生        </h3>
        <div class="sidebar-widget-body">
            

    

<div class="snick clearfix">
                            <div style="margin-bottom: 20px">
                

    

<form action="?" class="search">
                <table class="jd-search">
            <tbody>
                        <tr>
                <td class="label1">
                    医生姓名                </td>
                <td>
                    
                    <input type="text" class="layui-input" style="width: 150px" name="yishengxingming" value="${param.yishengxingming}" placeholder="请输入关键词"/>

                                                            </td>
            </tr>
                                    <tr>
                <td></td>
                <td><button type="submit" class="layui-btn layui-btn-default">
    搜索
</button></td>
            </tr>
                        </tbody>
        </table>
    </form>



            </div>
                <div class="row">
            <c:forEach items="${list}" var="r">
            <div class="snock col-md-3">
                <a href="yishengxinxidetail.do?id=${r.id}">
                    <div class="services">
                        <div class="img-box snocks pb130">
                            <div class="img" style="background-image: url('${r.yishengzhaopian}')"></div>
                        </div>
                        <h2>${Info.subStr(r.yishengxingming, 15)}</h2>
                        <p>${Info.subStr(r.yishengjianjie, 60)}</p>
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