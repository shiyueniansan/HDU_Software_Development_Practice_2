package com.ruoyi.project.financial.service;

import java.util.List;
import com.ruoyi.project.financial.domain.Title;

/**
 * 职称Service接口
 *
 * @author Keven
 * @date 2023-05-30
 */
public interface ITitleService
{
    /**
     * 查询职称
     *
     * @param id 职称主键
     * @return 职称
     */
    public Title selectTitleById(Long id);

    /**
     * 查询职称列表
     *
     * @param title 职称
     * @return 职称集合
     */
    public List<Title> selectTitleList(Title title);

    /**
     * 新增职称
     *
     * @param title 职称
     * @return 结果
     */
    public int insertTitle(Title title);

    /**
     * 修改职称
     *
     * @param title 职称
     * @return 结果
     */
    public int updateTitle(Title title);

    /**
     * 批量删除职称
     *
     * @param ids 需要删除的职称主键集合
     * @return 结果
     */
    public int deleteTitleByIds(Long[] ids);

    /**
     * 删除职称信息
     *
     * @param id 职称主键
     * @return 结果
     */
    public int deleteTitleById(Long id);
}
