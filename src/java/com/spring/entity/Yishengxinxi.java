package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "yishengxinxi")
public class Yishengxinxi implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "yishengzhanghao")
    private String yishengzhanghao;
    @Column(name = "yishengxingming")
    private String yishengxingming;
    @Column(name = "yishengzhaopian")
    private String yishengzhaopian;
    @Column(name = "xingbie")
    private String xingbie;
    @Column(name = "congyishijian")
    private String congyishijian;
    @Column(name = "yishengjianjie")
    private String yishengjianjie;
    @Column(name = "addtime")
    private String addtime;
    private String issh;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getYishengzhaopian() {
        return yishengzhaopian;
    }
    public void setYishengzhaopian(String yishengzhaopian) {
        this.yishengzhaopian = yishengzhaopian == null ? "" : yishengzhaopian.trim();
    }

    public String getXingbie() {
        return xingbie;
    }
    public void setXingbie(String xingbie) {
        this.xingbie = xingbie == null ? "" : xingbie.trim();
    }

    public String getCongyishijian() {
        return congyishijian;
    }
    public void setCongyishijian(String congyishijian) {
        this.congyishijian = congyishijian == null ? "" : congyishijian.trim();
    }

    public String getYishengjianjie() {
        return yishengjianjie;
    }
    public void setYishengjianjie(String yishengjianjie) {
        this.yishengjianjie = yishengjianjie == null ? "" : yishengjianjie.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }
    public String getIssh() {
        return issh;
    }
    public void setIssh(String issh) {
        this.issh = issh == null ? "" : issh.trim();
    }

}
