package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "yuyue")
public class Yuyue implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "yuyuebianhao")
    private String yuyuebianhao;
    @Column(name = "yishengxinxiid")
    private Integer yishengxinxiid;
    @Column(name = "yishengzhanghao")
    private String yishengzhanghao;
    @Column(name = "yishengxingming")
    private String yishengxingming;
    @Column(name = "yuyueleixing")
    private String yuyueleixing;
    @Column(name = "yuyueshijian")
    private String yuyueshijian;
    @Column(name = "yuyuerenxingming")
    private String yuyuerenxingming;
    @Column(name = "lianxidianhua")
    private String lianxidianhua;
    @Column(name = "beizhu")
    private String beizhu;
    @Column(name = "zhuangtai")
    private String zhuangtai;
    @Column(name = "yuyueren")
    private String yuyueren;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getYuyuebianhao() {
        return yuyuebianhao;
    }
    public void setYuyuebianhao(String yuyuebianhao) {
        this.yuyuebianhao = yuyuebianhao == null ? "" : yuyuebianhao.trim();
    }

    public Integer getYishengxinxiid() {
        return yishengxinxiid;
    }
    public void setYishengxinxiid(Integer yishengxinxiid) {
        this.yishengxinxiid = yishengxinxiid == null ? 0 : yishengxinxiid;
    }

    public String getYishengzhanghao() {
        return yishengzhanghao;
    }
    public void setYishengzhanghao(String yishengzhanghao) {
        this.yishengzhanghao = yishengzhanghao == null ? "" : yishengzhanghao.trim();
    }

    public String getYishengxingming() {
        return yishengxingming;
    }
    public void setYishengxingming(String yishengxingming) {
        this.yishengxingming = yishengxingming == null ? "" : yishengxingming.trim();
    }

    public String getYuyueleixing() {
        return yuyueleixing;
    }
    public void setYuyueleixing(String yuyueleixing) {
        this.yuyueleixing = yuyueleixing == null ? "" : yuyueleixing.trim();
    }

    public String getYuyueshijian() {
        return yuyueshijian;
    }
    public void setYuyueshijian(String yuyueshijian) {
        this.yuyueshijian = yuyueshijian == null ? "" : yuyueshijian.trim();
    }

    public String getYuyuerenxingming() {
        return yuyuerenxingming;
    }
    public void setYuyuerenxingming(String yuyuerenxingming) {
        this.yuyuerenxingming = yuyuerenxingming == null ? "" : yuyuerenxingming.trim();
    }

    public String getLianxidianhua() {
        return lianxidianhua;
    }
    public void setLianxidianhua(String lianxidianhua) {
        this.lianxidianhua = lianxidianhua == null ? "" : lianxidianhua.trim();
    }

    public String getBeizhu() {
        return beizhu;
    }
    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu == null ? "" : beizhu.trim();
    }

    public String getZhuangtai() {
        return zhuangtai;
    }
    public void setZhuangtai(String zhuangtai) {
        this.zhuangtai = zhuangtai == null ? "" : zhuangtai.trim();
    }

    public String getYuyueren() {
        return yuyueren;
    }
    public void setYuyueren(String yuyueren) {
        this.yuyueren = yuyueren == null ? "" : yuyueren.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
