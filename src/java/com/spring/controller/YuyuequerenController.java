package com.spring.controller;

import com.spring.dao.YuyuequerenMapper;
import com.spring.entity.Yuyuequeren;
import com.spring.service.YuyuequerenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;
import util.Request;
import util.Info;
import dao.Query;
import java.util.*;



import com.spring.entity.Yuyue;
import com.spring.service.YuyueService;

/**
 * 预约确认 */
@Controller
public class YuyuequerenController extends BaseController
{
    @Autowired
    private YuyuequerenMapper dao;
    @Autowired
    private YuyuequerenService service;

    @Autowired
    private YuyueService serviceRead;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/yuyuequeren_list")
    public String list()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Yuyuequeren.class); //  创建一个扩展搜索类
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
        List<Yuyuequeren> list = service.selectPageExample(example , page , 12);   // 获取当前页的行数
        // 将列表写给界面使用
        assign("list" , list);
        assign("orderby" , order);  // 把当前排序结果写进前台
        assign("sort" , sort);      // 把当前排序结果写进前台
        assign("where" , where);    // 把当前条件写给前台
        return "yuyuequeren_list";   // 使用视图文件：WebRoot\yuyuequeren_list.jsp
    }



    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere()
    {
        String where = " ";
        // 判断URL 参数yuyueid是否大于0
        if( Request.getInt("yuyueid") > 0 ) {
            // 大于0 则写入条件
            where += " AND yuyueid='"+Request.getInt("yuyueid")+"' ";
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
    @RequestMapping("/yuyuequeren_list_yishengzhanghao")
    public String listyishengzhanghao()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Yuyuequeren.class);  //  创建一个扩展搜索类
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

            List<Yuyuequeren> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "yuyuequeren_list_yishengzhanghao";
    }
    /**
     * 预约人列表
     */
    @RequestMapping("/yuyuequeren_list_yuyueren")
    public String listyuyueren()
    {
        // 检测是否有登录，没登录则跳转到登录页面
        if(!checkLogin()){
            return showError("尚未登录" , "./login.do");
        }

        String order = Request.get("order" , "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort  = Request.get("sort" , "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        
        Example example = new Example(Yuyuequeren.class);  //  创建一个扩展搜索类
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

            List<Yuyuequeren> list = service.selectPageExample(example , page , 12);
        
        request.setAttribute("list" , list);
                assign("orderby" , order);
        assign("sort" , sort);
        assign("where" , where);
        return "yuyuequeren_list_yuyueren";
    }




        @RequestMapping("/yuyuequeren_add")
    public String add()
    {
        int id = Request.getInt("id");  // 根据id 获取 预约模块中的数据
        Yuyue readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        request.setAttribute("readMap" , readMap);
        return "yuyuequeren_add";
    }



    @RequestMapping("/yuyuequeren_updt")
    public String updt()
    {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Yuyuequeren mmm = service.find(id);
        request.setAttribute("mmm" , mmm);
        request.setAttribute("updtself" , 0);
        return "yuyuequeren_updt";
    }
    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/yuyuequereninsert")
    public String insert()
    {
        String tmp="";
        Yuyuequeren post = new Yuyuequeren();  // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setYuyueid(Request.getInt("yuyueid"));

        post.setYuyuebianhao(Request.get("yuyuebianhao"));

        post.setYishengzhanghao(Request.get("yishengzhanghao"));

        post.setYishengxingming(Request.get("yishengxingming"));

        post.setYuyueshijian(Request.get("yuyueshijian"));

        post.setYuyuerenxingming(Request.get("yuyuerenxingming"));

        post.setLianxidianhua(Request.get("lianxidianhua"));

        post.setYuyueren(Request.get("yuyueren"));

        post.setYuyueleixing(Request.get("yuyueleixing"));

        post.setQuerenjieguo(Request.get("querenjieguo"));

        post.setFankuixinxi(Request.get("fankuixinxi"));

    post.setAddtime(Info.getDateStr());

        post.setYuyueid(Request.getInt("yuyueid"));

        
                service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("update yuyue set zhuangtai='已预约' where yuyuebianhao='"+request.getParameter("yuyuebianhao")+"' and '"+request.getParameter("querenjieguo")+"'='同意预约'");



        return showSuccess("保存成功" , Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
    * 更新内容
    * @return
    */
    @RequestMapping("/yuyuequerenupdate")
    public String update()
    {
        // 创建实体类
        Yuyuequeren post = new Yuyuequeren();
        // 将前台表单数据填充到实体类
        if(!Request.get("yuyueid").equals(""))
        post.setYuyueid(Request.getInt("yuyueid"));
            if(!Request.get("yuyuebianhao").equals(""))
        post.setYuyuebianhao(Request.get("yuyuebianhao"));
                if(!Request.get("yishengzhanghao").equals(""))
        post.setYishengzhanghao(Request.get("yishengzhanghao"));
                if(!Request.get("yishengxingming").equals(""))
        post.setYishengxingming(Request.get("yishengxingming"));
                if(!Request.get("yuyueshijian").equals(""))
        post.setYuyueshijian(Request.get("yuyueshijian"));
                if(!Request.get("yuyuerenxingming").equals(""))
        post.setYuyuerenxingming(Request.get("yuyuerenxingming"));
                if(!Request.get("lianxidianhua").equals(""))
        post.setLianxidianhua(Request.get("lianxidianhua"));
                if(!Request.get("yuyueren").equals(""))
        post.setYuyueren(Request.get("yuyueren"));
                if(!Request.get("yuyueleixing").equals(""))
        post.setYuyueleixing(Request.get("yuyueleixing"));
                if(!Request.get("querenjieguo").equals(""))
        post.setQuerenjieguo(Request.get("querenjieguo"));
                if(!Request.get("fankuixinxi").equals(""))
        post.setFankuixinxi(Request.get("fankuixinxi"));
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
    @RequestMapping("/yuyuequeren_detail")
    public String detail()
    {
        int id = Request.getInt("id");
        Yuyuequeren map = service.find(id);  // 根据前台url 参数中的id获取行数据
        request.setAttribute("map" , map);  // 把数据写到前台
        return "yuyuequeren_detail";  // 详情页面：WebRoot\yuyuequeren_detail.jsp
    }
        /**
    *  删除
    */
    @RequestMapping("/yuyuequeren_delete")
    public String delete()
    {
        if(!checkLogin()){
            return showError("尚未登录");
        }
        int id = Request.getInt("id");  // 根据id 删除某行数据
        HashMap map = Query.make("yuyuequeren").find(id);

                service.delete(id);// 根据id 删除某行数据
                return showSuccess("删除成功",request.getHeader("referer"));//弹出删除成功，并跳回上一页
    }
}
