package com.rk.financial.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rk.financial.mapper.JobMapper;
import com.rk.financial.domain.Job;
import com.rk.financial.service.IJobService;

/**
 * 职务Service业务层处理
 *
 * @author Keven
 * @date 2023-05-31
 */
@Service
public class JobServiceImpl implements IJobService
{
    @Autowired
    private JobMapper jobMapper;

    /**
     * 查询职务
     *
     * @param id 职务主键
     * @return 职务
     */
    @Override
    public Job selectJobById(Long id)
    {
        return jobMapper.selectJobById(id);
    }

    /**
     * 查询职务列表
     *
     * @param job 职务
     * @return 职务
     */
    @Override
    public List<Job> selectJobList(Job job)
    {
        return jobMapper.selectJobList(job);
    }

    /**
     * 新增职务
     *
     * @param job 职务
     * @return 结果
     */
    @Override
    public int insertJob(Job job)
    {
        return jobMapper.insertJob(job);
    }

    /**
     * 修改职务
     *
     * @param job 职务
     * @return 结果
     */
    @Override
    public int updateJob(Job job)
    {
        return jobMapper.updateJob(job);
    }

    /**
     * 批量删除职务
     *
     * @param ids 需要删除的职务主键
     * @return 结果
     */
    @Override
    public int deleteJobByIds(Long[] ids)
    {
        return jobMapper.deleteJobByIds(ids);
    }

    /**
     * 删除职务信息
     *
     * @param id 职务主键
     * @return 结果
     */
    @Override
    public int deleteJobById(Long id)
    {
        return jobMapper.deleteJobById(id);
    }
}
