package com.rk.project.financial.controller;

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
import com.rk.framework.aspectj.lang.annotation.Log;
import com.rk.framework.web.controller.BaseController;
import com.rk.framework.web.domain.AjaxResult;
import com.rk.framework.aspectj.lang.enums.BusinessType;
import com.rk.project.financial.domain.Job;
import com.rk.project.financial.service.IJobService;
import com.rk.common.utils.poi.ExcelUtil;
import com.rk.framework.web.page.TableDataInfo;

/**
 * 职务Controller
 *
 * @author Keven
 * @date 2023-05-31
 */
@RestController
@RequestMapping("/financial/job")
public class JobController extends BaseController
{
    @Autowired
    private IJobService jobService;

    /**
     * 查询职务列表
     */
    @PreAuthorize("@ss.hasPermi('financial:job:list')")
    @GetMapping("/list")
    public TableDataInfo list(Job job)
    {
        startPage();
        List<Job> list = jobService.selectJobList(job);
        return getDataTable(list);
    }

    /**
     * 导出职务列表
     */
    @PreAuthorize("@ss.hasPermi('financial:job:export')")
    @Log(title = "职务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Job job)
    {
        List<Job> list = jobService.selectJobList(job);
        ExcelUtil<Job> util = new ExcelUtil<Job>(Job.class);
        util.exportExcel(response, list, "职务数据");
    }

    /**
     * 获取职务详细信息
     */
    @PreAuthorize("@ss.hasPermi('financial:job:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jobService.selectJobById(id));
    }

    /**
     * 新增职务
     */
    @PreAuthorize("@ss.hasPermi('financial:job:add')")
    @Log(title = "职务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Job job)
    {
        return toAjax(jobService.insertJob(job));
    }

    /**
     * 修改职务
     */
    @PreAuthorize("@ss.hasPermi('financial:job:edit')")
    @Log(title = "职务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Job job)
    {
        return toAjax(jobService.updateJob(job));
    }

    /**
     * 删除职务
     */
    @PreAuthorize("@ss.hasPermi('financial:job:remove')")
    @Log(title = "职务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jobService.deleteJobByIds(ids));
    }
}
