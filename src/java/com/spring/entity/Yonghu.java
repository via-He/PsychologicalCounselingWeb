package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "yonghu")
public class Yonghu implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "cx")
    private String cx;
    @Column(name = "username")
    private String username;
    @Column(name = "pwd")
    private String pwd;
    @Column(name = "xingming")
    private String xingming;
    @Column(name = "xingbie")
    private String xingbie;
    @Column(name = "shouji")
    private String shouji;
    @Column(name = "touxiang")
    private String touxiang;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getCx() {
        return cx;
    }
    public void setCx(String cx) {
        this.cx = cx == null ? "" : cx.trim();
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username == null ? "" : username.trim();
    }

    public String getPwd() {
        return pwd;
    }
    public void setPwd(String pwd) {
        this.pwd = pwd == null ? "" : pwd.trim();
    }

    public String getXingming() {
        return xingming;
    }
    public void setXingming(String xingming) {
        this.xingming = xingming == null ? "" : xingming.trim();
    }

    public String getXingbie() {
        return xingbie;
    }
    public void setXingbie(String xingbie) {
        this.xingbie = xingbie == null ? "" : xingbie.trim();
    }

    public String getShouji() {
        return shouji;
    }
    public void setShouji(String shouji) {
        this.shouji = shouji == null ? "" : shouji.trim();
    }

    public String getTouxiang() {
        return touxiang;
    }
    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang == null ? "" : touxiang.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
