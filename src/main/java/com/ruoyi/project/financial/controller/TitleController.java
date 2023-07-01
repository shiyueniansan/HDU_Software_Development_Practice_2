package com.ruoyi.project.financial.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.financial.domain.Title;
import com.ruoyi.project.financial.service.ITitleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 职称Controller
 *
 * @author Keven
 * @date 2023-05-30
 */
@RestController
@RequestMapping("/financial/title")
public class TitleController extends BaseController
{
    @Autowired
    private ITitleService titleService;

    /**
     * 查询职称列表
     */
    @PreAuthorize("@ss.hasPermi('financial:title:list')")
    @GetMapping("/list")
    public TableDataInfo list(Title title)
    {
        startPage();
        List<Title> list = titleService.selectTitleList(title);
        return getDataTable(list);
    }

    /**
     * 导出职称列表
     */
    @PreAuthorize("@ss.hasPermi('financial:title:export')")
    @Log(title = "职称", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Title title)
    {
        List<Title> list = titleService.selectTitleList(title);
        ExcelUtil<Title> util = new ExcelUtil<Title>(Title.class);
        util.exportExcel(response, list, "职称数据");
    }

    /**
     * 获取职称详细信息
     */
    @PreAuthorize("@ss.hasPermi('financial:title:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(titleService.selectTitleById(id));
    }

    /**
     * 新增职称
     */
    @PreAuthorize("@ss.hasPermi('financial:title:add')")
    @Log(title = "职称", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Title title)
    {
        return toAjax(titleService.insertTitle(title));
    }

    /**
     * 修改职称
     */
    @PreAuthorize("@ss.hasPermi('financial:title:edit')")
    @Log(title = "职称", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Title title)
    {
        return toAjax(titleService.updateTitle(title));
    }

    /**
     * 删除职称
     */
    @PreAuthorize("@ss.hasPermi('financial:title:remove')")
    @Log(title = "职称", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(titleService.deleteTitleByIds(ids));
    }
}
