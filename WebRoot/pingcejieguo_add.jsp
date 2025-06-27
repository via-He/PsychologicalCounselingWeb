<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

<div style="padding: 10px" class="admin-content">





<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">评测结果添加评测结果:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="pingcejieguoinsert.do" method="post" name="form1" id="form1">
    
                                    <input type="hidden" name="xinlicepingid" value="${param.id}"/>                                        <div class="layui-form-item">
    <label class="layui-form-label">测评主题</label>
    <div class="layui-input-block">
        
                                                    ${readMap.cepingzhuti}<input type="hidden" id="cepingzhuti" name="cepingzhuti" value="${Info.html(readMap.cepingzhuti)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">总得分</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入总得分" style="width:150px;" id="zongdefen" name="zongdefen" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">专业建议</label>
    <div class="layui-input-block">
        
                                                    <textarea id="zhuanyejianyi" name="zhuanyejianyi" style="max-width: 750px;width:100%; height: 300px;"></textarea><script>
            (function(){
                var um = UM.getEditor('zhuanyejianyi');
            })();
            </script>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">测试者</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入测试者" style="width:150px;" readonly="readonly" id="ceshizhe" name="ceshizhe" value="${sessionScope.username}"/>                                            
    </div>
</div>
                                                    <div class="layui-form-item">
    <label class="layui-form-label"> </label>
    <div class="layui-input-block">
        
                                        
                        <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                                                                                                                                    
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
