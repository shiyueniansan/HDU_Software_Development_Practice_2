package com.rk.common.service;

import java.util.List;
import java.util.Set;
import com.rk.common.domain.SysRole;
import com.rk.common.domain.SysUserRole;

/**
 * 角色业务层
 *
 * @author rk
 */
public interface ISysRoleService
{
    /**
     * 根据用户ID查询角色权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    public Set<String> selectRolePermissionByUserId(Long userId);
}
