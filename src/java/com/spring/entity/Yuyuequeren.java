package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "yuyuequeren")
public class Yuyuequeren implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "yuyueid")
    private Integer yuyueid;
    @Column(name = "yuyuebianhao")
    private String yuyuebianhao;
    @Column(name = "yishengzhanghao")
    private String yishengzhanghao;
    @Column(name = "yishengxingming")
    private String yishengxingming;
    @Column(name = "yuyueshijian")
    private String yuyueshijian;
    @Column(name = "yuyuerenxingming")
    private String yuyuerenxingming;
    @Column(name = "lianxidianhua")
    private String lianxidianhua;
    @Column(name = "yuyueren")
    private String yuyueren;
    @Column(name = "yuyueleixing")
    private String yuyueleixing;
    @Column(name = "querenjieguo")
    private String querenjieguo;
    @Column(name = "fankuixinxi")
    private String fankuixinxi;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public Integer getYuyueid() {
        return yuyueid;
    }
    public void setYuyueid(Integer yuyueid) {
        this.yuyueid = yuyueid == null ? 0 : yuyueid;
    }

    public String getYuyuebianhao() {
        return yuyuebianhao;
    }
    public void setYuyuebianhao(String yuyuebianhao) {
        this.yuyuebianhao = yuyuebianhao == null ? "" : yuyuebianhao.trim();
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

    public String getYuyueren() {
        return yuyueren;
    }
    public void setYuyueren(String yuyueren) {
        this.yuyueren = yuyueren == null ? "" : yuyueren.trim();
    }

    public String getYuyueleixing() {
        return yuyueleixing;
    }
    public void setYuyueleixing(String yuyueleixing) {
        this.yuyueleixing = yuyueleixing == null ? "" : yuyueleixing.trim();
    }

    public String getQuerenjieguo() {
        return querenjieguo;
    }
    public void setQuerenjieguo(String querenjieguo) {
        this.querenjieguo = querenjieguo == null ? "" : querenjieguo.trim();
    }

    public String getFankuixinxi() {
        return fankuixinxi;
    }
    public void setFankuixinxi(String fankuixinxi) {
        this.fankuixinxi = fankuixinxi == null ? "" : fankuixinxi.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
