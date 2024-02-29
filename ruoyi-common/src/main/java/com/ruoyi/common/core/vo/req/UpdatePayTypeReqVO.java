package com.ruoyi.common.core.vo.req;

public class UpdatePayTypeReqVO {

    /** 承认ID */
    private Long payTypeApproveId;

    /** 帐号状态（0未审核 1审核成功 9否认） */
    private String status;

    private String updateBy;

	public Long getPayTypeApproveId() {
		return payTypeApproveId;
	}

	public void setPayTypeApproveId(Long payTypeApproveId) {
		this.payTypeApproveId = payTypeApproveId;
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
