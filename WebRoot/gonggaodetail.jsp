<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>



<div >

    

<div class="layui-container">

                    

    

<div style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
        <div class="common-title" style="margin-top: 4em;">
            <p>
                <i></i>
                <i></i>
            </p>
        </div>
        <div class="news_show">
            <span class="show_t">
                ${map.gonggaobiaoti}
            </span>
            <span class="fa_time">
                                发布人:${map.faburen}   
                
                </span>
            <div>

                ${map.neirong}

            </div>
            <div class="s_x clearfix">
                <ssm:sql var="prev" type="find">SELECT * FROM gonggao WHERE id<'${map.id}' ORDER BY id desc</ssm:sql>
                <c:choose>
<c:when test="${prev.id != null}">

                <a href="gonggaodetail.do?id=${prev.id}" class="s_prev">上一篇：${prev.gonggaobiaoti}</a>
                </c:when><c:otherwise>
                <a href="javascript:;" class="s_prev">上一篇：没有了</a>
                </c:otherwise></c:choose>
                <ssm:sql var="next" type="find">SELECT * FROM gonggao WHERE id>'${map.id}' ORDER BY id asc</ssm:sql>
                <c:choose>
<c:when test="${next.id != null}">

                <a href="gonggaodetail.do?id=${next.id}">下一篇：${next.gonggaobiaoti}</a>
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