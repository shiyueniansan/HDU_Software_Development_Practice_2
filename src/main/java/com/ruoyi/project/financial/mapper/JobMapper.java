package com.ruoyi.project.financial.mapper;

import java.util.List;
import com.ruoyi.project.financial.domain.Job;

/**
 * 职务Mapper接口
 *
 * @author Keven
 * @date 2023-05-31
 */
public interface JobMapper
{
    /**
     * 查询职务
     *
     * @param id 职务主键
     * @return 职务
     */
    public Job selectJobById(Long id);

    /**
     * 查询职务列表
     *
     * @param job 职务
     * @return 职务集合
     */
    public List<Job> selectJobList(Job job);

    /**
     * 新增职务
     *
     * @param job 职务
     * @return 结果
     */
    public int insertJob(Job job);

    /**
     * 修改职务
     *
     * @param job 职务
     * @return 结果
     */
    public int updateJob(Job job);

    /**
     * 删除职务
     *
     * @param id 职务主键
     * @return 结果
     */
    public int deleteJobById(Long id);

    /**
     * 批量删除职务
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteJobByIds(Long[] ids);
}
