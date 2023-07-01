package com.ruoyi.project.financial.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.financial.mapper.TitleMapper;
import com.ruoyi.project.financial.domain.Title;
import com.ruoyi.project.financial.service.ITitleService;

/**
 * 职称Service业务层处理
 *
 * @author Keven
 * @date 2023-05-30
 */
@Service
public class TitleServiceImpl implements ITitleService
{
    @Autowired
    private TitleMapper titleMapper;

    /**
     * 查询职称
     *
     * @param id 职称主键
     * @return 职称
     */
    @Override
    public Title selectTitleById(Long id)
    {
        return titleMapper.selectTitleById(id);
    }

    /**
     * 查询职称列表
     *
     * @param title 职称
     * @return 职称
     */
    @Override
    public List<Title> selectTitleList(Title title)
    {
        return titleMapper.selectTitleList(title);
    }

    /**
     * 新增职称
     *
     * @param title 职称
     * @return 结果
     */
    @Override
    public int insertTitle(Title title)
    {
        return titleMapper.insertTitle(title);
    }

    /**
     * 修改职称
     *
     * @param title 职称
     * @return 结果
     */
    @Override
    public int updateTitle(Title title)
    {
        return titleMapper.updateTitle(title);
    }

    /**
     * 批量删除职称
     *
     * @param ids 需要删除的职称主键
     * @return 结果
     */
    @Override
    public int deleteTitleByIds(Long[] ids)
    {
        return titleMapper.deleteTitleByIds(ids);
    }

    /**
     * 删除职称信息
     *
     * @param id 职称主键
     * @return 结果
     */
    @Override
    public int deleteTitleById(Long id)
    {
        return titleMapper.deleteTitleById(id);
    }
}
