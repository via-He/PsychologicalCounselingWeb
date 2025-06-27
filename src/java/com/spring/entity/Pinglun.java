package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "pinglun")
public class Pinglun implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "tieziid")
    private Integer tieziid;
    @Column(name = "biaoti")
    private String biaoti;
    @Column(name = "faburen")
    private String faburen;
    @Column(name = "huifuneirong")
    private String huifuneirong;
    @Column(name = "pinglunren")
    private String pinglunren;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public Integer getTieziid() {
        return tieziid;
    }
    public void setTieziid(Integer tieziid) {
        this.tieziid = tieziid == null ? 0 : tieziid;
    }

    public String getBiaoti() {
        return biaoti;
    }
    public void setBiaoti(String biaoti) {
        this.biaoti = biaoti == null ? "" : biaoti.trim();
    }

    public String getFaburen() {
        return faburen;
    }
    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getHuifuneirong() {
        return huifuneirong;
    }
    public void setHuifuneirong(String huifuneirong) {
        this.huifuneirong = huifuneirong == null ? "" : huifuneirong.trim();
    }

    public String getPinglunren() {
        return pinglunren;
    }
    public void setPinglunren(String pinglunren) {
        this.pinglunren = pinglunren == null ? "" : pinglunren.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
