package com.spring.controller;

import com.spring.dao.LiuyanMapper;
import com.spring.entity.Liuyan;
import com.spring.service.LiuyanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;



import com.spring.entity.Yishengxinxi;
import com.spring.service.YishengxinxiService;

/**
 * 留言 */
@Controller
public class LiuyanController extends BaseController
{
    @Autowired
    private LiuyanMapper dao;
    @Autowired
    private LiuyanService service;

    @Autowired
    private YishengxinxiService serviceRead;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/liuyan_list")
    public String list()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Liuyan.class); //  创建一个扩展搜索类
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
        List<Liuyan> list = service.selectPageExample(example , page , 12);   // 获取当前页的行数
        // 将列表写给界面使用
        assign("list" , list);
        assign("orderby" , order);  // 把当前排序结果写进前台
        assign("sort" , sort);      // 把当前排序结果写进前台
        assign("where" , where);    // 把当前条件写给前台
        return "liuyan_list";   // 使用视图文件：WebRoot\liuyan_list.jsp
    }



    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere()
    {
        String where = " ";
        // 判断URL 参数yishengxinxiid是否大于0
        if( Request.getInt("yishengxinxiid") > 0 ) {
            // 大于0 则写入条件
            where += " AND yishengxinxiid='"+Request.getInt("yishengxinxiid")+"' ";
        }
        // 以下是判断搜索框中是否有输入内容，判断是否前台是否有填写相关条件，符合则写入sql搜索语句
        return where;
    }

    /**
     * 医生账号列表
     */
    @RequestMapping("/liuyan_list_yishengzhanghao")
    public String listyishengzhanghao()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Liuyan.class);  //  创建一个扩展搜索类
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

            List<Liuyan> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "liuyan_list_yishengzhanghao";
    }
    /**
     * 发起人列表
     */
    @RequestMapping("/liuyan_list_faqiren")
    public String listfaqiren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Liuyan.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：发起人=当前登录用户
        String where = " faqiren='"+session.getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Liuyan> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "liuyan_list_faqiren";
    }


    /**
    *  前台列表页
    *
    */
    @RequestMapping("/liuyanlist")
    public String index()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./");
        }
        String order = Request.get("order" , "id");
        String sort  = Request.get("sort" , "desc");

        Example example = new Example(Liuyan.class);
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
            List<Liuyan> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
        request.setAttribute("where" , where);
        assign("orderby" , order);
        assign("sort" , sort);
        return "liuyanlist";
    }


        @RequestMapping("/liuyan_add")
    public String add()
    {
        int id = Request.getInt("id");  // 根据id 获取 医生信息模块中的数据
        Yishengxinxi readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        request.setAttribute("readMap" , readMap);
        return "liuyan_add";
    }

    @RequestMapping("/liuyanadd")
    public String addWeb()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./");
        }






        int id = Request.getInt("id"); // 根据id 获取 医生信息模块中的数据
        HashMap yuyue=Query.make("yuyue").where("yuyueren",session.getAttribute("username")).where("yishengxinxiid",id).where("zhuangtai='已预约'").where("yuyueleixing='在线沟通'").find();

        if(yuyue.isEmpty()){
            return showError("您尚未预约成功！请预约医生后再发起留言" );
        }
        HashMap liuyan=Query.make("liuyan").where("faqiren",session.getAttribute("username")).where("yishengxinxiid",id).find();

        if(!liuyan.isEmpty()){
            return showSuccess("已发起过留言，点击确认前往发送消息" ,"xinxilist.do?liuyanid="+liuyan.get("id")+"&yishengxinxiid="+liuyan.get("yishengxinxiid"));
        }



        Yishengxinxi readMap = serviceRead.find(id);
        request.setAttribute("readMap" , readMap);
        return "liuyanadd";
    }


    @RequestMapping("/liuyan_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Liuyan mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "liuyan_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/liuyaninsert")
    public String insert()
    {
        String tmp="";
        Liuyan post = new Liuyan();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setYishengxinxiid(Request.getInt("yishengxinxiid"));

        post.setYishengzhanghao(Request.get("yishengzhanghao"));

        post.setLiuyanneirong(Request.get("liuyanneirong"));

        post.setFaqiren(Request.get("faqiren"));

    post.setAddtime(Info.getDateStr());

        post.setYishengxinxiid(Request.getInt("yishengxinxiid"));

        
                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        
        return showSuccess("发起成功" ,"liuyanlist.do");
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/liuyanupdate")
    public String update()
    {
        // 创建实体类
        Liuyan post = new Liuyan();
        // 将前台表单数据填充到实体类
        if(!Request.get("yishengxinxiid").equals(""))
        post.setYishengxinxiid(Request.getInt("yishengxinxiid"));
            if(!Request.get("yishengzhanghao").equals(""))
        post.setYishengzhanghao(Request.get("yishengzhanghao"));
                if(!Request.get("liuyanneirong").equals(""))
        post.setLiuyanneirong(Request.get("liuyanneirong"));
                if(!Request.get("faqiren").equals(""))
        post.setFaqiren(Request.get("faqiren"));
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
    @RequestMapping("/liuyan_delete")
    public String delete()
    {
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("liuyan").find(id);

                service.delete(id);// 根据id 删除某行数据
                return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
