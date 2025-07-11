package com.rk.financial.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.rk.common.utils.StringUtils;
import com.rk.framework.config.RKConfig;

/**
 * 首页
 *
 * @author rk
 */
@RestController
public class IndexController
{
    /** 系统基础配置 */
    @Autowired
    private RKConfig rkConfig;

    /**
     * 访问首页，提示语
     */
    @RequestMapping("/")
    public String index()
    {
        return StringUtils.format("欢迎使用HDU财务系统，当前版本：v{}，请通过前端地址访问。", rkConfig.getVersion());
    }
}
