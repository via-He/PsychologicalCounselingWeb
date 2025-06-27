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
        <li class="layui-this">医生信息添加医生信息:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="yishengxinxiinsert.do" method="post" name="form1" id="form1">
    
                                                        <div class="layui-form-item">
    <label class="layui-form-label">医生账号</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入医生账号" style="width:150px;" readonly="readonly" id="yishengzhanghao" name="yishengzhanghao" value="${sessionScope.username}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">医生姓名</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入医生姓名" style="width:150px;" data-rule-required="true" data-msg-required="请填写医生姓名" id="yishengxingming" name="yishengxingming" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">医生照片</label>
    <div class="layui-input-block">
        
                                                    <div class="layui-input-group" style="width:250px">
    <input type="text" class="layui-input" data-rule-required="true" data-msg-required="请填写医生照片" id="yishengzhaopian" name="yishengzhaopian" value=""/>

    <span class="input-group-btn"><button type="button" class="layui-btn layui-btn-default" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=yishengzhaopian'})">
    上传图片
</button></span>
</div>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
        
                                                    <select class="layui-select class_xingbie20" data-value="" data-rule-required="true" data-msg-required="请填写性别" id="xingbie" name="xingbie" style="width:250px">
<option value="男">男</option>
<option value="女">女</option>

</select>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">从医时间</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入从医时间" style="width:150px;" id="congyishijian" name="congyishijian" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">医生简介</label>
    <div class="layui-input-block">
        
                                                    <textarea style="width:80%;height:150px;max-width: 90%;min-height: 120px" class="layui-textarea" placeholder="输入医生简介" id="yishengjianjie" name="yishengjianjie"></textarea>                                            
    </div>
</div>
                                                    <div class="layui-form-item">
    <label class="layui-form-label"> </label>
    <div class="layui-input-block">
        
                                                                                                                                        <input type="hidden" name="issh" value="否"/>
                                                                    
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
