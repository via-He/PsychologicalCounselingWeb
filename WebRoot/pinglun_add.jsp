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
        <li class="layui-this">评论添加评论:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="pingluninsert.do" method="post" name="form1" id="form1">
    
                                    <input type="hidden" name="tieziid" value="${param.id}"/>                                        <div class="layui-form-item">
    <label class="layui-form-label">标题</label>
    <div class="layui-input-block">
        
                                                    ${readMap.biaoti}<input type="hidden" id="biaoti" name="biaoti" value="${Info.html(readMap.biaoti)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">发布人</label>
    <div class="layui-input-block">
        
                                                    ${readMap.faburen}<input type="hidden" id="faburen" name="faburen" value="${Info.html(readMap.faburen)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">回复内容</label>
    <div class="layui-input-block">
        
                                                    <textarea style="width:80%;height:150px;max-width: 90%;min-height: 120px" class="layui-textarea" placeholder="输入回复内容" id="huifuneirong" name="huifuneirong"></textarea>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">评论人</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入评论人" style="width:150px;" readonly="readonly" id="pinglunren" name="pinglunren" value="${sessionScope.username}"/>                                            
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
