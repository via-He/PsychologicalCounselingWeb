<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">个人中心</span>
    </a>
    <ul class="subnav">
                        <li class="subnav-li" href="yonghu_updtself.do" data-id="a0-0">
            <a href="javascript:;" class="ue-clear">
            <i class="subnav-icon"></i>
            <span class="subnav-text">修改个人资料</span></a>
        </li>
                        <li class="subnav-li" href="mod.do" data-id="a0-1">
            <a href="javascript:;" class="ue-clear">
            <i class="subnav-icon"></i>
            <span class="subnav-text">修改密码</span></a>
        </li>
            </ul>
</li>


<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">医生信息管理</span>
    </a>
    <ul class="subnav">
                        <li class="subnav-li" href="yishengxinxi_list_yishengzhanghao.do" data-id="a1-0">
            <a href="javascript:;" class="ue-clear">
            <i class="subnav-icon"></i>
            <span class="subnav-text">我的医生信息</span></a>
        </li>
            </ul>
</li>


<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">预约管理</span>
    </a>
    <ul class="subnav">
                        <li class="subnav-li" href="yuyue_list_yishengzhanghao.do" data-id="a2-0">
            <a href="javascript:;" class="ue-clear">
            <i class="subnav-icon"></i>
            <span class="subnav-text">我的预约查询</span></a>
        </li>
                        <li class="subnav-li" href="yuyuequeren_list_yishengzhanghao.do" data-id="a2-1">
            <a href="javascript:;" class="ue-clear">
            <i class="subnav-icon"></i>
            <span class="subnav-text">我的预约确认查询</span></a>
        </li>
            </ul>
</li>


<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">留言管理</span>
    </a>
    <ul class="subnav">
                        <li class="subnav-li" href="liuyan_list_yishengzhanghao.do" data-id="a3-0">
            <a href="javascript:;" class="ue-clear">
            <i class="subnav-icon"></i>
            <span class="subnav-text">我的留言查询</span></a>
        </li>
            </ul>
</li>


<li class="nav-li">
    <a href="javascript:;" class="ue-clear">
        <i class="nav-ivon"></i>
        <span class="nav-text">情感驿站帖子管理</span>
    </a>
    <ul class="subnav">
                        <li class="subnav-li" href="tiezi_list_faburen.do" data-id="a4-0">
            <a href="javascript:;" class="ue-clear">
            <i class="subnav-icon"></i>
            <span class="subnav-text">我的帖子</span></a>
        </li>
                        <li class="subnav-li" href="tiezi_add.do" data-id="a4-1">
            <a href="javascript:;" class="ue-clear">
            <i class="subnav-icon"></i>
            <span class="subnav-text">发布帖子</span></a>
        </li>
                        <li class="subnav-li" href="pinglun_list_faburen.do" data-id="a4-2">
            <a href="javascript:;" class="ue-clear">
            <i class="subnav-icon"></i>
            <span class="subnav-text">我的帖子评论</span></a>
        </li>
                        <li class="subnav-li" href="pinglun_list_pinglunren.do" data-id="a4-3">
            <a href="javascript:;" class="ue-clear">
            <i class="subnav-icon"></i>
            <span class="subnav-text">我的评论</span></a>
        </li>
            </ul>
</li>


