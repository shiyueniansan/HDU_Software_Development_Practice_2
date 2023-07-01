package com.ruoyi.project.financial.service;

import java.util.List;

import com.ruoyi.project.financial.domain.PayDetail;

/**
 * 工资明细表Service接口
 *
 * @author Keven
 * @date 2023-05-31
 */
public interface IPayDetailService
{
    /**
     * 查询工资明细表
     *
     * @param facultyId 工资明细表主键
     * @return 工资明细表
     */
    public PayDetail selectPayDetailByFacultyId(Long facultyId);

    /**
     * 查询工资明细表列表
     *
     * @param payDetail 工资明细表
     * @return 工资明细表集合
     */
    public List<PayDetail> selectPayDetailList(PayDetail payDetail);

    /**
     * 新增工资明细表
     *
     * @param payDetail 工资明细表
     * @return 结果
     */
    public int insertPayDetail(PayDetail payDetail);

    /**
     * 修改工资明细表
     *
     * @param payDetail 工资明细表
     * @return 结果
     */
    public int updatePayDetail(PayDetail payDetail);

    /**
     * 批量删除工资明细表
     *
     * @param facultyIds 需要删除的工资明细表主键集合
     * @return 结果
     */
    public int deletePayDetailByFacultyIds(Long[] facultyIds);

    /**
     * 删除工资明细表信息
     *
     * @param facultyId 工资明细表主键
     * @return 结果
     */
    public int deletePayDetailByFacultyId(Long facultyId);

    /**
     * 根据教师id和月份查询工资表
     * @param facultyId
     * @param month
     * @return 工资明细表
     */
    public PayDetail selectPayDetailByFacultyIdAndMonth(Long facultyId, Long month);

    /**
     * 填充工资明细表
     *
     * @param payDetail 工资明细表
     */
    public void fillPayDetail(PayDetail payDetail);

    /**
     * 计算工资明细表
     *
     * @param payDetail 工资明细表
     */
    public void calculatePayDetail(PayDetail payDetail);

    /**
     * 计算工资明细表
     *
     * @param list 工资明细表集合
     */
    public void calculatePayDetail(List<PayDetail> list);

//    /**
//     * 计算教职工课时/工时
//     *
//     * @param payDetail 工资明细表
//     */
//    void calculateHours(PayDetail payDetail);

    /**
     * 计算教职工工资
     *
     * @param payDetail 工资明细表
     */
    void calculateAffairPay(PayDetail payDetail);

    /**
     * 计算教职工工资总额
     *
     * @param payDetail 工资明细表
     */
    void calculateTotalPay(PayDetail payDetail);

    /**
     * 计算教职工个人所得税
     *
     * @param payDetail 工资明细表
     */
    void calculateTax(PayDetail payDetail);

    /**
     * 计算教职工住房公积金
     *
     * @param payDetail 工资明细表
     */
    void calculateHousing(PayDetail payDetail);

    /**
     * 计算教职工保险费
     *
     * @param payDetail 工资明细表
     */
    void calculateInsurance(PayDetail payDetail);

    /**
     * 计算教职工实发工资
     *
     * @param payDetail 工资明细表
     */
    void calculateNetPay(PayDetail payDetail);
}
