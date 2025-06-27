<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">





<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">文章分类添加文章分类:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="wenzhangfenleiinsert.do" method="post" name="form1" id="form1">
    
                                                        <div class="layui-form-item">
    <label class="layui-form-label">分类名称</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入分类名称" style="width:250px;" data-rule-required="true" data-msg-required="请填写分类名称" remote="checkno.do?checktype=insert&table=wenzhangfenlei&col=fenleimingcheng" data-msg-remote="内容重复了" id="fenleimingcheng" name="fenleimingcheng" value=""/>                                            
    </div>
</div>
                                <div class="layui-form-item">
    <label class="layui-form-label"> </label>
    <div class="layui-input-block">
        
                                                                                                                                                        
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
</div>




<script>
    $(function () {
        $('#form1').validate();
    });
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(form1)', function(data){
            //layer.msg(JSON.stringify(data.field));
            return true;
        });
    });
</script>



</div>
<%@ include file="foot.jsp" %>
