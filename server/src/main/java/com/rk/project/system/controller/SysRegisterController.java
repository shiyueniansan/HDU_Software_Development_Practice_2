package com.rk.project.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.rk.common.utils.StringUtils;
import com.rk.framework.security.RegisterBody;
import com.rk.framework.security.service.SysRegisterService;
import com.rk.framework.web.controller.BaseController;
import com.rk.framework.web.domain.AjaxResult;
import com.rk.project.system.service.ISysConfigService;

/**
 * 注册验证
 *
 * @author rk
 */
@RestController
public class SysRegisterController extends BaseController
{
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user)
    {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser"))))
        {
            return error("当前系统没有开启注册功能！");
        }
        String msg = registerService.register(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
