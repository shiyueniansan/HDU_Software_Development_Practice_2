package com.rk.project.financial.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rk.framework.aspectj.lang.annotation.Excel;
import com.rk.framework.web.domain.BaseEntity;

/**
 * 个人事务对象 affair
 *
 * @author Keven
 * @date 2023-05-31
 */
public class Affair extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 教职工编号 */
    @Excel(name = "教职工编号")
    private Long facultyId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 月份 */
    @Excel(name = "月份")
    private Long month;

    /** 描述 */
    @Excel(name = "描述")
    private String des;

    /** 时长 */
    @Excel(name = "时长")
    private Float hour;//TODO:Hours

    //constructor with no parameters
    public Affair() {
    }

    //constructor with facultyId, month
    public Affair(Long facultyId, Long month) {
        this.facultyId = facultyId;
        this.month = month;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
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
    public void setDes(String des)
    {
        this.des = des;
    }

    public String getDes()
    {
        return des;
    }
    public void setHour(Float hour)
    {
        this.hour = hour;
    }

    public Float getHour()
    {
        return hour;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("facultyId", getFacultyId())
            .append("name", getName())
            .append("month", getMonth())
            .append("des", getDes())
            .append("hour", getHour())
            .toString();
    }
}
