package com.ruoyi.common.core.vo.resp;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class BuyDetailInfoRespVO {

    /** 买币ID */
    private Long buyId;

    /** 卖币No */
    private String saleNo;

    /** 卖币ID */
    private Long saleId;

    /** 卖币用户ID */
    private Long saleUserId;

    /** 卖币用户昵称 */
    private String saleUserNickName;

    /** 卖币用户手机号码 */
    private String saleUserPhonenumber;

    /** 卖币用户微信收款码填充信息 */
    private String saleWechatPayRemark;

    /** 卖币用户微信收款码图片地址 */
    private String saleWechatPayImg;

    /** 卖币用户支付宝收款填充信息 */
    private String saleAlipayRemark;

    /** 卖币用户支付宝收款码图片地址 */
    private String saleAlipayImg;

    /** 卖币用户银联填充信息 */
    private String saleUnionpayRemark;

    /** 卖币用户银联收款户名 */
    private String saleUnionpayAccount;

    /** 卖币用户银联收款卡号 */
    private String saleUnionpayCard;

    /** 买币用户ID */
    private Long buyUserId;

    /** 买币用户昵称 */
    private String buyUserNickName;

    /** 买币用户手机号码 */
    private String buyUserPhonenumber;

    /** 买币用户微信收款码填充信息 */
    private String buyWechatPayRemark;

    /** 买币用户微信收款码图片地址 */
    private String buyWechatPayImg;

    /** 买币用户支付宝收款填充信息 */
    private String buyAlipayRemark;

    /** 买币用户支付宝收款码图片地址 */
    private String buyAlipayImg;

    /** 买币用户银联填充信息 */
    private String buyUnionpayRemark;

    /** 买币用户银联收款户名 */
    private String buyUnionpayAccount;

    /** 买币用户银联收款卡号 */
    private String buyUnionpayCard;

    /** 买币时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date buyTime;

    /** 支付方式（0支付宝 1微信 2银联） */
    private String buyType;

    /** 买币金额 */
    private Float buyAmount;

    /** 支付凭证 */
    private String buyVoucher;

    /** 买币状态（0进行中 1买家已付款 2卖家已确认(买币完成) 9已取消） */
    private String status;

    public Long getBuyId() {
        return buyId;
    }

    public void setBuyId(Long buyId) {
        this.buyId = buyId;
    }


    public String getSaleNo() {
        return saleNo;
    }

    public void setSaleNo(String saleNo) {
        this.saleNo = saleNo;
    }
    public Long getSaleId() {
        return saleId;
    }

    public void setSaleId(Long saleId) {
        this.saleId = saleId;
    }

    public Long getSaleUserId() {
        return saleUserId;
    }

    public void setSaleUserId(Long saleUserId) {
        this.saleUserId = saleUserId;
    }

    public String getSaleUserNickName() {
        return saleUserNickName;
    }

    public void setSaleUserNickName(String saleUserNickName) {
        this.saleUserNickName = saleUserNickName;
    }

    public String getSaleUserPhonenumber() {
        return saleUserPhonenumber;
    }

    public void setSaleUserPhonenumber(String saleUserPhonenumber) {
        this.saleUserPhonenumber = saleUserPhonenumber;
    }

    public String getSaleWechatPayImg() {
        return saleWechatPayImg;
    }

    public void setSaleWechatPayImg(String saleWechatPayImg) {
        this.saleWechatPayImg = saleWechatPayImg;
    }

    public String getSaleAlipayImg() {
        return saleAlipayImg;
    }

    public void setSaleAlipayImg(String saleAlipayImg) {
        this.saleAlipayImg = saleAlipayImg;
    }

    public String getSaleUnionpayAccount() {
        return saleUnionpayAccount;
    }

    public void setSaleUnionpayAccount(String saleUnionpayAccount) {
        this.saleUnionpayAccount = saleUnionpayAccount;
    }

    public String getSaleUnionpayCard() {
        return saleUnionpayCard;
    }

    public void setSaleUnionpayCard(String saleUnionpayCard) {
        this.saleUnionpayCard = saleUnionpayCard;
    }

    public Long getBuyUserId() {
        return buyUserId;
    }

    public void setBuyUserId(Long buyUserId) {
        this.buyUserId = buyUserId;
    }

    public String getBuyUserNickName() {
        return buyUserNickName;
    }

    public void setBuyUserNickName(String buyUserNickName) {
        this.buyUserNickName = buyUserNickName;
    }

    public String getBuyUserPhonenumber() {
        return buyUserPhonenumber;
    }

    public void setBuyUserPhonenumber(String buyUserPhonenumber) {
        this.buyUserPhonenumber = buyUserPhonenumber;
    }

    public String getBuyWechatPayImg() {
        return buyWechatPayImg;
    }

    public void setBuyWechatPayImg(String buyWechatPayImg) {
        this.buyWechatPayImg = buyWechatPayImg;
    }

    public String getBuyAlipayImg() {
        return buyAlipayImg;
    }

    public void setBuyAlipayImg(String buyAlipayImg) {
        this.buyAlipayImg = buyAlipayImg;
    }

    public String getBuyUnionpayAccount() {
        return buyUnionpayAccount;
    }

    public void setBuyUnionpayAccount(String buyUnionpayAccount) {
        this.buyUnionpayAccount = buyUnionpayAccount;
    }

    public String getBuyUnionpayCard() {
        return buyUnionpayCard;
    }

    public void setBuyUnionpayCard(String buyUnionpayCard) {
        this.buyUnionpayCard = buyUnionpayCard;
    }

    public Date getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(Date buyTime) {
        this.buyTime = buyTime;
    }

    public String getBuyType() {
        return buyType;
    }

    public void setBuyType(String buyType) {
        this.buyType = buyType;
    }

    public Float getBuyAmount() {
        return buyAmount;
    }

    public void setBuyAmount(Float buyAmount) {
        this.buyAmount = buyAmount;
    }

    public String getBuyVoucher() {
        return buyVoucher;
    }

    public void setBuyVoucher(String buyVoucher) {
        this.buyVoucher = buyVoucher;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSaleWechatPayRemark() {
        return saleWechatPayRemark;
    }

    public void setSaleWechatPayRemark(String saleWechatPayRemark) {
        this.saleWechatPayRemark = saleWechatPayRemark;
    }

    public String getSaleAlipayRemark() {
        return saleAlipayRemark;
    }

    public void setSaleAlipayRemark(String saleAlipayRemark) {
        this.saleAlipayRemark = saleAlipayRemark;
    }

    public String getSaleUnionpayRemark() {
        return saleUnionpayRemark;
    }

    public void setSaleUnionpayRemark(String saleUnionpayRemark) {
        this.saleUnionpayRemark = saleUnionpayRemark;
    }

    public String getBuyWechatPayRemark() {
        return buyWechatPayRemark;
    }

    public void setBuyWechatPayRemark(String buyWechatPayRemark) {
        this.buyWechatPayRemark = buyWechatPayRemark;
    }

    public String getBuyAlipayRemark() {
        return buyAlipayRemark;
    }

    public void setBuyAlipayRemark(String buyAlipayRemark) {
        this.buyAlipayRemark = buyAlipayRemark;
    }

    public String getBuyUnionpayRemark() {
        return buyUnionpayRemark;
    }

    public void setBuyUnionpayRemark(String buyUnionpayRemark) {
        this.buyUnionpayRemark = buyUnionpayRemark;
    }
}
