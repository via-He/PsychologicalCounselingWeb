package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "xinxi")
public class Xinxi implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "liuyanid")
    private Integer liuyanid;
    @Column(name = "yishengxinxiid")
    private Integer yishengxinxiid;
    @Column(name = "xiaoxineirong")
    private String xiaoxineirong;
    @Column(name = "fasongren")
    private String fasongren;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public Integer getLiuyanid() {
        return liuyanid;
    }
    public void setLiuyanid(Integer liuyanid) {
        this.liuyanid = liuyanid == null ? 0 : liuyanid;
    }

    public Integer getYishengxinxiid() {
        return yishengxinxiid;
    }
    public void setYishengxinxiid(Integer yishengxinxiid) {
        this.yishengxinxiid = yishengxinxiid == null ? 0 : yishengxinxiid;
    }

    public String getXiaoxineirong() {
        return xiaoxineirong;
    }
    public void setXiaoxineirong(String xiaoxineirong) {
        this.xiaoxineirong = xiaoxineirong == null ? "" : xiaoxineirong.trim();
    }

    public String getFasongren() {
        return fasongren;
    }
    public void setFasongren(String fasongren) {
        this.fasongren = fasongren == null ? "" : fasongren.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
