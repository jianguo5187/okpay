package com.ruoyi.common.core.vo.req;

public class GetMyBuyListReqVO {

    /** 页数 */
    private Integer pageNumber;

    /** 每页件数 */
    private Integer pageRowCount;

    /** 买币金额 */
    private Float buyAmountFrom;

    /** 买币金额 */
    private Float buyAmountTo;

    /** 拆分类型（0不拆分 1拆分） */
    private String splitType;

    /** 支付方式（0支付宝 1微信 2银联） */
    private String buyType;

    /** 买币状态（0进行中 1买家已付款 2卖家已确认(买币完成) 3卖家已确认 9已取消） */
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

    public Float getBuyAmountFrom() {
        return buyAmountFrom;
    }

    public void setBuyAmountFrom(Float buyAmountFrom) {
        this.buyAmountFrom = buyAmountFrom;
    }

    public Float getBuyAmountTo() {
        return buyAmountTo;
    }

    public void setBuyAmountTo(Float buyAmountTo) {
        this.buyAmountTo = buyAmountTo;
    }

    public String getSplitType() {
        return splitType;
    }

    public void setSplitType(String splitType) {
        this.splitType = splitType;
    }

    public String getBuyType() {
        return buyType;
    }

    public void setBuyType(String buyType) {
        this.buyType = buyType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
