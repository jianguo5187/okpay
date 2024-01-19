package com.ruoyi.common.core.vo.req;

public class UpdateBuyStatusReqVO {

    /** 买币ID */
    private Long buyId;

    /** 买币状态（0进行中 1买家已付款 2卖家已确认(买币完成) 9已取消） */
    private String status;

    private String updateBy;

    public Long getBuyId() {
        return buyId;
    }

    public void setBuyId(Long buyId) {
        this.buyId = buyId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
}
