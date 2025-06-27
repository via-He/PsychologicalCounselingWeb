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
        <li class="layui-this">预约确认编辑预约确认:</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-input-form" action="yuyuequerenupdate.do" method="post" name="form1" id="form1">
    
                                    <input type="hidden" name="yuyueid" value="${mmm.yuyueid}"/>                                        <div class="layui-form-item">
    <label class="layui-form-label">预约编号</label>
    <div class="layui-input-block">
        
                                                    ${mmm.yuyuebianhao}<input type="hidden" id="yuyuebianhao" name="yuyuebianhao" value="${Info.html(mmm.yuyuebianhao)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">医生账号</label>
    <div class="layui-input-block">
        
                                                    ${mmm.yishengzhanghao}<input type="hidden" id="yishengzhanghao" name="yishengzhanghao" value="${Info.html(mmm.yishengzhanghao)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">医生姓名</label>
    <div class="layui-input-block">
        
                                                    ${mmm.yishengxingming}<input type="hidden" id="yishengxingming" name="yishengxingming" value="${Info.html(mmm.yishengxingming)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">预约时间</label>
    <div class="layui-input-block">
        
                                                    ${mmm.yuyueshijian}<input type="hidden" id="yuyueshijian" name="yuyueshijian" value="${Info.html(mmm.yuyueshijian)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">预约人姓名</label>
    <div class="layui-input-block">
        
                                                    ${mmm.yuyuerenxingming}<input type="hidden" id="yuyuerenxingming" name="yuyuerenxingming" value="${Info.html(mmm.yuyuerenxingming)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">联系电话</label>
    <div class="layui-input-block">
        
                                                    ${mmm.lianxidianhua}<input type="hidden" id="lianxidianhua" name="lianxidianhua" value="${Info.html(mmm.lianxidianhua)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">预约人</label>
    <div class="layui-input-block">
        
                                                    ${mmm.yuyueren}<input type="hidden" id="yuyueren" name="yuyueren" value="${Info.html(mmm.yuyueren)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">预约类型</label>
    <div class="layui-input-block">
        
                                                    ${mmm.yuyueleixing}<input type="hidden" id="yuyueleixing" name="yuyueleixing" value="${Info.html(mmm.yuyueleixing)}"/>                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">确认结果</label>
    <div class="layui-input-block">
        
                                                    <select class="layui-select class_querenjieguo26" data-value="${Info.html(mmm.querenjieguo)}" id="querenjieguo" name="querenjieguo" style="width:250px">
<option value="同意预约">同意预约</option>
<option value="不同意">不同意</option>

</select>
<script>
$(".class_querenjieguo26").val($(".class_querenjieguo26").attr("data-value"))</script>
                                            
    </div>
</div>
                                                        <div class="layui-form-item">
    <label class="layui-form-label">反馈信息</label>
    <div class="layui-input-block">
        
                                                    <textarea style="width:80%;height:150px;max-width: 90%;min-height: 120px" class="layui-textarea" placeholder="输入反馈信息" id="fankuixinxi" name="fankuixinxi">${Info.html(mmm.fankuixinxi)}</textarea>                                            
    </div>
</div>
                                                    <div class="layui-form-item">
    <label class="layui-form-label"> </label>
    <div class="layui-input-block">
        
                                            <input name="id" value="${mmm.id}" type="hidden"/>
                                                    <input name="yuyueid" value="${mmm.yuyueid}" type="hidden"/>
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
