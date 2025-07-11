package com.rk.financial.mapper;

import java.util.List;
import com.rk.financial.domain.Role;

/**
 * 角色表 数据层
 *
 * @author rk
 */
public interface RoleMapper
{
    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    public List<Role> selectRolePermissionByUserId(Long userId);

    /**
     * 根据用户ID查询角色
     *
     * @param userName 用户名
     * @return 角色列表
     */
    public List<Role> selectRolesByUserName(String userName);
}
