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
                        公告        </h3>
        <div class="sidebar-widget-body">
            

        
        

<div class="hotnews class1">
                                    <ul class="a">
                <c:set var="i" value="0" /><c:forEach items="${list}" var="r"><c:set var="i" value="${i+1}" />
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
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>