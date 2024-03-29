package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.vo.req.BuyCoinReqVO;
import com.ruoyi.common.core.vo.req.SaleShoppingCoinReqVo;
import com.ruoyi.common.core.vo.req.ShoppingListReqVO;
import com.ruoyi.common.core.vo.resp.SaleDetailInfoRespVO;
import com.ruoyi.system.service.ISysDictTypeService;
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
    @Autowired
    private ISysDictTypeService dictTypeService;

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

    /**
     * 查询交易列表
     */
    @GetMapping("/shoppingList")
    public TableDataInfo shoppingList(ShoppingListReqVO vo)
    {
        startPage();
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        List<SaleDetailInfoRespVO> list = sysSaleCoinService.selectShoppingList(user.getUserId(), user.getDeptId(), vo);
        return getDataTable(list);
    }

    /**
     * 获取卖币详细信息
     */
    @GetMapping(value = "/shopping/{saleId}")
    public AjaxResult getShoppingInfo(@PathVariable("saleId") Long saleId)
    {
        AjaxResult ajax = AjaxResult.success();
        if(saleId != null && saleId != 0){
            ajax.put(AjaxResult.DATA_TAG, sysSaleCoinService.selectShoppingInfo(saleId));
        }
        ajax.put("payTypes", dictTypeService.selectDictDataByType("pay_type"));
        return ajax;
    }

    /**
     * 买币接口
     */
    @PostMapping("/shoppingCoinBuy")
    public AjaxResult shoppingCoinBuy(@RequestBody BuyCoinReqVO vo)
    {
//        AjaxResult ajax = AjaxResult.success();
//        return ajax;
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        vo.setCreateBy(getUsername());
        return toAjax(sysSaleCoinService.shoppingCoinBuy(user.getUserId(), vo));
    }

    /**
     * 新增卖币
     */
    @PostMapping("/saleShoppingCoin")
    public AjaxResult saleShoppingCoin(@RequestBody SaleShoppingCoinReqVo vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        vo.setCreateBy(getUsername());
        return toAjax(sysSaleCoinService.saleShoppingCoin(user.getUserId(), vo));
    }
}
