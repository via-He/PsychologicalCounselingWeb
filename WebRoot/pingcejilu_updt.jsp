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
        <li class="layui-this">评测记录编辑评测记录:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="pingcejiluupdate.do" method="post" name="form1" id="form1">
    
                                    <input type="hidden" name="xinlicepingid" value="${mmm.xinlicepingid}"/>                                        <div class="layui-form-item">
    <label class="layui-form-label">测评主题</label>
    <div class="layui-input-block">
        
                                                    ${mmm.cepingzhuti}<input type="hidden" id="cepingzhuti" name="cepingzhuti" value="${Info.html(mmm.cepingzhuti)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">得分</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入得分" style="width:150px;" id="defen" name="defen" value="${Info.html(mmm.defen)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">答案</label>
    <div class="layui-input-block">
        
                                                    <textarea style="width:80%;height:150px;max-width: 90%;min-height: 120px" class="layui-textarea" placeholder="输入答案" id="daan" name="daan">${Info.html(mmm.daan)}</textarea>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">提交人</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入提交人" style="width:150px;" readonly="readonly" id="tijiaoren" name="tijiaoren" value="${mmm.tijiaoren}"/>                                            
    </div>
</div>
                                                                        <div class="layui-form-item">
    <label class="layui-form-label"> </label>
    <div class="layui-input-block">
        
                                            <input name="id" value="${mmm.id}" type="hidden"/>
                                                    <input name="xinlicepingid" value="${mmm.xinlicepingid}" type="hidden"/>
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
