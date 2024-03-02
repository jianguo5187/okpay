package com.ruoyi.common.core.vo.req;

public class UpdatePayInfoReqVO {

    /** 微信收款码填充信息 */
    private String wechatPayRemark;

    /** 微信收款码图片地址 */
    private String wechatPayImg;

    /** 支付宝收款码填充信息 */
    private String alipayRemark;

    /** 支付宝收款码图片地址 */
    private String alipayImg;

    /** 银联填充信息 */
    private String unionpayRemark;

    /** 银联收款户名 */
    private String unionpayAccount;

    /** 银联收款卡号 */
    private String unionpayCard;

    private String updateBy;

    public String getWechatPayRemark() {
        return wechatPayRemark;
    }

    public void setWechatPayRemark(String wechatPayRemark) {
        this.wechatPayRemark = wechatPayRemark;
    }

    public String getAlipayRemark() {
        return alipayRemark;
    }

    public void setAlipayRemark(String alipayRemark) {
        this.alipayRemark = alipayRemark;
    }

    public String getUnionpayRemark() {
        return unionpayRemark;
    }

    public void setUnionpayRemark(String unionpayRemark) {
        this.unionpayRemark = unionpayRemark;
    }

    public String getWechatPayImg() {
        return wechatPayImg;
    }

    public void setWechatPayImg(String wechatPayImg) {
        this.wechatPayImg = wechatPayImg;
    }

    public String getAlipayImg() {
        return alipayImg;
    }

    public void setAlipayImg(String alipayImg) {
        this.alipayImg = alipayImg;
    }

    public String getUnionpayAccount() {
        return unionpayAccount;
    }

    public void setUnionpayAccount(String unionpayAccount) {
        this.unionpayAccount = unionpayAccount;
    }

    public String getUnionpayCard() {
        return unionpayCard;
    }

    public void setUnionpayCard(String unionpayCard) {
        this.unionpayCard = unionpayCard;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
}
