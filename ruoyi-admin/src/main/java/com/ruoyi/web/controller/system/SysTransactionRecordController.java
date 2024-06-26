package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysTransactionRecord;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.vo.resp.UserTransactionDetailInfoRespVO;
import com.ruoyi.common.core.vo.resp.UserTransactionTotalRespVO;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
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
import com.ruoyi.system.service.ISysTransactionRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 交易记录Controller
 * 
 * @author ruoyi
 * @date 2024-01-19
 */
@RestController
@RequestMapping("/system/transactionRecord")
public class SysTransactionRecordController extends BaseController
{
    @Autowired
    private ISysTransactionRecordService sysTransactionRecordService;

    /**
     * 查询交易记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:transactionRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysTransactionRecord sysTransactionRecord)
    {
        startPage();
        if(StringUtils.equals(sysTransactionRecord.getTransactionFlg(),"1")){
            SysUser user = SecurityUtils.getLoginUser().getUser();
            sysTransactionRecord.setDeptId(user.getDeptId());
        }
        List<SysTransactionRecord> list = sysTransactionRecordService.selectSysTransactionRecordList(sysTransactionRecord);
        return getDataTable(list);
    }

    /**
     * 导出交易记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:transactionRecord:export')")
    @Log(title = "交易记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysTransactionRecord sysTransactionRecord)
    {
        List<SysTransactionRecord> list = sysTransactionRecordService.selectSysTransactionRecordList(sysTransactionRecord);
        ExcelUtil<SysTransactionRecord> util = new ExcelUtil<SysTransactionRecord>(SysTransactionRecord.class);
        util.exportExcel(response, list, "交易记录数据");
    }

    /**
     * 获取交易记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:transactionRecord:query')")
    @GetMapping(value = "/{recordId}")
    public AjaxResult getInfo(@PathVariable("recordId") Long recordId)
    {
        return success(sysTransactionRecordService.selectSysTransactionRecordByRecordId(recordId));
    }

    /**
     * 新增交易记录
     */
    @PreAuthorize("@ss.hasPermi('system:transactionRecord:add')")
    @Log(title = "交易记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysTransactionRecord sysTransactionRecord)
    {
        return toAjax(sysTransactionRecordService.insertSysTransactionRecord(sysTransactionRecord));
    }

    /**
     * 修改交易记录
     */
    @PreAuthorize("@ss.hasPermi('system:transactionRecord:edit')")
    @Log(title = "交易记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysTransactionRecord sysTransactionRecord)
    {
        return toAjax(sysTransactionRecordService.updateSysTransactionRecord(sysTransactionRecord));
    }

    /**
     * 删除交易记录
     */
    @PreAuthorize("@ss.hasPermi('system:transactionRecord:remove')")
    @Log(title = "交易记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {
        return toAjax(sysTransactionRecordService.deleteSysTransactionRecordByRecordIds(recordIds));
    }

    /**
     * 查询交易记录列表
     */
    @GetMapping("/userTransactionlist")
    public TableDataInfo userTransactionlist(SysTransactionRecord sysTransactionRecord)
    {
        startPage();
        if(StringUtils.equals(sysTransactionRecord.getTransactionFlg(),"1")){
            SysUser user = SecurityUtils.getLoginUser().getUser();
            sysTransactionRecord.setDeptId(user.getDeptId());
        }
        List<UserTransactionTotalRespVO> list = sysTransactionRecordService.selectUserTransactionlist(sysTransactionRecord);
        return getDataTable(list);
    }

    /**
     * 用户交易合计金额
     */
    @GetMapping(value = "/getUserTotalAmount")
    public AjaxResult getUserTotalAmount(SysTransactionRecord sysTransactionRecord)
    {
        AjaxResult ajax = AjaxResult.success();
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(StringUtils.equals(sysTransactionRecord.getTransactionFlg(),"1")){
            sysTransactionRecord.setDeptId(user.getDeptId());
        }

        List<UserTransactionDetailInfoRespVO> list = sysTransactionRecordService.selectUserTransactionMoneyList(sysTransactionRecord);
        Float transactionTotalAmount = 0f;
        Float transactionInAmount = 0f;
        Float transactionOutAmount = 0f;
        for(UserTransactionDetailInfoRespVO userTransactionDetailInfo : list){
            transactionTotalAmount = transactionTotalAmount + userTransactionDetailInfo.getTransactionTotalAmount();
            transactionInAmount = transactionInAmount + userTransactionDetailInfo.getTransactionBuyAmount();
            transactionOutAmount = transactionOutAmount + userTransactionDetailInfo.getTransactionSaleAmount();
        }
        ajax.put("totalAmount",transactionTotalAmount);
        ajax.put("totalInAmount",transactionInAmount);
        ajax.put("totalOutAmount",transactionOutAmount);
        return ajax;
    }


    /**
     * 查询交易记录列表
     */
    @GetMapping("/listUserTransactionMoney")
    public TableDataInfo listUserTransactionMoney(SysTransactionRecord sysTransactionRecord)
    {
        startPage();
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(StringUtils.equals(sysTransactionRecord.getTransactionFlg(),"1")){
            sysTransactionRecord.setDeptId(user.getDeptId());
        }
        List<UserTransactionDetailInfoRespVO> list = sysTransactionRecordService.selectUserTransactionMoneyList(sysTransactionRecord);
        return getDataTable(list);
    }


    /**
     * 查询用户转账流水金额
     */
    @GetMapping(value = "/getUserRechargeTotalAmount")
    public AjaxResult getUserRechargeTotalAmount(SysTransactionRecord sysTransactionRecord)
    {
        AjaxResult ajax = AjaxResult.success();
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(StringUtils.equals(sysTransactionRecord.getTransactionFlg(),"1")){
            sysTransactionRecord.setDeptId(user.getDeptId());
        }

        List<UserTransactionDetailInfoRespVO> list = sysTransactionRecordService.selectUserRechargeTransactionMoneyList(sysTransactionRecord);
        Float transactionTotalAmount = 0f;
        Float transactionInAmount = 0f;
        Float transactionOutAmount = 0f;
        for(UserTransactionDetailInfoRespVO userTransactionDetailInfo : list){
            transactionTotalAmount = transactionTotalAmount + userTransactionDetailInfo.getTransactionTotalAmount();
            transactionInAmount = transactionInAmount + userTransactionDetailInfo.getTransactionBuyAmount();
            transactionOutAmount = transactionOutAmount + userTransactionDetailInfo.getTransactionSaleAmount();
        }
        ajax.put("totalAmount",transactionTotalAmount);
        ajax.put("totalInAmount",transactionInAmount);
        ajax.put("totalOutAmount",transactionOutAmount);
        return ajax;
    }


    /**
     * 查询转账流水交易记录列表
     */
    @GetMapping("/listUserRechargeTransactionMoney")
    public TableDataInfo listUserRechargeTransactionMoney(SysTransactionRecord sysTransactionRecord)
    {
        startPage();
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(StringUtils.equals(sysTransactionRecord.getTransactionFlg(),"1")){
            sysTransactionRecord.setDeptId(user.getDeptId());
        }
        List<UserTransactionDetailInfoRespVO> list = sysTransactionRecordService.selectUserRechargeTransactionMoneyList(sysTransactionRecord);
        return getDataTable(list);
    }
}
