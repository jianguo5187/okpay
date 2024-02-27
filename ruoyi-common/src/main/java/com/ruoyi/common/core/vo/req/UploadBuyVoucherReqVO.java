package com.ruoyi.common.core.vo.req;

public class UploadBuyVoucherReqVO {

    /** 买币ID */
    private Long buyId;

    /** 支付凭证 */
    private String buyVoucher;

    private String updateBy;

    public Long getBuyId() {
        return buyId;
    }

    public void setBuyId(Long buyId) {
        this.buyId = buyId;
    }

    public String getBuyVoucher() {
        return buyVoucher;
    }

    public void setBuyVoucher(String buyVoucher) {
        this.buyVoucher = buyVoucher;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
}
