<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>

<div style="padding: 10px" class="admin-content">


    <div style="padding: 20px;background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-card">
                <div class="layui-card-header">预约详情</div>
                <div class="layui-card-body">
                    <div class="admin-detail clearfix">
                        <div class="detail detail-text">
                            <div class="detail-title">
                                预约编号：
                            </div>
                            <div class="detail-content">
                                ${map.yuyuebianhao}
                            </div>
                        </div>
                        <div class="detail detail-text">
                            <div class="detail-title">
                                医生姓名：
                            </div>
                            <div class="detail-content">
                                ${map.yishengxingming}
                            </div>
                        </div>
                        <div class="detail detail-text">
                            <div class="detail-title">
                                预约人姓名：
                            </div>
                            <div class="detail-content">
                                ${map.yuyuerenxingming}
                            </div>
                        </div>
                        <div class="detail detail-text">
                            <div class="detail-title">
                                联系电话：
                            </div>
                            <div class="detail-content">
                                ${map.lianxidianhua}
                            </div>
                        </div>
                        <div class="detail detail-readmodule">
                            <div class="detail-title">
                                医生信息id：
                            </div>
                            <div class="detail-content">
                                ${map.yishengxinxiid}
                            </div>
                        </div>
                        <div class="detail detail-textuser">
                            <div class="detail-title">
                                医生账号：
                            </div>
                            <div class="detail-content">
                                ${map.yishengzhanghao}
                            </div>
                        </div>
                        <div class="detail detail-textuser">
                            <div class="detail-title">
                                预约人：
                            </div>
                            <div class="detail-content">
                                ${map.yuyueren}
                            </div>
                        </div>
                        <div class="detail detail-select">
                            <div class="detail-title">
                                预约类型：
                            </div>
                            <div class="detail-content">
                                ${map.yuyueleixing}
                            </div>
                        </div>
                        <div class="detail detail-select">
                            <div class="detail-title">
                                状态：
                            </div>
                            <div class="detail-content">
                                ${map.zhuangtai}
                            </div>
                        </div>
                        <div class="detail detail-datetime">
                            <div class="detail-title">
                                预约时间：
                            </div>
                            <div class="detail-content">
                                ${map.yuyueshijian}
                            </div>
                        </div>
                        <div class="detail detail-textarea">
                            <div class="detail-title">
                                备注：
                            </div>
                            <div class="detail-content">
                                ${map.beizhu}
                            </div>
                        </div>
                        <div class="detail detail-autotime">
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
