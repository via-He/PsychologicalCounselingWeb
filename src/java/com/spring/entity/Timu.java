package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "timu")
public class Timu implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "xinlicepingid")
    private Integer xinlicepingid;
    @Column(name = "cepingzhuti")
    private String cepingzhuti;
    @Column(name = "bianhao")
    private String bianhao;
    @Column(name = "timu")
    private String timu;
    @Column(name = "leixing")
    private String leixing;
    @Column(name = "daan")
    private String daan;
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

    public String getBianhao() {
        return bianhao;
    }
    public void setBianhao(String bianhao) {
        this.bianhao = bianhao == null ? "" : bianhao.trim();
    }

    public String getTimu() {
        return timu;
    }
    public void setTimu(String timu) {
        this.timu = timu == null ? "" : timu.trim();
    }

    public String getLeixing() {
        return leixing;
    }
    public void setLeixing(String leixing) {
        this.leixing = leixing == null ? "" : leixing.trim();
    }

    public String getDaan() {
        return daan;
    }
    public void setDaan(String daan) {
        this.daan = daan == null ? "" : daan.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
