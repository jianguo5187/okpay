package com.ruoyi.common.core.domain.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 卖币对象 sys_sale_coin
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
public class SysSaleCoin extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 卖币ID */
    private Long saleId;

    /** 卖币No */
    @Excel(name = "卖币No")
    private String saleNo;

    /** 卖币时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "卖币时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date saleTime;

    /** 卖币用户ID */
    @Excel(name = "卖币用户ID")
    private Long saleUserId;

    /** 卖币拆分类型（0不拆分 1拆分） */
    @Excel(name = "卖币拆分类型", readConverterExp = "0=不拆分,1=拆分")
    private String saleSplitType;

    /** 支持支付类型 */
    @Excel(name = "支持支付类型")
    private String supportBuyType;

    /** 卖币金额 */
    @Excel(name = "卖币金额")
    private Float saleAmount;

    /** 订单剩余金额 */
    @Excel(name = "订单剩余金额")
    private Float remainAmount;

    /** 卖币状态（0订单生产 1交易中 2已完成 9已取消） */
    @Excel(name = "卖币状态", readConverterExp = "0=订单生产,1=交易中,2=已完成,9=已取消")
    private String status;

    /** 加急状态（0否 1是） */
    @Excel(name = "加急销售", readConverterExp = "0=否,1=是")
    private String urgentSaleFlg;

    public void setSaleId(Long saleId) 
    {
        this.saleId = saleId;
    }

    public Long getSaleId() 
    {
        return saleId;
    }
    public void setSaleNo(String saleNo) 
    {
        this.saleNo = saleNo;
    }

    public String getSaleNo() 
    {
        return saleNo;
    }
    public void setSaleTime(Date saleTime) 
    {
        this.saleTime = saleTime;
    }

    public Date getSaleTime() 
    {
        return saleTime;
    }
    public void setSaleUserId(Long saleUserId) 
    {
        this.saleUserId = saleUserId;
    }

    public Long getSaleUserId() 
    {
        return saleUserId;
    }
    public void setSaleSplitType(String saleSplitType) 
    {
        this.saleSplitType = saleSplitType;
    }

    public String getSaleSplitType() 
    {
        return saleSplitType;
    }
    public void setSupportBuyType(String supportBuyType) 
    {
        this.supportBuyType = supportBuyType;
    }

    public String getSupportBuyType() 
    {
        return supportBuyType;
    }
    public void setSaleAmount(Float saleAmount)
    {
        this.saleAmount = saleAmount;
    }

    public Float getSaleAmount()
    {
        return saleAmount;
    }
    public void setRemainAmount(Float remainAmount)
    {
        this.remainAmount = remainAmount;
    }

    public Float getRemainAmount()
    {
        return remainAmount;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setUrgentSaleFlg(String urgentSaleFlg) 
    {
        this.urgentSaleFlg = urgentSaleFlg;
    }

    public String getUrgentSaleFlg() 
    {
        return urgentSaleFlg;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("saleId", getSaleId())
            .append("saleNo", getSaleNo())
            .append("saleTime", getSaleTime())
            .append("saleUserId", getSaleUserId())
            .append("saleSplitType", getSaleSplitType())
            .append("supportBuyType", getSupportBuyType())
            .append("saleAmount", getSaleAmount())
            .append("remainAmount", getRemainAmount())
            .append("status", getStatus())
            .append("urgentSaleFlg", getUrgentSaleFlg())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
