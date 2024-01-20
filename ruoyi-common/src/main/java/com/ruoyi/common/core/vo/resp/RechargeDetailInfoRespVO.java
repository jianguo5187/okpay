package com.ruoyi.common.core.vo.resp;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class RechargeDetailInfoRespVO {

    /** 充值ID */
    private Long rechargeId;

    /** 充值用户ID */
    private Long fromUserId;

    /** 充值用户昵称 */
    private String rechargeFromUserNickName;

    /** 充值用户手机号码 */
    private String rechargeFromUserPhonenumber;

    /** 充值用户微信收款码图片地址 */
    private String rechargeFromWechatPayImg;

    /** 充值用户支付宝收款码图片地址 */
    private String rechargeFromAlipayImg;

    /** 充值用户银联收款户名 */
    private String rechargeFromUnionpayAccount;

    /** 充值用户银联收款卡号 */
    private String rechargeFromUnionpayCard;

    /** 被充值用户ID */
    private Long toUserId;

    /** 被充值用户昵称 */
    private String rechargeToUserNickName;

    /** 被充值用户手机号码 */
    private String rechargeToUserPhonenumber;

    /** 被充值用户微信收款码图片地址 */
    private String rechargeToWechatPayImg;

    /** 被充值用户支付宝收款码图片地址 */
    private String rechargeToAlipayImg;

    /** 被充值用户银联收款户名 */
    private String rechargeToUnionpayAccount;

    /** 被充值用户银联收款卡号 */
    private String rechargeToUnionpayCard;

    /** 充值金额 */
    private Float rechargeAmount;

    /** 充值时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date rechargeTime;

    /** 充值方式（0支付宝 1微信 2银联） */
    private String rechargeType;

    /** 充值状态（0进行中 1已确认(充值完成) 9已取消） */
    private String status;

    public Long getRechargeId() {
        return rechargeId;
    }

    public void setRechargeId(Long rechargeId) {
        this.rechargeId = rechargeId;
    }

    public Long getFromUserId() {
        return fromUserId;
    }

    public void setFromUserId(Long fromUserId) {
        this.fromUserId = fromUserId;
    }

    public String getRechargeFromUserNickName() {
        return rechargeFromUserNickName;
    }

    public void setRechargeFromUserNickName(String rechargeFromUserNickName) {
        this.rechargeFromUserNickName = rechargeFromUserNickName;
    }

    public String getRechargeFromUserPhonenumber() {
        return rechargeFromUserPhonenumber;
    }

    public void setRechargeFromUserPhonenumber(String rechargeFromUserPhonenumber) {
        this.rechargeFromUserPhonenumber = rechargeFromUserPhonenumber;
    }

    public String getRechargeFromWechatPayImg() {
        return rechargeFromWechatPayImg;
    }

    public void setRechargeFromWechatPayImg(String rechargeFromWechatPayImg) {
        this.rechargeFromWechatPayImg = rechargeFromWechatPayImg;
    }

    public String getRechargeFromAlipayImg() {
        return rechargeFromAlipayImg;
    }

    public void setRechargeFromAlipayImg(String rechargeFromAlipayImg) {
        this.rechargeFromAlipayImg = rechargeFromAlipayImg;
    }

    public String getRechargeFromUnionpayAccount() {
        return rechargeFromUnionpayAccount;
    }

    public void setRechargeFromUnionpayAccount(String rechargeFromUnionpayAccount) {
        this.rechargeFromUnionpayAccount = rechargeFromUnionpayAccount;
    }

    public String getRechargeFromUnionpayCard() {
        return rechargeFromUnionpayCard;
    }

    public void setRechargeFromUnionpayCard(String rechargeFromUnionpayCard) {
        this.rechargeFromUnionpayCard = rechargeFromUnionpayCard;
    }

    public Long getToUserId() {
        return toUserId;
    }

    public void setToUserId(Long toUserId) {
        this.toUserId = toUserId;
    }

    public String getRechargeToUserNickName() {
        return rechargeToUserNickName;
    }

    public void setRechargeToUserNickName(String rechargeToUserNickName) {
        this.rechargeToUserNickName = rechargeToUserNickName;
    }

    public String getRechargeToUserPhonenumber() {
        return rechargeToUserPhonenumber;
    }

    public void setRechargeToUserPhonenumber(String rechargeToUserPhonenumber) {
        this.rechargeToUserPhonenumber = rechargeToUserPhonenumber;
    }

    public String getRechargeToWechatPayImg() {
        return rechargeToWechatPayImg;
    }

    public void setRechargeToWechatPayImg(String rechargeToWechatPayImg) {
        this.rechargeToWechatPayImg = rechargeToWechatPayImg;
    }

    public String getRechargeToAlipayImg() {
        return rechargeToAlipayImg;
    }

    public void setRechargeToAlipayImg(String rechargeToAlipayImg) {
        this.rechargeToAlipayImg = rechargeToAlipayImg;
    }

    public String getRechargeToUnionpayAccount() {
        return rechargeToUnionpayAccount;
    }

    public void setRechargeToUnionpayAccount(String rechargeToUnionpayAccount) {
        this.rechargeToUnionpayAccount = rechargeToUnionpayAccount;
    }

    public String getRechargeToUnionpayCard() {
        return rechargeToUnionpayCard;
    }

    public void setRechargeToUnionpayCard(String rechargeToUnionpayCard) {
        this.rechargeToUnionpayCard = rechargeToUnionpayCard;
    }

    public Float getRechargeAmount() {
        return rechargeAmount;
    }

    public void setRechargeAmount(Float rechargeAmount) {
        this.rechargeAmount = rechargeAmount;
    }

    public Date getRechargeTime() {
        return rechargeTime;
    }

    public void setRechargeTime(Date rechargeTime) {
        this.rechargeTime = rechargeTime;
    }

    public String getRechargeType() {
        return rechargeType;
    }

    public void setRechargeType(String rechargeType) {
        this.rechargeType = rechargeType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
