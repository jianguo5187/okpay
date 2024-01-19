package com.ruoyi.common.core.vo.req;

public class BuyCoinReqVO {

    /** 卖币ID */
    private Long saleId;

    /** 支付方式（0支付宝 1微信 2银联） */
    private String buyType;

    /** 买币金额 */
    private Float buyAmount;

    private String createBy;

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Long getSaleId() {
        return saleId;
    }

    public void setSaleId(Long saleId) {
        this.saleId = saleId;
    }

    public String getBuyType() {
        return buyType;
    }

    public void setBuyType(String buyType) {
        this.buyType = buyType;
    }

    public Float getBuyAmount() {
        return buyAmount;
    }

    public void setBuyAmount(Float buyAmount) {
        this.buyAmount = buyAmount;
    }
}
