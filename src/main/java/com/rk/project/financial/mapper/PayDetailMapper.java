package com.rk.project.financial.mapper;

import java.util.List;
import com.rk.project.financial.domain.PayDetail;
import org.apache.ibatis.annotations.Param;

/**
 * 工资明细表Mapper接口
 *
 * @author Keven
 * @date 2023-05-30
 */
public interface PayDetailMapper
{
    /**
     * 查询工资明细表
     *
     * @param facultyId 工资明细表主键
     * @return 工资明细表
     */
    public PayDetail selectPayDetailByFacultyId(Long facultyId);

    /**
     * 查询工资明细表列表
     *
     * @param payDetail 工资明细表
     * @return 工资明细表集合
     */
    public List<PayDetail> selectPayDetailList(PayDetail payDetail);

    /**
     * 新增工资明细表
     *
     * @param payDetail 工资明细表
     * @return 结果
     */
    public int insertPayDetail(PayDetail payDetail);

    /**
     * 修改工资明细表
     *
     * @param payDetail 工资明细表
     * @return 结果
     */
    public int updatePayDetail(PayDetail payDetail);

    /**
     * 删除工资明细表
     *
     * @param facultyId 工资明细表主键
     * @return 结果
     */
    public int deletePayDetailByFacultyId(Long facultyId);

    /**
     * 批量删除工资明细表
     *
     * @param facultyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePayDetailByFacultyIds(Long[] facultyIds);

    /**
     * 根据教师id和月份查询工资明细表
     * @param facultyId
     * @param month
     * @return 工资明细表
     */
    public PayDetail selectPayDetailByFacultyIdAndMonth(@Param("facultyId") Long facultyId, @Param("month") Long month);
}
