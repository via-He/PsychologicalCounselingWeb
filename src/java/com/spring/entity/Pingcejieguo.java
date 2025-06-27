package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "pingcejieguo")
public class Pingcejieguo implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "xinlicepingid")
    private Integer xinlicepingid;
    @Column(name = "cepingzhuti")
    private String cepingzhuti;
    @Column(name = "zongdefen")
    private String zongdefen;
    @Column(name = "zhuanyejianyi")
    private String zhuanyejianyi;
    @Column(name = "ceshizhe")
    private String ceshizhe;
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

    public String getZongdefen() {
        return zongdefen;
    }
    public void setZongdefen(String zongdefen) {
        this.zongdefen = zongdefen == null ? "" : zongdefen.trim();
    }

    public String getZhuanyejianyi() {
        return zhuanyejianyi;
    }
    public void setZhuanyejianyi(String zhuanyejianyi) {
        this.zhuanyejianyi = zhuanyejianyi == null ? "" : zhuanyejianyi.trim();
    }

    public String getCeshizhe() {
        return ceshizhe;
    }
    public void setCeshizhe(String ceshizhe) {
        this.ceshizhe = ceshizhe == null ? "" : ceshizhe.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
