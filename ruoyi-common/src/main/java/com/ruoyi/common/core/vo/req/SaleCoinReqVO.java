package com.ruoyi.common.core.vo.req;

import javax.validation.constraints.NotNull;

public class SaleCoinReqVO {


    /** 卖币拆分类型（0不拆分 1拆分） */
    @NotNull(message = "拆分类型不能为空")
    private String saleSplitType;

    /** 支持支付类型（0支付宝 1微信 2银联） */
    @NotNull(message = "支持支付方式不能为空")
    private String supportBuyType;

    /** 卖币金额 */
    @NotNull(message = "金额不能为空")
    private Float saleAmount;

    /** 加急状态（0否 1是） */
    @NotNull(message = "加急状态不能为空")
    private String urgentSaleFlg;

    private String createBy;

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
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

    public Float getSaleAmount() {
        return saleAmount;
    }

    public void setSaleAmount(Float saleAmount) {
        this.saleAmount = saleAmount;
    }

    public String getUrgentSaleFlg() {
        return urgentSaleFlg;
    }

    public void setUrgentSaleFlg(String urgentSaleFlg) {
        this.urgentSaleFlg = urgentSaleFlg;
    }
}
