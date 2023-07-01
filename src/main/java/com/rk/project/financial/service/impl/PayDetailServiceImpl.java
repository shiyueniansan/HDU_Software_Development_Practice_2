package com.rk.project.financial.service.impl;

import java.util.List;

import com.rk.project.financial.constant.FinancialConstants;
import com.rk.project.financial.domain.Faculty;
import com.rk.project.financial.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rk.project.financial.mapper.PayDetailMapper;
import com.rk.project.financial.domain.PayDetail;

/**
 * 工资明细表Service业务层处理
 *
 * @author Keven
 * @date 2023-05-31
 */
@Service
public class PayDetailServiceImpl implements IPayDetailService
{
    @Autowired
    private PayDetailMapper payDetailMapper;

    @Autowired
    private IFacultyService facultyService;

    @Autowired
    private IAffairService affairService;

    @Autowired
    private ITitleService titleService;

    @Autowired
    private IJobService jobService;

    @Autowired
    private IFacultyYearlyService facultyYearlyService;

    /**
     * 查询工资明细表
     *
     * @param facultyId 工资明细表主键
     * @return 工资明细表
     */
    @Override
    public PayDetail selectPayDetailByFacultyId(Long facultyId)
    {
        return payDetailMapper.selectPayDetailByFacultyId(facultyId);
    }

    /**
     * 查询工资明细表列表
     *
     * @param payDetail 工资明细表
     * @return 工资明细表
     */
    @Override
    public List<PayDetail> selectPayDetailList(PayDetail payDetail)
    {
        return payDetailMapper.selectPayDetailList(payDetail);
    }

    /**
     * 新增工资明细表
     *
     * @param payDetail 工资明细表
     * @return 结果
     */
    @Override
    public int insertPayDetail(PayDetail payDetail)
    {
        return payDetailMapper.insertPayDetail(payDetail);
    }

    /**
     * 修改工资明细表
     *
     * @param payDetail 工资明细表
     * @return 结果
     */
    @Override
    public int updatePayDetail(PayDetail payDetail)
    {
        return payDetailMapper.updatePayDetail(payDetail);
    }

    /**
     * 批量删除工资明细表
     *
     * @param facultyIds 需要删除的工资明细表主键
     * @return 结果
     */
    @Override
    public int deletePayDetailByFacultyIds(Long[] facultyIds)
    {
        return payDetailMapper.deletePayDetailByFacultyIds(facultyIds);
    }

    /**
     * 删除工资明细表信息
     *
     * @param facultyId 工资明细表主键
     * @return 结果
     */
    @Override
    public int deletePayDetailByFacultyId(Long facultyId)
    {
        return payDetailMapper.deletePayDetailByFacultyId(facultyId);
    }

    /**
     * 根据教师id和月份查询工资表
     * @param facultyId
     * @param month
     * @return 工资明细表
     */
    @Override
    public PayDetail selectPayDetailByFacultyIdAndMonth(Long facultyId, Long month) {
        return payDetailMapper.selectPayDetailByFacultyIdAndMonth(facultyId, month);
    }

    /**
     * 装填工资明细表
     *
     * @param payDetail 工资明细表
     * @return 结果
     */
    @Override
    public void fillPayDetail(PayDetail payDetail) {
        Faculty faculty = facultyService.selectFacultyById(payDetail.getFacultyId());
        payDetail.setName(faculty.getName());
        payDetail.setFacultyId(faculty.getId());
        payDetail.setBasicPay(faculty.getBasicPay());
        payDetail.setType(faculty.getType());
        payDetail.setJob(faculty.getJob());
        payDetail.setTitle(faculty.getTitle());
        payDetail.setLivingSubsidy(faculty.getLivingSubsidy());
        payDetail.setReadingSubsidy(faculty.getReadingSubsidy());
        payDetail.setTransportationSubsidy(faculty.getTransportationSubsidy());
        payDetail.setWashingSubsidy(faculty.getWashingSubsidy());
        payDetail.setQuotaHours(faculty.getQuotaHour());
        //装填课时/工时数
        payDetail.setHours(affairService.countHoursByFacultyIdAndMonth(payDetail.getFacultyId(), payDetail.getMonth()));
        //装填本年度累计授课时数
        facultyYearlyService.updateHours(
                facultyYearlyService.selectFacultyYearlyByFacultyId(payDetail.getFacultyId()));
        payDetail.setTotalHours(facultyYearlyService.selectFacultyYearlyByFacultyId(payDetail.getFacultyId()).getHour());
        //装填上年度月平均工资
        payDetail.setAvgPay(facultyYearlyService.selectFacultyYearlyByFacultyId(payDetail.getFacultyId()).getAvgPay());
    }

