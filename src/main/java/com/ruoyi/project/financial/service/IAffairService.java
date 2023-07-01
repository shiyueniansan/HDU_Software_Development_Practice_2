package com.ruoyi.project.financial.service;

import java.util.List;
import com.ruoyi.project.financial.domain.Affair;

/**
 * 个人事务Service接口
 *
 * @author Keven
 * @date 2023-05-31
 */
public interface IAffairService
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
     * 批量删除个人事务
     *
     * @param ids 需要删除的个人事务主键集合
     * @return 结果
     */
    public int deleteAffairByIds(Long[] ids);

    /**
     * 删除个人事务信息
     *
     * @param id 个人事务主键
     * @return 结果
     */
    public int deleteAffairById(Long id);

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
    public int updateAffairNameByFacultyId(Long facultyId, String name);

    /**
      * 根据facultyId和month计算课时/工时
      *
      * @param facultyId 教职工编号
      * @return 结果
      */
    Float countHoursByFacultyIdAndMonth(Long facultyId, Long month);

//    /**
//     * 根据facultyId查找个人事务
//     *
//     * @param facultyId 教职工编号
//     * @return 结果
//     */
//    public List<Affair> selectAffairListByFacultyId(Long facultyId);
}
