package com.spring.controller;

import com.spring.dao.YishengxinxiMapper;
import com.spring.entity.Yishengxinxi;
import com.spring.service.YishengxinxiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;




/**
 * 医生信息 */
@Controller
public class YishengxinxiController extends BaseController
{
    @Autowired
    private YishengxinxiMapper dao;
    @Autowired
    private YishengxinxiService service;


    /**
     *  后台列表页
     *
     */
    @RequestMapping("/yishengxinxi_list")
    public String list()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Yishengxinxi.class); //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();          // 创建一个扩展搜索条件类
        String where = " 1=1 ";   // 创建初始条件为：1=1
        where += getWhere();      // 从方法中获取url 上的参数，并写成 sql条件语句
        criteria.andCondition(where);   // 将条件写进上面的扩展条件类中
        if(sort.equals("desc")){        // 判断前台提交的sort 参数是否等于  desc倒序  是则使用倒序，否则使用正序
            example.orderBy(order).desc();  // 把sql 语句设置成倒序
        }else{
            example.orderBy(order).asc();   // 把 sql 设置成正序
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));  // 获取前台提交的URL参数 page  如果没有则设置为1
        page = Math.max(1 , page);  // 取两个数的最大值，防止page 小于1
        List<Yishengxinxi> list = service.selectPageExample(example , page , 12);   // 获取当前页的行数
        // 将列表写给界面使用
        assign("list" , list);
        assign("orderby" , order);  // 把当前排序结果写进前台
        assign("sort" , sort);      // 把当前排序结果写进前台
        assign("where" , where);    // 把当前条件写给前台
        return "yishengxinxi_list";   // 使用视图文件：WebRoot\yishengxinxi_list.jsp
    }



    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere()
    {
        String where = " ";
        // 以下是判断搜索框中是否有输入内容，判断是否前台是否有填写相关条件，符合则写入sql搜索语句
            if(!Request.get("yishengzhanghao").equals("")) {
            where += " AND yishengzhanghao LIKE '%"+Request.get("yishengzhanghao")+"%' ";
        }
                if(!Request.get("yishengxingming").equals("")) {
            where += " AND yishengxingming LIKE '%"+Request.get("yishengxingming")+"%' ";
        }
                if(!Request.get("xingbie").equals("")) {
            where += " AND xingbie ='"+Request.get("xingbie")+"' ";
        }
            return where;
    }

    /**
     * 医生账号列表
     */
    @RequestMapping("/yishengxinxi_list_yishengzhanghao")
    public String listyishengzhanghao()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Yishengxinxi.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：医生账号=当前登录用户
        String where = " yishengzhanghao='"+session.getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Yishengxinxi> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "yishengxinxi_list_yishengzhanghao";
    }


    /**
    *  前台列表页
    *
    */
    @RequestMapping("/yishengxinxilist")
    public String index()
    {
        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Yishengxinxi.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " 1=1 ";
        where += " AND issh='是' ";
        where += getWhere();
        criteria.andCondition(where);
        if(sort.equals("desc")){
            example.orderBy(order).desc();
        }else{
            example.orderBy(order).asc();
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1 , page);
            List<Yishengxinxi> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
        request.setAttribute("where" , where);
        assign("orderby" , order);
        assign("sort" , sort);
        return "yishengxinxilist";
    }


        @RequestMapping("/yishengxinxi_add")
    public String add()
    {
        return "yishengxinxi_add";
    }



    @RequestMapping("/yishengxinxi_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Yishengxinxi mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "yishengxinxi_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/yishengxinxiinsert")
    public String insert()
    {
        String tmp="";
        Yishengxinxi post = new Yishengxinxi();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setYishengzhanghao(Request.get("yishengzhanghao"));

        post.setYishengxingming(Request.get("yishengxingming"));

        post.setYishengzhaopian(Request.get("yishengzhaopian"));

        post.setXingbie(Request.get("xingbie"));

        post.setCongyishijian(Request.get("congyishijian"));

        post.setYishengjianjie(Request.get("yishengjianjie"));

    post.setAddtime(Info.getDateStr());

        post.setIssh(Request.get("issh" , "否"));

        
                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/yishengxinxiupdate")
    public String update()
    {
        // 创建实体类
        Yishengxinxi post = new Yishengxinxi();
        // 将前台表单数据填充到实体类
        if(!Request.get("yishengzhanghao").equals(""))
        post.setYishengzhanghao(Request.get("yishengzhanghao"));
                if(!Request.get("yishengxingming").equals(""))
        post.setYishengxingming(Request.get("yishengxingming"));
                if(!Request.get("yishengzhaopian").equals(""))
        post.setYishengzhaopian(Request.get("yishengzhaopian"));
                if(!Request.get("xingbie").equals(""))
        post.setXingbie(Request.get("xingbie"));
                if(!Request.get("congyishijian").equals(""))
        post.setCongyishijian(Request.get("congyishijian"));
                if(!Request.get("yishengjianjie").equals(""))
        post.setYishengjianjie(Request.get("yishengjianjie"));
                if(!Request.get("addtime").equals(""))
        post.setAddtime(Request.get("addtime"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
                        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
    /**
     *  后台详情
     */
    @RequestMapping("/yishengxinxi_detail")
    public String detail()
    {
        int id = Request.getInt("id");
        Yishengxinxi map = service.find(id);  // 根据前台url 参数中的id获取行数据
        request.setAttribute("map" , map);  // 把数据写到前台
        return "yishengxinxi_detail";  // 详情页面：WebRoot\yishengxinxi_detail.jsp
    }
    /**
     *  前台详情
     */
    @RequestMapping("/yishengxinxidetail")
    public String detailweb()
    {
        int id = Request.getInt("id");
        Yishengxinxi map = service.find(id);
        

        request.setAttribute("map" , map);
        return "yishengxinxidetail";    // 前台详情页面：WebRoot\yishengxinxidetail.jsp
    }
        /**
    *  删除
    */
    @RequestMapping("/yishengxinxi_delete")
    public String delete()
    {
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("yishengxinxi").find(id);

                service.delete(id);// 根据id 删除某行数据
                return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
