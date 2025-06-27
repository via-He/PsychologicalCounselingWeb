package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.XinlicepingMapper;
import com.spring.entity.Xinliceping;
import com.spring.service.XinlicepingService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("XinlicepingService")
public class XinlicepingServiceImpl extends ServiceBase<Xinliceping> implements XinlicepingService {
    @Resource
    private XinlicepingMapper dao;

    @Override
    protected XinlicepingMapper getDao() {
        return dao;
    }
}
