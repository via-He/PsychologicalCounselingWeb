<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.Info"%>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">





<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">预约添加预约:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="yuyueinsert.do" method="post" name="form1" id="form1">
    
                                                        <div class="layui-form-item">
    <label class="layui-form-label">预约编号</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入预约编号" style="width:150px;" readonly="readonly" id="yuyuebianhao" name="yuyuebianhao" value="${Info.getID()}"/>                                            
    </div>
</div>
                                    <input type="hidden" name="yishengxinxiid" value="${param.id}"/>                                        <div class="layui-form-item">
    <label class="layui-form-label">医生账号</label>
    <div class="layui-input-block">
        
                                                    ${readMap.yishengzhanghao}<input type="hidden" id="yishengzhanghao" name="yishengzhanghao" value="${Info.html(readMap.yishengzhanghao)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">医生姓名</label>
    <div class="layui-input-block">
        
                                                    ${readMap.yishengxingming}<input type="hidden" id="yishengxingming" name="yishengxingming" value="${Info.html(readMap.yishengxingming)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">预约类型</label>
    <div class="layui-input-block">
        
                                                    <select class="layui-select class_yuyueleixing4" data-value="在线沟通" data-rule-required="true" data-msg-required="请填写预约类型" id="yuyueleixing" name="yuyueleixing" style="width:250px">
<option value="在线沟通">在线沟通</option>
<option value="线下沟通">线下沟通</option>

</select>
<script>
$(".class_yuyueleixing4").val($(".class_yuyueleixing4").attr("data-value"))</script>
                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">预约时间</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})" style="width:200px;" data-rule-required="true" data-msg-required="请填写预约时间" id="yuyueshijian" name="yuyueshijian" readonly="readonly" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">预约人姓名</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入预约人姓名" style="width:150px;" id="yuyuerenxingming" name="yuyuerenxingming" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">联系电话</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入联系电话" style="width:150px;" id="lianxidianhua" name="lianxidianhua" value=""/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">备注</label>
    <div class="layui-input-block">
        
                                                    <textarea style="width:80%;height:150px;max-width: 90%;min-height: 120px" class="layui-textarea" placeholder="输入备注" id="beizhu" name="beizhu"></textarea>                                            
    </div>
</div>
                                                                            <div class="layui-form-item">
    <label class="layui-form-label">预约人</label>
    <div class="layui-input-block">
        
                                                    <input type="text" class="layui-input" placeholder="输入预约人" style="width:150px;" readonly="readonly" id="yuyueren" name="yuyueren" value="${sessionScope.username}"/>                                            
    </div>
</div>
                                                    <div class="layui-form-item">
    <label class="layui-form-label"> </label>
    <div class="layui-input-block">
        
                                        
                        <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                                                                 <input type="hidden" name="zhuangtai" id="zhuangtai" value="未预约"/>  
                                                                    
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
