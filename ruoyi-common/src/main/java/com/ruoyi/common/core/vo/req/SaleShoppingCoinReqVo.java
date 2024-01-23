package com.ruoyi.common.core.vo.req;

public class SaleShoppingCoinReqVo {


    /** 卖币金额 */
    private Float saleAmount;

    /** 卖币拆分类型（0不拆分 1拆分） */
    private String saleSplitType;

    /** 支持支付类型 */
    private String supportBuyType;

    /** 支持支付类型 */
    private String[] supportBuyTypeArg;

    /** 加急状态（0否 1是） */
    private String urgentSaleFlg;

    private String createBy;

    public Float getSaleAmount() {
        return saleAmount;
    }

    public void setSaleAmount(Float saleAmount) {
        this.saleAmount = saleAmount;
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

    public String[] getSupportBuyTypeArg() {
        return supportBuyTypeArg;
    }

    public void setSupportBuyTypeArg(String[] supportBuyTypeArg) {
        this.supportBuyTypeArg = supportBuyTypeArg;
    }

    public String getUrgentSaleFlg() {
        return urgentSaleFlg;
    }

    public void setUrgentSaleFlg(String urgentSaleFlg) {
        this.urgentSaleFlg = urgentSaleFlg;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
}
