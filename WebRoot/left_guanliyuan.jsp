<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">账号管理</span>
    </a>
    <ul class="subnav">
        <li class="subnav-li" href="yonghu_list.do" data-id="a0-0">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">管理员账号管理</span></a>
        </li>
        <li class="subnav-li" href="yonghu_add.do" data-id="a0-1">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">管理员账号添加</span></a>
        </li>
        <li class="subnav-li" href="mod.do" data-id="a0-2">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">密码修改</span></a>
        </li>
    </ul>
</li>


<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">医生信息管理</span>
    </a>
    <ul class="subnav">
        <li class="subnav-li" href="yishengxinxi_list.do" data-id="a1-0">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">医生信息查询</span></a>
        </li>
        <li class="subnav-li" href="yuyue_list.do" data-id="a1-1">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">医生预约管理</span></a>
        </li>
        <li class="subnav-li" href="yuyuequeren_list.do" data-id="a1-2">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">医生预约确认查询</span></a>
        </li>
        <li class="subnav-li" href="liuyan_list.do" data-id="a1-3">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">留言发起信息查询</span></a>
        </li>
<%--        <li class="subnav-li" href="xinxi_list.do" data-id="a1-4">--%>
<%--            <a href="javascript:;" class="ue-clear">--%>
<%--                <i class="subnav-icon"></i>--%>
<%--                <span class="subnav-text">留言沟通记录查询</span></a>--%>
<%--        </li>--%>
    </ul>
</li>


<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">系统设置</span>
    </a>
    <ul class="subnav">
        <li class="subnav-li" href="lunbotu_add.do" data-id="a2-0">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">轮播图添加</span></a>
        </li>
        <li class="subnav-li" href="lunbotu_list.do" data-id="a2-1">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">轮播图查询</span></a>
        </li>
    </ul>
</li>


<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">情感驿站管理</span>
    </a>
    <ul class="subnav">
        <li class="subnav-li" href="tiezi_list.do" data-id="a3-0">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">全部帖子管理</span></a>
        </li>
        <li class="subnav-li" href="tiezi_add.do" data-id="a3-1">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">发布帖子</span></a>
        </li>
        <li class="subnav-li" href="tiezi_list_faburen.do" data-id="a3-2">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">我的帖子</span></a>
        </li>
        <li class="subnav-li" href="pinglun_list_pinglunren.do" data-id="a3-3">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">我的评论</span></a>
        </li>
        <li class="subnav-li" href="pinglun_list_faburen.do" data-id="a3-4">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">我的帖子评论</span></a>
        </li>
    </ul>
</li>


<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">心理评测管理</span>
    </a>
    <ul class="subnav">


        <li class="subnav-li" href="xinliceping_add.do" data-id="a4-2">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">添加评测</span></a>
        </li>
        <li class="subnav-li" href="xinliceping_list.do" data-id="a4-3">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">评测管理</span></a>
        </li>

        <li class="subnav-li" href="pingcejianyi_list.do" data-id="a4-1">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">建议设置查询</span></a>
        </li>
        <li class="subnav-li" href="timu_list.do" data-id="a4-4">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">评测题目查询</span></a>
        </li>
        <li class="subnav-li" href="pingcejilu_list.do" data-id="a4-5">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">评测记录查询</span></a>
        </li>
        <li class="subnav-li" href="pingcejieguo_list.do" data-id="a4-6">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">评测结果管理</span></a>
        </li>
    </ul>
</li>


<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">公告管理</span>
    </a>
    <ul class="subnav">
        <li class="subnav-li" href="gonggao_add.do" data-id="a5-0">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">发布公告</span></a>
        </li>
        <li class="subnav-li" href="gonggao_list.do" data-id="a5-1">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">公告查询</span></a>
        </li>
    </ul>
</li>


<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">文章管理</span>
    </a>
    <ul class="subnav">
        <li class="subnav-li" href="wenzhangfenlei_add.do" data-id="a6-0">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">添加分类</span></a>
        </li>
        <li class="subnav-li" href="wenzhangfenlei_list.do" data-id="a6-1">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">分类管理</span></a>
        </li>
        <li class="subnav-li" href="wenzhang_add.do" data-id="a6-2">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">添加文章</span></a>
        </li>
        <li class="subnav-li" href="wenzhang_list.do" data-id="a6-3">
            <a href="javascript:;" class="ue-clear">
                <i class="subnav-icon"></i>
                <span class="subnav-text">文章查询</span></a>
        </li>
    </ul>
</li>


