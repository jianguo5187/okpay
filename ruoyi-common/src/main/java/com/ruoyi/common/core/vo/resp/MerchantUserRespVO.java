package com.ruoyi.common.core.vo.resp;

public class MerchantUserRespVO {
    /** 商户用户ID */
    private Long merchantUserId;

    /** 商户用户昵称 */
    private String merchantUserNickName;

    /** 商户用户头像 */
    private String merchantUserAvatar;

    /** 加急手续费 */
    private Integer ungentCommission;

    /** 普通手续费 */
    private Integer normalCommission;

    /** 拆分购买最小金额比例 */
    private Integer splitMinRate;

    /** 拆分购买最大金额比例 */
    private Integer splitMaxRate;

    /** 单次购买上限金额 */
    private Float singleBuyMaxAmount;

    public Long getMerchantUserId() {
        return merchantUserId;
    }

    public void setMerchantUserId(Long merchantUserId) {
        this.merchantUserId = merchantUserId;
    }

    public String getMerchantUserNickName() {
        return merchantUserNickName;
    }

    public void setMerchantUserNickName(String merchantUserNickName) {
        this.merchantUserNickName = merchantUserNickName;
    }

    public String getMerchantUserAvatar() {
        return merchantUserAvatar;
    }

    public void setMerchantUserAvatar(String merchantUserAvatar) {
        this.merchantUserAvatar = merchantUserAvatar;
    }

    public Integer getUngentCommission() {
        return ungentCommission;
    }

    public void setUngentCommission(Integer ungentCommission) {
        this.ungentCommission = ungentCommission;
    }

    public Integer getNormalCommission() {
        return normalCommission;
    }

    public void setNormalCommission(Integer normalCommission) {
        this.normalCommission = normalCommission;
    }

    public Integer getSplitMinRate() {
        return splitMinRate;
    }

    public void setSplitMinRate(Integer splitMinRate) {
        this.splitMinRate = splitMinRate;
    }

    public Integer getSplitMaxRate() {
        return splitMaxRate;
    }

    public void setSplitMaxRate(Integer splitMaxRate) {
        this.splitMaxRate = splitMaxRate;
    }

    public Float getSingleBuyMaxAmount() {
        return singleBuyMaxAmount;
    }

    public void setSingleBuyMaxAmount(Float singleBuyMaxAmount) {
        this.singleBuyMaxAmount = singleBuyMaxAmount;
    }
}
