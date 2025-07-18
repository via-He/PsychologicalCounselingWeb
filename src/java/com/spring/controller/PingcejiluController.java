package com.spring.controller;

import com.spring.dao.PingcejiluMapper;
import com.spring.entity.Pingcejilu;
import com.spring.service.PingcejiluService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;



import com.spring.entity.Xinliceping;
import com.spring.service.XinlicepingService;

/**
 * 评测记录 */
@Controller
public class PingcejiluController extends BaseController
{
    @Autowired
    private PingcejiluMapper dao;
    @Autowired
    private PingcejiluService service;

    @Autowired
    private XinlicepingService serviceRead;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/pingcejilu_list")
    public String list()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Pingcejilu.class); //  创建一个扩展搜索类
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
        List<Pingcejilu> list = service.selectPageExample(example , page , 12);   // 获取当前页的行数
        // 将列表写给界面使用
        assign("list" , list);
        assign("orderby" , order);  // 把当前排序结果写进前台
        assign("sort" , sort);      // 把当前排序结果写进前台
        assign("where" , where);    // 把当前条件写给前台
        return "pingcejilu_list";   // 使用视图文件：WebRoot\pingcejilu_list.jsp
    }



    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere()
    {
        String where = " ";
        // 判断URL 参数xinlicepingid是否大于0
        if( Request.getInt("xinlicepingid") > 0 ) {
            // 大于0 则写入条件
            where += " AND xinlicepingid='"+Request.getInt("xinlicepingid")+"' ";
        }
        // 以下是判断搜索框中是否有输入内容，判断是否前台是否有填写相关条件，符合则写入sql搜索语句
            if(!Request.get("cepingzhuti").equals("")) {
            where += " AND cepingzhuti LIKE '%"+Request.get("cepingzhuti")+"%' ";
        }
            return where;
    }

    /**
     * 提交人列表
     */
    @RequestMapping("/pingcejilu_list_tijiaoren")
    public String listtijiaoren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Pingcejilu.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：提交人=当前登录用户
        String where = " tijiaoren='"+session.getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Pingcejilu> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "pingcejilu_list_tijiaoren";
    }




        @RequestMapping("/pingcejilu_add")
    public String add()
    {
        int id = Request.getInt("id");  // 根据id 获取 心理测评模块中的数据
        Xinliceping readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        request.setAttribute("readMap" , readMap);
        return "pingcejilu_add";
    }



    @RequestMapping("/pingcejilu_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Pingcejilu mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "pingcejilu_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/pingcejiluinsert")
    public String insert()
    {
        String tmp="";
        Pingcejilu post = new Pingcejilu();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setXinlicepingid(Request.getInt("xinlicepingid"));

        post.setCepingzhuti(Request.get("cepingzhuti"));

        post.setDefen(Request.get("defen"));

        post.setDaan(Request.get("daan"));

        post.setTijiaoren(Request.get("tijiaoren"));

        post.setZimu(Request.get("zimu"));

    post.setAddtime(Info.getDateStr());

        post.setXinlicepingid(Request.getInt("xinlicepingid"));

        
                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/pingcejiluupdate")
    public String update()
    {
        // 创建实体类
        Pingcejilu post = new Pingcejilu();
        // 将前台表单数据填充到实体类
        if(!Request.get("xinlicepingid").equals(""))
        post.setXinlicepingid(Request.getInt("xinlicepingid"));
            if(!Request.get("cepingzhuti").equals(""))
        post.setCepingzhuti(Request.get("cepingzhuti"));
                if(!Request.get("defen").equals(""))
        post.setDefen(Request.get("defen"));
                if(!Request.get("daan").equals(""))
        post.setDaan(Request.get("daan"));
                if(!Request.get("tijiaoren").equals(""))
        post.setTijiaoren(Request.get("tijiaoren"));
                if(!Request.get("zimu").equals(""))
        post.setZimu(Request.get("zimu"));
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
    @RequestMapping("/pingcejilu_delete")
    public String delete()
    {
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("pingcejilu").find(id);

                service.delete(id);// 根据id 删除某行数据
                return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
