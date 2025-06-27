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
        <li class="layui-this">文章编辑文章:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="wenzhangupdate.do" method="post" name="form1" id="form1">
    
                                                        <div class="layui-form-item">
    <label class="layui-form-label">文章标题</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入文章标题" style="width:250px;" data-rule-required="true" data-msg-required="请填写文章标题" id="wenzhangbiaoti" name="wenzhangbiaoti" value="${Info.html(mmm.wenzhangbiaoti)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">图片</label>
    <div class="layui-input-block">
        
                                                    <div class="layui-input-group" style="width:250px">
    <input type="text" class="layui-input" data-rule-required="true" data-msg-required="请填写图片" id="tupian" name="tupian" value="${Info.html(mmm.tupian)}"/>

    <span class="input-group-btn"><button type="button" class="layui-btn layui-btn-default" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=tupian'})">
    上传图片
</button></span>
</div>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">视频</label>
    <div class="layui-input-block">
        
                                                    <div class="layui-input-group" style="width:250px">
    <input type="text" class="layui-input" id="shipin" name="shipin" value="${Info.html(mmm.shipin)}"/>

    <span class="input-group-btn"><button type="button" class="layui-btn layui-btn-default" onclick="layer.open({type:2,title:'上传文件',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=shipin'})">
    上传文件
</button></span>
</div>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">分类</label>
    <div class="layui-input-block">
        
                                                    <select class="layui-select class_fenlei29" data-value="${Info.html(mmm.fenlei)}" data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei" style="width:250px">
<ssm:sql var="select" type="select">SELECT * FROM wenzhangfenlei ORDER BY id desc</ssm:sql>
<c:forEach items="${select}" var="m">
<option value="${m.id}">${m.fenleimingcheng}</option>
</c:forEach>

</select>
<script>
$(".class_fenlei29").val($(".class_fenlei29").attr("data-value"))</script>
                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">发布人</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入发布人" style="width:150px;" id="faburen" name="faburen" value="${Info.html(mmm.faburen)}"/>                                            
    </div>
</div>
                                                                            <div class="layui-form-item">
    <label class="layui-form-label">文章内容</label>
    <div class="layui-input-block">
        
                                                    <textarea id="wenzhangneirong" name="wenzhangneirong" style="max-width: 750px;width:100%; height: 300px;">${Info.html(mmm.wenzhangneirong)}</textarea><script>
            (function(){
                var um = UM.getEditor('wenzhangneirong');
            })();
            </script>                                            
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
