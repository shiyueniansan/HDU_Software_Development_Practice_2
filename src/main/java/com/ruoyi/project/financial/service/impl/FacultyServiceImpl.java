package com.ruoyi.project.financial.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.financial.mapper.FacultyMapper;
import com.ruoyi.project.financial.domain.Faculty;
import com.ruoyi.project.financial.service.IFacultyService;

/**
 * 教职工Service业务层处理
 *
 * @author Keven
 * @date 2023-05-30
 */
@Service
public class FacultyServiceImpl implements IFacultyService
{
    @Autowired
    private FacultyMapper facultyMapper;

    /**
     * 查询教职工
     *
     * @param id 教职工主键
     * @return 教职工
     */
    @Override
    public Faculty selectFacultyById(Long id)
    {
        return facultyMapper.selectFacultyById(id);
    }

    /**
     * 查询教职工列表
     *
     * @param faculty 教职工
     * @return 教职工
     */
    @Override
    public List<Faculty> selectFacultyList(Faculty faculty)
    {
        return facultyMapper.selectFacultyList(faculty);
    }

    /**
     * 新增教职工
     *
     * @param faculty 教职工
     * @return 结果
     */
    @Override
    public int insertFaculty(Faculty faculty)
    {
        return facultyMapper.insertFaculty(faculty);
    }

    /**
     * 修改教职工
     *
     * @param faculty 教职工
     * @return 结果
     */
    @Override
    public int updateFaculty(Faculty faculty)
    {
        return facultyMapper.updateFaculty(faculty);
    }

    /**
     * 批量删除教职工
     *
     * @param ids 需要删除的教职工主键
     * @return 结果
     */
    @Override
    public int deleteFacultyByIds(Long[] ids)
    {
        return facultyMapper.deleteFacultyByIds(ids);
    }

    /**
     * 删除教职工信息
     *
     * @param id 教职工主键
     * @return 结果
     */
    @Override
    public int deleteFacultyById(Long id)
    {
        return facultyMapper.deleteFacultyById(id);
    }
}
