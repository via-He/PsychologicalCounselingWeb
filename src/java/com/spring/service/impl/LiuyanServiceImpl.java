package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.LiuyanMapper;
import com.spring.entity.Liuyan;
import com.spring.service.LiuyanService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("LiuyanService")
public class LiuyanServiceImpl extends ServiceBase<Liuyan> implements LiuyanService {
    @Resource
    private LiuyanMapper dao;

    @Override
    protected LiuyanMapper getDao() {
        return dao;
    }
}
