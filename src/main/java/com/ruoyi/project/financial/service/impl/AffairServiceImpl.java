package com.ruoyi.project.financial.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.financial.mapper.AffairMapper;
import com.ruoyi.project.financial.domain.Affair;
import com.ruoyi.project.financial.service.IAffairService;

/**
 * 个人事务Service业务层处理
 *
 * @author Keven
 * @date 2023-05-31
 */
@Service
public class AffairServiceImpl implements IAffairService
{
    @Autowired
    private AffairMapper affairMapper;

    /**
     * 查询个人事务
     *
     * @param id 个人事务主键
     * @return 个人事务
     */
    @Override
    public Affair selectAffairById(Long id)
    {
        return affairMapper.selectAffairById(id);
    }

    /**
     * 查询个人事务列表
     *
     * @param affair 个人事务
     * @return 个人事务
     */
    @Override
    public List<Affair> selectAffairList(Affair affair)
    {
        return affairMapper.selectAffairList(affair);
    }

    /**
     * 新增个人事务
     *
     * @param affair 个人事务
     * @return 结果
     */
    @Override
    public int insertAffair(Affair affair)
    {
        return affairMapper.insertAffair(affair);
    }

    /**
     * 修改个人事务
     *
     * @param affair 个人事务
     * @return 结果
     */
    @Override
    public int updateAffair(Affair affair)
    {
        return affairMapper.updateAffair(affair);
    }

    /**
     * 批量删除个人事务
     *
     * @param ids 需要删除的个人事务主键
     * @return 结果
     */
    @Override
    public int deleteAffairByIds(Long[] ids)
    {
        return affairMapper.deleteAffairByIds(ids);
    }

    /**
     * 删除个人事务信息
     *
     * @param id 个人事务主键
     * @return 结果
     */
    @Override
    public int deleteAffairById(Long id)
    {
        return affairMapper.deleteAffairById(id);
    }

    /**
     * 根据facultyIds批量删除个人事务
     *
     * @param facultyIds 需要删除的个人事务facultyIds集合
     * @return 结果
     */
    @Override
    public int deleteAffairByFacultyIds(Long[] facultyIds) {
        return affairMapper.deleteAffairByFacultyIds(facultyIds);
    }

    /**
     * 根据facultyId更新个人事务的姓名
     *
     * @param facultyId 教职工编号
     * @param name 教职工姓名
     * @return 结果
     */
    @Override
    public int updateAffairNameByFacultyId(Long facultyId, String name) {
        return affairMapper.updateAffairNameByFacultyId(facultyId, name);
    }

    /**
     * 根据facultyId和month计算课时/工时
     *
     * @param facultyId 教职工编号
     * @return 结果
     */
    @Override
    public Float countHoursByFacultyIdAndMonth(Long facultyId, Long month) {
        Float hours = 0F;
        List<Affair> affairList = selectAffairList(new Affair(facultyId,month));
        for (Affair affair : affairList) {
            hours += affair.getHour();
        }
        return hours;
    }
}
