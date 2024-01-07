package com.ruoyi.common.core.vo.req;

public class UpdatePayInfoReqVO {


    /** 微信收款码图片地址 */
    private String wechatPayImg;

    /** 支付宝收款码图片地址 */
    private String alipayImg;

    /** 银联收款户名 */
    private String unionpayAccount;

    /** 银联收款卡号 */
    private String unionpayCard;

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
}
