package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.PingcejieguoMapper;
import com.spring.entity.Pingcejieguo;
import com.spring.service.PingcejieguoService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("PingcejieguoService")
public class PingcejieguoServiceImpl extends ServiceBase<Pingcejieguo> implements PingcejieguoService {
    @Resource
    private PingcejieguoMapper dao;

    @Override
    protected PingcejieguoMapper getDao() {
        return dao;
    }
}
