package com.ruoyi.common.core.vo.resp;

public class UserAmountInfoRespVO {

    /** 用户ID */
    private Long userId;

    /** 余额 */
    private Float amount;

    /** 可售金额 */
    private Float sellableAmount;

    /** 卖单余额 */
    private Float saleedAmount;

    /** 交易中 */
    private Float transactionAmount;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Float getAmount() {
        return amount;
    }

    public void setAmount(Float amount) {
        this.amount = amount;
    }

    public Float getSellableAmount() {
        return sellableAmount;
    }

    public void setSellableAmount(Float sellableAmount) {
        this.sellableAmount = sellableAmount;
    }

    public Float getSaleedAmount() {
        return saleedAmount;
    }

    public void setSaleedAmount(Float saleedAmount) {
        this.saleedAmount = saleedAmount;
    }

    public Float getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(Float transactionAmount) {
        this.transactionAmount = transactionAmount;
    }
}
