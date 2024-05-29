package com.ruoyi.common.core.vo.resp;

public class UserTransactionDetailInfoRespVO {

    /** 交易用户ID */
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 用户类型 */
    private String userType;

    /** 总流水金额 */
    private Float transactionTotalAmount;

    /** 买币流水金额 */
    private Float transactionBuyAmount;

    /** 卖币流水金额 */
    private Float transactionSaleAmount;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public Float getTransactionTotalAmount() {
        return transactionTotalAmount;
    }

    public void setTransactionTotalAmount(Float transactionTotalAmount) {
        this.transactionTotalAmount = transactionTotalAmount;
    }

    public Float getTransactionBuyAmount() {
        return transactionBuyAmount;
    }

    public void setTransactionBuyAmount(Float transactionBuyAmount) {
        this.transactionBuyAmount = transactionBuyAmount;
    }

    public Float getTransactionSaleAmount() {
        return transactionSaleAmount;
    }

    public void setTransactionSaleAmount(Float transactionSaleAmount) {
        this.transactionSaleAmount = transactionSaleAmount;
    }
}
