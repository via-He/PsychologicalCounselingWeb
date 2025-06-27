<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">


    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">题目编辑题目:</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <form class="layui-form layui-input-form" action="timuupdate.do" method="post" name="form1" id="form1">

                    <input type="hidden" name="xinlicepingid" value="${mmm.xinlicepingid}"/>
                    <div class="layui-form-item">
                        <label class="layui-form-label">测评主题</label>
                        <div class="layui-input-block">

                            ${mmm.cepingzhuti}<input type="hidden" id="cepingzhuti" name="cepingzhuti"
                                                     value="${Info.html(mmm.cepingzhuti)}"/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">编号</label>
                        <div class="layui-input-block">

                            <input type="text" class="layui-input" placeholder="输入编号" style="width:150px;"
                                   readonly="readonly" id="bianhao" name="bianhao" value="${Info.html(mmm.bianhao)}"/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">题目</label>
                        <div class="layui-input-block">

                            <textarea style="width:80%;height:150px;max-width: 90%;min-height: 120px"
                                      class="layui-textarea" placeholder="输入题目" id="timu"
                                      name="timu">${Info.html(mmm.timu)}</textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型</label>
                        <div class="layui-input-block">

                            <select class="layui-select class_leixing11" data-value="${Info.html(mmm.leixing)}"
                                    id="leixing" name="leixing" style="width:250px">
                                <option value="单选题">单选题</option>
                                <option value="多选题">多选题</option>

                            </select>
                            <script>
                                $(".class_leixing11").val($(".class_leixing11").attr("data-value"))</script>

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">答案</label>
                        <div class="layui-input-block">

                            <div id="TypeFieldabc">
                                <div style="border: 1px solid #ededed; border-radius: 5px; padding: 10px; background: #F2F2F2;">
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th width="80"> </th>
                                            <th>答案</th>
                                            <!--<th width="80">跳转序号</th>-->
                                            <th width="60">得分</th>
                                        </tr>
                                        </thead>
                                        <tbody id="field_box">

                                        </tbody>
                                    </table>
                                </div>
                                <button type="button" class="btn btn-default btn-sm" id="add_btn">增加答案</button>
                            </div>
                            <input type="hidden" id="daan" name="daan"/>
                            <script>
                                function selectType(obj) {
                                    var v = $(obj).val();
                                    if (v == '单选题' || v == '多选题') {
                                        $('#TypeFieldabc').show();
                                    } else {
                                        $('#TypeFieldabc').hide();
                                    }
                                }

                                function updateZimu() {
                                    var zimu = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                                    var index = $("#field_box").find("tr").each(function (index) {
                                        $(this).find('td:eq(0)').find('input').val(zimu.substr(index, 1));
                                    });
                                }

                                function addFieldItem(wx) {
                                    wx = wx || {};
                                    var str = [];
                                    str.push('<tr><td align="center" valign="middle">');
                                    str.push('<input type="text" readonly="readonly" style="width: 40px;" data-id="zimu" class="form-control" value="" />');
                                    str.push('</td><td>');
                                    str.push('<input type="text" style="width:100%" onblur="updateData()" data-id="title" class="form-control" value="' + (wx.title || '') + '" />');
                                    str.push('</td><td>');

                                    str.push('<input type="number" step="1" style="width: 60px;" onblur="updateData()" data-id="point" class="form-control" value="' + (wx.point || '0') + '" />');
                                    str.push('</td><td>');

                                    str.push('<button onclick="delItem(this);" type="button" class="btn btn-default">删除</button>');
                                    str.push('</td></tr>');
                                    var html = str.join('');
                                    $('#field_box').append(html);
                                    updateZimu();
                                }

                                function delItem(obj) {
                                    if (confirm('此操作将不可恢复，您确定删除？')) {
                                        $(obj).parent().parent().remove();
                                    }
                                    updateZimu();
                                }

                                $(function () {
                                    var __fields = ${mmm.daan};
                                    if (__fields.length > 0) {
                                        $.each(__fields, function () {
                                            addFieldItem(this);
                                        });
                                    } else {
                                        addFieldItem();
                                    }
                                });

                                function updateData() {
                                    var result = [];
                                    $('#field_box').find('tr').each(function () {
                                        var obj = {};
                                        $(this).find('[data-id]').each(function () {
                                            if ($(this).attr('type') == 'checkbox') {
                                                obj[$(this).attr('data-id')] = $(this).attr('checked')
                                            } else {
                                                obj[$(this).attr('data-id')] = $.trim($(this).val());
                                            }
                                        });
                                        if (obj.title != '' && obj.point != '') {
                                            result.push(obj);
                                        }
                                    });
                                    $('#daan').val(JSON.stringify(result));
                                }

                                $('#TypeFieldabc').on('input,checkbox', 'blur,change', function (e) {
                                    console.log(e);
                                })

                                $('#add_btn').click(addFieldItem);
                                $('#form1').submit(function () {
                                    updateData();
                                    return true;
                                })

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
