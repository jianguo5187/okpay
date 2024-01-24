package com.ruoyi.common.core.vo.resp;

public class UserTransactionTotalRespVO {


    /** 交易用户ID */
    private Long userId;

    /** 交易用户昵称 */
    private String userNickName;

    /** 交易总金额 */
    private Float recordAmount;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }

    public Float getRecordAmount() {
        return recordAmount;
    }

    public void setRecordAmount(Float recordAmount) {
        this.recordAmount = recordAmount;
    }
}
