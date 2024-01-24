package com.ruoyi.common.core.vo.req;

public class RechargeToUserReqVO {

    /** 商户ID */
    private Long userId;

    /** 充值金额 */
    private Float rechargeAmount;

    private String createBy;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Float getRechargeAmount() {
        return rechargeAmount;
    }

    public void setRechargeAmount(Float rechargeAmount) {
        this.rechargeAmount = rechargeAmount;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
}
