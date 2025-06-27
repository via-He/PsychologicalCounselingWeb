<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

<div style="padding: 10px" class="admin-content">





<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">情感驿站帖子添加情感驿站帖子:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="tieziinsert.do" method="post" name="form1" id="form1">
    
                                                        <div class="layui-form-item">
    <label class="layui-form-label">标题</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入标题" style="width:250px;" data-rule-required="true" data-msg-required="请填写标题" id="biaoti" name="biaoti" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">视频</label>
    <div class="layui-input-block">
        
                                                    <div class="layui-input-group" style="width:250px">
    <input type="text" class="layui-input" id="shipin" name="shipin" value=""/>

    <span class="input-group-btn"><button type="button" class="layui-btn layui-btn-default" onclick="layer.open({type:2,title:'上传文件',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=shipin'})">
    上传文件
</button></span>
</div>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">图片</label>
    <div class="layui-input-block">
        
                                                    <div class="layui-input-group" style="width:250px">
    <input type="text" class="layui-input" id="tupian" name="tupian" value=""/>

    <span class="input-group-btn"><button type="button" class="layui-btn layui-btn-default" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=tupian'})">
    上传图片
</button></span>
</div>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">内容</label>
    <div class="layui-input-block">
        
                                                    <textarea id="neirong" name="neirong" style="max-width: 750px;width:100%; height: 300px;"></textarea><script>
            (function(){
                var um = UM.getEditor('neirong');
            })();
            </script>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">发布人</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入发布人" style="width:150px;" readonly="readonly" id="faburen" name="faburen" value="${sessionScope.username}"/>                                            
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
