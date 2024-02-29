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
import com.ruoyi.common.core.domain.entity.SysUserPayTypeApprove;
import com.ruoyi.system.service.ISysUserPayTypeApproveService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户支付方式审核Controller
 * 
 * @author ruoyi
 * @date 2024-02-29
 */
@RestController
@RequestMapping("/system/payApprove")
public class SysUserPayTypeApproveController extends BaseController
{
    @Autowired
    private ISysUserPayTypeApproveService sysUserPayTypeApproveService;

    /**
     * 查询用户支付方式审核列表
     */
    @PreAuthorize("@ss.hasPermi('system:payApprove:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysUserPayTypeApprove sysUserPayTypeApprove)
    {
        startPage();
        List<SysUserPayTypeApprove> list = sysUserPayTypeApproveService.selectSysUserPayTypeApproveList(sysUserPayTypeApprove);
        return getDataTable(list);
    }

    /**
     * 导出用户支付方式审核列表
     */
    @PreAuthorize("@ss.hasPermi('system:payApprove:export')")
    @Log(title = "用户支付方式审核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUserPayTypeApprove sysUserPayTypeApprove)
    {
        List<SysUserPayTypeApprove> list = sysUserPayTypeApproveService.selectSysUserPayTypeApproveList(sysUserPayTypeApprove);
        ExcelUtil<SysUserPayTypeApprove> util = new ExcelUtil<SysUserPayTypeApprove>(SysUserPayTypeApprove.class);
        util.exportExcel(response, list, "用户支付方式审核数据");
    }

    /**
     * 获取用户支付方式审核详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:payApprove:query')")
    @GetMapping(value = "/{payTypeApproveId}")
    public AjaxResult getInfo(@PathVariable("payTypeApproveId") Long payTypeApproveId)
    {
        return success(sysUserPayTypeApproveService.selectSysUserPayTypeApproveByPayTypeApproveId(payTypeApproveId));
    }

    /**
     * 新增用户支付方式审核
     */
    @PreAuthorize("@ss.hasPermi('system:payApprove:add')")
    @Log(title = "用户支付方式审核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserPayTypeApprove sysUserPayTypeApprove)
    {
        return toAjax(sysUserPayTypeApproveService.insertSysUserPayTypeApprove(sysUserPayTypeApprove));
    }

    /**
     * 修改用户支付方式审核
     */
    @PreAuthorize("@ss.hasPermi('system:payApprove:edit')")
    @Log(title = "用户支付方式审核", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserPayTypeApprove sysUserPayTypeApprove)
    {
        return toAjax(sysUserPayTypeApproveService.updateSysUserPayTypeApprove(sysUserPayTypeApprove));
    }

    /**
     * 删除用户支付方式审核
     */
    @PreAuthorize("@ss.hasPermi('system:payApprove:remove')")
    @Log(title = "用户支付方式审核", businessType = BusinessType.DELETE)
	@DeleteMapping("/{payTypeApproveIds}")
    public AjaxResult remove(@PathVariable Long[] payTypeApproveIds)
    {
        return toAjax(sysUserPayTypeApproveService.deleteSysUserPayTypeApproveByPayTypeApproveIds(payTypeApproveIds));
    }
}
