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
        <li class="layui-this">用户添加用户:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="yonghuinsert.do" method="post" name="form1" id="form1">
    
                                                        <div class="layui-form-item">
    <label class="layui-form-label">权限</label>
    <div class="layui-input-block">
        
                                                    <select class="layui-select class_cx2" data-value="" id="cx" name="cx" style="width:250px">
<option value="管理员">管理员</option>
<option value="学生">学生</option>
<option value="医生">医生</option>
<option value="白领">白领</option>

</select>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">帐号</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入帐号" style="width:150px;" data-rule-required="true" data-msg-required="请填写帐号" remote="checkno.do?checktype=insert&table=yonghu&col=username" data-msg-remote="内容重复了" id="username" name="username" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
        
                                                    <input type="password" class="layui-input" placeholder="输入密码" style="width:150px;" data-rule-required="true" data-msg-required="请填写密码" id="pwd" name="pwd" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入姓名" style="width:150px;" data-rule-required="true" data-msg-required="请填写姓名" id="xingming" name="xingming" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
        
                                                    <select class="layui-select class_xingbie3" data-value="" data-rule-required="true" data-msg-required="请填写性别" id="xingbie" name="xingbie" style="width:250px">
<option value="男">男</option>
<option value="女">女</option>

</select>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">手机</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入手机" style="width:150px;" data-rule-required="true" data-msg-required="请填写手机" phone="true" data-msg-phone="请输入正确手机号码" id="shouji" name="shouji" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">头像</label>
    <div class="layui-input-block">
        
                                                    <div class="layui-input-group" style="width:250px">
    <input type="text" class="layui-input" data-rule-required="true" data-msg-required="请填写头像" id="touxiang" name="touxiang" value=""/>

    <span class="input-group-btn"><button type="button" class="layui-btn layui-btn-default" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=touxiang'})">
    上传图片
</button></span>
</div>                                            
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
