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
 * @date 2024-01-22
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

    /** 交易类型（0买币 1卖币 2商家直充 3代理充值 4充值到商户(提现) 5手续费） */
    @Excel(name = "交易类型", readConverterExp = "0=买币,1=卖币,2=商家直充,3=代理充值,4=充值到商户(提现),5=手续费")
    private String recordType;

    private String recordTypeName;

    /** 买币ID */
    @Excel(name = "买币ID")
    private Long buyId;

    /** 卖币ID */
    @Excel(name = "卖币ID")
    private Long saleId;

    /** 充值ID */
    @Excel(name = "充值ID")
    private Long rechargeId;

    /** 交易金额 */
    @Excel(name = "交易金额")
    private Float recordAmount;

    /** 交易后余额 */
    @Excel(name = "交易后余额")
    private Float userRemainAmount;


    /** 显示金额 */
    private Float showRecordAmount;

    /** 记录状态（0正常 1取消） */
    @Excel(name = "记录状态", readConverterExp = "0=正常,1=取消")
    private String status;

    /** 开始时间 */
    private String startTime;

    /** 结束 */
    private String endTime;

    private String userNickName;

    private String transactionFlg;

    private Long deptId;

    private String userType;

    /** 上级用户ID */
    private Long parentUserId;

    /** 自身用户ID */
    private Long selfUserId;

    public String getTransactionFlg() {
        return transactionFlg;
    }

    public void setTransactionFlg(String transactionFlg) {
        this.transactionFlg = transactionFlg;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

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
    public void setRechargeId(Long rechargeId) 
    {
        this.rechargeId = rechargeId;
    }

    public Long getRechargeId() 
    {
        return rechargeId;
    }
    public void setRecordAmount(Float recordAmount) 
    {
        this.recordAmount = recordAmount;
    }

    public Float getRecordAmount() 
    {
        return recordAmount;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public String getRecordTypeName() {
        return recordTypeName;
    }

    public void setRecordTypeName(String recordTypeName) {
        this.recordTypeName = recordTypeName;
    }

    public Float getShowRecordAmount() {
        return showRecordAmount;
    }

    public void setShowRecordAmount(Float showRecordAmount) {
        this.showRecordAmount = showRecordAmount;
    }

    public Float getUserRemainAmount() {
        return userRemainAmount;
    }

    public void setUserRemainAmount(Float userRemainAmount) {
        this.userRemainAmount = userRemainAmount;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public Long getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(Long parentUserId) {
        this.parentUserId = parentUserId;
    }

    public Long getSelfUserId() {
        return selfUserId;
    }

    public void setSelfUserId(Long selfUserId) {
        this.selfUserId = selfUserId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recordId", getRecordId())
            .append("userId", getUserId())
            .append("recordTime", getRecordTime())
            .append("recordType", getRecordType())
            .append("buyId", getBuyId())
            .append("saleId", getSaleId())
            .append("rechargeId", getRechargeId())
            .append("recordAmount", getRecordAmount())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
