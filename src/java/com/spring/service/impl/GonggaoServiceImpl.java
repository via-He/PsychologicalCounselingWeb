package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.GonggaoMapper;
import com.spring.entity.Gonggao;
import com.spring.service.GonggaoService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("GonggaoService")
public class GonggaoServiceImpl extends ServiceBase<Gonggao> implements GonggaoService {
    @Resource
    private GonggaoMapper dao;

    @Override
    protected GonggaoMapper getDao() {
        return dao;
    }
}
