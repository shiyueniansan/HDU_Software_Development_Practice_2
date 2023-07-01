package com.rk.financial.service;

import java.util.List;
import com.rk.financial.domain.Pay;

/**
 * 工资表Service接口
 *
 * @author Keven
 * @date 2023-05-31
 */
public interface IPayService
{
    /**
     * 查询工资表
     *
     * @param facultyId 工资表主键
     * @return 工资表
     */
    public Pay selectPayByFacultyId(Long facultyId);

    /**
     * 查询工资表列表
     *
     * @param pay 工资表
     * @return 工资表集合
     */
    public List<Pay> selectPayList(Pay pay);

    /**
     * 新增工资表
     *
     * @param pay 工资表
     * @return 结果
     */
    public int insertPay(Pay pay);

    /**
     * 修改工资表
     *
     * @param pay 工资表
     * @return 结果
     */
    public int updatePay(Pay pay);

    /**
     * 批量删除工资表
     *
     * @param facultyIds 需要删除的工资表主键集合
     * @return 结果
     */
    public int deletePayByFacultyIds(Long[] facultyIds);

    /**
     * 删除工资表信息
     *
     * @param facultyId 工资表主键
     * @return 结果
     */
    public int deletePayByFacultyId(Long facultyId);

    /**
     * 计算工资表
     * @param pay
     */
    public void calculatePay(Pay pay);
    /**
     * 计算工资表
     *
     * @param list
     */
    public void calculatePay(List<Pay> list);
}
