package com.ruoyi.common.core.domain.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 充值对象 sys_recharge
 * 
 * @author ruoyi
 * @date 2024-01-20
 */
public class SysRecharge extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 充值ID */
    private Long rechargeId;

    /** 充值用户ID */
    @Excel(name = "充值用户ID")
    private Long fromUserId;

    /** 被充值用户ID */
    @Excel(name = "被充值用户ID")
    private Long toUserId;

    /** 充值金额 */
    @Excel(name = "充值金额")
    private Float rechargeAmount;

    /** 充值时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "充值时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date rechargeTime;

    /** 充值方式（0支付宝 1微信 2银联） */
    @Excel(name = "充值方式", readConverterExp = "0=支付宝,1=微信,2=银联")
    private String rechargeType;

    /** 充值状态（0进行中 1已确认(充值完成) 9已取消） */
    @Excel(name = "充值状态", readConverterExp = "0=进行中,1=已确认(充值完成),9=已取消")
    private String status;

    public void setRechargeId(Long rechargeId) 
    {
        this.rechargeId = rechargeId;
    }

    public Long getRechargeId() 
    {
        return rechargeId;
    }
    public void setFromUserId(Long fromUserId) 
    {
        this.fromUserId = fromUserId;
    }

    public Long getFromUserId() 
    {
        return fromUserId;
    }
    public void setToUserId(Long toUserId) 
    {
        this.toUserId = toUserId;
    }

    public Long getToUserId() 
    {
        return toUserId;
    }
    public void setRechargeAmount(Float rechargeAmount)
    {
        this.rechargeAmount = rechargeAmount;
    }

    public Float getRechargeAmount()
    {
        return rechargeAmount;
    }
    public void setRechargeTime(Date rechargeTime) 
    {
        this.rechargeTime = rechargeTime;
    }

    public Date getRechargeTime() 
    {
        return rechargeTime;
    }
    public void setRechargeType(String rechargeType) 
    {
        this.rechargeType = rechargeType;
    }

    public String getRechargeType() 
    {
        return rechargeType;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("rechargeId", getRechargeId())
            .append("fromUserId", getFromUserId())
            .append("toUserId", getToUserId())
            .append("rechargeAmount", getRechargeAmount())
            .append("rechargeTime", getRechargeTime())
            .append("rechargeType", getRechargeType())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
