package com.ruoyi.common.core.domain.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 交易记录对象 sys_transaction_record
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
public class SysTransactionRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录ID */
    private Long recordId;

    /** 交易用户ID */
    @Excel(name = "交易用户ID")
    private Long userId;

    /** 交易时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "交易时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date recordTime;

    /** 交易类型（0买币 1卖币 2商家直充 3代理充值 4手续费） */
    @Excel(name = "交易类型", readConverterExp = "0=买币,1=卖币,2=商家直充,3=代理充值,4=手续费")
    private String recordType;

    /** 交易金额 */
    @Excel(name = "交易金额")
    private BigDecimal recordAmount;

    public void setRecordId(Long recordId) 
    {
        this.recordId = recordId;
    }

    public Long getRecordId() 
    {
        return recordId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setRecordTime(Date recordTime) 
    {
        this.recordTime = recordTime;
    }

    public Date getRecordTime() 
    {
        return recordTime;
    }
    public void setRecordType(String recordType) 
    {
        this.recordType = recordType;
    }

    public String getRecordType() 
    {
        return recordType;
    }
    public void setRecordAmount(BigDecimal recordAmount) 
    {
        this.recordAmount = recordAmount;
    }

    public BigDecimal getRecordAmount() 
    {
        return recordAmount;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recordId", getRecordId())
            .append("userId", getUserId())
            .append("recordTime", getRecordTime())
            .append("recordType", getRecordType())
            .append("recordAmount", getRecordAmount())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("remark", getRemark())
            .toString();
    }
}
