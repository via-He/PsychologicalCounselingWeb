<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>


<div class="layui-container" style="max-width:450px">

    <div class="panel panel-default">
        <div class="panel-heading">
            修改密码:
        </div>
        <div class="panel-body">
            <form class="layui-form" action="editPassword.do" method="post" name="form1" id="form1">

                <div class="layui-form-item">
                    <label class="layui-form-label">原密码</label>
                    <div class="layui-input-block">

                        <input type="text" class="layui-input" autocomplete="off" placeholder="请输入原密码"
                               name="oldPassword"/>

                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-block">

                        <input type="text" class="layui-input" autocomplete="off" placeholder="请输入新密码" name="newPwd"/>

                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">

                        <input type="text" class="layui-input" autocomplete="off" placeholder="请输入确认密码" name="newPwd2"/>

                    </div>
                </div>
                <div class="layui-form-item">


                    <button type="submit" class="layui-btn" name="Submit">
                        提交
                    </button>
                    <button type="reset" class="layui-btn layui-btn-default" name="Submit2">
                        重置
                    </button>

                </div>

            </form>
        </div>
    </div>

</div>


<script>
    $(function () {
        $('#form1').validate();
    });
</script>


<%@ include file="foot.jsp" %>

