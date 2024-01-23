package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SysBuyCoin;
import com.ruoyi.common.core.vo.req.ShoppingBuyListReqVO;
import com.ruoyi.common.core.vo.resp.BuyDetailInfoRespVO;

/**
 * 买币Service接口
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
public interface ISysBuyCoinService 
{
    /**
     * 查询买币
     * 
     * @param buyId 买币主键
     * @return 买币
     */
    public SysBuyCoin selectSysBuyCoinByBuyId(Long buyId);

    /**
     * 查询买币列表
     * 
     * @param sysBuyCoin 买币
     * @return 买币集合
     */
    public List<SysBuyCoin> selectSysBuyCoinList(SysBuyCoin sysBuyCoin);

    /**
     * 新增买币
     * 
     * @param sysBuyCoin 买币
     * @return 结果
     */
    public int insertSysBuyCoin(SysBuyCoin sysBuyCoin);

    /**
     * 修改买币
     * 
     * @param sysBuyCoin 买币
     * @return 结果
     */
    public int updateSysBuyCoin(SysBuyCoin sysBuyCoin);

    /**
     * 批量删除买币
     * 
     * @param buyIds 需要删除的买币主键集合
     * @return 结果
     */
    public int deleteSysBuyCoinByBuyIds(Long[] buyIds);

    /**
     * 删除买币信息
     * 
     * @param buyId 买币主键
     * @return 结果
     */
    public int deleteSysBuyCoinByBuyId(Long buyId);

    public List<BuyDetailInfoRespVO> selectShoppingBuyList(Long userId, Long deptId, ShoppingBuyListReqVO vo);
}
