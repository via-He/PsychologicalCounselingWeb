package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "pingcejilu")
public class Pingcejilu implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "xinlicepingid")
    private Integer xinlicepingid;
    @Column(name = "cepingzhuti")
    private String cepingzhuti;
    @Column(name = "defen")
    private String defen;
    @Column(name = "daan")
    private String daan;
    @Column(name = "tijiaoren")
    private String tijiaoren;
    @Column(name = "zimu")
    private String zimu;
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

    public String getDefen() {
        return defen;
    }
    public void setDefen(String defen) {
        this.defen = defen == null ? "" : defen.trim();
    }

    public String getDaan() {
        return daan;
    }
    public void setDaan(String daan) {
        this.daan = daan == null ? "" : daan.trim();
    }

    public String getTijiaoren() {
        return tijiaoren;
    }
    public void setTijiaoren(String tijiaoren) {
        this.tijiaoren = tijiaoren == null ? "" : tijiaoren.trim();
    }

    public String getZimu() {
        return zimu;
    }
    public void setZimu(String zimu) {
        this.zimu = zimu == null ? "" : zimu.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
