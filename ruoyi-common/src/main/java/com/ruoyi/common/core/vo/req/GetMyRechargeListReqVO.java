package com.ruoyi.common.core.vo.req;

public class GetMyRechargeListReqVO {

    /** 页数 */
    private Integer pageNumber;

    /** 每页件数 */
    private Integer pageRowCount;

    /** 充值金额 */
    private Float rechargeAmountFrom;

    /** 充值金额 */
    private Float rechargeAmountTo;

    /** 充值方式（0支付宝 1微信 2银联） */
    private String rechargeType;

    /** 充值状态（0进行中 1已确认(充值完成) 9已取消） */
    private String status;

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getPageRowCount() {
        return pageRowCount;
    }

    public void setPageRowCount(Integer pageRowCount) {
        this.pageRowCount = pageRowCount;
    }

    public Float getRechargeAmountFrom() {
        return rechargeAmountFrom;
    }

    public void setRechargeAmountFrom(Float rechargeAmountFrom) {
        this.rechargeAmountFrom = rechargeAmountFrom;
    }

    public Float getRechargeAmountTo() {
        return rechargeAmountTo;
    }

    public void setRechargeAmountTo(Float rechargeAmountTo) {
        this.rechargeAmountTo = rechargeAmountTo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRechargeType() {
        return rechargeType;
    }

    public void setRechargeType(String rechargeType) {
        this.rechargeType = rechargeType;
    }
}
