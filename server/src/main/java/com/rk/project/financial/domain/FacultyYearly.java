package com.rk.project.financial.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rk.framework.aspectj.lang.annotation.Excel;
import com.rk.framework.web.domain.BaseEntity;

/**
 * 教职工年度对象 faculty_yearly
 *
 * @author Keven
 * @date 2023-05-31
 */
public class FacultyYearly extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 教职工编号 */
    @Excel(name = "教职工编号")
    private Long facultyId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 本年度累计工资总额 */
    @Excel(name = "本年度累计工资总额")
    private Float totalPay;

    /** 本年度累计授课时数 */
    @Excel(name = "本年度累计授课时数")
    private Float hour;//TODO:Hours

    /** 上年度月平均工资 */
    @Excel(name = "上年度月平均工资")
    private Float avgPay;

    /** 本年度累计实发工资 */
    @Excel(name = "本年度累计实发工资")
    private Float netPay;

    //constructor with facultyId and name
    public FacultyYearly(Long facultyId, String name) {
        this.facultyId = facultyId;
        this.name = name;
    }

    //constructor with faculty
    public FacultyYearly(Faculty faculty) {
        this.facultyId = faculty.getId();
        this.name = faculty.getName();
    }

    //constructor with no parameters
    public FacultyYearly() {
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
    public void setTotalPay(Float totalPay)
    {
        this.totalPay = totalPay;
    }

    public Float getTotalPay()
    {
        return totalPay;
    }
    public void setHour(Float hour)
    {
        this.hour = hour;
    }

    public Float getHour()
    {
        return hour;
    }
    public void setAvgPay(Float avgPay)
    {
        this.avgPay = avgPay;
    }

    public Float getAvgPay()
    {
        return avgPay;
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
            .append("totalPay", getTotalPay())
            .append("hour", getHour())
            .append("avgPay", getAvgPay())
            .append("netPay", getNetPay())
            .toString();
    }
}
