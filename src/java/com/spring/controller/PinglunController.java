package com.spring.controller;

import com.spring.dao.PinglunMapper;
import com.spring.entity.Pinglun;
import com.spring.service.PinglunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;



import com.spring.entity.Tiezi;
import com.spring.service.TieziService;

/**
 * 评论 */
@Controller
public class PinglunController extends BaseController
{
    @Autowired
    private PinglunMapper dao;
    @Autowired
    private PinglunService service;

    @Autowired
    private TieziService serviceRead;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/pinglun_list")
    public String list()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Pinglun.class); //  创建一个扩展搜索类
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
        List<Pinglun> list = service.selectPageExample(example , page , 12);   // 获取当前页的行数
        // 将列表写给界面使用
        assign("list" , list);
        assign("orderby" , order);  // 把当前排序结果写进前台
        assign("sort" , sort);      // 把当前排序结果写进前台
        assign("where" , where);    // 把当前条件写给前台
        return "pinglun_list";   // 使用视图文件：WebRoot\pinglun_list.jsp
    }



    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere()
    {
        String where = " ";
        // 判断URL 参数tieziid是否大于0
        if( Request.getInt("tieziid") > 0 ) {
            // 大于0 则写入条件
            where += " AND tieziid='"+Request.getInt("tieziid")+"' ";
        }
        // 以下是判断搜索框中是否有输入内容，判断是否前台是否有填写相关条件，符合则写入sql搜索语句
            if(!Request.get("biaoti").equals("")) {
            where += " AND biaoti LIKE '%"+Request.get("biaoti")+"%' ";
        }
                if(!Request.get("huifuneirong").equals("")) {
            where += " AND huifuneirong LIKE '%"+Request.get("huifuneirong")+"%' ";
        }
                if(!Request.get("pinglunren").equals("")) {
            where += " AND pinglunren LIKE '%"+Request.get("pinglunren")+"%' ";
        }
            return where;
    }

    /**
     * 发布人列表
     */
    @RequestMapping("/pinglun_list_faburen")
    public String listfaburen()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Pinglun.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：发布人=当前登录用户
        String where = " faburen='"+session.getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Pinglun> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "pinglun_list_faburen";
    }
    /**
     * 评论人列表
     */
    @RequestMapping("/pinglun_list_pinglunren")
    public String listpinglunren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Pinglun.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：评论人=当前登录用户
        String where = " pinglunren='"+session.getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Pinglun> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "pinglun_list_pinglunren";
    }




        @RequestMapping("/pinglun_add")
    public String add()
    {
        int id = Request.getInt("id");  // 根据id 获取 情感驿站帖子模块中的数据
        Tiezi readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        request.setAttribute("readMap" , readMap);
        return "pinglun_add";
    }

    @RequestMapping("/pinglunadd")
    public String addWeb()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./");
        }
        int id = Request.getInt("id"); // 根据id 获取 情感驿站帖子模块中的数据
        Tiezi readMap = serviceRead.find(id);
        request.setAttribute("readMap" , readMap);
        return "pinglunadd";
    }


    @RequestMapping("/pinglun_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Pinglun mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "pinglun_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/pingluninsert")
    public String insert()
    {
        String tmp="";
        Pinglun post = new Pinglun();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setTieziid(Request.getInt("tieziid"));

        post.setBiaoti(Request.get("biaoti"));

        post.setFaburen(Request.get("faburen"));

        post.setHuifuneirong(Request.get("huifuneirong"));

        post.setPinglunren(Request.get("pinglunren"));

    post.setAddtime(Info.getDateStr());

        post.setTieziid(Request.getInt("tieziid"));

        
                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/pinglunupdate")
    public String update()
    {
        // 创建实体类
        Pinglun post = new Pinglun();
        // 将前台表单数据填充到实体类
        if(!Request.get("tieziid").equals(""))
        post.setTieziid(Request.getInt("tieziid"));
            if(!Request.get("biaoti").equals(""))
        post.setBiaoti(Request.get("biaoti"));
                if(!Request.get("faburen").equals(""))
        post.setFaburen(Request.get("faburen"));
                if(!Request.get("huifuneirong").equals(""))
        post.setHuifuneirong(Request.get("huifuneirong"));
                if(!Request.get("pinglunren").equals(""))
        post.setPinglunren(Request.get("pinglunren"));
                if(!Request.get("addtime").equals(""))
        post.setAddtime(Request.get("addtime"));
        
        post.setId(Request.getInt("id"));
                service.update(post); // 更新数据
        int charuid = post.getId().intValue();
                        return showSuccess("保存成功" , Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }
        /**
    *  删除
    */
    @RequestMapping("/pinglun_delete")
    public String delete()
    {
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("pinglun").find(id);

                service.delete(id);// 根据id 删除某行数据
                return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
