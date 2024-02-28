package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.SysBuyCoin;
import com.ruoyi.common.core.vo.resp.BuyDetailInfoRespVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 买币Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
public interface SysBuyCoinMapper 
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
     * 删除买币
     * 
     * @param buyId 买币主键
     * @return 结果
     */
    public int deleteSysBuyCoinByBuyId(Long buyId);

    /**
     * 批量删除买币
     * 
     * @param buyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysBuyCoinByBuyIds(Long[] buyIds);

    public BuyDetailInfoRespVO getBuyDetailInfo(Long buyId);

    public List<BuyDetailInfoRespVO> getMyBuyList(@Param("userId") Long userId, @Param("status") String status, @Param("buyAmountFrom") Float buyAmountFrom, @Param("buyAmountTo") Float buyAmountTo, @Param("splitType") String splitType, @Param("buyType") String buyType, @Param("pageNumber") Integer pageNumber, @Param("pageRowCount") Integer pageRowCount);
    public List<BuyDetailInfoRespVO> getBuyListBySaleId(Long saleId);

    public SysBuyCoin selectsBuyCoinBySaleId(Long saleId);

    public List<BuyDetailInfoRespVO> selectShoppingBuyList(@Param("userId") Long userId, @Param("deptId") Long deptId, @Param("buyUserId") Long buyUserId, @Param("saleNo") String saleNo, @Param("status") String status, @Param("buyType") String buyType, @Param("startBuyTime") Date startBuyTime, @Param("endBuyTime") Date endBuyTime);

    public SysBuyCoin checkNofinishBuyInfoExist(Long userId);
}
