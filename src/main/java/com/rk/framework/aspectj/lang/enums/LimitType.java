package com.rk.framework.aspectj.lang.enums;

/**
 * 限流类型
 *
 * @author rk
 */

public enum LimitType
{
    /**
     * 默认策略全局限流
     */
    DEFAULT,

    /**
     * 根据请求者IP进行限流
     */
    IP
}
