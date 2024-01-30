package com.ruoyi.system.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.vo.req.*;
import com.ruoyi.common.core.vo.resp.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.common.core.domain.entity.SysBuyCoin;
import com.ruoyi.common.core.domain.entity.SysRecharge;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysSaleCoin;
import com.ruoyi.common.core.domain.entity.SysTransactionRecord;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.ImageUtils;
import com.ruoyi.common.utils.sign.Base64;
import com.ruoyi.system.mapper.SysBuyCoinMapper;
import com.ruoyi.system.mapper.SysNoticeMapper;
import com.ruoyi.system.mapper.SysRechargeMapper;
import com.ruoyi.system.mapper.SysSaleCoinMapper;
import com.ruoyi.system.mapper.SysTransactionRecordMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.system.service.ISysAppService;
import com.ruoyi.system.service.ISysSaleCoinService;
import com.ruoyi.system.service.ISysUserService;

@Service
public class SysAppServiceImpl implements ISysAppService {

    @Autowired
    private ISysSaleCoinService sysSaleCoinService;

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private SysUserMapper userMapper;

    @Autowired
    private SysSaleCoinMapper sysSaleCoinMapper;

    @Autowired
    private SysBuyCoinMapper sysBuyCoinMapper;

    @Autowired
    private SysRechargeMapper sysRechargeMapper;

    @Autowired
    private SysNoticeMapper noticeMapper;
    
    @Autowired
    private SysTransactionRecordMapper sysTransactionRecordMapper;

    public boolean checkRoleExist(List<SysRole> roleList, Long checkValue){
        boolean exist = false;
        for(SysRole role : roleList){
            if(role.getRoleId().compareTo(checkValue) == 0){
                exist = true;
                break;
            }
        }
        return exist;
    }

    @Override
    public UserAmountInfoRespVO getUserAmountInfo(Long userId) {
        return userMapper.getUserAmountInfo(userId);
    }

    @Override
    public int updatePayInfo(Long userId, UpdatePayInfoReqVO vo) {
        SysUser user = sysUserService.selectUserById(userId);

        user.setWechatPayRemark(vo.getWechatPayRemark());
        user.setAlipayRemark(vo.getAlipayRemark());
        user.setUnionpayRemark(vo.getUnionpayRemark());

        if(StringUtils.isNotEmpty(vo.getWechatPayImg())){
            String wechatPayImgFileName = ImageUtils.savaBase64ImageFile(vo.getWechatPayImg());
            if(StringUtils.isNotEmpty(wechatPayImgFileName)){
                user.setWechatPayImg(wechatPayImgFileName);
            }else{
                throw new ServiceException("微信收款码图片地址上传失败");
            }
        }

        if(StringUtils.isNotEmpty(vo.getAlipayImg())){
            String alipayImgFileName = ImageUtils.savaBase64ImageFile(vo.getAlipayImg());
            if(StringUtils.isNotEmpty(alipayImgFileName)){
                user.setAlipayImg(alipayImgFileName);
            }else{
                throw new ServiceException("支付宝收款码地址上传失败");
            }
        }

        if(StringUtils.isNotEmpty(vo.getUnionpayAccount())){
            user.setUnionpayAccount(vo.getUnionpayAccount());
        }

        if(StringUtils.isNotEmpty(vo.getUnionpayCard())){
            user.setUnionpayCard(vo.getUnionpayCard());
        }

        return userMapper.updateUser(user);
    }

    @Override
    public int updateUserInfo(Long userId, UpdateUserInfoReqVO vo) {
        SysUser user = sysUserService.selectUserById(userId);

        if(StringUtils.isNotEmpty(vo.getAvatar())){
            String avatarFileName = ImageUtils.savaBase64ImageFile(vo.getAvatar());
            if(StringUtils.isNotEmpty(avatarFileName)){
                user.setAvatar(avatarFileName);
            }else{
                throw new ServiceException("头像上传失败");
            }
        }
        user.setRemark(vo.getRemark());
        user.setNickName(vo.getNickName());

        return userMapper.updateUser(user);
    }

