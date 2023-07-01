package com.ruoyi.project.financial.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 工资明细表对象 faculty_monthly
 *
 * @author Keven
 * @date 2023-05-31
 */
public class PayDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 教职工编号 */
    @Excel(name = "教职工编号")
    private Long facultyId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 月份 */
    @Excel(name = "月份")
    private Long month;

    /** 基本工资 */
    @Excel(name = "基本工资")
    private Float basicPay;

    /** 教师/职工 */
    private Long type;

    /** 职务 */
    @Excel(name = "职务")
    private Long job;

    /** 职称 */
    @Excel(name = "职称")
    private Long title;

    /** 生活补贴 */
    @Excel(name = "生活补贴")
    private Float livingSubsidy;

    /** 书报费 */
    @Excel(name = "书报费")
    private Float readingSubsidy;

    /** 交通费 */
    @Excel(name = "交通费")
    private Float transportationSubsidy;

    /** 洗理费 */
    @Excel(name = "洗理费")
    private Float washingSubsidy;

    /** 课时/工时数 */
    private Float Hours;

    /** 课时费 */
    @Excel(name = "课时费")
    private Float teacherPay;

    /** 岗位津贴 */
    @Excel(name = "岗位津贴")
    private Float staffPay;

    /** 额定课时数 */
    private Float quotaHours;

    /** 本年度累计授课时数 */
    private Float totalHours;

    /** 超额课时费（12月） */
    @Excel(name = "超额课时费")
    private Float extraTeacherPay;

    /** 工资总额 */
    @Excel(name = "工资总额")
    private Float totalPay;

    /** 个人所得税 */
    @Excel(name = "个人所得税")
    private Float tax;

    /** 上一年度月平均工资 */
    private Float AvgPay;

    /** 住房公积金 */
    @Excel(name = "住房公积金")
    private Float housing;//TODO: housingFund

    /** 保险费 */
    @Excel(name = "保险费")
    private Float insurance;

    /** 实发工资 */
    @Excel(name = "实发工资")
    private Float netPay;

    //constructor with no parameter
    public PayDetail() {
    }

    //constructor with facultyId and month
    public PayDetail(Long facultyId, Long month) {
        this.facultyId = facultyId;
        this.month = month;
    }

    //constructor with faculty and month
    public PayDetail(Faculty faculty, Long month) {
        this.facultyId = faculty.getId();
        this.name = faculty.getName();
        this.month = month;
    }

    //constuctor with faculty
    public PayDetail(Faculty faculty) {
        this.facultyId = faculty.getId();
        this.name = faculty.getName();
    }

    public void setFacultyId(Long facultyId)
    {
        this.facultyId = facultyId;
    }

    public Long getFacultyId()
    {
        return facultyId;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setMonth(Long month)
    {
        this.month = month;
    }

    public Long getMonth()
    {
        return month;
    }

    public void setBasicPay(Float basicPay)
    {
        this.basicPay = basicPay;
    }

    public Float getBasicPay()
    {
        return basicPay;
    }
    public void setType(Long type)
    {
        this.type = type;
    }
    public Long getType()
    {
        return type;
    }
    public void setJob(Long job)
    {
        this.job = job;
    }

    public Long getJob()
    {
        return job;
    }
    public void setTitle(Long title)
    {
        this.title = title;
    }

    public Long getTitle()
    {
        return title;
    }
    public void setLivingSubsidy(Float livingSubsidy)
    {
        this.livingSubsidy = livingSubsidy;
    }

    public Float getLivingSubsidy()
    {
        return livingSubsidy;
    }
    public void setReadingSubsidy(Float readingSubsidy)
    {
        this.readingSubsidy = readingSubsidy;
    }

    public Float getReadingSubsidy()
    {
        return readingSubsidy;
    }
    public void setTransportationSubsidy(Float transportationSubsidy)
    {
        this.transportationSubsidy = transportationSubsidy;
    }

    public Float getTransportationSubsidy()
    {
        return transportationSubsidy;
    }
    public void setWashingSubsidy(Float washingSubsidy)
    {
        this.washingSubsidy = washingSubsidy;
    }

    public Float getWashingSubsidy()
    {
        return washingSubsidy;
    }
    public void setHours(Float Hours)
    {
        this.Hours = Hours;
    }
    public Float getHours()
    {
        return Hours;
    }
    public void setTeacherPay(Float teacherPay)
    {
        this.teacherPay = teacherPay;
    }

    public Float getTeacherPay()
    {
        return teacherPay;
    }
    public void setStaffPay(Float staffPay)
    {
        this.staffPay = staffPay;
    }

    public Float getStaffPay()
    {
        return staffPay;
    }
    public void setQuotaHours(Float quotaHours)
    {
        this.quotaHours = quotaHours;
    }
    public Float getQuotaHours()
    {
        return quotaHours;
    }
    public void setTotalHours(Float totalHours)
    {
        this.totalHours = totalHours;
    }
    public Float getTotalHours()
    {
        return totalHours;
    }
    public void setExtraTeacherPay(Float extraTeacherPay)
    {
        this.extraTeacherPay = extraTeacherPay;
    }

    public Float getExtraTeacherPay()
    {
        return extraTeacherPay;
    }
    public void setTotalPay(Float totalPay)
    {
        this.totalPay = totalPay;
    }

    public Float getTotalPay()
    {
        return totalPay;
    }
    public void setTax(Float tax)
    {
        this.tax = tax;
    }

    public Float getTax()
    {
        return tax;
    }
    public void setAvgPay(Float AvgPay)
    {
        this.AvgPay = AvgPay;
    }
    public Float getAvgPay()
    {
        return AvgPay;
    }

    public void setHousing(Float housing)
    {
        this.housing = housing;
    }

    public Float getHousing()
    {
        return housing;
    }
    public void setInsurance(Float insurance)
    {
        this.insurance = insurance;
    }

    public Float getInsurance()
    {
        return insurance;
    }
    public void setNetPay(Float netPay)
    {
        this.netPay = netPay;
    }

    public Float getNetPay()
    {
        return netPay;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("facultyId", getFacultyId())
            .append("name", getName())
            .append("month", getMonth())
            .append("basicPay", getBasicPay())
            .append("job", getJob())
            .append("title", getTitle())
            .append("livingSubsidy", getLivingSubsidy())
            .append("readingSubsidy", getReadingSubsidy())
            .append("transportationSubsidy", getTransportationSubsidy())
            .append("washingSubsidy", getWashingSubsidy())
            .append("teacherPay", getTeacherPay())
            .append("staffPay", getStaffPay())
            .append("extraTeacherPay", getExtraTeacherPay())
            .append("totalPay", getTotalPay())
            .append("tax", getTax())
            .append("housing", getHousing())
            .append("insurance", getInsurance())
            .append("netPay", getNetPay())
            .toString();
    }
}
