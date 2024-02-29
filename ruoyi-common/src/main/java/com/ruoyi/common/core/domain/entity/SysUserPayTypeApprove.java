package com.ruoyi.common.core.domain.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户支付方式审核对象 sys_user_pay_type_approve
 * 
 * @author ruoyi
 * @date 2024-02-29
 */
public class SysUserPayTypeApprove extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 承认ID */
    private Long payTypeApproveId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 用户昵称 */
    private String nickName;

    /** 支付方式（0微信,1支付宝） */
    @Excel(name = "支付方式", readConverterExp = "0=微信,1支付宝")
    private String payType;

    /** 支付方式填充信息 */
    @Excel(name = "支付方式填充信息")
    private String payRemark;

    /** 收款码图片地址 */
    @Excel(name = "收款码图片地址")
    private String payImg;

    /** 帐号状态（0未审核 1审核成功 9否认） */
    @Excel(name = "帐号状态", readConverterExp = "0=未审核,1=审核成功,9=否认")
    private String status;

    /** 删除标志（0代表存在 1代表删除） */
    private String delFlag;

    /** 最后登录IP */
    @Excel(name = "最后登录IP")
    private String loginIp;

    /** 最后登录时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date loginDate;

    public void setPayTypeApproveId(Long payTypeApproveId) 
    {
        this.payTypeApproveId = payTypeApproveId;
    }

    public Long getPayTypeApproveId() 
    {
        return payTypeApproveId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setPayType(String payType) 
    {
        this.payType = payType;
    }

    public String getPayType() 
    {
        return payType;
    }
    public void setPayRemark(String payRemark) 
    {
        this.payRemark = payRemark;
    }

    public String getPayRemark() 
    {
        return payRemark;
    }
    public void setPayImg(String payImg) 
    {
        this.payImg = payImg;
    }

    public String getPayImg() 
    {
        return payImg;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    public void setLoginIp(String loginIp) 
    {
        this.loginIp = loginIp;
    }

    public String getLoginIp() 
    {
        return loginIp;
    }
    public void setLoginDate(Date loginDate) 
    {
        this.loginDate = loginDate;
    }

    public Date getLoginDate() 
    {
        return loginDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("payTypeApproveId", getPayTypeApproveId())
            .append("userId", getUserId())
            .append("payType", getPayType())
            .append("payRemark", getPayRemark())
            .append("payImg", getPayImg())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("loginIp", getLoginIp())
            .append("loginDate", getLoginDate())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
