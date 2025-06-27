package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "xinliceping")
public class Xinliceping implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "cepingzhuti")
    private String cepingzhuti;
    @Column(name = "tupian")
    private String tupian;
    @Column(name = "cepingjieshao")
    private String cepingjieshao;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getCepingzhuti() {
        return cepingzhuti;
    }
    public void setCepingzhuti(String cepingzhuti) {
        this.cepingzhuti = cepingzhuti == null ? "" : cepingzhuti.trim();
    }

    public String getTupian() {
        return tupian;
    }
    public void setTupian(String tupian) {
        this.tupian = tupian == null ? "" : tupian.trim();
    }

    public String getCepingjieshao() {
        return cepingjieshao;
    }
    public void setCepingjieshao(String cepingjieshao) {
        this.cepingjieshao = cepingjieshao == null ? "" : cepingjieshao.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}
