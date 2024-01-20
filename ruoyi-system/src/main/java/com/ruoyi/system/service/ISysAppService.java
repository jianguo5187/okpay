package com.ruoyi.system.service;

import com.ruoyi.common.core.vo.req.*;
import com.ruoyi.common.core.vo.resp.BuyDetailInfoRespVO;
import com.ruoyi.common.core.vo.resp.RechargeDetailInfoRespVO;
import com.ruoyi.common.core.vo.resp.SaleDetailInfoRespVO;

import java.util.List;

public interface ISysAppService {

    public Long parentMerchantUserId(Long userId);

    public Long addSaleCoin(Long userId, SaleCoinReqVO vo);

    public int updateSaleStatus(UpdateSaleStatusReqVO vo);

    public SaleDetailInfoRespVO getSaleDetailInfo(Long saleId);

    public List<SaleDetailInfoRespVO> getSaleList(Long userId, Long deptId, GetSaleListReqVO vo);

    public List<SaleDetailInfoRespVO> getMySaleList(Long userId, GetMySaleListReqVO vo);

    public Long addBuyCoin(Long userId, BuyCoinReqVO vo);

    public int updateBuyStatus(UpdateBuyStatusReqVO vo);

    public BuyDetailInfoRespVO getBuyDetailInfo(Long buyId);

    public List<BuyDetailInfoRespVO> getMyBuyList(Long userId, GetMyBuyListReqVO vo);

    public Long addRechargeToMerchant(Long userId, RechargeToMerchantReqVO vo);

    public int updateRechargeStatus(UpdateRechargeStatusReqVO vo);

    public RechargeDetailInfoRespVO getRechargeDetailInfo(Long rechargeId);

    public List<RechargeDetailInfoRespVO> getMyRechargeList(Long userId, GetMyRechargeListReqVO vo);
}
