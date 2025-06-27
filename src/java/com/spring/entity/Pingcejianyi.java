package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "pingcejianyi")
public class Pingcejianyi implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "xinlicepingid")
    private Integer xinlicepingid;
    @Column(name = "cepingzhuti")
    private String cepingzhuti;
    @Column(name = "qifenshu")
    private Integer qifenshu;
    @Column(name = "zhifenshu")
    private Integer zhifenshu;
    @Column(name = "jianyineirong")
    private String jianyineirong;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public Integer getXinlicepingid() {
        return xinlicepingid;
    }
    public void setXinlicepingid(Integer xinlicepingid) {
        this.xinlicepingid = xinlicepingid == null ? 0 : xinlicepingid;
    }

    public String getCepingzhuti() {
        return cepingzhuti;
    }
    public void setCepingzhuti(String cepingzhuti) {
        this.cepingzhuti = cepingzhuti == null ? "" : cepingzhuti.trim();
    }

    public Integer getQifenshu() {
        return qifenshu;
    }
    public void setQifenshu(Integer qifenshu) {
        this.qifenshu = qifenshu == null ? 0 : qifenshu;
    }

    public Integer getZhifenshu() {
        return zhifenshu;
    }
    public void setZhifenshu(Integer zhifenshu) {
        this.zhifenshu = zhifenshu == null ? 0 : zhifenshu;
    }

    public String getJianyineirong() {
        return jianyineirong;
    }
    public void setJianyineirong(String jianyineirong) {
        this.jianyineirong = jianyineirong == null ? "" : jianyineirong.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
