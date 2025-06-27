<%@ page language="java" import="dao.CommDAO" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>

<%@page import="util.Info" %>
<%@ page import="com.alibaba.fastjson.*" %>
<%@ page import="dao.Query" %>
<%@ page import="util.Request" %>
<%

    if (request.getParameter("f") != null) {


        String json1 = request.getParameter("JSON");
        String id = request.getParameter("id");
        JSONArray json = JSON.parseArray(json1);
        JSONObject leixingdefen = JSON.parseObject(request.getParameter("leixingdefen"));


        HashMap data = new HashMap();

//        String kaoshibianhao = Info.getID();
//        data.put("kaoshibianhao", kaoshibianhao);
        data.put("tijiaoren", request.getSession().getAttribute("username"));
        data.put("addtime", Info.getDateStr());

        HashMap m = new HashMap();
        for (int i = 0; i < json.size(); i++) {
            JSONObject obj = json.getJSONObject(i);
            obj.putAll(data);
            obj.put("shitiid" , obj.get("id"));   // 错题里面记录的是那个试题的id
            obj.remove("id");

            m.putAll(obj);
            int defen = obj.getIntValue("defen");// Integer.valueOf(String.valueOf(obj.get("defen"))).intValue();
//            if (defen != -1) {
//                if (defen == 0 && request.getParameter("cuoti")==null) {
//                    Query.make("cuoti").add(m);
//                }else{
//                    if(defen > 0 && request.getParameter("cuoti")!=null){
//                        // 删除该错题
//                        Query.make("cuoti").where("shitiid" , obj.get("shitiid")).delete();
//                    }
//                }
//            }
            Query.make("pingcejilu").add(m);
        }

        HashMap jieguo = new HashMap();
        jieguo.putAll(m);


        Integer total = Integer.valueOf(request.getParameter("zongdefen"));

//        jieguo.put("kaoshibianhao", kaoshibianhao);
//        jieguo.put("danxuantidefen", leixingdefen.get("单选题"));
//        jieguo.put("duoxuantidefen", leixingdefen.get("多选题"));
        jieguo.put("zongdefen", total);
//        jieguo.put("shifoujige", total >= 60 ? "及格" : "不及格");

        HashMap jy=Query.make("pingcejianyi").where("xinlicepingid",id).where("qifenshu","<=",total).where("zhifenshu",">=",total).find();
        String zhuanyejianyi="";
        if (jy.isEmpty()){
            zhuanyejianyi="未设置该分数段建议";
        }else {

            zhuanyejianyi= String.valueOf( jy.get("jianyineirong") );
        }



        jieguo.put("zhuanyejianyi", zhuanyejianyi);

        jieguo.put("ceshizhe", request.getSession().getAttribute("username"));

//        jieguo.put("kaoshishichang", Request.get("time"));
//        jieguo.put("suoshubanji", session.getAttribute("suoshubanji"));


        long insertId = Query.make("pingcejieguo").insert(jieguo);

        out.clear();
        out.clearBuffer();
        out.println("{code:0,data:" + insertId + "}");
        out.close();
    } else {
        out.println("{code:1,msg:\"信息提交失败\"}");
        out.close();
    }
%>