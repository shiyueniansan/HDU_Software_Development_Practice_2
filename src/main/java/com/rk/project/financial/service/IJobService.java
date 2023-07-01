package com.rk.project.financial.service;

import java.util.List;
import com.rk.project.financial.domain.Job;

/**
 * 职务Service接口
 *
 * @author Keven
 * @date 2023-05-31
 */
public interface IJobService
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
     * 批量删除职务
     *
     * @param ids 需要删除的职务主键集合
     * @return 结果
     */
    public int deleteJobByIds(Long[] ids);

    /**
     * 删除职务信息
     *
     * @param id 职务主键
     * @return 结果
     */
    public int deleteJobById(Long id);
}
