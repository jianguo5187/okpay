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
import com.ruoyi.common.core.domain.entity.SysRecharge;
import com.ruoyi.system.service.ISysRechargeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 充值Controller
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
@RestController
@RequestMapping("/system/recharge")
public class SysRechargeController extends BaseController
{
    @Autowired
    private ISysRechargeService sysRechargeService;

    /**
     * 查询充值列表
     */
    @PreAuthorize("@ss.hasPermi('system:recharge:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysRecharge sysRecharge)
    {
        startPage();
        List<SysRecharge> list = sysRechargeService.selectSysRechargeList(sysRecharge);
        return getDataTable(list);
    }

    /**
     * 导出充值列表
     */
    @PreAuthorize("@ss.hasPermi('system:recharge:export')")
    @Log(title = "充值", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysRecharge sysRecharge)
    {
        List<SysRecharge> list = sysRechargeService.selectSysRechargeList(sysRecharge);
        ExcelUtil<SysRecharge> util = new ExcelUtil<SysRecharge>(SysRecharge.class);
        util.exportExcel(response, list, "充值数据");
    }

    /**
     * 获取充值详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:recharge:query')")
    @GetMapping(value = "/{rechargeId}")
    public AjaxResult getInfo(@PathVariable("rechargeId") Long rechargeId)
    {
        return success(sysRechargeService.selectSysRechargeByRechargeId(rechargeId));
    }

    /**
     * 新增充值
     */
    @PreAuthorize("@ss.hasPermi('system:recharge:add')")
    @Log(title = "充值", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysRecharge sysRecharge)
    {
        return toAjax(sysRechargeService.insertSysRecharge(sysRecharge));
    }

    /**
     * 修改充值
     */
    @PreAuthorize("@ss.hasPermi('system:recharge:edit')")
    @Log(title = "充值", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysRecharge sysRecharge)
    {
        return toAjax(sysRechargeService.updateSysRecharge(sysRecharge));
    }

    /**
     * 删除充值
     */
    @PreAuthorize("@ss.hasPermi('system:recharge:remove')")
    @Log(title = "充值", businessType = BusinessType.DELETE)
	@DeleteMapping("/{rechargeIds}")
    public AjaxResult remove(@PathVariable Long[] rechargeIds)
    {
        return toAjax(sysRechargeService.deleteSysRechargeByRechargeIds(rechargeIds));
    }
}