    @Override
    public Long parentMerchantUserId(Long userId) {
        if(userId != null && userId != 0){
            SysUser user = sysUserService.selectUserById(userId);

            //商户
            if(checkRoleExist(user.getRoles(), 3l)) {
                return user.getUserId();
            }else if(checkRoleExist(user.getRoles(), 4l)){
                //代理
                return user.getParentUserId();
            }else if(checkRoleExist(user.getRoles(), 5l)){
                //客户
                SysUser agentUser = sysUserService.selectUserById(user.getParentUserId());
                return agentUser.getParentUserId();
            }
        }
        return null;
    }

    @Override
    public Long addSaleCoin(Long userId, SaleCoinReqVO vo) {
        Date currentDate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String currentDateTime = sdf.format(currentDate);
        Long merchantUserId = parentMerchantUserId(userId);
        if(merchantUserId == null || merchantUserId == 0) {
            throw new ServiceException("上级商户不存在，请联系管理员");
        }
        SysUser merchantUser = sysUserService.selectUserById(merchantUserId);
        Integer commissionRate = 1;
        Float commissionAmount = 0f;
        Float saleAmountWithoutCommission = 0f;
        if(StringUtils.equals(vo.getUrgentSaleFlg(), "0")) {
        	//普通
        	Float f = (vo.getSaleAmount() * merchantUser.getNormalCommission())/100;
        	BigDecimal b = new BigDecimal(f);
        	commissionAmount = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
        }else {
        	//加急
        	Float f = (vo.getSaleAmount() * merchantUser.getUngentCommission())/100;
        	BigDecimal b = new BigDecimal(f);
        	commissionAmount = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
        }
        saleAmountWithoutCommission = vo.getSaleAmount() - commissionAmount;

        SysSaleCoin sysSaleCoin = new SysSaleCoin();
        String saleNo = "OK" + currentDateTime;
        sysSaleCoin.setSaleNo(saleNo);
        sysSaleCoin.setSaleUserId(userId);
        sysSaleCoin.setSaleSplitType(vo.getSaleSplitType());
        sysSaleCoin.setSupportBuyType(vo.getSupportBuyType());
        sysSaleCoin.setSaleAmount(vo.getSaleAmount());
        sysSaleCoin.setSaleAmountWithoutCommission(saleAmountWithoutCommission);
        sysSaleCoin.setCommissionAmount(commissionAmount);
        sysSaleCoin.setRemainAmount(saleAmountWithoutCommission);
        sysSaleCoin.setStatus("0"); //生成订单
        sysSaleCoin.setUrgentSaleFlg(vo.getUrgentSaleFlg());
        sysSaleCoin.setCreateBy(vo.getCreateBy());
        
        int insertRow = sysSaleCoinMapper.insertSysSaleCoin(sysSaleCoin);
        
        return sysSaleCoin.getSaleId();
    }
    
    @Override
    public Float updateUserAmount(Long userId, String transactionRecordType, Long recordId, Float amount, String updateBy) {
        
        //临时交易记录生成
        SysTransactionRecord transactionRecord = new SysTransactionRecord();
        //更新用户余额
        SysUser user = sysUserService.selectUserById(userId);
        Float remainAmount = 0f;
        if(StringUtils.equals(transactionRecordType, "1")) {
            //卖币生成
        	transactionRecord.setUserId(userId);
        	transactionRecord.setSaleId(recordId);
        	transactionRecord.setRecordType("1"); //卖币
        	transactionRecord.setRecordAmount(amount);
        	transactionRecord.setStatus("9"); //临时记录

            remainAmount = user.getAmount() - amount;
        }
        transactionRecord.setCreateBy(updateBy);
        int transactionRecordRow = sysTransactionRecordMapper.insertSysTransactionRecord(transactionRecord);

        userMapper.updateUserAmount(userId, remainAmount);
        return remainAmount;
    }

