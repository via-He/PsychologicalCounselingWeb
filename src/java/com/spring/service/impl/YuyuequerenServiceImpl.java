package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.YuyuequerenMapper;
import com.spring.entity.Yuyuequeren;
import com.spring.service.YuyuequerenService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("YuyuequerenService")
public class YuyuequerenServiceImpl extends ServiceBase<Yuyuequeren> implements YuyuequerenService {
    @Resource
    private YuyuequerenMapper dao;

    @Override
    protected YuyuequerenMapper getDao() {
        return dao;
    }
}
