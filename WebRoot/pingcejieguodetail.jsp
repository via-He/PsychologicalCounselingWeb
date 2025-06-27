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
                ${map.cepingzhuti}
            </span>
                <span class="fa_time">
                                总得分:${map.zongdefen}   
                                测试者:${map.ceshizhe}   
                
                </span>
                <div>

                    ${map.zhuanyejianyi}

                </div>

            </div>
        </div>


    </div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>