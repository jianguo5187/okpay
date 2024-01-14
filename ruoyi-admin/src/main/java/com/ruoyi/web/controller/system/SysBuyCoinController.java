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
import com.ruoyi.common.core.domain.entity.SysBuyCoin;
import com.ruoyi.system.service.ISysBuyCoinService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 买币Controller
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
@RestController
@RequestMapping("/system/buyCoin")
public class SysBuyCoinController extends BaseController
{
    @Autowired
    private ISysBuyCoinService sysBuyCoinService;

    /**
     * 查询买币列表
     */
    @PreAuthorize("@ss.hasPermi('system:buyCoin:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysBuyCoin sysBuyCoin)
    {
        startPage();
        List<SysBuyCoin> list = sysBuyCoinService.selectSysBuyCoinList(sysBuyCoin);
        return getDataTable(list);
    }

    /**
     * 导出买币列表
     */
    @PreAuthorize("@ss.hasPermi('system:buyCoin:export')")
    @Log(title = "买币", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysBuyCoin sysBuyCoin)
    {
        List<SysBuyCoin> list = sysBuyCoinService.selectSysBuyCoinList(sysBuyCoin);
        ExcelUtil<SysBuyCoin> util = new ExcelUtil<SysBuyCoin>(SysBuyCoin.class);
        util.exportExcel(response, list, "买币数据");
    }

    /**
     * 获取买币详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:buyCoin:query')")
    @GetMapping(value = "/{buyId}")
    public AjaxResult getInfo(@PathVariable("buyId") Long buyId)
    {
        return success(sysBuyCoinService.selectSysBuyCoinByBuyId(buyId));
    }

    /**
     * 新增买币
     */
    @PreAuthorize("@ss.hasPermi('system:buyCoin:add')")
    @Log(title = "买币", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysBuyCoin sysBuyCoin)
    {
        return toAjax(sysBuyCoinService.insertSysBuyCoin(sysBuyCoin));
    }

    /**
     * 修改买币
     */
    @PreAuthorize("@ss.hasPermi('system:buyCoin:edit')")
    @Log(title = "买币", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysBuyCoin sysBuyCoin)
    {
        return toAjax(sysBuyCoinService.updateSysBuyCoin(sysBuyCoin));
    }

    /**
     * 删除买币
     */
    @PreAuthorize("@ss.hasPermi('system:buyCoin:remove')")
    @Log(title = "买币", businessType = BusinessType.DELETE)
	@DeleteMapping("/{buyIds}")
    public AjaxResult remove(@PathVariable Long[] buyIds)
    {
        return toAjax(sysBuyCoinService.deleteSysBuyCoinByBuyIds(buyIds));
    }
}
