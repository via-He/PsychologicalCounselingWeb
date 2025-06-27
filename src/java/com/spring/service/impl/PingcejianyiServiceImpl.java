package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.PingcejianyiMapper;
import com.spring.entity.Pingcejianyi;
import com.spring.service.PingcejianyiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("PingcejianyiService")
public class PingcejianyiServiceImpl extends ServiceBase<Pingcejianyi> implements PingcejianyiService {
    @Resource
    private PingcejianyiMapper dao;

    @Override
    protected PingcejianyiMapper getDao() {
        return dao;
    }
}
