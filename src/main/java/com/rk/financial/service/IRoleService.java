package com.rk.financial.service;

import java.util.Set;

/**
 * 角色业务层
 *
 * @author rk
 */
public interface IRoleService
{
    /**
     * 根据用户ID查询角色权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    public Set<String> selectRolePermissionByUserId(Long userId);
}
