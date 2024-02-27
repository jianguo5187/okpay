package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.vo.req.*;
import com.ruoyi.common.core.vo.resp.*;
import com.ruoyi.system.domain.SysNotice;

import java.util.List;

public interface ISysAppService {


    public UserAmountInfoRespVO getUserAmountInfo(Long userId);

    public int updatePayInfo(Long userId, UpdatePayInfoReqVO vo);
    public int updateUserInfo(Long userId, UpdateUserInfoReqVO vo);

    public Long parentMerchantUserId(Long userId);

    public Long addSaleCoin(Long userId, SaleCoinReqVO vo);

    public int updateSaleStatus(Long userId, UpdateSaleStatusReqVO vo);

    public SaleDetailInfoRespVO getSaleDetailInfo(Long saleId);
    
    public Float updateUserAmount(Long userId, String transactionRecordType, Long recordId, Float amount, String updateBy);

    public List<SaleDetailInfoRespVO> getSaleList(Long userId, Long deptId, GetSaleListReqVO vo);

    public List<SaleDetailInfoRespVO> getMySaleList(Long userId, GetMySaleListReqVO vo);

    public Long addBuyCoin(Long userId, BuyCoinReqVO vo);

    public int updateBuyStatus(Long userId, UpdateBuyStatusReqVO vo);

    public int uploadBuyVoucher(Long userId, UploadBuyVoucherReqVO vo);

    public BuyDetailInfoRespVO getBuyDetailInfo(Long buyId);

    public List<BuyDetailInfoRespVO> getMyBuyList(Long userId, GetMyBuyListReqVO vo);

    public Long addRechargeToMerchant(Long userId, RechargeToMerchantReqVO vo);

    public Long addRechargeToUser(Long userId, RechargeToUserReqVO vo);

    public int updateRechargeStatus(UpdateRechargeStatusReqVO vo);

    public RechargeDetailInfoRespVO getRechargeDetailInfo(Long rechargeId);

    public List<RechargeDetailInfoRespVO> getMyRechargeList(Long userId, GetMyRechargeListReqVO vo);

    public List<NoticeDetailInfoRespVO> getUserNoticeList(Long userId, GetNoticeListReqVO vo);

    public int updateNoticeReadStatus(Long userId, Long noticeId);

    public List<TransactionDetailInfoRespVO> getMyTransactionList(Long userId, GetMyTransactionListReqVO vo);

    public CashFlowRespVO getUserCashFlow(Long userId);
}
