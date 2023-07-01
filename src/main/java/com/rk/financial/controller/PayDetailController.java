package com.rk.financial.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.rk.framework.aspectj.lang.annotation.Log;
import com.rk.framework.web.controller.BaseController;
import com.rk.framework.aspectj.lang.enums.BusinessType;
import com.rk.financial.domain.PayDetail;
import com.rk.financial.service.IPayDetailService;
import com.rk.common.utils.poi.ExcelUtil;
import com.rk.framework.web.page.TableDataInfo;

/**
 * 个人工资明细表Controller
 *
 * @author Keven
 * @date 2023-05-31
 */
@RestController
@RequestMapping("/financial/payDetail")
public class PayDetailController extends BaseController
{
    @Autowired
    private IPayDetailService payDetailService;

    /**
     * 查询个人工资明细表列表
     */
    @PreAuthorize("@ss.hasPermi('financial:payDetail:list')")
    @GetMapping("/list")
    public TableDataInfo list(PayDetail payDetail)
    {
        startPage();
        payDetail.setFacultyId(getLoginUser().getUser().getFacultyId());
        List<PayDetail> list = payDetailService.selectPayDetailList(payDetail);
        payDetailService.calculatePayDetail(list);
        return getDataTable(list);
    }

    /**
     * 导出个人工资明细表列表
     */
    @PreAuthorize("@ss.hasPermi('financial:payDetail:export')")
    @Log(title = "个人工资明细表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PayDetail payDetail)
    {
        payDetail.setFacultyId(getLoginUser().getUser().getFacultyId());
        List<PayDetail> list = payDetailService.selectPayDetailList(payDetail);
        payDetailService.calculatePayDetail(list);
        ExcelUtil<PayDetail> util = new ExcelUtil<PayDetail>(PayDetail.class);
        util.exportExcel(response, list, "个人工资明细表数据");
    }
}
