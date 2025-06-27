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
            <div class="layui-card-header">医生信息详情</div>
            <div class="layui-card-body">
                <div class="admin-detail clearfix">
                                            <div class="detail detail-textuser">
                <div class="detail-title">
                    医生账号：
                </div>
                <div class="detail-content">
                    ${map.yishengzhanghao}
                </div>
            </div>                                            <div class="detail detail-text">
                <div class="detail-title">
                    医生姓名：
                </div>
                <div class="detail-content">
                    ${map.yishengxingming}
                </div>
            </div><div class="detail detail-text">
                <div class="detail-title">
                    从医时间：
                </div>
                <div class="detail-content">
                    ${map.congyishijian}
                </div>
            </div>                                            <div class="detail detail-image">
                <div class="detail-title">
                    医生照片：
                </div>
                <div class="detail-content">
                    <img src="${map.yishengzhaopian}" style="width: 350px"/>
                </div>
            </div>                                            <div class="detail detail-select">
                <div class="detail-title">
                    性别：
                </div>
                <div class="detail-content">
                    ${map.xingbie}
                </div>
            </div>                                            <div class="detail detail-textarea">
                <div class="detail-title">
                    医生简介：
                </div>
                <div class="detail-content">
                    ${map.yishengjianjie}
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
