package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.WenzhangMapper;
import com.spring.entity.Wenzhang;
import com.spring.service.WenzhangService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("WenzhangService")
public class WenzhangServiceImpl extends ServiceBase<Wenzhang> implements WenzhangService {
    @Resource
    private WenzhangMapper dao;

    @Override
    protected WenzhangMapper getDao() {
        return dao;
    }
}
