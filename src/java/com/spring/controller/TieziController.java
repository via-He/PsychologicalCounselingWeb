package com.spring.controller;

import com.spring.dao.TieziMapper;
import com.spring.entity.Tiezi;
import com.spring.service.TieziService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;




/**
 * 情感驿站帖子 */
@Controller
public class TieziController extends BaseController
{
    @Autowired
    private TieziMapper dao;
    @Autowired
    private TieziService service;


    /**
     *  后台列表页
     *
     */
    @RequestMapping("/tiezi_list")
    public String list()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Tiezi.class); //  创建一个扩展搜索类
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
        List<Tiezi> list = service.selectPageExample(example , page , 12);   // 获取当前页的行数
        // 将列表写给界面使用
        assign("list" , list);
        assign("orderby" , order);  // 把当前排序结果写进前台
        assign("sort" , sort);      // 把当前排序结果写进前台
        assign("where" , where);    // 把当前条件写给前台
        return "tiezi_list";   // 使用视图文件：WebRoot\tiezi_list.jsp
    }



    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere()
    {
        String where = " ";
        // 以下是判断搜索框中是否有输入内容，判断是否前台是否有填写相关条件，符合则写入sql搜索语句
            if(!Request.get("biaoti").equals("")) {
            where += " AND biaoti LIKE '%"+Request.get("biaoti")+"%' ";
        }
            return where;
    }

    /**
     * 发布人列表
     */
    @RequestMapping("/tiezi_list_faburen")
    public String listfaburen()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Tiezi.class);  //  创建一个扩展搜索类
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

            List<Tiezi> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "tiezi_list_faburen";
    }


    /**
    *  前台列表页
    *
    */
    @RequestMapping("/tiezilist")
    public String index()
    {
        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Tiezi.class);
        Example.Criteria criteria = example.createCriteria();
        String where = " 1=1 ";
        where += getWhere();
        criteria.andCondition(where);
        if(sort.equals("desc")){
            example.orderBy(order).desc();
        }else{
            example.orderBy(order).asc();
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));
        page = Math.max(1 , page);
            List<Tiezi> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
        request.setAttribute("where" , where);
        assign("orderby" , order);
        assign("sort" , sort);
        return "tiezilist";
    }


        @RequestMapping("/tiezi_add")
    public String add()
    {
        return "tiezi_add";
    }

    @RequestMapping("/tieziadd")
    public String addWeb()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./");
        }
        return "tieziadd";
    }


    @RequestMapping("/tiezi_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Tiezi mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "tiezi_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/tieziinsert")
    public String insert()
    {
        String tmp="";
        Tiezi post = new Tiezi();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setBiaoti(Request.get("biaoti"));

        post.setShipin(Request.get("shipin"));

        post.setTupian(Request.get("tupian"));

        post.setNeirong(util.DownloadRemoteImage.run(Request.get("neirong")));

        post.setFaburen(Request.get("faburen"));

    post.setAddtime(Info.getDateStr());


        
                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/tieziupdate")
    public String update()
    {
        // 创建实体类
        Tiezi post = new Tiezi();
        // 将前台表单数据填充到实体类
        if(!Request.get("biaoti").equals(""))
        post.setBiaoti(Request.get("biaoti"));
                if(!Request.get("shipin").equals(""))
        post.setShipin(Request.get("shipin"));
                if(!Request.get("tupian").equals(""))
        post.setTupian(Request.get("tupian"));
                if(!Request.get("neirong").equals(""))
        post.setNeirong(util.DownloadRemoteImage.run(Request.get("neirong")));
            if(!Request.get("faburen").equals(""))
        post.setFaburen(Request.get("faburen"));
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
    @RequestMapping("/tiezi_detail")
    public String detail()
    {
        int id = Request.getInt("id");
        Tiezi map = service.find(id);  // 根据前台url 参数中的id获取行数据
        request.setAttribute("map" , map);  // 把数据写到前台
        return "tiezi_detail";  // 详情页面：WebRoot\tiezi_detail.jsp
    }
    /**
     *  前台详情
     */
    @RequestMapping("/tiezidetail")
    public String detailweb()
    {
        int id = Request.getInt("id");
        Tiezi map = service.find(id);
        

        request.setAttribute("map" , map);
        return "tiezidetail";    // 前台详情页面：WebRoot\tiezidetail.jsp
    }
        /**
    *  删除
    */
    @RequestMapping("/tiezi_delete")
    public String delete()
    {
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("tiezi").find(id);

                service.delete(id);// 根据id 删除某行数据
                return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
