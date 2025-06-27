<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
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
            <li class="layui-this">评测建议编辑评测建议:</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <form class="layui-form layui-input-form" action="pingcejianyiupdate.do" method="post" name="form1"
                      id="form1">

<%--                    <input type="hidden" name="xinlicepingid" value="${mmm.xinlicepingid}"/>--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label">测评主题</label>
                        <div class="layui-input-block">

                            ${mmm.cepingzhuti}<input type="hidden" id="cepingzhuti" name="cepingzhuti"
                                                     value="${Info.html(mmm.cepingzhuti)}"/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">起分数</label>
                        <div class="layui-input-block">

                            <input type="number" class="layui-input" placeholder="输入起分数" style="width:150px;"
                                   data-rule-required="true" data-msg-required="请填写起分数" number="true"
                                   data-msg-number="输入一个有效数字" id="qifenshu" name="qifenshu"
                                   value="${Info.html(mmm.qifenshu)}"/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">止分数</label>
                        <div class="layui-input-block">

                            <input type="number" class="layui-input" placeholder="输入止分数" style="width:150px;"
                                   data-rule-required="true" data-msg-required="请填写止分数" number="true"
                                   data-msg-number="输入一个有效数字" id="zhifenshu" name="zhifenshu"
                                   value="${Info.html(mmm.zhifenshu)}"/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">建议内容</label>
                        <div class="layui-input-block">

                            <textarea id="jianyineirong" name="jianyineirong"
                                      style="max-width: 750px;width:100%; height: 300px;">${Info.html(mmm.jianyineirong)}</textarea>
                            <script>
                                (function () {
                                    var um = UM.getEditor('jianyineirong');
                                })();
                            </script>
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
        layui.use('form', function () {
            var form = layui.form;

            //监听提交
            form.on('submit(form1)', function (data) {
                //layer.msg(JSON.stringify(data.field));
                return true;
            });
        });
    </script>


</div>
<%@ include file="foot.jsp" %>
