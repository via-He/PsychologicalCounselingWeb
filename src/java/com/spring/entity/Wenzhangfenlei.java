package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "wenzhangfenlei")
public class Wenzhangfenlei implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "fenleimingcheng")
    private String fenleimingcheng;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getFenleimingcheng() {
        return fenleimingcheng;
    }
    public void setFenleimingcheng(String fenleimingcheng) {
        this.fenleimingcheng = fenleimingcheng == null ? "" : fenleimingcheng.trim();
    }

}
