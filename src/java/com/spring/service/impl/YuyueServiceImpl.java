package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.YuyueMapper;
import com.spring.entity.Yuyue;
import com.spring.service.YuyueService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("YuyueService")
public class YuyueServiceImpl extends ServiceBase<Yuyue> implements YuyueService {
    @Resource
    private YuyueMapper dao;

    @Override
    protected YuyueMapper getDao() {
        return dao;
    }
}
