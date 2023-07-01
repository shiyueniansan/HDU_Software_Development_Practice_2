package com.rk.project.financial.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rk.framework.aspectj.lang.annotation.Excel;
import com.rk.framework.web.domain.BaseEntity;

/**
 * 工资表对象 faculty_monthly
 *
 * @author Keven
 * @date 2023-05-31
 */
public class Pay extends BaseEntity
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

    /** 实发工资 */
    @Excel(name = "实发工资")
    private Float netPay;

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
            .append("netPay", getNetPay())
            .toString();
    }
}
