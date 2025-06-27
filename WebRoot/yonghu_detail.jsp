<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>

<div style="padding: 10px" class="admin-content">



<div style="padding: 20px;background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-card">
            <div class="layui-card-header">用户详情</div>
            <div class="layui-card-body">
                <div class="admin-detail clearfix">
                                            <div class="detail detail-select">
                <div class="detail-title">
                    权限：
                </div>
                <div class="detail-content">
                    ${map.cx}
                </div>
            </div><div class="detail detail-select">
                <div class="detail-title">
                    性别：
                </div>
                <div class="detail-content">
                    ${map.xingbie}
                </div>
            </div>                                            <div class="detail detail-text">
                <div class="detail-title">
                    帐号：
                </div>
                <div class="detail-content">
                    ${map.username}
                </div>
            </div><div class="detail detail-text">
                <div class="detail-title">
                    姓名：
                </div>
                <div class="detail-content">
                    ${map.xingming}
                </div>
            </div><div class="detail detail-text">
                <div class="detail-title">
                    手机：
                </div>
                <div class="detail-content">
                    ${map.shouji}
                </div>
            </div>                                            <div class="detail detail-password">
                <div class="detail-title">
                    密码：
                </div>
                <div class="detail-content">
                    ${map.pwd}
                </div>
            </div>                                            <div class="detail detail-image">
                <div class="detail-title">
                    头像：
                </div>
                <div class="detail-content">
                    <img src="${map.touxiang}" style="width: 350px"/>
                </div>
            </div>                                            <div class="detail detail-autotime">
                <div class="detail-title">
                    添加时间：
                </div>
                <div class="detail-content">
                    ${map.addtime}
                </div>
            </div>                    
                                                                                                                    </div>

                <div class="button-list mt10">
                    <div class="">
                        <button type="button" class="layui-btn layui-btn-default" onclick="history.go(-1);">
    返回
                        
</button>
                        <button type="button" class="layui-btn layui-btn-default" onclick="window.print()">
    打印本页
                        
</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>






</div>
<%@ include file="foot.jsp" %>
