package com.rk.financial.mapper;

import java.util.List;
import com.rk.financial.domain.Faculty;

/**
 * 教职工Mapper接口
 *
 * @author Keven
 * @date 2023-05-30
 */
public interface FacultyMapper
{
    /**
     * 查询教职工
     *
     * @param id 教职工主键
     * @return 教职工
     */
    public Faculty selectFacultyById(Long id);

    /**
     * 查询教职工列表
     *
     * @param faculty 教职工
     * @return 教职工集合
     */
    public List<Faculty> selectFacultyList(Faculty faculty);

    /**
     * 新增教职工
     *
     * @param faculty 教职工
     * @return 结果
     */
    public int insertFaculty(Faculty faculty);

    /**
     * 修改教职工
     *
     * @param faculty 教职工
     * @return 结果
     */
    public int updateFaculty(Faculty faculty);

    /**
     * 删除教职工
     *
     * @param id 教职工主键
     * @return 结果
     */
    public int deleteFacultyById(Long id);

    /**
     * 批量删除教职工
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFacultyByIds(Long[] ids);
}
