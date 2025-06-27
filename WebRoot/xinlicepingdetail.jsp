<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>


<div>


    <div class="layui-container">


        <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
            <h3 class="section-title">
                心理评测详情 </h3>
            <div class="sidebar-widget-body">


                <div class="">
                    <div class="goods-info clearfix">
                        <div class="gallery-list">
                            <div class="swiper-container gallery-top" id="shangpin-galler">
                                <div class="swiper-wrapper">
                                </div>
                            </div>

                        </div>
                        <div class="goods-right-content">
                            <h3 class="title">${map.cepingzhuti}</h3>
                            <div class="descount">
                                <div>
                        <span class="name">
                            添加时间：
                        </span>
                                    <span class="val">
                                        ${map.addtime} </span>
                                </div>
                                <div>
                        <span class="name">
                            测评介绍：
                        </span>
                                    <span class="val">
                                        ${map.cepingjieshao} </span>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="goods-content">
                    </div>

                    <script>
                        (function () {
                            var images = "${map.tupian}".split(",");
                            if (images.length > 0) {
                                for (var i = 0; i < images.length; i++) {
                                    var path = images[i]
                                    var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url(' + path + ')"></div></div></div>';
                                    $('#shangpin-galler .swiper-wrapper').append(src);
                                    $('#shangpin-thumb .swiper-wrapper').append(src);
                                }

                                var thumbsSwiper = new Swiper('#shangpin-thumb', {
                                    spaceBetween: 10,
                                    slidesPerView: 4,
                                    watchSlidesVisibility: true,//防止不可点击
                                })
                                var gallerySwiper = new Swiper('#shangpin-galler', {
                                    spaceBetween: 10,
                                    thumbs: {
                                        swiper: thumbsSwiper,
                                    }
                                })
                            }

                        })();

                    </script>

                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


    </div>


</div>
<div>


    <div class="layui-container">


        <div class="title-modelbox-widget" style="margin:10px 0px 10px 0px;background-color:#FFFFFF">
            <h3 class="section-title">
                开始评测 </h3>
            <div class="sidebar-widget-body">


                <div class="gr-control-base-text">


                    <!-- 开始代码开始 -->
                    <link rel="stylesheet" href="js/layer/theme/default/layer.css">
                    <script src="js/layer/layer.js"></script>
                    <script src="js/paper.js"></script>
                    <style>
                        #zhangjielianxi {
                            padding: 20px;
                            background: #f2f2f2;
                        }

                        #zhangjielianxi div {
                            padding: 20px;
                        }

                        #zhangjielianxi div h3 {
                            margin-bottom: 8px;
                        }
                        .shuxiang #zhangjielianxi .daan label{
                            display: block;
                        }
                        .tiku-message-zhengque,.tiku-message-jiexi{
                            padding: 10px;
                            padding-left: 100px;
                            margin-top: 10px;
                            background: #cdcdcd;

                            display: none;
                        }
                        .tiku-message-zhengque:before{
                            content: '正确答案：';
                            display: inline;
                            float: left;
                        }
                        .tiku-message-jiexi:before{
                            content: "解析：";
                            display: inline;
                            float: left;
                        }
                    </style>

                    <%

                        HashMap map=Query.make("xinliceping").where("id",request.getParameter("id")).find();
                        // LIMIT 题目数
                        List<HashMap> wenda = Query.make("timu").where("xinlicepingid",map.get("id")).where("leixing" ,"单选题").order("rand()").limit(5).select();
                        wenda.addAll(Query.make("timu").where("xinlicepingid",map.get("id")).where("leixing" ,"多选题").order("rand()").limit(5).select());
                    %>
                    <div id="shijuan"></div>
                    <script>
                        window.isKaoshi = false;
                        (function (){

                            new paper('#shijuan' , {
                                list:<%=JSONArray.toJSONString(wenda)%>,
                                daan:'daan',//设置答案字段
                                leixing:'leixing', // 设置类型字段
                                danxuanti:'单选题',  // 设置单选类型
                                duoxuanti:'多选题',  // 设置多选类型
                                biaoti:'timu',    // 设置标题字段
                                isShuxiang:true, // false 横向摆放、true 一行一个选项
                                // jiexi:'daanjieshi', // 设置解析字段 没有就去掉
                                // zhengquedaan:'zhengquedaan', // 设置正确答案字段
                                <%--kaoshishichang: <%= map.get("kaoshishizhang") %>, // 设置考试时长，没有则去掉--%>
                                isRequired:true, // 是否所有的题目都要选择后才可以提交
                                submit:function (result,zongdefen,leixingdefen,time){
                                    var index = layer.load(0, {
                                        shade: [0.5, '#000'] //0.1透明度的白色背景
                                    });
                                    //设置提交考试结果地址
                                    $.post("jiaojuan_insert.jsp?f=f", {
                                        JSON: JSON.stringify(result),
                                        zongdefen:zongdefen,
                                        leixingdefen:JSON.stringify(leixingdefen),
                                        time:time,
                                        id:<%=request.getParameter("id")%>
                                    }, function (res) {
                                        layer.close(index);
                                        var re = eval("(" + res + ")");
                                        if (re.code == 0) {
                                            layer.alert("提交成功", function () {
                                                window.isKaoshi = false;
                                                //设置提交完成后跳转地址
                                                location.href = 'pingcejieguodetail.do?id=' +re.data;
                                            });
                                        } else {
                                            layer.alert(re.msg);
                                        }

                                    });
                                }
                            });
                            window.addEventListener('beforeunload', function (e) {
                                if (window.isKaoshi) {
                                    var confirmationMessage = '你当前正在考试，确定离开？';
                                    (e || window.event).returnValue = confirmationMessage; // 兼容 Gecko + IE
                                    return confirmationMessage; // 兼容 Gecko + Webkit, Safari, Chrome
                                }
                            })
                        })();
                    </script>
                    <!-- 开始代码结束 -->



                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


    </div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>