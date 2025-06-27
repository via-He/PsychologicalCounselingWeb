package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.XinxiMapper;
import com.spring.entity.Xinxi;
import com.spring.service.XinxiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("XinxiService")
public class XinxiServiceImpl extends ServiceBase<Xinxi> implements XinxiService {
    @Resource
    private XinxiMapper dao;

    @Override
    protected XinxiMapper getDao() {
        return dao;
    }
}
