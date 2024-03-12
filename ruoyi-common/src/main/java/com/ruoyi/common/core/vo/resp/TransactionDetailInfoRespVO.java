package com.ruoyi.common.core.vo.resp;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class TransactionDetailInfoRespVO {

    /** 记录ID */
    private Long recordId;

    /** 交易用户ID */
    private Long userId;

    /** 交易时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date recordTime;

    /** 交易类型（0买币 1卖币 2商家直充 3代理充值 4充值到商户(提现) 5手续费） */
    private String recordType;

    /** 买币ID */
    private Long buyId;

    /** 卖币ID */
    private Long saleId;

    /** 充值ID */
    private Long rechargeId;

    /** 交易金额 */
    private Float recordAmount;

    /** 交易金额 */
    private Float saleRemainAmount;

    /** 交易后余额 */
    private Float userRemainAmount;

    /** 记录状态（0正常 1取消） */
    private String status;

    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Date recordTime) {
        this.recordTime = recordTime;
    }

    public String getRecordType() {
        return recordType;
    }

    public void setRecordType(String recordType) {
        this.recordType = recordType;
    }

    public Long getBuyId() {
        return buyId;
    }

    public void setBuyId(Long buyId) {
        this.buyId = buyId;
    }

    public Long getSaleId() {
        return saleId;
    }

    public void setSaleId(Long saleId) {
        this.saleId = saleId;
    }

    public Long getRechargeId() {
        return rechargeId;
    }

    public void setRechargeId(Long rechargeId) {
        this.rechargeId = rechargeId;
    }

    public Float getRecordAmount() {
        return recordAmount;
    }

    public void setRecordAmount(Float recordAmount) {
        this.recordAmount = recordAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Float getSaleRemainAmount() {
        return saleRemainAmount;
    }

    public void setSaleRemainAmount(Float saleRemainAmount) {
        this.saleRemainAmount = saleRemainAmount;
    }

    public Float getUserRemainAmount() {
        return userRemainAmount;
    }

    public void setUserRemainAmount(Float userRemainAmount) {
        this.userRemainAmount = userRemainAmount;
    }
}
