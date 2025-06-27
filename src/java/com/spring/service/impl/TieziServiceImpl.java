package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.TieziMapper;
import com.spring.entity.Tiezi;
import com.spring.service.TieziService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("TieziService")
public class TieziServiceImpl extends ServiceBase<Tiezi> implements TieziService {
    @Resource
    private TieziMapper dao;

    @Override
    protected TieziMapper getDao() {
        return dao;
    }
}
