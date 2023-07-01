package com.rk.financial.mapper;

import java.util.List;
import com.rk.financial.domain.Title;

/**
 * 职称Mapper接口
 *
 * @author Keven
 * @date 2023-05-30
 */
public interface TitleMapper
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
     * 删除职称
     *
     * @param id 职称主键
     * @return 结果
     */
    public int deleteTitleById(Long id);

    /**
     * 批量删除职称
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTitleByIds(Long[] ids);
}
