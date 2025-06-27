package com.spring.service.impl;

import com.base.ServiceBase;
import com.spring.dao.YishengxinxiMapper;
import com.spring.entity.Yishengxinxi;
import com.spring.service.YishengxinxiService;
import org.springframework.stereotype.Service;
import util.Info;

import javax.annotation.Resource;

@Service("YishengxinxiService")
public class YishengxinxiServiceImpl extends ServiceBase<Yishengxinxi> implements YishengxinxiService {
    @Resource
    private YishengxinxiMapper dao;

    @Override
    protected YishengxinxiMapper getDao() {
        return dao;
    }
}
