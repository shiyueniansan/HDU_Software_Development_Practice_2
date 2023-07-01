package com.ruoyi.project.financial.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.financial.domain.PayDetail;
import com.ruoyi.project.financial.service.IPayDetailService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 工资明细表Controller
 *
 * @author Keven
 * @date 2023-05-31
 */
@RestController
@RequestMapping("/financial/payDetails")
public class PayDetailsController extends BaseController
{
    @Autowired
    private IPayDetailService payDetailService;

    /**
     * 查询工资明细表列表
     */
    @PreAuthorize("@ss.hasPermi('financial:payDetails:list')")
    @GetMapping("/list")
    public TableDataInfo list(PayDetail payDetail)
    {
        startPage();
        List<PayDetail> list = payDetailService.selectPayDetailList(payDetail);
        payDetailService.calculatePayDetail(list);
        return getDataTable(list);
    }

    /**
     * 导出工资明细表列表
     */
    @PreAuthorize("@ss.hasPermi('financial:payDetails:export')")
    @Log(title = "工资明细表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PayDetail payDetail)
    {
        List<PayDetail> list = payDetailService.selectPayDetailList(payDetail);
        payDetailService.calculatePayDetail(list);
        ExcelUtil<PayDetail> util = new ExcelUtil<PayDetail>(PayDetail.class);
        util.exportExcel(response, list, "工资明细表数据");
    }
}
