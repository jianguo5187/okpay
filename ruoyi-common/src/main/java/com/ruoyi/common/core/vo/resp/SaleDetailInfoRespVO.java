package com.ruoyi.common.core.vo.resp;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class SaleDetailInfoRespVO {

    /** 卖币ID */
    private Long saleId;

    /** 卖币No */
    private String saleNo;

    /** 卖币时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date saleTime;

    /** 卖币用户ID */
    private Long saleUserId;

    /** 卖币拆分类型（0不拆分 1拆分） */
    private String saleSplitType;

    /** 支持支付类型（0不拆分 1拆分） */
    private String[] supportBuyTypeArg;

    /** 支持支付类型 */
    private String supportBuyType;

    /** 支持支付类型名称 */
    private String supportBuyTypeName;

    /** 卖币金额 */
    private Float saleAmount;

    /** 扣除手续费可交易金额 */
    private Float saleAmountWithoutCommission;

    /** 可交易金额 */
    private Float remainAmount;

    /** 手续费 */
    private Float commissionAmount;

    /** 拆分购买最小金额比例 */
    private Integer splitMinRate;

    /** 拆分购买最大金额比例 */
    private Integer splitMaxRate;

    /** 拆分购买最小金额 */
    private Float splitMinAmount;

    /** 拆分购买最大金额 */
    private Float splitMaxAmount;

    /** 单次购买上限金额 */
    private Float singleBuyMaxAmount;

    /** 卖币状态（0订单生产 1交易中 2已完成 9已取消） */
    private String status;

    /** 加急状态（0否 1是） */
    private String urgentSaleFlg;

    /** 卖币用户昵称 */
    private String saleUserNickName;

    /** 手机号码 */
    private String saleUserPhonenumber;

    /** 卖币用户头像 */
    private String saleUserAvatar;

    /** 微信收款填充信息 */
    private String wechatPayRemark;

    /** 微信收款码图片地址 */
    private String wechatPayImg;

    /** 支付宝收款填充信息 */
    private String alipayRemark;

    /** 支付宝收款码图片地址 */
    private String alipayImg;

    /** 银联填充信息 */
    private String unionpayRemark;

    /** 银联收款户名 */
    private String unionpayAccount;

    /** 银联收款卡号 */
    private String unionpayCard;

    private List<BuyDetailInfoRespVO> buyUserList;

    public Long getSaleId() {
        return saleId;
    }

    public void setSaleId(Long saleId) {
        this.saleId = saleId;
    }

    public String getSaleNo() {
        return saleNo;
    }

    public void setSaleNo(String saleNo) {
        this.saleNo = saleNo;
    }

    public Date getSaleTime() {
        return saleTime;
    }

    public void setSaleTime(Date saleTime) {
        this.saleTime = saleTime;
    }

    public Long getSaleUserId() {
        return saleUserId;
    }

    public void setSaleUserId(Long saleUserId) {
        this.saleUserId = saleUserId;
    }

    public String getSaleSplitType() {
        return saleSplitType;
    }

    public void setSaleSplitType(String saleSplitType) {
        this.saleSplitType = saleSplitType;
    }

    public String[] getSupportBuyTypeArg() {
        return supportBuyTypeArg;
    }

    public void setSupportBuyTypeArg(String[] supportBuyTypeArg) {
        this.supportBuyTypeArg = supportBuyTypeArg;
    }

    public String getSupportBuyType() {
        return supportBuyType;
    }

    public void setSupportBuyType(String supportBuyType) {
        this.supportBuyType = supportBuyType;
    }

    public String getSupportBuyTypeName() {
        return supportBuyTypeName;
    }

    public void setSupportBuyTypeName(String supportBuyTypeName) {
        this.supportBuyTypeName = supportBuyTypeName;
    }

    public Float getSaleAmount() {
        return saleAmount;
    }

    public void setSaleAmount(Float saleAmount) {
        this.saleAmount = saleAmount;
    }
    
    public void setSaleAmountWithoutCommission(Float saleAmountWithoutCommission) 
    {
        this.saleAmountWithoutCommission = saleAmountWithoutCommission;
    }

    public Float getRemainAmount() {
        return remainAmount;
    }

    public void setRemainAmount(Float remainAmount) {
        this.remainAmount = remainAmount;
    }

    public Float getSaleAmountWithoutCommission()
    {
        return saleAmountWithoutCommission;
    }
    public void setCommissionAmount(Float commissionAmount) 
    {
        this.commissionAmount = commissionAmount;
    }

    public Float getCommissionAmount() 
    {
        return commissionAmount;
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

    public Float getSplitMinAmount() {
        return splitMinAmount;
    }

    public void setSplitMinAmount(Float splitMinAmount) {
        this.splitMinAmount = splitMinAmount;
    }

    public Float getSplitMaxAmount() {
        return splitMaxAmount;
    }

    public void setSplitMaxAmount(Float splitMaxAmount) {
        this.splitMaxAmount = splitMaxAmount;
    }

    public Float getSingleBuyMaxAmount() {
        return singleBuyMaxAmount;
    }

    public void setSingleBuyMaxAmount(Float singleBuyMaxAmount) {
        this.singleBuyMaxAmount = singleBuyMaxAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUrgentSaleFlg() {
        return urgentSaleFlg;
    }

    public void setUrgentSaleFlg(String urgentSaleFlg) {
        this.urgentSaleFlg = urgentSaleFlg;
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

    public String getSaleUserAvatar() {
		return saleUserAvatar;
	}

	public void setSaleUserAvatar(String saleUserAvatar) {
		this.saleUserAvatar = saleUserAvatar;
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

    public List<BuyDetailInfoRespVO> getBuyUserList() {
        return buyUserList;
    }

    public void setBuyUserList(List<BuyDetailInfoRespVO> buyUserList) {
        this.buyUserList = buyUserList;
    }
}
