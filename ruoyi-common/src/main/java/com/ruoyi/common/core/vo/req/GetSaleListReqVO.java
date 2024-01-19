package com.ruoyi.common.core.vo.req;

import javax.validation.constraints.NotNull;

public class GetSaleListReqVO {

    @NotNull(message = "页数不能为空")
    private Integer pageNumber;

    @NotNull(message = "每页显示件数不能为空")
    private Integer pageRowCount;

    /** 卖币金额 */
    private Float saleAmountFrom;

    /** 卖币金额 */
    private Float saleAmountTo;

    /** 卖币拆分类型（0不拆分 1拆分） */
    private String saleSplitType;

    /** 支持支付类型 */
    private String supportBuyType;

    public Float getSaleAmountFrom() {
        return saleAmountFrom;
    }

    public void setSaleAmountFrom(Float saleAmountFrom) {
        this.saleAmountFrom = saleAmountFrom;
    }

    public Float getSaleAmountTo() {
        return saleAmountTo;
    }

    public void setSaleAmountTo(Float saleAmountTo) {
        this.saleAmountTo = saleAmountTo;
    }

    public String getSaleSplitType() {
        return saleSplitType;
    }

    public void setSaleSplitType(String saleSplitType) {
        this.saleSplitType = saleSplitType;
    }

    public String getSupportBuyType() {
        return supportBuyType;
    }

    public void setSupportBuyType(String supportBuyType) {
        this.supportBuyType = supportBuyType;
    }

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
}
