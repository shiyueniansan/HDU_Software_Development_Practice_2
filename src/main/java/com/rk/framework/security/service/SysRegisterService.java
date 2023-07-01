//package com.rk.framework.security.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import com.rk.common.constant.CacheConstants;
//import com.rk.common.constant.Constants;
//import com.rk.common.constant.UserConstants;
//import com.rk.common.exception.user.CaptchaException;
//import com.rk.common.exception.user.CaptchaExpireException;
//import com.rk.common.utils.MessageUtils;
//import com.rk.common.utils.SecurityUtils;
//import com.rk.common.utils.StringUtils;
//import com.rk.framework.manager.AsyncManager;
//import com.rk.framework.manager.factory.AsyncFactory;
//import com.rk.framework.redis.RedisCache;
//import com.rk.framework.security.RegisterBody;
//import com.rk.financial.domain.User;
//import com.rk.project.system.service.ISysConfigService;
//import com.rk.project.system.service.ISysUserService;
//
///**
// * 注册校验方法
// *
// * @author rk
// */
//@Component
//public class SysRegisterService
//{
//    @Autowired
//    private ISysUserService userService;
//
//    @Autowired
//    private ISysConfigService configService;
//
//    @Autowired
//    private RedisCache redisCache;
//
//    /**
//     * 注册
//     */
//    public String register(RegisterBody registerBody)
//    {
//        String msg = "", username = registerBody.getUsername(), password = registerBody.getPassword();
//        User user = new User();
//        user.setUserName(username);
//
//        // 验证码开关
//        boolean captchaEnabled = configService.selectCaptchaEnabled();
//        if (captchaEnabled)
//        {
//            validateCaptcha(username, registerBody.getCode(), registerBody.getUuid());
//        }
//
//        if (StringUtils.isEmpty(username))
//        {
//            msg = "用户名不能为空";
//        }
//        else if (StringUtils.isEmpty(password))
//        {
//            msg = "用户密码不能为空";
//        }
//        else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
//                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
//        {
//            msg = "账户长度必须在2到20个字符之间";
//        }
//        else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
//                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
//        {
//            msg = "密码长度必须在5到20个字符之间";
//        }
//        else if (!userService.checkUserNameUnique(user))
//        {
//            msg = "保存用户'" + username + "'失败，注册账号已存在";
//        }
//        else
//        {
//            user.setNickName(username);
//            user.setPassword(SecurityUtils.encryptPassword(password));
//            boolean regFlag = userService.registerUser(user);
//            if (!regFlag)
//            {
//                msg = "注册失败,请联系系统管理人员";
//            }
//            else
//            {
//                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.REGISTER, MessageUtils.message("user.register.success")));
//            }
//        }
//        return msg;
//    }
//
//    /**
//     * 校验验证码
//     *
//     * @param username 用户名
//     * @param code 验证码
//     * @param uuid 唯一标识
//     * @return 结果
//     */
//    public void validateCaptcha(String username, String code, String uuid)
//    {
//        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
//        String captcha = redisCache.getCacheObject(verifyKey);
//        redisCache.deleteObject(verifyKey);
//        if (captcha == null)
//        {
//            throw new CaptchaExpireException();
//        }
//        if (!code.equalsIgnoreCase(captcha))
//        {
//            throw new CaptchaException();
//        }
//    }
//}
