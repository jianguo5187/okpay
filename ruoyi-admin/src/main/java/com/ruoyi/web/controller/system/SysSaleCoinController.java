package com.ruoyi.web.controller.system;

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
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.core.domain.entity.SysSaleCoin;
import com.ruoyi.system.service.ISysSaleCoinService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 卖币Controller
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
@RestController
@RequestMapping("/system/saleCoin")
public class SysSaleCoinController extends BaseController
{
    @Autowired
    private ISysSaleCoinService sysSaleCoinService;

    /**
     * 查询卖币列表
     */
    @PreAuthorize("@ss.hasPermi('system:saleCoin:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysSaleCoin sysSaleCoin)
    {
        startPage();
        List<SysSaleCoin> list = sysSaleCoinService.selectSysSaleCoinList(sysSaleCoin);
        return getDataTable(list);
    }

    /**
     * 导出卖币列表
     */
    @PreAuthorize("@ss.hasPermi('system:saleCoin:export')")
    @Log(title = "卖币", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysSaleCoin sysSaleCoin)
    {
        List<SysSaleCoin> list = sysSaleCoinService.selectSysSaleCoinList(sysSaleCoin);
        ExcelUtil<SysSaleCoin> util = new ExcelUtil<SysSaleCoin>(SysSaleCoin.class);
        util.exportExcel(response, list, "卖币数据");
    }

    /**
     * 获取卖币详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:saleCoin:query')")
    @GetMapping(value = "/{saleId}")
    public AjaxResult getInfo(@PathVariable("saleId") Long saleId)
    {
        return success(sysSaleCoinService.selectSysSaleCoinBySaleId(saleId));
    }

    /**
     * 新增卖币
     */
    @PreAuthorize("@ss.hasPermi('system:saleCoin:add')")
    @Log(title = "卖币", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysSaleCoin sysSaleCoin)
    {
        return toAjax(sysSaleCoinService.insertSysSaleCoin(sysSaleCoin));
    }

    /**
     * 修改卖币
     */
    @PreAuthorize("@ss.hasPermi('system:saleCoin:edit')")
    @Log(title = "卖币", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysSaleCoin sysSaleCoin)
    {
        return toAjax(sysSaleCoinService.updateSysSaleCoin(sysSaleCoin));
    }

    /**
     * 删除卖币
     */
    @PreAuthorize("@ss.hasPermi('system:saleCoin:remove')")
    @Log(title = "卖币", businessType = BusinessType.DELETE)
	@DeleteMapping("/{saleIds}")
    public AjaxResult remove(@PathVariable Long[] saleIds)
    {
        return toAjax(sysSaleCoinService.deleteSysSaleCoinBySaleIds(saleIds));
    }
}
