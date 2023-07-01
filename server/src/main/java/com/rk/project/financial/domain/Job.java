package com.rk.project.financial.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.rk.framework.aspectj.lang.annotation.Excel;
import com.rk.framework.web.domain.BaseEntity;

/**
 * 职务对象 job
 *
 * @author Keven
 * @date 2023-05-31
 */
public class Job extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 职务 */
    @Excel(name = "职务")
    private String des;

    /** 职务系数 */
    @Excel(name = "职务系数")
    private Float factor;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setDes(String des)
    {
        this.des = des;
    }

    public String getDes()
    {
        return des;
    }
    public void setFactor(Float factor)
    {
        this.factor = factor;
    }

    public Float getFactor()
    {
        return factor;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("des", getDes())
            .append("factor", getFactor())
            .toString();
    }
}
