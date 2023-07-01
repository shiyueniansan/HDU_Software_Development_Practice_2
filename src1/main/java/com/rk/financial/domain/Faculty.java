package com.rk.financial.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rk.framework.aspectj.lang.annotation.Excel;
import com.rk.framework.web.domain.BaseEntity;

/**
 * 教职工对象 faculty
 *
 * @author Keven
 * @date 2023-05-30
 */
public class Faculty extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 教师/职工 */
    @Excel(name = "教师/职工")
    private Long type;

    /** 职务 */
    @Excel(name = "职务")
    private Long job;

    /** 职称 */
    @Excel(name = "职称")
    private Long title;

    /** 基本工资 */
    @Excel(name = "基本工资")
    private Float basicPay;

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

    /** 定额课时 */
    @Excel(name = "定额课时")
    private Float quotaHour;//TODO:Hours

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setType(Long type)
    {
        this.type = type;
    }

    public Long getType()
    {
        return type;
    }
    public void setTitle(Long title)
    {
        this.title = title;
    }

    public Long getTitle()
    {
        return title;
    }
    public void setJob(Long job)
    {
        this.job = job;
    }

    public Long getJob()
    {
        return job;
    }
    public void setBasicPay(Float basicPay)
    {
        this.basicPay = basicPay;
    }

    public Float getBasicPay()
    {
        return basicPay;
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
    public void setQuotaHour(Float quotaHour)
    {
        this.quotaHour = quotaHour;
    }

    public Float getQuotaHour()
    {
        return quotaHour;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("type", getType())
            .append("title", getTitle())
            .append("job", getJob())
            .append("basicPay", getBasicPay())
            .append("livingSubsidy", getLivingSubsidy())
            .append("readingSubsidy", getReadingSubsidy())
            .append("transportationSubsidy", getTransportationSubsidy())
            .append("washingSubsidy", getWashingSubsidy())
            .append("quotaHour", getQuotaHour())
            .toString();
    }
}
