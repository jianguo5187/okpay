package com.ruoyi.common.core.vo.req;

public class UpdateSaleStatusReqVO {


    /** 卖币ID */
    private Long saleId;

    /** 卖币状态（0订单生产 1交易中 2已完成 9已取消） */
    private String status;

    private String updateBy;

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Long getSaleId() {
        return saleId;
    }

    public void setSaleId(Long saleId) {
        this.saleId = saleId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
