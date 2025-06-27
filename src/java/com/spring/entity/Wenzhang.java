package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "wenzhang")
public class Wenzhang implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "wenzhangbiaoti")
    private String wenzhangbiaoti;
    @Column(name = "tupian")
    private String tupian;
    @Column(name = "shipin")
    private String shipin;
    @Column(name = "fenlei")
    private String fenlei;
    @Column(name = "faburen")
    private String faburen;
    @Column(name = "liulanliang")
    private String liulanliang;
    @Column(name = "wenzhangneirong")
    private String wenzhangneirong;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getWenzhangbiaoti() {
        return wenzhangbiaoti;
    }
    public void setWenzhangbiaoti(String wenzhangbiaoti) {
        this.wenzhangbiaoti = wenzhangbiaoti == null ? "" : wenzhangbiaoti.trim();
    }

    public String getTupian() {
        return tupian;
    }
    public void setTupian(String tupian) {
        this.tupian = tupian == null ? "" : tupian.trim();
    }

    public String getShipin() {
        return shipin;
    }
    public void setShipin(String shipin) {
        this.shipin = shipin == null ? "" : shipin.trim();
    }

    public String getFenlei() {
        return fenlei;
    }
    public void setFenlei(String fenlei) {
        this.fenlei = fenlei == null ? "" : fenlei.trim();
    }

    public String getFaburen() {
        return faburen;
    }
    public void setFaburen(String faburen) {
        this.faburen = faburen == null ? "" : faburen.trim();
    }

    public String getLiulanliang() {
        return liulanliang;
    }
    public void setLiulanliang(String liulanliang) {
        this.liulanliang = liulanliang == null ? "" : liulanliang.trim();
    }

    public String getWenzhangneirong() {
        return wenzhangneirong;
    }
    public void setWenzhangneirong(String wenzhangneirong) {
        this.wenzhangneirong = wenzhangneirong == null ? "" : wenzhangneirong.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
