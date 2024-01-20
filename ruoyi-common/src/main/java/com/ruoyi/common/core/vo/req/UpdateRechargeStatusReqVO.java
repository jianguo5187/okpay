package com.ruoyi.common.core.vo.req;

public class UpdateRechargeStatusReqVO {

    /** 充值ID */
    private Long rechargeId;

    /** 充值状态（0进行中 1已确认(充值完成) 9已取消） */
    private String status;

    private String updateBy;

    public Long getRechargeId() {
        return rechargeId;
    }

    public void setRechargeId(Long rechargeId) {
        this.rechargeId = rechargeId;
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