    /**
     * 计算工资明细表
     *
     * @param payDetail 工资明细表
     */
    @Override
    public void calculatePayDetail(PayDetail payDetail) {
        //装填工资明细表
        fillPayDetail(payDetail);
        //计算（超额）课时费/岗位津贴
        calculateAffairPay(payDetail);
        //计算工资总额
        calculateTotalPay(payDetail);
        //计算个人所得税
        calculateTax(payDetail);
        //计算住房公积金
        calculateHousing(payDetail);
        //计算保险费
        calculateInsurance(payDetail);
        //计算实发工资
        calculateNetPay(payDetail);
        //更新工资明细表
        updatePayDetail(payDetail);
    }

    /**
     * 计算工资明细表
     *
     * @param list 工资明细表
     */
    @Override
    public void calculatePayDetail(List<PayDetail> list) {
        for (PayDetail payDetail : list) {
            calculatePayDetail(payDetail);
        }
    }

    /**
     * 计算教职工课时费及超额课时费及岗位津贴
     *
     * @param payDetail 工资明细表
     */
    @Override
    public void calculateAffairPay(PayDetail payDetail) {
        //计算教师课时费及超额课时费及岗位津贴
        if(payDetail.getType()==0)
        {
            //计算教师课时费
            payDetail.setTeacherPay(
                    payDetail.getHours() * FinancialConstants.TEACHER_PAY_PER_HOUR *
                            titleService.selectTitleById(payDetail.getTitle()).getFactor());
            //计算教师超额课时费
            if (payDetail.getMonth() == 12&& payDetail.getTotalHours()>payDetail.getQuotaHours()) {
                payDetail.setExtraTeacherPay(
                        (payDetail.getTotalHours() - payDetail.getQuotaHours()) * FinancialConstants.TEACHER_PAY_PER_HOUR *
                                titleService.selectTitleById(payDetail.getTitle()).getFactor()
                                * FinancialConstants.EXTRA_TEACHER_PAY_FACTOR
                );
            }
            else {
                payDetail.setExtraTeacherPay(0F);
            }
            //教师岗位津贴为0
            payDetail.setStaffPay(0F);
        }
        //计算职工岗位津贴及课时费及超额课时费
        else if(payDetail.getType()==1)
        {
            //计算职工岗位津贴
            payDetail.setStaffPay(
                    payDetail.getHours()* FinancialConstants.STAFF_PAY_PER_HOUR *
                            jobService.selectJobById(payDetail.getJob()).getFactor()
            );
            //职工课时费及超额课时费为0
            payDetail.setTeacherPay(0F);
            payDetail.setExtraTeacherPay(0F);
        }
    }

    /**
     * 计算教职工工资总额
     *
     * @param payDetail 工资明细表
     */
    @Override
    public void calculateTotalPay(PayDetail payDetail) {
        //工资总额：（基本工资、生活补贴、书报费、交通费、洗理费、课时费或岗位津贴）+超额课时费（12月）
        payDetail.setTotalPay(
                payDetail.getBasicPay()+
                        payDetail.getLivingSubsidy()+
                        payDetail.getReadingSubsidy()+
                        payDetail.getTransportationSubsidy()+
                        payDetail.getWashingSubsidy()+
                        payDetail.getTeacherPay()+
                        payDetail.getExtraTeacherPay()+
                        payDetail.getStaffPay()
        );
    }