    @Override
    public int updateSaleStatus(Long userId, UpdateSaleStatusReqVO vo) {

        SysSaleCoin sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(vo.getSaleId());
        if(StringUtils.isNull(sysSaleCoin)){
            throw new ServiceException("卖币信息不存在，请联系管理员");
        }
        if(StringUtils.equals(sysSaleCoin.getStatus(), "9")) {
            throw new ServiceException("卖币订单已经被取消，不可交易");
        }
        
        Long merchantUserId = parentMerchantUserId(userId);
        if(merchantUserId == null || merchantUserId == 0) {
            throw new ServiceException("上级商户不存在，请联系管理员");
        }
        
        // 0生成订单⇒1交易中
        if(StringUtils.equals(sysSaleCoin.getStatus(), "0") && StringUtils.equals(vo.getStatus(), "1")) {
        	//
        	SysTransactionRecord transactionRecord = sysTransactionRecordMapper.selectTransactionRecordByRecordTypeAndId("1", null, vo.getSaleId(), null);
        	if(StringUtils.isNull(transactionRecord)) {
                throw new ServiceException("交易记录信息不存在，不可管理");
        	}
        	transactionRecord.setStatus("0");
        	transactionRecord.setUpdateBy(vo.getUpdateBy());
        	sysTransactionRecordMapper.updateSysTransactionRecord(transactionRecord);
        	
        	//手续费交易记录生成
            SysTransactionRecord commissiontransactionRecord = new SysTransactionRecord();
            commissiontransactionRecord.setUserId(merchantUserId);
            commissiontransactionRecord.setSaleId(sysSaleCoin.getSaleId());
            commissiontransactionRecord.setRecordType("5"); //手续费
            commissiontransactionRecord.setRecordAmount(sysSaleCoin.getCommissionAmount());
            commissiontransactionRecord.setStatus("0");
            commissiontransactionRecord.setCreateBy(vo.getUpdateBy());
            sysTransactionRecordMapper.insertSysTransactionRecord(commissiontransactionRecord);
            
        }else if(StringUtils.equals(vo.getStatus(), "9")) {
        	// 订单取消
        	// 判断是否有买币记录存在
        	if(StringUtils.isNotNull(sysBuyCoinMapper.selectSysBuyCoinByBuyId(vo.getSaleId()))) {
                throw new ServiceException("该卖币已有买币记录，不可取消");
        	}
        	
        	//交易记录取消
        	SysTransactionRecord transactionRecord = sysTransactionRecordMapper.selectTransactionRecordByRecordTypeAndId("1", null, vo.getSaleId(), null);
        	//手续费交易记录取消
        	SysTransactionRecord commissiontransactionRecord = sysTransactionRecordMapper.selectTransactionRecordByRecordTypeAndId("9", null, vo.getSaleId(), null);
        	if(StringUtils.isNull(transactionRecord) || StringUtils.isNull(commissiontransactionRecord)) {
                throw new ServiceException("交易记录信息不存在，不可管理");
        	}
        	
        	transactionRecord.setStatus("9");
        	transactionRecord.setUpdateBy(vo.getUpdateBy());
        	sysTransactionRecordMapper.updateSysTransactionRecord(transactionRecord);
        	
        	commissiontransactionRecord.setStatus("9");
        	commissiontransactionRecord.setUpdateBy(vo.getUpdateBy());
        	sysTransactionRecordMapper.updateSysTransactionRecord(commissiontransactionRecord);
        	
            //更新用户余额
            SysUser user = sysUserService.selectUserById(userId);
            Float remainAmount = user.getAmount() + sysSaleCoin.getSaleAmount();
            userMapper.updateUserAmount(userId, remainAmount);
        }
        sysSaleCoin.setStatus(vo.getStatus());
        sysSaleCoin.setUpdateBy(vo.getUpdateBy());

        return sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);
    }

    @Override
    public SaleDetailInfoRespVO getSaleDetailInfo(Long saleId) {

        SaleDetailInfoRespVO respVO = new SaleDetailInfoRespVO();
        SysSaleCoin saleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(saleId);
        if(StringUtils.isNull(saleCoin)){
            throw new ServiceException("卖币信息不存在，请联系管理员");
        }
        SysUser saleUser = sysUserService.selectUserById(saleCoin.getSaleUserId());

        respVO.setSaleId(saleId);
        respVO.setSaleNo(saleCoin.getSaleNo());
        respVO.setSaleTime(saleCoin.getSaleTime());
        respVO.setSaleSplitType(saleCoin.getSaleSplitType());
        respVO.setSupportBuyType(saleCoin.getSupportBuyType());
        respVO.setSaleAmount(saleCoin.getSaleAmount());
        respVO.setSaleAmountWithoutCommission(saleCoin.getSaleAmountWithoutCommission());
        respVO.setRemainAmount(saleCoin.getRemainAmount());
        respVO.setCommissionAmount(saleCoin.getCommissionAmount());
        respVO.setStatus(saleCoin.getStatus());
        respVO.setUrgentSaleFlg(saleCoin.getUrgentSaleFlg());
        respVO.setSaleUserId(saleUser.getUserId());
        respVO.setSaleUserNickName(saleUser.getNickName());
        respVO.setSaleUserPhonenumber(saleUser.getPhonenumber());
        respVO.setWechatPayRemark(saleUser.getWechatPayRemark());
        respVO.setAlipayRemark(saleUser.getAlipayRemark());
        respVO.setUnionpayRemark(saleUser.getUnionpayRemark());
        respVO.setUnionpayAccount(saleUser.getUnionpayAccount());
        respVO.setUnionpayCard(saleUser.getUnionpayCard());
        if(StringUtils.isNotEmpty(saleUser.getWechatPayImg())){
            respVO.setWechatPayImg(Base64.encode(ImageUtils.getImage(saleUser.getWechatPayImg())));
        }
        if(StringUtils.isNotEmpty(saleUser.getAlipayImg())){
            respVO.setAlipayImg(Base64.encode(ImageUtils.getImage(saleUser.getAlipayImg())));
        }

        List<BuyDetailInfoRespVO> buyList = sysBuyCoinMapper.getBuyListBySaleId(saleId);

        for (BuyDetailInfoRespVO vo : buyList){
            if(StringUtils.isNotEmpty(vo.getSaleWechatPayImg())){
                vo.setSaleWechatPayImg(Base64.encode(ImageUtils.getImage(vo.getSaleWechatPayImg())));
            }
            if(StringUtils.isNotEmpty(vo.getSaleAlipayImg())){
                vo.setSaleAlipayImg(Base64.encode(ImageUtils.getImage(vo.getSaleAlipayImg())));
            }

            if(StringUtils.isNotEmpty(vo.getBuyWechatPayImg())){
                vo.setBuyWechatPayImg(Base64.encode(ImageUtils.getImage(vo.getBuyWechatPayImg())));
            }
            if(StringUtils.isNotEmpty(vo.getBuyAlipayImg())){
                vo.setBuyAlipayImg(Base64.encode(ImageUtils.getImage(vo.getBuyAlipayImg())));
            }
        }

        respVO.setBuyUserList(buyList);

        return respVO;
    }

    @Override
    public List<SaleDetailInfoRespVO> getSaleList(Long userId, Long deptId, GetSaleListReqVO vo) {
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        String[] supportBuyArg = new String[]{};
        if(vo.getSupportBuyType() != null){
            supportBuyArg = vo.getSupportBuyType().split(",");
        }
        Long merchantUserId  = parentMerchantUserId(userId);

        List<SaleDetailInfoRespVO> saleList  = sysSaleCoinMapper.getSaleList(userId,merchantUserId, deptId, vo.getSaleAmountFrom(), vo.getSaleAmountTo(), vo.getSaleSplitType(), supportBuyArg, (vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());
        for(SaleDetailInfoRespVO respVO : saleList){

            if(StringUtils.isNotEmpty(respVO.getSaleUserAvatar())){
                respVO.setSaleUserAvatar(Base64.encode(ImageUtils.getImage(respVO.getSaleUserAvatar())));
            }
            if(StringUtils.isNotEmpty(respVO.getWechatPayImg())){
                respVO.setWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getWechatPayImg())));
            }
            if(StringUtils.isNotEmpty(respVO.getAlipayImg())){
                respVO.setAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getAlipayImg())));
            }
        }
        return saleList;
    }

    @Override
    public List<SaleDetailInfoRespVO> getMySaleList(Long userId, GetMySaleListReqVO vo) {
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        String[] supportBuyArg = new String[]{};
        if(vo.getSupportBuyType() != null){
            supportBuyArg = vo.getSupportBuyType().split(",");
        }
        List<SaleDetailInfoRespVO> saleList  = sysSaleCoinMapper.getMySaleList(userId,vo.getStatus(),vo.getSaleAmountFrom(), vo.getSaleAmountTo(),vo.getSaleSplitType(),supportBuyArg, (vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());
        for(SaleDetailInfoRespVO respVO : saleList){

            if(StringUtils.isNotEmpty(respVO.getWechatPayImg())){
                respVO.setWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getWechatPayImg())));
            }
            if(StringUtils.isNotEmpty(respVO.getAlipayImg())){
                respVO.setAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getAlipayImg())));
            }
        }
        return saleList;
    }

    @Override
    public Long addBuyCoin(Long userId, BuyCoinReqVO vo) {

        SysSaleCoin sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(vo.getSaleId());
        if(sysSaleCoin == null){
            throw new ServiceException("卖币信息不存在，请联系管理员");
        }
        // 订单不可拆分
        if(StringUtils.equals(sysSaleCoin.getSaleSplitType(),"0")
            && sysSaleCoin.getSaleAmountWithoutCommission().compareTo(vo.getBuyAmount()) != 0){
            throw new ServiceException("不可拆分购买，请全额购买");
        }
        //判断支付方式
        if(sysSaleCoin.getSupportBuyType().indexOf(vo.getBuyType()) < 0){
            throw new ServiceException("支付方式不支持，请重新选择");
        }
        //购买金额大于剩余金额
        if(sysSaleCoin.getRemainAmount().compareTo(vo.getBuyAmount()) < 0){
            throw new ServiceException("可购买金额不足，请重新选择");
        }

        SysBuyCoin sysBuyCoin = new SysBuyCoin();
        sysBuyCoin.setSaleId(vo.getSaleId());
        sysBuyCoin.setSaleUserId(sysSaleCoin.getSaleUserId());
        sysBuyCoin.setBuyUserId(userId);
        sysBuyCoin.setBuyType(vo.getBuyType());
        sysBuyCoin.setBuyAmount(vo.getBuyAmount());
        sysBuyCoin.setStatus("0");
        sysBuyCoin.setCreateBy(vo.getCreateBy());

        Float remainAmount = sysSaleCoin.getRemainAmount() - vo.getBuyAmount();
        if(remainAmount == 0){
            sysSaleCoin.setStatus("2");
        }
        sysSaleCoin.setRemainAmount(remainAmount);
        sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);

        int insertRow = sysBuyCoinMapper.insertSysBuyCoin(sysBuyCoin);

        return sysBuyCoin.getBuyId();
    }

    @Override
    public int updateBuyStatus(Long userId, UpdateBuyStatusReqVO vo) {

        SysBuyCoin sysBuyCoin = sysBuyCoinMapper.selectSysBuyCoinByBuyId(vo.getBuyId());
        if(StringUtils.isNull(sysBuyCoin)){
            throw new ServiceException("买币信息不存在，请联系管理员");
        }

        if(StringUtils.equals(vo.getStatus(),"9")){
            //取消
            if(StringUtils.equals(sysBuyCoin.getStatus(),"2")){
                throw new ServiceException("买币完成，不可取消，请联系管理员");
            }

            //卖单取消
            SysSaleCoin sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(sysBuyCoin.getSaleId());
            sysSaleCoin.setStatus("1");
            sysSaleCoin.setRemainAmount(sysSaleCoin.getRemainAmount() + sysBuyCoin.getBuyAmount());
            sysSaleCoin.setUpdateBy(vo.getUpdateBy());
            sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);

//            //买币记录取消
//            SysTransactionRecord buyRecord = sysTransactionRecordMapper.selectTransactionRecordByRecordTypeAndId("0", sysBuyCoin.getBuyId(), null, null);
//            if(StringUtils.isNull(buyRecord)) {
//                throw new ServiceException("交易记录信息不存在，不可取消");
//            }
//            buyRecord.setStatus("9");
//            buyRecord.setUpdateBy(vo.getUpdateBy());
//            sysTransactionRecordMapper.updateSysTransactionRecord(buyRecord);

        }else if(StringUtils.equals(sysBuyCoin.getStatus(),"0") && StringUtils.equals(vo.getStatus(),"1")){
            //0进行中 ⇒ 1买家已付款
        }else if(StringUtils.equals(sysBuyCoin.getStatus(),"1") && StringUtils.equals(vo.getStatus(),"2")){
            //1买家已付款 ⇒ 2卖家已确认(买币完成)
            SysTransactionRecord buyRecord = new SysTransactionRecord();

            //买币交易记录
            buyRecord.setUserId(sysBuyCoin.getBuyUserId());
            buyRecord.setBuyId(sysBuyCoin.getBuyId());
            buyRecord.setRecordType("0"); //买币
            buyRecord.setRecordAmount(sysBuyCoin.getBuyAmount());
            buyRecord.setStatus("0");
            buyRecord.setCreateBy(vo.getUpdateBy());
            sysTransactionRecordMapper.insertSysTransactionRecord(buyRecord);

            //更新买家用户余额
            SysUser user = sysUserService.selectUserById(sysBuyCoin.getBuyUserId());
            Float remainAmount = user.getAmount() + sysBuyCoin.getBuyAmount();
            userMapper.updateUserAmount(user.getUserId(), remainAmount);
        }
        sysBuyCoin.setStatus(vo.getStatus());
        sysBuyCoin.setUpdateBy(vo.getUpdateBy());

        return sysBuyCoinMapper.updateSysBuyCoin(sysBuyCoin);
    }

    @Override
    public BuyDetailInfoRespVO getBuyDetailInfo(Long buyId) {

        BuyDetailInfoRespVO respVO = sysBuyCoinMapper.getBuyDetailInfo(buyId);

        if(StringUtils.isNotEmpty(respVO.getSaleWechatPayImg())){
            respVO.setSaleWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getSaleWechatPayImg())));
        }
        if(StringUtils.isNotEmpty(respVO.getSaleAlipayImg())){
            respVO.setSaleAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getSaleAlipayImg())));
        }

        if(StringUtils.isNotEmpty(respVO.getBuyWechatPayImg())){
            respVO.setBuyWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getBuyWechatPayImg())));
        }
        if(StringUtils.isNotEmpty(respVO.getBuyAlipayImg())){
            respVO.setBuyAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getBuyAlipayImg())));
        }

        return respVO;
    }

    @Override
    public List<BuyDetailInfoRespVO> getMyBuyList(Long userId, GetMyBuyListReqVO vo) {
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        List<BuyDetailInfoRespVO> buyList = sysBuyCoinMapper.getMyBuyList(userId,vo.getStatus(),vo.getBuyAmountFrom(), vo.getBuyAmountTo(),vo.getSplitType(), vo.getBuyType(), (vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());

        for (BuyDetailInfoRespVO respVO : buyList){
            if(StringUtils.isNotEmpty(respVO.getSaleWechatPayImg())){
                respVO.setSaleWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getSaleWechatPayImg())));
            }
            if(StringUtils.isNotEmpty(respVO.getSaleAlipayImg())){
                respVO.setSaleAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getSaleAlipayImg())));
            }

            if(StringUtils.isNotEmpty(respVO.getBuyWechatPayImg())){
                respVO.setBuyWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getBuyWechatPayImg())));
            }
            if(StringUtils.isNotEmpty(respVO.getBuyAlipayImg())){
                respVO.setBuyAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getBuyAlipayImg())));
            }
        }
        return buyList;
    }

    @Override
    public Long addRechargeToMerchant(Long userId, RechargeToMerchantReqVO vo) {
        SysRecharge recharge = new SysRecharge();
        recharge.setFromUserId(userId);
        recharge.setToUserId(vo.getMerchantUserId());
        recharge.setRechargeAmount(vo.getRechargeAmount());
        recharge.setStatus("0");
        recharge.setRechargeType(vo.getRechargeType());
        recharge.setCreateBy(vo.getCreateBy());
        int insertRow = sysRechargeMapper.insertSysRecharge(recharge);
        //TODO 记录表等信息
        return recharge.getRechargeId();
    }

    @Override
    public Long addRechargeToUser(Long userId, RechargeToUserReqVO vo) {
        SysRecharge recharge = new SysRecharge();
        recharge.setFromUserId(userId);
        recharge.setToUserId(vo.getUserId());
        recharge.setRechargeAmount(vo.getRechargeAmount());
        recharge.setStatus("1"); //充值完成
        recharge.setRechargeType("3");
        recharge.setCreateBy(vo.getCreateBy());
        int insertRow = sysRechargeMapper.insertSysRecharge(recharge);

        //充值扣款人交易记录
        SysUser rechargeFromUser = sysUserService.selectUserById(userId);
        SysTransactionRecord rechargeFromRecord = new SysTransactionRecord();
        rechargeFromRecord.setUserId(userId);
        rechargeFromRecord.setRechargeId(recharge.getRechargeId());
        rechargeFromRecord.setRecordType("3"); //充值From方
        rechargeFromRecord.setRecordAmount(vo.getRechargeAmount());
        rechargeFromRecord.setStatus("0");
        rechargeFromRecord.setCreateBy(vo.getCreateBy());
        sysTransactionRecordMapper.insertSysTransactionRecord(rechargeFromRecord);
        // 更新余额
        Float rechargeFromUserRemainAmount = rechargeFromUser.getAmount() - vo.getRechargeAmount();
        userMapper.updateUserAmount(rechargeFromUser.getUserId(), rechargeFromUserRemainAmount);

        //充值扣款人交易记录
        SysUser rechargeToUser = sysUserService.selectUserById(vo.getUserId());
        SysTransactionRecord rechargeToUserRecord = new SysTransactionRecord();
        rechargeToUserRecord.setUserId(vo.getUserId());
        rechargeToUserRecord.setRechargeId(recharge.getRechargeId());
        rechargeToUserRecord.setRecordType("6"); //充值To方
        rechargeToUserRecord.setRecordAmount(vo.getRechargeAmount());
        rechargeToUserRecord.setStatus("0");
        rechargeToUserRecord.setCreateBy(vo.getCreateBy());
        sysTransactionRecordMapper.insertSysTransactionRecord(rechargeToUserRecord);
        // 更新余额
        Float rechargeToUserRemainAmount = rechargeToUser.getAmount() - vo.getRechargeAmount();
        userMapper.updateUserAmount(rechargeToUser.getUserId(), rechargeToUserRemainAmount);

        return recharge.getRechargeId();
    }

    @Override
    public int updateRechargeStatus(UpdateRechargeStatusReqVO vo) {

        SysRecharge sysRecharge = sysRechargeMapper.selectSysRechargeByRechargeId(vo.getRechargeId());
        if(StringUtils.isNull(sysRecharge)){
            throw new ServiceException("充值记录信息不存在，请联系管理员");
        }
        sysRecharge.setStatus(vo.getStatus());
        sysRecharge.setUpdateBy(vo.getUpdateBy());

        //todo

        return sysRechargeMapper.updateSysRecharge(sysRecharge);
    }

    @Override
    public RechargeDetailInfoRespVO getRechargeDetailInfo(Long rechargeId) {

        RechargeDetailInfoRespVO respVO = sysRechargeMapper.getRechargeDetailInfo(rechargeId);

        if(StringUtils.isNotEmpty(respVO.getRechargeToWechatPayImg())){
            respVO.setRechargeToWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeToWechatPayImg())));
        }
        if(StringUtils.isNotEmpty(respVO.getRechargeToAlipayImg())){
            respVO.setRechargeToAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeToAlipayImg())));
        }
        if(StringUtils.isNotEmpty(respVO.getRechargeFromWechatPayImg())){
            respVO.setRechargeFromWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeFromWechatPayImg())));
        }
        if(StringUtils.isNotEmpty(respVO.getRechargeFromAlipayImg())){
            respVO.setRechargeFromAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeFromAlipayImg())));
        }
        return respVO;
    }

    @Override
    public List<RechargeDetailInfoRespVO> getMyRechargeList(Long userId, GetMyRechargeListReqVO vo) {

        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        List<RechargeDetailInfoRespVO> rechargeList = sysRechargeMapper.getMyRechargeList(userId,vo.getStatus(),vo.getRechargeAmountFrom(), vo.getRechargeAmountTo(),vo.getRechargeType(), (vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());

        for (RechargeDetailInfoRespVO respVO : rechargeList){
            if(StringUtils.isNotEmpty(respVO.getRechargeToWechatPayImg())){
                respVO.setRechargeToWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeToWechatPayImg())));
            }
            if(StringUtils.isNotEmpty(respVO.getRechargeToAlipayImg())){
                respVO.setRechargeToAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeToAlipayImg())));
            }
            if(StringUtils.isNotEmpty(respVO.getRechargeFromWechatPayImg())){
                respVO.setRechargeFromWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeFromWechatPayImg())));
            }
            if(StringUtils.isNotEmpty(respVO.getRechargeFromAlipayImg())){
                respVO.setRechargeFromAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeFromAlipayImg())));
            }
        }
        return rechargeList;
    }

    @Override
    public List<NoticeDetailInfoRespVO> getUserNoticeList(Long userId, GetNoticeListReqVO vo) {
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        return noticeMapper.getUserNoticeList(userId,(vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());
    }

    @Override
    public int updateNoticeReadStatus(Long userId, Long noticeId) {
        noticeMapper.deleteNoticeUser(noticeId,userId);
        return noticeMapper.inserteNoticeUser(noticeId,userId);
    }

    @Override
    public List<TransactionDetailInfoRespVO> getMyTransactionList(Long userId, GetMyTransactionListReqVO vo) {
        if(StringUtils.isNull(vo.getPageNumber())){
            vo.setPageNumber(1);
        }
        if(StringUtils.isNull(vo.getPageRowCount())){
            vo.setPageRowCount(20);
        }
        return sysTransactionRecordMapper.getMyTransactionList(userId,(vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());
    }

    @Override
    public CashFlowRespVO getUserCashFlow(Long userId) {
        CashFlowRespVO respVO = new CashFlowRespVO();
        SysTransactionRecord searchRecord = new SysTransactionRecord();
        searchRecord.setUserId(userId);
        searchRecord.setStatus("0");
//        List<SysTransactionRecord> list = sysTransactionRecordMapper.selectSysTransactionRecordList(searchRecord);
        Float totalAmount = sysTransactionRecordMapper.getTransactonAmountTotal(userId,null,null);
//        Float commissionAmount = 0f;
        Float todayTotalAmount = sysTransactionRecordMapper.getTransactonAmountTotal(userId,"0",null);
        Float yesterdayTotalAmount = sysTransactionRecordMapper.getTransactonAmountTotal(userId,null,"1");

//        for(SysTransactionRecord transactionRecord : list){
//            if(StringUtils.equals(transactionRecord.getRecordType(),"0")
//                    || StringUtils.equals(transactionRecord.getRecordType(),"2")
//                    || StringUtils.equals(transactionRecord.getRecordType(),"4")
//                    || StringUtils.equals(transactionRecord.getRecordType(),"5")
//                    || StringUtils.equals(transactionRecord.getRecordType(),"6")){
//                totalAmount += transactionRecord.getRecordAmount();
//
//                // 手续费
//                if(StringUtils.equals(transactionRecord.getRecordType(),"5")){
//                    commissionAmount += transactionRecord.getRecordAmount();
//                }
//            }else if(StringUtils.equals(transactionRecord.getRecordType(),"1")
//                    || StringUtils.equals(transactionRecord.getRecordType(),"3")){
//                totalAmount -= transactionRecord.getRecordAmount();
//            }
//        }

        respVO.setTotalAmount(totalAmount == null?0f : totalAmount);
//        respVO.setCommissionAmount(commissionAmount);
        respVO.setTodayTotalAmount(todayTotalAmount == null?0f : todayTotalAmount);
        respVO.setYesterdayTotalAmount(yesterdayTotalAmount == null?0f : yesterdayTotalAmount);
        return respVO;
    }
}
