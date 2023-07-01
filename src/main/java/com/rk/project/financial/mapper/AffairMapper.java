package com.rk.project.financial.mapper;

import java.util.List;
import com.rk.project.financial.domain.Affair;
import org.apache.ibatis.annotations.Param;

/**
 * 个人事务Mapper接口
 *
 * @author Keven
 * @date 2023-05-31
 */
public interface AffairMapper
{
    /**
     * 查询个人事务
     *
     * @param id 个人事务主键
     * @return 个人事务
     */
    public Affair selectAffairById(Long id);

    /**
     * 查询个人事务列表
     *
     * @param affair 个人事务
     * @return 个人事务集合
     */
    public List<Affair> selectAffairList(Affair affair);

    /**
     * 新增个人事务
     *
     * @param affair 个人事务
     * @return 结果
     */
    public int insertAffair(Affair affair);

    /**
     * 修改个人事务
     *
     * @param affair 个人事务
     * @return 结果
     */
    public int updateAffair(Affair affair);

    /**
     * 删除个人事务
     *
     * @param id 个人事务主键
     * @return 结果
     */
    public int deleteAffairById(Long id);

    /**
     * 批量删除个人事务
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAffairByIds(Long[] ids);

    /**
     * 根据facultyIds批量删除个人事务
     *
     * @param facultyIds 需要删除的个人事务的facultyIds集合
     * @return 结果
     */
    public int deleteAffairByFacultyIds(Long[] facultyIds);

    /**
     * 根据facultyId更新个人事务的姓名
     *
     * @param facultyId 教职工编号
     * @param name 教职工姓名
     * @return 结果
     */
    public int updateAffairNameByFacultyId(@Param("facultyId") Long facultyId, @Param("name") String name);

//    /**
//     * 根据facultyId查找个人事务
//     *
//     * @param facultyId 教职工编号
//     * @return 结果
//     */
//    public List<Affair> selectAffairListByFacultyId(Long facultyId);
}
