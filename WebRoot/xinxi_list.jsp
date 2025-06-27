<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="head.jsp" %>

<div style="padding: 10px" class="admin-content">


    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">
            <span class="module-name">
                信息            </span>
                <span>查询</span>
            </li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="pa10 form-search">
                    <form class="layui-form layui-form-inline" id="formSearch" action="?">

                        <div class="layui-form-item">
                            发送人

                            <input type="text" class="layui-input" style="" name="fasongren"
                                   value="${param.fasongren}"/>
                        </div>
                        <button type="submit" class="layui-btn layui-btn-default">
                            搜索
                        </button>

                    </form>
                </div>

                <div class="list-table">
                    <table width="100%" border="1" lay-filter="table" id="tables" class="table layui-table">
                        <thead>
                        <tr align="center">
                            <th width="60" data-field="item" lay-data="{field:'item',width:60}">序号</th>
                            <th lay-data="{field:'xiaoxineirong'}"> 消息内容</th>
                            <th lay-data="{field:'fasongren'}"> 发送人</th>
                            <th lay-data="{field:'addtime'}"> 添加时间</th>

                            <th width="220" data-field="handler" lay-data="{field:'handler',width:220}">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="i" value="0"/>
                        <c:forEach items="${list}" var="map">
                            <c:set var="i" value="${i+1}"/>
                            <tr id="${map.id}" pid="">
                                <td width="30" align="center">
                                    <label>
                                            ${i}
                                    </label>
                                </td>
                                <td> ${map.xiaoxineirong} </td>
                                <td> ${map.fasongren} </td>
                                <td> ${Info.subStr(map.addtime , 19 , "")} </td>

                                <td align="center">


                                    <a href="xinxi_updt.do?id=${map.id}">编辑</a>
                                    <a href="xinxi_delete.do?id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
                                    <!--qiatnalijne-->
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                ${page.info}
            </div>
        </div>
    </div>


    <script>
        $(function () {
            layui.use('table', function () {
                var table = layui.table;
                var limit = $('#tables').find('tr').length - 1;
                // 去掉下面的注释相当于开启表格渲染
                /*
                table.init('table', {
                    height: 580, //设置高度
                    autoSort: false,
                    initSort: {
                        field: '
                ${orderby}',
                        type: '
                ${sort}'
                    },
                    limit: limit, //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
                    //支持所有基础参数.
                    done(res, curr, count){
                        $('.layui-table').addClass('table');
                        $('#list-table').show();
                    }
                });
                */
                table.on('sort(table)', function (obj) {
                    // 监听排序按钮
                    var search = $('#formSearch').serialize();
                    var sort = obj.type == null ? 'asc' : obj.type
                    var url = location.pathname + "?" + search + "&order=" + obj.field + "&sort=" + sort
                    location.href = url;
                });
            })
        })

    </script>


</div>
<%@ include file="foot.jsp" %>
