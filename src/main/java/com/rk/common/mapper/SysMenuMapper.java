package com.rk.common.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.rk.common.domain.SysMenu;

/**
 * 菜单表 数据层
 *
 * @author rk
 */
public interface SysMenuMapper
{
    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    public List<String> selectMenuPermsByUserId(Long userId);

    /**
     * 根据角色ID查询权限
     *
     * @param roleId 角色ID
     * @return 权限列表
     */
    public List<String> selectMenuPermsByRoleId(Long roleId);

    /**
     * 根据用户ID查询菜单
     *
     * @param userId 用户ID
     * @return 菜单列表
     */
    public List<SysMenu> selectMenuTreeByUserId(Long userId);
}
