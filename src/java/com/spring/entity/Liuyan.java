package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "liuyan")
public class Liuyan implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "yishengxinxiid")
    private Integer yishengxinxiid;
    @Column(name = "yishengzhanghao")
    private String yishengzhanghao;
    @Column(name = "liuyanneirong")
    private String liuyanneirong;
    @Column(name = "faqiren")
    private String faqiren;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getLiuyanneirong() {
        return liuyanneirong;
    }
    public void setLiuyanneirong(String liuyanneirong) {
        this.liuyanneirong = liuyanneirong == null ? "" : liuyanneirong.trim();
    }

    public String getFaqiren() {
        return faqiren;
    }
    public void setFaqiren(String faqiren) {
        this.faqiren = faqiren == null ? "" : faqiren.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
