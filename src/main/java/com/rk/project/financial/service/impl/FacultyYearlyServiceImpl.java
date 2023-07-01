package com.rk.project.financial.service.impl;

import java.util.List;

import com.rk.project.financial.domain.PayDetail;
import com.rk.project.financial.service.IAffairService;
import com.rk.project.financial.service.IPayDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rk.project.financial.mapper.FacultyYearlyMapper;
import com.rk.project.financial.domain.FacultyYearly;
import com.rk.project.financial.service.IFacultyYearlyService;

/**
 * 教职工年度Service业务层处理
 *
 * @author Keven
 * @date 2023-05-31
 */
@Service
public class FacultyYearlyServiceImpl implements IFacultyYearlyService
{
    @Autowired
    private FacultyYearlyMapper facultyYearlyMapper;

    @Autowired
    private IAffairService affairService;

    @Autowired
    private IPayDetailService payDetailService;

    /**
     * 查询教职工年度
     *
     * @param facultyId 教职工年度主键
     * @return 教职工年度
     */
    @Override
    public FacultyYearly selectFacultyYearlyByFacultyId(Long facultyId)
    {
        return facultyYearlyMapper.selectFacultyYearlyByFacultyId(facultyId);
    }

    /**
     * 查询教职工年度列表
     *
     * @param facultyYearly 教职工年度
     * @return 教职工年度
     */
    @Override
    public List<FacultyYearly> selectFacultyYearlyList(FacultyYearly facultyYearly)
    {
        return facultyYearlyMapper.selectFacultyYearlyList(facultyYearly);
    }

    /**
     * 新增教职工年度
     *
     * @param facultyYearly 教职工年度
     * @return 结果
     */
    @Override
    public int insertFacultyYearly(FacultyYearly facultyYearly)
    {
        return facultyYearlyMapper.insertFacultyYearly(facultyYearly);
    }

    /**
     * 修改教职工年度
     *
     * @param facultyYearly 教职工年度
     * @return 结果
     */
    @Override
    public int updateFacultyYearly(FacultyYearly facultyYearly)
    {
        return facultyYearlyMapper.updateFacultyYearly(facultyYearly);
    }

    /**
     * 批量删除教职工年度
     *
     * @param facultyIds 需要删除的教职工年度主键
     * @return 结果
     */
    @Override
    public int deleteFacultyYearlyByFacultyIds(Long[] facultyIds)
    {
        return facultyYearlyMapper.deleteFacultyYearlyByFacultyIds(facultyIds);
    }

    /**
     * 删除教职工年度信息
     *
     * @param facultyId 教职工年度主键
     * @return 结果
     */
    @Override
    public int deleteFacultyYearlyByFacultyId(Long facultyId)
    {
        return facultyYearlyMapper.deleteFacultyYearlyByFacultyId(facultyId);
    }

    /**
     * 计算教职工教职工本年度累计授课时数
     *
     * @param facultyYearly 教职工年度
     */
    @Override
    public void updateHours(FacultyYearly facultyYearly) {
        Float hours = 0F;
        for(long month = 1; month <= 12; month++){
            hours+=affairService.countHoursByFacultyIdAndMonth(facultyYearly.getFacultyId(), month);
        }
        facultyYearly.setHour(hours);
        updateFacultyYearly(facultyYearly);
    }

    /**
     * 计算教职工教职工本年度累计授课时数
     *
     * @param list 教职工年度集合
     */
    @Override
    public void updateHours(List<FacultyYearly> list) {
        for (FacultyYearly facultyYearly : list) {
            updateHours(facultyYearly);
        }
    }

    /**
     * 计算教职工本年度累计工资总额及实发工资
     *
     * @param facultyYearly 教职工年度
     */
    @Override
    public void updatePay(FacultyYearly facultyYearly) {
        Float totalPay = 0F;
        Float netPay = 0F;
        for(long month = 1; month <= 12; month++){
            PayDetail payDetail = payDetailService.selectPayDetailByFacultyIdAndMonth(facultyYearly.getFacultyId(), month);
            payDetailService.calculatePayDetail(payDetail);
            totalPay += payDetail.getTotalPay();
            netPay += payDetail.getNetPay();
        }
        facultyYearly.setTotalPay(totalPay);
        facultyYearly.setNetPay(netPay);
        updateFacultyYearly(facultyYearly);
    }

    /**
     * 计算教职工本年度累计工资总额及实发工资
     *
     * @param list 教职工年度集合
     */
    @Override
    public void updatePay(List<FacultyYearly> list) {
        for (FacultyYearly facultyYearly : list) {
            updatePay(facultyYearly);
        }
    }
}
