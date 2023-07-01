package com.rk.financial.service;

import java.util.List;
import com.rk.financial.domain.FacultyYearly;

/**
 * 教职工年度Service接口
 *
 * @author Keven
 * @date 2023-05-31
 */
public interface IFacultyYearlyService
{
    /**
     * 查询教职工年度
     *
     * @param facultyId 教职工年度主键
     * @return 教职工年度
     */
    public FacultyYearly selectFacultyYearlyByFacultyId(Long facultyId);

    /**
     * 查询教职工年度列表
     *
     * @param facultyYearly 教职工年度
     * @return 教职工年度集合
     */
    public List<FacultyYearly> selectFacultyYearlyList(FacultyYearly facultyYearly);

    /**
     * 新增教职工年度
     *
     * @param facultyYearly 教职工年度
     * @return 结果
     */
    public int insertFacultyYearly(FacultyYearly facultyYearly);

    /**
     * 修改教职工年度
     *
     * @param facultyYearly 教职工年度
     * @return 结果
     */
    public int updateFacultyYearly(FacultyYearly facultyYearly);

    /**
     * 批量删除教职工年度
     *
     * @param facultyIds 需要删除的教职工年度主键集合
     * @return 结果
     */
    public int deleteFacultyYearlyByFacultyIds(Long[] facultyIds);

    /**
     * 删除教职工年度信息
     *
     * @param facultyId 教职工年度主键
     * @return 结果
     */
    public int deleteFacultyYearlyByFacultyId(Long facultyId);

    /**
     * 计算教职工教职工本年度累计授课时数
     *
     * @param facultyYearly 教职工年度
     */
    public void updateHours(FacultyYearly facultyYearly);

    /**
     * 计算教职工教职工本年度累计授课时数
     *
     * @param list 教职工年度集合
     */
    public void updateHours(List<FacultyYearly> list);

    /**
     * 计算教职工本年度累计工资总额及实发工资
     *
     * @param facultyYearly 教职工年度
     */
    public void updatePay(FacultyYearly facultyYearly);

    /**
     * 计算教职工本年度累计工资总额及实发工资
     *
     * @param list 教职工年度集合
     */
    public void updatePay(List<FacultyYearly> list);
}
