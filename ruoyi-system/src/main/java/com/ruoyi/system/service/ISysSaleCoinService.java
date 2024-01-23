package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SysSaleCoin;
import com.ruoyi.common.core.vo.req.BuyCoinReqVO;
import com.ruoyi.common.core.vo.req.SaleShoppingCoinReqVo;
import com.ruoyi.common.core.vo.req.ShoppingListReqVO;
import com.ruoyi.common.core.vo.resp.SaleDetailInfoRespVO;

/**
 * 卖币Service接口
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
public interface ISysSaleCoinService 
{
    /**
     * 查询卖币
     * 
     * @param saleId 卖币主键
     * @return 卖币
     */
    public SysSaleCoin selectSysSaleCoinBySaleId(Long saleId);

    /**
     * 查询卖币列表
     * 
     * @param sysSaleCoin 卖币
     * @return 卖币集合
     */
    public List<SysSaleCoin> selectSysSaleCoinList(SysSaleCoin sysSaleCoin);

    /**
     * 新增卖币
     * 
     * @param sysSaleCoin 卖币
     * @return 结果
     */
    public int insertSysSaleCoin(SysSaleCoin sysSaleCoin);

    /**
     * 修改卖币
     * 
     * @param sysSaleCoin 卖币
     * @return 结果
     */
    public int updateSysSaleCoin(SysSaleCoin sysSaleCoin);

    /**
     * 批量删除卖币
     * 
     * @param saleIds 需要删除的卖币主键集合
     * @return 结果
     */
    public int deleteSysSaleCoinBySaleIds(Long[] saleIds);

    /**
     * 删除卖币信息
     * 
     * @param saleId 卖币主键
     * @return 结果
     */
    public int deleteSysSaleCoinBySaleId(Long saleId);

    public List<SaleDetailInfoRespVO> selectShoppingList(Long userId, Long deptId, ShoppingListReqVO vo);

    public SaleDetailInfoRespVO selectShoppingInfo(Long saleId);

    public int shoppingCoinBuy(Long userId, BuyCoinReqVO vo);

    public int saleShoppingCoin(Long userId, SaleShoppingCoinReqVo vo);
}
