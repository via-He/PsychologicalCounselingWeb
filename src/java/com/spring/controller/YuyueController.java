package com.spring.controller;

import com.spring.dao.YuyueMapper;
import com.spring.entity.Yuyue;
import com.spring.service.YuyueService;
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
 * 预约 */
@Controller
public class YuyueController extends BaseController
{
    @Autowired
    private YuyueMapper dao;
    @Autowired
    private YuyueService service;

    @Autowired
    private YishengxinxiService serviceRead;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/yuyue_list")
    public String list()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Yuyue.class); //  创建一个扩展搜索类
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
        List<Yuyue> list = service.selectPageExample(example , page , 12);   // 获取当前页的行数
        // 将列表写给界面使用
        assign("list" , list);
        assign("orderby" , order);  // 把当前排序结果写进前台
        assign("sort" , sort);      // 把当前排序结果写进前台
        assign("where" , where);    // 把当前条件写给前台
        return "yuyue_list";   // 使用视图文件：WebRoot\yuyue_list.jsp
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
            if(!Request.get("yishengxingming").equals("")) {
            where += " AND yishengxingming LIKE '%"+Request.get("yishengxingming")+"%' ";
        }
                if(!Request.get("yuyueleixing").equals("")) {
            where += " AND yuyueleixing ='"+Request.get("yuyueleixing")+"' ";
        }
            return where;
    }

    /**
     * 医生账号列表
     */
    @RequestMapping("/yuyue_list_yishengzhanghao")
    public String listyishengzhanghao()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Yuyue.class);  //  创建一个扩展搜索类
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

            List<Yuyue> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "yuyue_list_yishengzhanghao";
    }
    /**
     * 预约人列表
     */
    @RequestMapping("/yuyue_list_yuyueren")
    public String listyuyueren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Yuyue.class);  //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria();           // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：预约人=当前登录用户
        String where = " yuyueren='"+session.getAttribute("username")+"' ";
        where += getWhere();

        criteria.andCondition(where);   // 将条件写入
        if(sort.equals("desc")){        // 注释同list
            example.orderBy(order).desc(); // 注释同list
        }else{
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1 , page); // 注释同list

            List<Yuyue> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "yuyue_list_yuyueren";
    }




        @RequestMapping("/yuyue_add")
    public String add()
    {
        int id = Request.getInt("id");  // 根据id 获取 医生信息模块中的数据
        Yishengxinxi readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        request.setAttribute("readMap" , readMap);
        return "yuyue_add";
    }

    @RequestMapping("/yuyueadd")
    public String addWeb()
    {
        if(!checkLogin()){
            return showError("尚未登录" , "./");
        }
        int id = Request.getInt("id"); // 根据id 获取 医生信息模块中的数据
        Yishengxinxi readMap = serviceRead.find(id);
        request.setAttribute("readMap" , readMap);
        return "yuyueadd";
    }


    @RequestMapping("/yuyue_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Yuyue mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "yuyue_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/yuyueinsert")
    public String insert()
    {
        String tmp="";
        Yuyue post = new Yuyue();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setYuyuebianhao(Request.get("yuyuebianhao"));

        post.setYishengxinxiid(Request.getInt("yishengxinxiid"));

        post.setYishengzhanghao(Request.get("yishengzhanghao"));

        post.setYishengxingming(Request.get("yishengxingming"));

        post.setYuyueleixing(Request.get("yuyueleixing"));

        post.setYuyueshijian(Request.get("yuyueshijian"));

        post.setYuyuerenxingming(Request.get("yuyuerenxingming"));

        post.setLianxidianhua(Request.get("lianxidianhua"));

        post.setBeizhu(Request.get("beizhu"));

        post.setZhuangtai(Request.get("zhuangtai"));

        post.setYuyueren(Request.get("yuyueren"));

    post.setAddtime(Info.getDateStr());

        post.setYishengxinxiid(Request.getInt("yishengxinxiid"));

        
                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        
        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/yuyueupdate")
    public String update()
    {
        // 创建实体类
        Yuyue post = new Yuyue();
        // 将前台表单数据填充到实体类
        if(!Request.get("yuyuebianhao").equals(""))
        post.setYuyuebianhao(Request.get("yuyuebianhao"));
                if(!Request.get("yishengxinxiid").equals(""))
        post.setYishengxinxiid(Request.getInt("yishengxinxiid"));
            if(!Request.get("yishengzhanghao").equals(""))
        post.setYishengzhanghao(Request.get("yishengzhanghao"));
                if(!Request.get("yishengxingming").equals(""))
        post.setYishengxingming(Request.get("yishengxingming"));
                if(!Request.get("yuyueleixing").equals(""))
        post.setYuyueleixing(Request.get("yuyueleixing"));
                if(!Request.get("yuyueshijian").equals(""))
        post.setYuyueshijian(Request.get("yuyueshijian"));
                if(!Request.get("yuyuerenxingming").equals(""))
        post.setYuyuerenxingming(Request.get("yuyuerenxingming"));
                if(!Request.get("lianxidianhua").equals(""))
        post.setLianxidianhua(Request.get("lianxidianhua"));
                if(!Request.get("beizhu").equals(""))
        post.setBeizhu(Request.get("beizhu"));
                if(!Request.get("zhuangtai").equals(""))
        post.setZhuangtai(Request.get("zhuangtai"));
                if(!Request.get("yuyueren").equals(""))
        post.setYuyueren(Request.get("yuyueren"));
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
    @RequestMapping("/yuyue_detail")
    public String detail()
    {
        int id = Request.getInt("id");
        Yuyue map = service.find(id);  // 根据前台url 参数中的id获取行数据
        request.setAttribute("map" , map);  // 把数据写到前台
        return "yuyue_detail";  // 详情页面：WebRoot\yuyue_detail.jsp
    }
        /**
    *  删除
    */
    @RequestMapping("/yuyue_delete")
    public String delete()
    {
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("yuyue").find(id);

                service.delete(id);// 根据id 删除某行数据
                return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
