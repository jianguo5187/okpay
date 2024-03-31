package com.ruoyi.system.service.impl;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.core.vo.req.*;
import com.ruoyi.common.core.vo.resp.*;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.ruoyi.common.core.domain.entity.SysBuyCoin;
import com.ruoyi.common.core.domain.entity.SysRecharge;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysSaleCoin;
import com.ruoyi.common.core.domain.entity.SysTransactionRecord;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.entity.SysUserPayTypeApprove;
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

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ISysUserPayTypeApproveService sysUserPayTypeApproveService;

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private WebSocketServer webSocketService;

    // 卖币订单自动取消时间（默认480分钟）
    @Value("${token.saleInfoAutoCancelTime}")
    private int saleInfoAutoCancelTime;

    // 未付款订单自动取消默认时间（默认2分钟）
    @Value("${token.noPayAutoCancelTime}")
    private int noPayAutoCancelTime;

    // 未付款订单可撤单等待时间（6分钟）
    @Value("${token.noPayWaitCancelableTime}")
    private int noPayWaitCancelableTime;

    // 等待付款订单自动取消默认时间（10分钟）
    @Value("${token.waitPayAutoCancelTime}")
    private int waitPayAutoCancelTime;

    // 自动确认（默认30分钟）
    @Value("${token.autoBuyFinishTime}")
    private int autoBuyFinishTime;

    public boolean checkRoleExist(Long userId, Long checkValue){
        boolean exist = false;
        List<Long> roleIdList = roleService.selectRoleListByUserId(userId);
        for(Long roleId : roleIdList){
            if(roleId.compareTo(checkValue) == 0){
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

        if(StringUtils.isNotEmpty(vo.getUnionpayAccount())){

            SysUser user = sysUserService.selectUserById(userId);

            user.setUnionpayRemark(vo.getUnionpayRemark());
            user.setUnionpayAccount(vo.getUnionpayAccount());
            user.setUnionpayCard(vo.getUnionpayCard());

            return userMapper.updateUser(user);
        }else{

            SysUserPayTypeApprove userPayTypeApprove = new SysUserPayTypeApprove();
            if(StringUtils.isNotEmpty(vo.getWechatPayImg())){
                SysUserPayTypeApprove searchUserPayTypeApprove = new SysUserPayTypeApprove();
                searchUserPayTypeApprove.setUserId(userId);
                searchUserPayTypeApprove.setPayType("1"); //微信
                searchUserPayTypeApprove.setStatus("0"); //未承认
                if(sysUserPayTypeApproveService.checkExistsApproveInfo(searchUserPayTypeApprove)){
                    throw new ServiceException("已有一笔未承认的微信收款码记录，请先联系管理员进行审核。");
                }


                String wechatPayImgFileName = ImageUtils.savaBase64ImageFile(vo.getWechatPayImg());
                if(StringUtils.isNotEmpty(wechatPayImgFileName)){
                    userPayTypeApprove.setPayImg(wechatPayImgFileName);
                    userPayTypeApprove.setPayType("1"); //微信
                    userPayTypeApprove.setPayRemark(vo.getWechatPayRemark());
                }else{
                    throw new ServiceException("微信收款码图片地址上传失败");
                }

            }

            if(StringUtils.isNotEmpty(vo.getAlipayImg())){

                SysUserPayTypeApprove searchUserPayTypeApprove = new SysUserPayTypeApprove();
                searchUserPayTypeApprove.setUserId(userId);
                searchUserPayTypeApprove.setPayType("0"); //支付宝
                searchUserPayTypeApprove.setStatus("0"); //未承认
                if(sysUserPayTypeApproveService.checkExistsApproveInfo(searchUserPayTypeApprove)){
                    throw new ServiceException("已有一笔未承认的支付宝收款码记录，请先联系管理员进行审核。");
                }

                String alipayImgFileName = ImageUtils.savaBase64ImageFile(vo.getAlipayImg());
                if(StringUtils.isNotEmpty(alipayImgFileName)){
                    userPayTypeApprove.setPayImg(alipayImgFileName);
                    userPayTypeApprove.setPayType("0"); //支付宝
                    userPayTypeApprove.setPayRemark(vo.getWechatPayRemark());
                }else{
                    throw new ServiceException("支付宝收款码地址上传失败");
                }
            }

            if(StringUtils.isEmpty(userPayTypeApprove.getPayType())){
                throw new ServiceException("收款码未上传");
            }

            userPayTypeApprove.setUserId(userId);
            userPayTypeApprove.setStatus("0");
            userPayTypeApprove.setCreateBy(vo.getUpdateBy());

            return sysUserPayTypeApproveService.insertSysUserPayTypeApprove(userPayTypeApprove);
        }
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
            if(checkRoleExist(userId, 3l)) {
                return user.getUserId();
            }else if(checkRoleExist(userId, 4l)){
                //代理
                return user.getParentUserId();
            }else if(checkRoleExist(userId, 5l)){
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
        if(merchantUser.getSingleBuyMaxAmount() >0 && merchantUser.getSingleBuyMaxAmount().compareTo(vo.getSaleAmount()) < 0){
            throw new ServiceException("卖币金额不允许超过单次可购买最大金额（"+ merchantUser.getSingleBuyMaxAmount() +"）");
        }

        SysSaleCoin dbSaleCoin = sysSaleCoinMapper.checkNofinishSaleInfoExist(userId);
        if(StringUtils.isNotNull(dbSaleCoin) && dbSaleCoin.getSaleId() > 0){
            throw new ServiceException("已存在卖币订单，无法重复创建卖币订单。");
        }

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
        sysSaleCoin.setSplitMinRate(merchantUser.getSplitMinRate());
        sysSaleCoin.setSplitMaxRate(merchantUser.getSplitMaxRate());
        sysSaleCoin.setSingleBuyMaxAmount(merchantUser.getSingleBuyMaxAmount());
        sysSaleCoin.setCreateBy(vo.getCreateBy());
        
        int insertRow = sysSaleCoinMapper.insertSysSaleCoin(sysSaleCoin);
        
        return sysSaleCoin.getSaleId();
    }
    
    @Override
    public Float updateUserAmount(Long userId, String transactionRecordType, Long recordId, Float amount, String updateBy) {

        //更新用户余额
        SysUser user = sysUserService.selectUserById(userId);
        Float remainAmount = 0f;
        if(StringUtils.equals(transactionRecordType, "1")) {
            //卖币生成
//        	transactionRecord.setUserId(userId);
//        	transactionRecord.setSaleId(recordId);
//        	transactionRecord.setRecordType("1"); //卖币
//        	transactionRecord.setRecordAmount(amount);
//        	transactionRecord.setStatus("9"); //临时记录

            remainAmount = user.getAmount() - amount;

//            transactionRecord.setUserRemainAmount(remainAmount);
        }
//        transactionRecord.setCreateBy(updateBy);
//        int transactionRecordRow = sysTransactionRecordMapper.insertSysTransactionRecord(transactionRecord);

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
            throw new ServiceException("卖币订单已经被其他人取消。无需重复取消");
        }
        
        Long merchantUserId = parentMerchantUserId(userId);
        if(merchantUserId == null || merchantUserId == 0) {
            throw new ServiceException("上级商户不存在，请联系管理员");
        }
        //卖币用户
        SysUser user = sysUserService.selectUserById(userId);

        //商户用户
        SysUser merchantUser = sysUserService.selectUserById(merchantUserId);
        
        // 0生成订单⇒1交易中
        if(StringUtils.equals(sysSaleCoin.getStatus(), "0") && StringUtils.equals(vo.getStatus(), "1")) {

            //卖家交易记录生成
            SysTransactionRecord transactionRecord = new SysTransactionRecord();
        	transactionRecord.setUserId(userId);
        	transactionRecord.setSaleId(sysSaleCoin.getSaleId());
        	transactionRecord.setRecordType("1"); //卖币
        	transactionRecord.setRecordAmount(sysSaleCoin.getSaleAmount());
            transactionRecord.setUserRemainAmount(user.getAmount());
        	transactionRecord.setStatus("0");
            transactionRecord.setCreateBy(vo.getUpdateBy());
            sysTransactionRecordMapper.insertSysTransactionRecord(transactionRecord);
        	
        	//商家手续费交易记录生成
            if(sysSaleCoin.getCommissionAmount() >0 ){
                SysTransactionRecord commissiontransactionRecord = new SysTransactionRecord();
                commissiontransactionRecord.setUserId(merchantUserId);
                commissiontransactionRecord.setSaleId(sysSaleCoin.getSaleId());
                commissiontransactionRecord.setRecordType("5"); //手续费
                commissiontransactionRecord.setRecordAmount(sysSaleCoin.getCommissionAmount());
                commissiontransactionRecord.setUserRemainAmount(merchantUser.getAmount() + sysSaleCoin.getCommissionAmount());
                commissiontransactionRecord.setStatus("0");
                commissiontransactionRecord.setCreateBy(vo.getUpdateBy());
                sysTransactionRecordMapper.insertSysTransactionRecord(commissiontransactionRecord);
            }

            merchantUser.setAmount(merchantUser.getAmount() + sysSaleCoin.getCommissionAmount());
            userMapper.updateUser(merchantUser);
        }else if(StringUtils.equals(vo.getStatus(), "9")) {
            // 挂单已取消，直接返回
            if(StringUtils.equals(sysSaleCoin.getStatus(), "9")){
                return 1;
            }
            if(StringUtils.equals(sysSaleCoin.getStatus(),"2")){
                throw new ServiceException("卖币订单已完成，不可取消。");
            }

        	// 订单取消
        	// 判断是否有买币记录存在
            boolean existBuyInfo = false;
            SysBuyCoin dbBuyCoin = sysBuyCoinMapper.checkNofinishBuyInfoExistBySaleId(sysSaleCoin.getSaleId());
            if(StringUtils.isNotNull(dbBuyCoin) && dbBuyCoin.getBuyId() > 0){
                // 存在卖币信息
                UpdateBuyStatusReqVO updateBuyStatusReqVO = new UpdateBuyStatusReqVO();
                updateBuyStatusReqVO.setBuyId(dbBuyCoin.getBuyId());
                updateBuyStatusReqVO.setStatus("9"); // 买币取消
                updateBuyStatusReqVO.setUpdateBy(vo.getUpdateBy());
                cancelBuyCoin(userId,updateBuyStatusReqVO);

                dbBuyCoin.setStatus("9");
                dbBuyCoin.setUpdateBy(vo.getUpdateBy());
                sysBuyCoinMapper.updateSysBuyCoin(dbBuyCoin);

                //重新获取修正后的卖币情报
                sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(vo.getSaleId());
                existBuyInfo = true;
            }

            // 应退还的手续费
            Float newCommissionAmount = 0f;
            if(StringUtils.equals(sysSaleCoin.getUrgentSaleFlg(), "0")) {
                //普通
                Float f = ((sysSaleCoin.getSaleAmountWithoutCommission() - sysSaleCoin.getRemainAmount()) * merchantUser.getNormalCommission())/100;
                BigDecimal b = new BigDecimal(f);
                newCommissionAmount = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
            }else {
                //加急
                Float f = ((sysSaleCoin.getSaleAmountWithoutCommission() - sysSaleCoin.getRemainAmount()) * merchantUser.getUngentCommission())/100;
                BigDecimal b = new BigDecimal(f);
                newCommissionAmount = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
            }
            Float remainCommissionAmount = sysSaleCoin.getCommissionAmount() - newCommissionAmount;

            //更新用户余额
            Float remainAmount = user.getAmount() + sysSaleCoin.getRemainAmount() + remainCommissionAmount;
            userMapper.updateUserAmount(userId, remainAmount);
        	
        	//交易记录取消
        	SysTransactionRecord transactionRecord = sysTransactionRecordMapper.selectTransactionRecordByRecordTypeAndId("1", null, vo.getSaleId(), null);

            if(StringUtils.isNotNull(transactionRecord)){
                // 被交易过（订单剩余金额 != 扣除手续费可交易金额）
                if(existBuyInfo || sysSaleCoin.getSaleAmountWithoutCommission().compareTo(sysSaleCoin.getRemainAmount()) != 0){
                    Float recordAmount = sysSaleCoin.getRemainAmount() + remainCommissionAmount;
                    if(recordAmount.compareTo(0f) != 0){
                        // 取消卖币交易记录生成
                        SysTransactionRecord newTransactionRecord = new SysTransactionRecord();
                        newTransactionRecord.setUserId(userId);
                        newTransactionRecord.setSaleId(sysSaleCoin.getSaleId());
                        newTransactionRecord.setRecordType("7"); //卖币退款
                        newTransactionRecord.setRecordAmount(sysSaleCoin.getRemainAmount() + remainCommissionAmount);
                        newTransactionRecord.setUserRemainAmount(remainAmount);
                        newTransactionRecord.setStatus("0");
                        newTransactionRecord.setCreateBy(vo.getUpdateBy());
                        sysTransactionRecordMapper.insertSysTransactionRecord(newTransactionRecord);
                    }
                    // 交易过
                    existBuyInfo = true;
                }

                if(!existBuyInfo){
                    transactionRecord.setStatus("9");
                }
                transactionRecord.setUpdateBy(vo.getUpdateBy());
                sysTransactionRecordMapper.updateSysTransactionRecord(transactionRecord);
            }

            //手续费交易记录取消
            SysTransactionRecord commissiontransactionRecord = sysTransactionRecordMapper.selectTransactionRecordByRecordTypeAndId("5", null, vo.getSaleId(), null);
            if(StringUtils.isNotNull(commissiontransactionRecord)) {
                commissiontransactionRecord.setStatus("9");
                commissiontransactionRecord.setUpdateBy(vo.getUpdateBy());
                sysTransactionRecordMapper.updateSysTransactionRecord(commissiontransactionRecord);

                // 被交易过（订单剩余金额 != 扣除手续费可交易金额）
                if(sysSaleCoin.getSaleAmountWithoutCommission().compareTo(sysSaleCoin.getRemainAmount()) != 0){
                    // 取消卖币交易记录生成
                    SysTransactionRecord newCommissiontransactionRecord = new SysTransactionRecord();
                    newCommissiontransactionRecord.setUserId(userId);
                    newCommissiontransactionRecord.setSaleId(sysSaleCoin.getSaleId());
                    newCommissiontransactionRecord.setRecordType("5"); //手续费退款扣费
                    newCommissiontransactionRecord.setRecordAmount(remainCommissionAmount);
                    newCommissiontransactionRecord.setUserRemainAmount(merchantUser.getAmount() - remainCommissionAmount);
                    newCommissiontransactionRecord.setStatus("0");
                    newCommissiontransactionRecord.setCreateBy(vo.getUpdateBy());
                    sysTransactionRecordMapper.insertSysTransactionRecord(newCommissiontransactionRecord);

                    merchantUser.setAmount(merchantUser.getAmount() - sysSaleCoin.getCommissionAmount());
                    userMapper.updateUser(merchantUser);
                }
        	}

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
        respVO.setWechatPayImg(saleUser.getWechatPayImg());
        respVO.setAlipayImg(saleUser.getAlipayImg());
//        if(StringUtils.isNotEmpty(saleUser.getWechatPayImg())){
//            respVO.setWechatPayImg(Base64.encode(ImageUtils.getImage(saleUser.getWechatPayImg())));
//        }
//        if(StringUtils.isNotEmpty(saleUser.getAlipayImg())){
//            respVO.setAlipayImg(Base64.encode(ImageUtils.getImage(saleUser.getAlipayImg())));
//        }

        List<BuyDetailInfoRespVO> buyList = sysBuyCoinMapper.getBuyListBySaleId(saleId);

//        for (BuyDetailInfoRespVO vo : buyList){
//            if(StringUtils.isNotEmpty(vo.getSaleWechatPayImg())){
//                vo.setSaleWechatPayImg(Base64.encode(ImageUtils.getImage(vo.getSaleWechatPayImg())));
//            }
//            if(StringUtils.isNotEmpty(vo.getSaleAlipayImg())){
//                vo.setSaleAlipayImg(Base64.encode(ImageUtils.getImage(vo.getSaleAlipayImg())));
//            }
//
//            if(StringUtils.isNotEmpty(vo.getBuyWechatPayImg())){
//                vo.setBuyWechatPayImg(Base64.encode(ImageUtils.getImage(vo.getBuyWechatPayImg())));
//            }
//            if(StringUtils.isNotEmpty(vo.getBuyAlipayImg())){
//                vo.setBuyAlipayImg(Base64.encode(ImageUtils.getImage(vo.getBuyAlipayImg())));
//            }
//        }

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
        SysUser merchantUser = sysUserService.selectUserById(merchantUserId);

        List<SaleDetailInfoRespVO> saleList  = sysSaleCoinMapper.getSaleList(userId,merchantUserId, merchantUser.getDeptId(), vo.getSaleAmountFrom(), vo.getSaleAmountTo(), vo.getSaleSplitType(), supportBuyArg, (vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());
//        for(SaleDetailInfoRespVO respVO : saleList){
//
//            if(StringUtils.isNotEmpty(respVO.getSaleUserAvatar())){
//                respVO.setSaleUserAvatar(Base64.encode(ImageUtils.getImage(respVO.getSaleUserAvatar())));
//            }
//            if(StringUtils.isNotEmpty(respVO.getWechatPayImg())){
//                respVO.setWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getWechatPayImg())));
//            }
//            if(StringUtils.isNotEmpty(respVO.getAlipayImg())){
//                respVO.setAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getAlipayImg())));
//            }
//        }
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
//        for(SaleDetailInfoRespVO respVO : saleList){
//
//            if(StringUtils.isNotEmpty(respVO.getWechatPayImg())){
//                respVO.setWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getWechatPayImg())));
//            }
//            if(StringUtils.isNotEmpty(respVO.getAlipayImg())){
//                respVO.setAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getAlipayImg())));
//            }
//        }
        return saleList;
    }

    @Override
    public Long addBuyCoin(Long userId, BuyCoinReqVO vo) {

        SysSaleCoin sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(vo.getSaleId());
        if(sysSaleCoin == null){
            throw new ServiceException("卖币信息不存在，请联系管理员");
        }

        SysBuyCoin dbBuyCoin = sysBuyCoinMapper.checkNofinishBuyInfoExist(userId);
        if(StringUtils.isNotNull(dbBuyCoin) && dbBuyCoin.getBuyId() > 0){
            throw new ServiceException("已存在交易中订单，无法重复购买，请先取消交易中订单。");
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
        if(sysSaleCoin.getSingleBuyMaxAmount() > 0
            && sysSaleCoin.getSingleBuyMaxAmount().compareTo(vo.getBuyAmount()) < 0){
            throw new ServiceException("购买金额大于单次可购买最大金额（" + sysSaleCoin.getSingleBuyMaxAmount() + "），请重新选择");
        }
        //购买金额大于剩余金额
        if(sysSaleCoin.getRemainAmount().compareTo(vo.getBuyAmount()) < 0){
            throw new ServiceException("可购买金额不足，请重新选择");
        }

        //订单可拆分时，验证拆分金额
        if(StringUtils.equals(sysSaleCoin.getSaleSplitType(),"1")){
            if(sysSaleCoin.getSplitMinRate() != 0){
                Float splitMinAmount = (sysSaleCoin.getSplitMinRate() * sysSaleCoin.getRemainAmount())/100;
                if(splitMinAmount.compareTo(vo.getBuyAmount()) > 0){
                    throw new ServiceException("购买金额小于拆分购买最少购买金额（" + splitMinAmount + "），请重新选择");
                }
            }
            if(sysSaleCoin.getSplitMaxRate() != 0){
                Float splitMaxAmount = (sysSaleCoin.getSplitMaxRate() * sysSaleCoin.getRemainAmount())/100;
                if(splitMaxAmount.compareTo(vo.getBuyAmount()) < 0){
                    throw new ServiceException("购买金额大于拆分购买最多购买金额（" + splitMaxAmount + "），请重新选择");
                }
            }
        }
        // 锁定卖币订单
        createSaleOrder(vo.getSaleId());

        SysBuyCoin sysBuyCoin = new SysBuyCoin();
        sysBuyCoin.setSaleId(vo.getSaleId());
        sysBuyCoin.setSaleUserId(sysSaleCoin.getSaleUserId());
        sysBuyCoin.setBuyUserId(userId);
        sysBuyCoin.setBuyType(vo.getBuyType());
        sysBuyCoin.setBuyAmount(vo.getBuyAmount());
        sysBuyCoin.setStatus("0");
        sysBuyCoin.setCreateBy(vo.getCreateBy());

        Float remainAmount = sysSaleCoin.getRemainAmount() - vo.getBuyAmount();
        sysSaleCoin.setRemainAmount(remainAmount);
        sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);

        int insertRow = sysBuyCoinMapper.insertSysBuyCoin(sysBuyCoin);

        // 买币订单超时设定
        createBuyOrderNoPay(sysBuyCoin.getBuyId());

        //给卖家推送消息
        String sendMessage = "{}";
        JSONObject saleJsonObject = JSON.parseObject(sendMessage);
        saleJsonObject.put("type", "buyCoinStart");
        saleJsonObject.put("bussineType", "buyCoin");
        saleJsonObject.put("bussineId", sysBuyCoin.getBuyId());
        saleJsonObject.put("message", "买家下单");
        sendMessageToUser(0l,sysBuyCoin.getSaleUserId(),saleJsonObject.toString());


        return sysBuyCoin.getBuyId();
    }

    @Override
    public void buyCoinAutoCancel(Long buyId) {

        SysBuyCoin sysBuyCoin = sysBuyCoinMapper.selectSysBuyCoinByBuyId(buyId);
        if(StringUtils.isNotNull(sysBuyCoin)){
            // 订单状态是1买家已付款或2卖家已确认(买币完成)或9取消，不可取消
            if(!StringUtils.equals(sysBuyCoin.getStatus(),"1")
                    && !StringUtils.equals(sysBuyCoin.getStatus(),"2")
                    && !StringUtils.equals(sysBuyCoin.getStatus(),"9")){

                // 解除卖币订单锁定
                deleteSaleOrder(sysBuyCoin.getSaleId());

                //卖单余额更新
                SysSaleCoin sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(sysBuyCoin.getSaleId());
                sysSaleCoin.setStatus("1");
                sysSaleCoin.setRemainAmount(sysSaleCoin.getRemainAmount() + sysBuyCoin.getBuyAmount());
                sysSaleCoin.setUpdateBy("AUTO_CANCEL");
                sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);

                //买币取消
                sysBuyCoin.setStatus("9");
                sysBuyCoin.setUpdateBy("AUTO_CANCEL");
                sysBuyCoinMapper.updateSysBuyCoin(sysBuyCoin);


                String sendMessage = "{}";
                //给买家推送消息
                JSONObject buyJsonObject = JSON.parseObject(sendMessage);
                buyJsonObject.put("type", "buyCoinAutoCancel");
                buyJsonObject.put("bussineType", "buyCoin");
                buyJsonObject.put("bussineId", sysBuyCoin.getBuyId());
                buyJsonObject.put("message", "订单超时，自动取消");
                sendMessageToUser(0l,sysBuyCoin.getBuyUserId(),buyJsonObject.toString());

                //给卖家推送消息
                JSONObject saleJsonObject = JSON.parseObject(sendMessage);
                saleJsonObject.put("type", "buyCoinAutoCancel");
                saleJsonObject.put("bussineType", "buyCoin");
                saleJsonObject.put("bussineId", sysBuyCoin.getBuyId());
                saleJsonObject.put("message", "订单超时，自动取消");
                sendMessageToUser(0l,sysBuyCoin.getSaleUserId(),saleJsonObject.toString());
            }
        }
    }

    @Override
    public void buyCoinAutoFinish(Long buyId) {

        SysBuyCoin sysBuyCoin = sysBuyCoinMapper.selectSysBuyCoinByBuyId(buyId);
        if(StringUtils.isNotNull(sysBuyCoin)) {
            // 订单状态是1买家已付款时自动确认，不可取消
            if (StringUtils.equals(sysBuyCoin.getStatus(), "1")) {

                //1买家已付款 ⇒ 2卖家已确认(买币完成)
                SysTransactionRecord buyRecord = new SysTransactionRecord();

                //更新买家用户余额
                SysUser user = sysUserService.selectUserById(sysBuyCoin.getBuyUserId());
                Float remainAmount = user.getAmount() + sysBuyCoin.getBuyAmount();
                userMapper.updateUserAmount(user.getUserId(), remainAmount);

                //买币交易记录
                buyRecord.setUserId(sysBuyCoin.getBuyUserId());
                buyRecord.setBuyId(sysBuyCoin.getBuyId());
                buyRecord.setRecordType("0"); //买币
                buyRecord.setRecordAmount(sysBuyCoin.getBuyAmount());
                buyRecord.setUserRemainAmount(remainAmount);
                buyRecord.setStatus("0");
                buyRecord.setCreateBy("AUTO_FINISH");
                sysTransactionRecordMapper.insertSysTransactionRecord(buyRecord);

                SysSaleCoin sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(sysBuyCoin.getSaleId());
                // 已经全部售出
                if(sysSaleCoin.getRemainAmount().compareTo(0f) == 0){
                    sysSaleCoin.setStatus("2"); //卖币完成
                }
                sysSaleCoin.setUpdateBy("AUTO_FINISH");
                sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);

                // 解除卖币订单锁定
                deleteSaleOrder(sysBuyCoin.getSaleId());

                //买币完成
                sysBuyCoin.setStatus("2");
                sysBuyCoin.setUpdateBy("AUTO_FINISH");
                sysBuyCoinMapper.updateSysBuyCoin(sysBuyCoin);

                String sendMessage = "{}";

                //给买家推送消息
                JSONObject buyJsonObject = JSON.parseObject(sendMessage);
                buyJsonObject.put("type", "buyCoinAutoFinish");
                buyJsonObject.put("bussineType", "buyCoin");
                buyJsonObject.put("bussineId", sysBuyCoin.getBuyId());
                buyJsonObject.put("message", "订单确认超时，自动完成");
                sendMessageToUser(0l,sysBuyCoin.getBuyUserId(),buyJsonObject.toString());

                //给卖家推送消息
                JSONObject saleJsonObject = JSON.parseObject(sendMessage);
                saleJsonObject.put("type", "buyCoinAutoFinish");
                saleJsonObject.put("bussineType", "buyCoin");
                saleJsonObject.put("bussineId", sysBuyCoin.getBuyId());
                saleJsonObject.put("message", "订单确认超时，自动完成");
                sendMessageToUser(0l,sysBuyCoin.getSaleUserId(),saleJsonObject.toString());
            }
        }
    }

    public void cancelBuyCoin(Long userId, UpdateBuyStatusReqVO vo){

        SysBuyCoin sysBuyCoin = sysBuyCoinMapper.selectSysBuyCoinByBuyId(vo.getBuyId());
        SysUser user = sysUserService.selectUserById(userId);
        //DB的买单状态已取消，直接返回
        if(StringUtils.equals(sysBuyCoin.getStatus(),"9")){
            return;
        }
        // 商户可直接驳回买单
        // 订单状态是1买家已付款或2卖家已确认(买币完成)或4异议单，不可取消
        if(StringUtils.equals(user.getUserType(),"03") || StringUtils.equals(user.getUserType(),"04")){
            if(StringUtils.equals(sysBuyCoin.getStatus(),"1")
                    || StringUtils.equals(sysBuyCoin.getStatus(),"2")){
                throw new ServiceException("买家已付款，不可取消，请联系管理员");
            }
            if(StringUtils.equals(sysBuyCoin.getStatus(),"4")){
                throw new ServiceException("订单存在异议，不可取消，请联系管理员");
            }
            if(StringUtils.equals(sysBuyCoin.getStatus(),"5")){

                String buyIdKey = getNoPayWaitCancelabledOrderKey(vo.getBuyId());
                Long buyKey = redisCache.getCacheObject(buyIdKey);
                if(StringUtils.isNotNull(buyKey)){
                    throw new ServiceException("买家付款中，不可取消，请联系管理员");
                }
            }
        }

        // 解除卖币订单锁定
        deleteSaleOrder(sysBuyCoin.getSaleId());
        // 解除买家未付款超时
        deleteBuyOrderNoPay(sysBuyCoin.getBuyId());
        // 解除不可撤单订单
        deleteNoPayWaitCancelabled(sysBuyCoin.getBuyId());
        // 解除自动收款超时锁定
//            deleteBuyOrderNoFinish(sysBuyCoin.getBuyId());
//
//            //取消
//            if(StringUtils.equals(sysBuyCoin.getStatus(),"2")){
//                throw new ServiceException("买币完成，不可取消，请联系管理员");
//            }

        //卖单取消
        SysSaleCoin sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(sysBuyCoin.getSaleId());
        sysSaleCoin.setStatus("1");
        sysSaleCoin.setRemainAmount(sysSaleCoin.getRemainAmount() + sysBuyCoin.getBuyAmount());
        sysSaleCoin.setUpdateBy(vo.getUpdateBy());
        sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);

        String sendMessage = "{}";
        if(userId.compareTo(sysBuyCoin.getBuyUserId()) == 0){
            //买家取消
            //给卖家推送消息
            JSONObject jsonObject = JSON.parseObject(sendMessage);
            jsonObject.put("type", "buyCoinBuyUserCancel");
            jsonObject.put("bussineType", "buyCoin");
            jsonObject.put("bussineId", sysBuyCoin.getBuyId());
            jsonObject.put("message", "买家取消");
            sendMessageToUser(sysBuyCoin.getBuyUserId(),sysBuyCoin.getSaleUserId(),jsonObject.toString());
        }else if(userId.compareTo(sysBuyCoin.getSaleUserId()) == 0){
            //卖家取消
            //给买家推送消息
            JSONObject jsonObject = JSON.parseObject(sendMessage);
            jsonObject.put("type", "buyCoinSaleUserCancel");
            jsonObject.put("bussineType", "buyCoin");
            jsonObject.put("bussineId", sysBuyCoin.getBuyId());
            jsonObject.put("message", "卖家取消");
            sendMessageToUser(sysBuyCoin.getSaleUserId(),sysBuyCoin.getBuyUserId(),jsonObject.toString());
        }else{
            //商户取消
            //给买家推送消息
            JSONObject buyJsonObject = JSON.parseObject(sendMessage);
            buyJsonObject.put("type", "buyCoinMerchantUserCancel");
            buyJsonObject.put("bussineType", "buyCoin");
            buyJsonObject.put("bussineId", sysBuyCoin.getBuyId());
            buyJsonObject.put("message", "商户取消");
            sendMessageToUser(sysBuyCoin.getSaleUserId(),sysBuyCoin.getBuyUserId(),buyJsonObject.toString());

            //给卖家推送消息
            JSONObject saleJsonObject = JSON.parseObject(sendMessage);
            saleJsonObject.put("type", "buyCoinMerchantUserCancel");
            saleJsonObject.put("bussineType", "buyCoin");
            saleJsonObject.put("bussineId", sysBuyCoin.getBuyId());
            saleJsonObject.put("message", "商户取消");
            sendMessageToUser(sysBuyCoin.getBuyUserId(),sysBuyCoin.getSaleUserId(),saleJsonObject.toString());
        }
    }


    @Override
    public int updateBuyStatus(Long userId, UpdateBuyStatusReqVO vo) {

        SysBuyCoin sysBuyCoin = sysBuyCoinMapper.selectSysBuyCoinByBuyId(vo.getBuyId());
        if(StringUtils.isNull(sysBuyCoin)){
            throw new ServiceException("买币信息不存在，请联系管理员");
        }
        SysUser user = sysUserService.selectUserById(userId);

        if(StringUtils.equals(vo.getStatus(),"4")) {
            if(StringUtils.equals("9",sysBuyCoin.getStatus())){
                throw new ServiceException("买币订单已被取消，无法提出异议");
            }

            // 解除买家未付款超时
            deleteBuyOrderNoPay(sysBuyCoin.getBuyId());

            String sendMessage = "{}";
            if(sysBuyCoin.getBuyUserId().compareTo(userId) == 0){

                //给卖家推送消息
                JSONObject jsonObject = JSON.parseObject(sendMessage);
                jsonObject.put("type", "buyCoinObjection");
                jsonObject.put("bussineType", "buyCoin");
                jsonObject.put("bussineId", sysBuyCoin.getBuyId());
                jsonObject.put("message", "买家有异议，管理员审核中");
                sendMessageToUser(sysBuyCoin.getBuyUserId(),sysBuyCoin.getSaleUserId(),jsonObject.toString());
            }else if(sysBuyCoin.getBuyUserId().compareTo(userId) == 0){

                //给买家推送消息
                JSONObject jsonObject = JSON.parseObject(sendMessage);
                jsonObject.put("type", "buyCoinObjection");
                jsonObject.put("bussineType", "buyCoin");
                jsonObject.put("bussineId", sysBuyCoin.getBuyId());
                jsonObject.put("message", "卖家有异议，管理员审核中");
                sendMessageToUser(sysBuyCoin.getSaleUserId(),sysBuyCoin.getBuyUserId(),jsonObject.toString());
            }

        }else if(StringUtils.equals(vo.getStatus(),"9")){

            cancelBuyCoin(userId,vo);
//            //买币记录取消
//            SysTransactionRecord buyRecord = sysTransactionRecordMapper.selectTransactionRecordByRecordTypeAndId("0", sysBuyCoin.getBuyId(), null, null);
//            if(StringUtils.isNull(buyRecord)) {
//                throw new ServiceException("交易记录信息不存在，不可取消");
//            }
//            buyRecord.setStatus("9");
//            buyRecord.setUpdateBy(vo.getUpdateBy());
//            sysTransactionRecordMapper.updateSysTransactionRecord(buyRecord);

        }else if(StringUtils.equals(sysBuyCoin.getStatus(),"0") && StringUtils.equals(vo.getStatus(),"3")){
            //0买家下单 ⇒ 3卖家已确认

            // 刷新未付款超时取消时常
            flushBuyOrderNoPay(sysBuyCoin.getBuyId());
            // 新增不可撤单订单
            createNoPayWaitCancelabled(sysBuyCoin.getBuyId());

            //给买家推送消息
            String sendMessage = "{}";
            JSONObject jsonObject = JSON.parseObject(sendMessage);
            jsonObject.put("type", "buyCoinConfirm");
            jsonObject.put("bussineType", "buyCoin");
            jsonObject.put("bussineId", sysBuyCoin.getBuyId());
            jsonObject.put("message", "卖家已确认售卖");
            sendMessageToUser(sysBuyCoin.getSaleUserId(),sysBuyCoin.getBuyUserId(),jsonObject.toString());

        }else if(StringUtils.equals(sysBuyCoin.getStatus(),"3") && StringUtils.equals(vo.getStatus(),"5")){
            //3卖家已确认 ⇒ 5买家付款中

            //给卖家推送消息
            String sendMessage = "{}";
            JSONObject jsonObject = JSON.parseObject(sendMessage);
            jsonObject.put("type", "buyCoinPayed");
            jsonObject.put("bussineType", "buyCoin");
            jsonObject.put("bussineId", sysBuyCoin.getBuyId());
            jsonObject.put("message", "买家正在付款中");
            sendMessageToUser(sysBuyCoin.getBuyUserId(),sysBuyCoin.getSaleUserId(),jsonObject.toString());

        }else if(StringUtils.equals(sysBuyCoin.getStatus(),"5") && StringUtils.equals(vo.getStatus(),"1")){

            //5买家付款中 ⇒ 1买家已付款
            // 解除买家未付款超时
            deleteBuyOrderNoPay(sysBuyCoin.getBuyId());
            // 解除不可撤单订单
            deleteNoPayWaitCancelabled(sysBuyCoin.getBuyId());

            // 新增自动收款超时限制
            createBuyOrderNoFinish(sysBuyCoin.getBuyId());

            //给卖家推送消息
            String sendMessage = "{}";
            JSONObject jsonObject = JSON.parseObject(sendMessage);
            jsonObject.put("type", "buyCoinPayed");
            jsonObject.put("bussineType", "buyCoin");
            jsonObject.put("bussineId", sysBuyCoin.getBuyId());
            jsonObject.put("message", "买家已付款");
            sendMessageToUser(sysBuyCoin.getBuyUserId(),sysBuyCoin.getSaleUserId(),jsonObject.toString());

        }else if(StringUtils.equals(sysBuyCoin.getStatus(),"1") && StringUtils.equals(vo.getStatus(),"2")
            || StringUtils.equals(sysBuyCoin.getStatus(),"4") && StringUtils.equals(vo.getStatus(),"2")){

            //1买家已付款 ⇒ 2卖家已确认(买币完成)
            //4异议 ⇒ 2卖家已确认(买币完成)

            SysTransactionRecord buyRecord = new SysTransactionRecord();

            //更新买家用户余额
            user = sysUserService.selectUserById(sysBuyCoin.getBuyUserId());
            Float remainAmount = user.getAmount() + sysBuyCoin.getBuyAmount();
            userMapper.updateUserAmount(user.getUserId(), remainAmount);

            //买币交易记录
            buyRecord.setUserId(sysBuyCoin.getBuyUserId());
            buyRecord.setBuyId(sysBuyCoin.getBuyId());
            buyRecord.setRecordType("0"); //买币
            buyRecord.setRecordAmount(sysBuyCoin.getBuyAmount());
            buyRecord.setUserRemainAmount(remainAmount);
            buyRecord.setStatus("0");
            buyRecord.setCreateBy(vo.getUpdateBy());
            sysTransactionRecordMapper.insertSysTransactionRecord(buyRecord);

            SysSaleCoin sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(sysBuyCoin.getSaleId());
            // 已经全部售出
            if(sysSaleCoin.getRemainAmount().compareTo(0f) == 0){
                sysSaleCoin.setStatus("2"); //卖币完成
            }
            sysSaleCoin.setUpdateBy(vo.getUpdateBy());
            sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);

            // 解除卖币订单锁定
            deleteSaleOrder(sysBuyCoin.getSaleId());
            // 解除自动收款超时锁定
            deleteBuyOrderNoFinish(sysBuyCoin.getBuyId());
            // 解除不可撤单订单
            deleteNoPayWaitCancelabled(sysBuyCoin.getBuyId());

            //给买家推送消息
            String sendMessage = "{}";
            JSONObject jsonObject = JSON.parseObject(sendMessage);
            jsonObject.put("type", "buyCoinFinish");
            jsonObject.put("bussineType", "buyCoin");
            jsonObject.put("bussineId", sysBuyCoin.getBuyId());
            jsonObject.put("message", "卖家已确认收款，订单完成");
            sendMessageToUser(sysBuyCoin.getSaleUserId(),sysBuyCoin.getBuyUserId(),jsonObject.toString());
        }
        sysBuyCoin.setStatus(vo.getStatus());
        sysBuyCoin.setUpdateBy(vo.getUpdateBy());

        return sysBuyCoinMapper.updateSysBuyCoin(sysBuyCoin);
    }

    @Override
    public void extendBuyTimeOutNoPay(ExtendBuyTimeOutNoPayReqVO vo) {
        // 刷新不可撤单时间到订单结束
        extendNoPayWaitCancelabled(vo.getBuyId());
    }

    public void sendMessageToUser(Long fromUserId, Long toUserId, String message){
        try {
            webSocketService.sendMessageTo(fromUserId.toString(),toUserId.toString(),message);
        } catch (IOException e) {
//            throw new RuntimeException(e);
        }
    }


    public int uploadBuyVoucher(Long userId, UploadBuyVoucherReqVO vo){

        SysBuyCoin sysBuyCoin = sysBuyCoinMapper.selectSysBuyCoinByBuyId(vo.getBuyId());
        if(StringUtils.isNull(sysBuyCoin)){
            throw new ServiceException("买币信息不存在，请联系管理员");
        }

        if(StringUtils.isNotEmpty(vo.getBuyVoucher())){
            String buyVoucher = ImageUtils.savaBase64ImageFile(vo.getBuyVoucher());
            if(StringUtils.isNotEmpty(buyVoucher)){
                sysBuyCoin.setBuyVoucher(buyVoucher);
            }else{
                throw new ServiceException("上传买币支付凭证失败");
            }
        }
        int updateRow = sysBuyCoinMapper.updateSysBuyCoin(sysBuyCoin);
        if(updateRow >0){
            UpdateBuyStatusReqVO updateBuyStatusReqVO = new UpdateBuyStatusReqVO();
            updateBuyStatusReqVO.setStatus("1"); //买家已付款
            updateBuyStatusReqVO.setBuyId(vo.getBuyId());
            updateBuyStatusReqVO.setUpdateBy(vo.getUpdateBy());
            updateBuyStatus(userId,updateBuyStatusReqVO);
        }

        return updateRow;
    }

    @Override
    public BuyDetailInfoRespVO getBuyDetailInfo(Long buyId) {

        BuyDetailInfoRespVO respVO = sysBuyCoinMapper.getBuyDetailInfo(buyId);

//        if(StringUtils.isNotEmpty(respVO.getSaleWechatPayImg())){
//            respVO.setSaleWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getSaleWechatPayImg())));
//        }
//        if(StringUtils.isNotEmpty(respVO.getSaleAlipayImg())){
//            respVO.setSaleAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getSaleAlipayImg())));
//        }
//
//        if(StringUtils.isNotEmpty(respVO.getBuyWechatPayImg())){
//            respVO.setBuyWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getBuyWechatPayImg())));
//        }
//        if(StringUtils.isNotEmpty(respVO.getBuyAlipayImg())){
//            respVO.setBuyAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getBuyAlipayImg())));
//        }

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

//        for (BuyDetailInfoRespVO respVO : buyList){
//            if(StringUtils.isNotEmpty(respVO.getSaleWechatPayImg())){
//                respVO.setSaleWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getSaleWechatPayImg())));
//            }
//            if(StringUtils.isNotEmpty(respVO.getSaleAlipayImg())){
//                respVO.setSaleAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getSaleAlipayImg())));
//            }
//
//            if(StringUtils.isNotEmpty(respVO.getBuyWechatPayImg())){
//                respVO.setBuyWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getBuyWechatPayImg())));
//            }
//            if(StringUtils.isNotEmpty(respVO.getBuyAlipayImg())){
//                respVO.setBuyAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getBuyAlipayImg())));
//            }
//        }
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
        SysUser rechargeFromUser = sysUserService.selectUserById(userId);
        SysUser rechargeToUser = sysUserService.selectUserById(vo.getUserId());
        Long merchantUserId  = parentMerchantUserId(userId);
        SysUser merchantUser = sysUserService.selectUserById(merchantUserId);
        Float rechargeCommission = 0f;
        if(rechargeToUser.getRechargeCommission() > 0){
            Float f = (vo.getRechargeAmount() * rechargeToUser.getRechargeCommission())/100;
            BigDecimal b = new BigDecimal(f);
            rechargeCommission = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
        }

        Float rechargeFromUserRemainAmount = rechargeFromUser.getAmount() - vo.getRechargeAmount();
        Float rechargeToUserRemainAmount = rechargeToUser.getAmount() + vo.getRechargeAmount() - rechargeCommission;

        SysRecharge recharge = new SysRecharge();
        recharge.setFromUserId(userId);
        recharge.setToUserId(vo.getUserId());
        recharge.setRechargeAmount(vo.getRechargeAmount());
        recharge.setStatus("1"); //充值完成
        recharge.setRechargeType("3");
        recharge.setRechargeFromUserRemianAmount(rechargeFromUserRemainAmount);
        recharge.setRechargeToUserRemianAmount(rechargeToUserRemainAmount);
        recharge.setCreateBy(vo.getCreateBy());
        int insertRow = sysRechargeMapper.insertSysRecharge(recharge);

        //充值扣款人交易记录
        SysTransactionRecord rechargeFromRecord = new SysTransactionRecord();
        rechargeFromRecord.setUserId(userId);
        rechargeFromRecord.setRechargeId(recharge.getRechargeId());
        rechargeFromRecord.setRecordType("3"); //充值From方
        rechargeFromRecord.setRecordAmount(vo.getRechargeAmount());
        rechargeFromRecord.setUserRemainAmount(rechargeFromUserRemainAmount);
        rechargeFromRecord.setStatus("0");
        rechargeFromRecord.setCreateBy(vo.getCreateBy());
        sysTransactionRecordMapper.insertSysTransactionRecord(rechargeFromRecord);
        // 更新余额
        userMapper.updateUserAmount(rechargeFromUser.getUserId(), rechargeFromUserRemainAmount);

        // 更新余额
        userMapper.updateUserAmount(rechargeToUser.getUserId(), rechargeToUserRemainAmount);

        //充值扣款人交易记录
        SysTransactionRecord rechargeToUserRecord = new SysTransactionRecord();
        rechargeToUserRecord.setUserId(vo.getUserId());
        rechargeToUserRecord.setRechargeId(recharge.getRechargeId());
        rechargeToUserRecord.setRecordType("6"); //充值To方
        rechargeToUserRecord.setRecordAmount(vo.getRechargeAmount()- rechargeCommission);
        rechargeToUserRecord.setUserRemainAmount(rechargeToUserRemainAmount);
        rechargeToUserRecord.setStatus("0");
        rechargeToUserRecord.setCreateBy(vo.getCreateBy());
        sysTransactionRecordMapper.insertSysTransactionRecord(rechargeToUserRecord);

        if(rechargeCommission > 0){
            // 更新余额
            userMapper.updateUserAmount(merchantUser.getUserId(), merchantUser.getAmount() + rechargeCommission);
            //充值手续费交易记录
            SysTransactionRecord rechargeCommissionRecord = new SysTransactionRecord();
            rechargeCommissionRecord.setUserId(merchantUser.getUserId());
            rechargeCommissionRecord.setRechargeId(recharge.getRechargeId());
            rechargeCommissionRecord.setRecordType("8"); //充值手续费
            rechargeCommissionRecord.setRecordAmount(rechargeCommission);
            rechargeCommissionRecord.setUserRemainAmount(merchantUser.getAmount() + rechargeCommission);
            rechargeCommissionRecord.setStatus("0");
            rechargeCommissionRecord.setCreateBy(vo.getCreateBy());
            sysTransactionRecordMapper.insertSysTransactionRecord(rechargeCommissionRecord);
        }

        //给被充值的人 推送消息
        String sendMessage = "{}";
        JSONObject jsonObject = JSON.parseObject(sendMessage);
        jsonObject.put("type", "rechargeFinish");
        jsonObject.put("bussineType", "recharge");
        jsonObject.put("bussineId", recharge.getRechargeId());
        jsonObject.put("message", "充值完成");
        sendMessageToUser(userId,vo.getUserId(),jsonObject.toString());

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

//        if(StringUtils.isNotEmpty(respVO.getRechargeToWechatPayImg())){
//            respVO.setRechargeToWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeToWechatPayImg())));
//        }
//        if(StringUtils.isNotEmpty(respVO.getRechargeToAlipayImg())){
//            respVO.setRechargeToAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeToAlipayImg())));
//        }
//        if(StringUtils.isNotEmpty(respVO.getRechargeFromWechatPayImg())){
//            respVO.setRechargeFromWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeFromWechatPayImg())));
//        }
//        if(StringUtils.isNotEmpty(respVO.getRechargeFromAlipayImg())){
//            respVO.setRechargeFromAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeFromAlipayImg())));
//        }
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

//        for (RechargeDetailInfoRespVO respVO : rechargeList){
//            if(StringUtils.isNotEmpty(respVO.getRechargeToWechatPayImg())){
//                respVO.setRechargeToWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeToWechatPayImg())));
//            }
//            if(StringUtils.isNotEmpty(respVO.getRechargeToAlipayImg())){
//                respVO.setRechargeToAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeToAlipayImg())));
//            }
//            if(StringUtils.isNotEmpty(respVO.getRechargeFromWechatPayImg())){
//                respVO.setRechargeFromWechatPayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeFromWechatPayImg())));
//            }
//            if(StringUtils.isNotEmpty(respVO.getRechargeFromAlipayImg())){
//                respVO.setRechargeFromAlipayImg(Base64.encode(ImageUtils.getImage(respVO.getRechargeFromAlipayImg())));
//            }
//        }
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
        String[] recordTypeArg = new String[]{};
        if(vo.getRecordType() != null){
            recordTypeArg = vo.getRecordType().split(",");
        }
        return sysTransactionRecordMapper.getMyTransactionList(userId,recordTypeArg,vo.getRecordTimeFrom(), vo.getRecordTimeTo(),(vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());
    }

    @Override
    public CashFlowRespVO getUserCashFlow(Long userId) {
        CashFlowRespVO respVO = new CashFlowRespVO();
        SysUser user = sysUserService.selectUserById(userId);
        SysTransactionRecord searchRecord = new SysTransactionRecord();
        searchRecord.setUserId(userId);
        searchRecord.setStatus("0");
//        List<SysTransactionRecord> list = sysTransactionRecordMapper.selectSysTransactionRecordList(searchRecord);
        Float totalAmount = sysTransactionRecordMapper.getTransactonAmountTotal(null,user.getDeptId(),null,null);
//        Float commissionAmount = 0f;
        Float todayTotalAmount = sysTransactionRecordMapper.getTransactonAmountTotal(null,user.getDeptId(),"0",null);
        Float yesterdayTotalAmount = sysTransactionRecordMapper.getTransactonAmountTotal(null,user.getDeptId(),null,"1");

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

    @Override
    public boolean existSalingOrder(Long saleId){
        String saleIdKey = getSaleOrderKey(saleId);
        Long saleKey = redisCache.getCacheObject(saleIdKey);
        if(StringUtils.isNotNull(saleKey)){
            return true;
        }
        return false;
    }

    private String getSaleOrderKey(Long saleId){
        return CacheConstants.SALE_ICON_ORDER_ID + saleId;
    }

    @Override
    public void createSaleOrder(Long saleId){
        String saleIdKey = getSaleOrderKey(saleId);
        redisCache.setCacheObject(saleIdKey, saleId, saleInfoAutoCancelTime, TimeUnit.MINUTES);
    }

    private void deleteSaleOrder(Long saleId){
        String saleIdKey = getSaleOrderKey(saleId);
        redisCache.deleteObject(saleIdKey);
    }

    private String getNoPayWaitCancelabledOrderKey(Long buyId){
        return CacheConstants.BUY_ICON_ORDER_ID_NO_PAY_WAIT_CANCELABLE + buyId;
    }

    private void createNoPayWaitCancelabled(Long buyId){
        String buyIdKey = getNoPayWaitCancelabledOrderKey(buyId);
        redisCache.setCacheObject(buyIdKey, buyId, noPayWaitCancelableTime, TimeUnit.MINUTES);
    }

    private void extendNoPayWaitCancelabled(Long buyId){
        String buyIdKey = getNoPayWaitCancelabledOrderKey(buyId);
        redisCache.setCacheObject(buyIdKey, buyId, waitPayAutoCancelTime, TimeUnit.MINUTES);
    }

    private void deleteNoPayWaitCancelabled(Long buyId){
        String buyIdKey = getNoPayWaitCancelabledOrderKey(buyId);
        redisCache.deleteObject(buyIdKey);
    }

    private void flushBuyOrderNoPay(Long buyId){
        String buyIdKey = getNoPayOrderKey(buyId);
        redisCache.setCacheObject(buyIdKey, buyId, waitPayAutoCancelTime, TimeUnit.MINUTES);
    }

    private String getNoPayOrderKey(Long buyId){
        return CacheConstants.BUY_ICON_ORDER_ID_NO_PAY + buyId;
    }

    private void createBuyOrderNoPay(Long buyId){
        String buyIdKey = getNoPayOrderKey(buyId);
        redisCache.setCacheObject(buyIdKey, buyId, noPayAutoCancelTime, TimeUnit.MINUTES);
    }

    private void deleteBuyOrderNoPay(Long buyId){
        String buyIdKey = getNoPayOrderKey(buyId);
        redisCache.deleteObject(buyIdKey);
    }

    private String getAutoFinishOrderKey(Long buyId){
        return CacheConstants.BUY_ICON_ORDER_ID_AUTO_FINISH + buyId;
    }

    private void createBuyOrderNoFinish(Long buyId){
        String buyIdKey = getAutoFinishOrderKey(buyId);
        redisCache.setCacheObject(buyIdKey, buyId, autoBuyFinishTime, TimeUnit.MINUTES);
    }

    private void deleteBuyOrderNoFinish(Long buyId){
        String buyIdKey = getAutoFinishOrderKey(buyId);
        redisCache.deleteObject(buyIdKey);
    }

	@Override
	public int updatePayTypeStatus(Long userId, UpdatePayTypeReqVO vo) {

		SysUserPayTypeApprove userPayTypeApprove = sysUserPayTypeApproveService.selectSysUserPayTypeApproveByPayTypeApproveId(vo.getPayTypeApproveId());
        if(StringUtils.isNull(userPayTypeApprove)){
            throw new ServiceException("审核信息不存在，请联系管理员");
        }
        
        // 审核成功
        if(StringUtils.equals(vo.getStatus(), "1")) {
        	
            SysUser user = sysUserService.selectUserById(userPayTypeApprove.getUserId());
            // 支付宝付款码
            if(StringUtils.equals(userPayTypeApprove.getPayType(), "0")) {

            	user.setAlipayImg(userPayTypeApprove.getPayImg());
            	user.setAlipayRemark(userPayTypeApprove.getPayRemark());
            // 微信付款码
            }else if(StringUtils.equals(userPayTypeApprove.getPayType(), "1")) {

            	user.setWechatPayImg(userPayTypeApprove.getPayImg());
            	user.setWechatPayRemark(userPayTypeApprove.getPayRemark());
            }
            userMapper.updateUser(user);
        }
    	userPayTypeApprove.setStatus(vo.getStatus());
    	userPayTypeApprove.setUpdateBy(vo.getUpdateBy());

		return sysUserPayTypeApproveService.updateSysUserPayTypeApprove(userPayTypeApprove);
	}
}