    /**
     * 计算教职工个人所得税
     *
     * @param payDetail 工资明细表
     */
    @Override
    public void calculateTax(PayDetail payDetail) {
        //TODO:use Constants
        /*1、工资范围在1-5000元之间的，包括5000元，适用个人所得税税率为0%；
        2、工资范围在5000-8000元之间的，包括8000元，适用个人所得税税率为3%；
        3、工资范围在8000-17000元之间的，包括17000元，适用个人所得税税率为10%；
        4、工资范围在17000-30000元之间的，包括30000元，适用个人所得税税率为20%；
        5、工资范围在30000-40000元之间的，包括40000元，适用个人所得税税率为25%；
        6、工资范围在40000-60000元之间的，包括60000元，适用个人所得税税率为30%；
        7、工资范围在60000-85000元之间的，包括85000元，适用个人所得税税率为35%；
        8、工资范围在85000元以上的，适用个人所得税税率为45%。*/
        if (payDetail.getTotalPay() <= 5000) {
            payDetail.setTax(0F);
        } else if (payDetail.getTotalPay() > 5000 && payDetail.getTotalPay() <= 8000) {
            payDetail.setTax(
                    (payDetail.getTotalPay() - 5000) * 0.03F
            );
        } else if (payDetail.getTotalPay() > 8000 && payDetail.getTotalPay() <= 17000) {
            payDetail.setTax(
                    (payDetail.getTotalPay() - 8000) * 0.1F + 90F
            );
        } else if (payDetail.getTotalPay() > 17000 && payDetail.getTotalPay() <= 30000) {
            payDetail.setTax
                    ((payDetail.getTotalPay() - 17000) * 0.2F + 990F
                    );
        } else if (payDetail.getTotalPay() > 30000 && payDetail.getTotalPay() <= 40000) {
            payDetail.setTax(
                    (payDetail.getTotalPay() - 30000) * 0.25F + 3590F
            );
        } else if (payDetail.getTotalPay() > 40000 && payDetail.getTotalPay() <= 60000) {
            payDetail.setTax(
                    (payDetail.getTotalPay() - 40000) * 0.3F + 6090F
            );
        } else if (payDetail.getTotalPay() > 60000 && payDetail.getTotalPay() <= 85000) {
            payDetail.setTax(
                    (payDetail.getTotalPay() - 60000) * 0.35F + 12090F
            );
        } else if (payDetail.getTotalPay() > 85000) {
            payDetail.setTax(
                    (payDetail.getTotalPay() - 85000) * 0.45F + 20840F
            );
        }
    }

    /**
     * 计算教职工住房公积金
     *
     * @param payDetail 工资明细表
     */
    @Override
    public void calculateHousing(PayDetail payDetail) {
        /*职工住房公积金的月缴存额为职工本人上一年度月平均工资乘以职工住房公积金缴存比例。
        职工和单位住房公积金的缴存比例均不得低于职工上一年度月平均工资的5%。*/
        payDetail.setHousing(
                payDetail.getAvgPay() * FinancialConstants.HOUSING_FACTOR
        );
    }

    /**
     * 计算教职工保险费
     *
     * @param payDetail 工资明细表
     */
    @Override
    public void calculateInsurance(PayDetail payDetail) {
        //计算保险费，暂同住房公积金
        payDetail.setInsurance(
                payDetail.getAvgPay() * FinancialConstants.INSURANCE_FACTOR
        );
    }


    /**
     * 计算教职工实发工资
     *
     * @param payDetail 工资明细表
     */
    @Override
    public void calculateNetPay(PayDetail payDetail) {
        //实发工资：工资总额扣除个人所得税、住房公积金和保险费
        payDetail.setNetPay(
                payDetail.getTotalPay()-
                        payDetail.getTax()-
                        payDetail.getHousing()-
                        payDetail.getInsurance()
        );
    }
}
