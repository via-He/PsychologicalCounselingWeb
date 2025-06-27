package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.TimuMapper;
import com.spring.entity.Timu;
import com.spring.service.TimuService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("TimuService")
public class TimuServiceImpl extends ServiceBase<Timu> implements TimuService {
    @Resource
    private TimuMapper dao;

    @Override
    protected TimuMapper getDao() {
        return dao;
    }
}
