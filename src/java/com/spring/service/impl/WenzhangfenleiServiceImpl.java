package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.WenzhangfenleiMapper;
import com.spring.entity.Wenzhangfenlei;
import com.spring.service.WenzhangfenleiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("WenzhangfenleiService")
public class WenzhangfenleiServiceImpl extends ServiceBase<Wenzhangfenlei> implements WenzhangfenleiService {
    @Resource
    private WenzhangfenleiMapper dao;

    @Override
    protected WenzhangfenleiMapper getDao() {
        return dao;
    }
}
