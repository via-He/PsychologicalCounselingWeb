package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.PingcejiluMapper;
import com.spring.entity.Pingcejilu;
import com.spring.service.PingcejiluService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("PingcejiluService")
public class PingcejiluServiceImpl extends ServiceBase<Pingcejilu> implements PingcejiluService {
    @Resource
    private PingcejiluMapper dao;

    @Override
    protected PingcejiluMapper getDao() {
        return dao;
    }
}
