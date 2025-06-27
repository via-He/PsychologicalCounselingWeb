<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>

<div style="padding: 10px" class="admin-content">





<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">轮播图编辑轮播图:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="lunbotuupdate.do" method="post" name="form1" id="form1">
    
                                                        <div class="layui-form-item">
    <label class="layui-form-label">标题</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入标题" style="width:150px;" data-rule-required="true" data-msg-required="请填写标题" id="title" name="title" value="${Info.html(mmm.title)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">图片</label>
    <div class="layui-input-block">
        
                                                    <div class="layui-input-group" style="width:250px">
    <input type="text" class="layui-input" data-rule-required="true" data-msg-required="请填写图片" id="image" name="image" value="${Info.html(mmm.image)}"/>

    <span class="input-group-btn"><button type="button" class="layui-btn layui-btn-default" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=image'})">
    上传图片
</button></span>
</div>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">连接地址</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入连接地址" style="width:250px;" data-rule-required="true" data-msg-required="请填写连接地址" id="url" name="url" value="${Info.html(mmm.url)}"/>                                            
    </div>
</div>
                                                    <div class="layui-form-item">
    <label class="layui-form-label"> </label>
    <div class="layui-input-block">
        
                                            <input name="id" value="${mmm.id}" type="hidden"/>
                                                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                        <input name="updtself" value="${updtself}" type="hidden"/>
                                                            
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
