package com.ruoyi.common.core.domain.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 买币对象 sys_buy_coin
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
public class SysBuyCoin extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 买币ID */
    private Long buyId;

    /** 卖币ID */
    @Excel(name = "卖币ID")
    private Long saleId;

    /** 卖币用户ID */
    @Excel(name = "卖币用户ID")
    private Long saleUserId;

    /** 买币用户ID */
    @Excel(name = "买币用户ID")
    private Long buyUserId;

    /** 买币时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "买币时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date buyTime;

    /** 支付方式（0支付宝 1微信 2银联） */
    @Excel(name = "支付方式", readConverterExp = "0=支付宝,1=微信,2=银联")
    private String buyType;

    /** 买币金额 */
    @Excel(name = "买币金额")
    private Float buyAmount;

    /** 买币状态（0进行中 1买家已付款 2卖家已确认(买币完成) 3卖家已确认 9已取消） */
    @Excel(name = "买币状态", readConverterExp = "0=进行中,1=买家已付款,2=卖家已确认(买币完成),9=已取消")
    private String status;

    /** 支付凭证 */
    private String buyVoucher;

    public void setBuyId(Long buyId) 
    {
        this.buyId = buyId;
    }

    public Long getBuyId() 
    {
        return buyId;
    }
    public void setSaleId(Long saleId) 
    {
        this.saleId = saleId;
    }

    public Long getSaleId() 
    {
        return saleId;
    }
    public void setSaleUserId(Long saleUserId) 
    {
        this.saleUserId = saleUserId;
    }

    public Long getSaleUserId() 
    {
        return saleUserId;
    }
    public void setBuyUserId(Long buyUserId) 
    {
        this.buyUserId = buyUserId;
    }

    public Long getBuyUserId() 
    {
        return buyUserId;
    }
    public void setBuyTime(Date buyTime) 
    {
        this.buyTime = buyTime;
    }

    public Date getBuyTime() 
    {
        return buyTime;
    }
    public void setBuyType(String buyType) 
    {
        this.buyType = buyType;
    }

    public String getBuyType() 
    {
        return buyType;
    }
    public void setBuyAmount(Float buyAmount)
    {
        this.buyAmount = buyAmount;
    }

    public Float getBuyAmount()
    {
        return buyAmount;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public String getBuyVoucher() {
        return buyVoucher;
    }

    public void setBuyVoucher(String buyVoucher) {
        this.buyVoucher = buyVoucher;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("buyId", getBuyId())
            .append("saleId", getSaleId())
            .append("saleUserId", getSaleUserId())
            .append("buyUserId", getBuyUserId())
            .append("buyTime", getBuyTime())
            .append("buyType", getBuyType())
            .append("buyAmount", getBuyAmount())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
