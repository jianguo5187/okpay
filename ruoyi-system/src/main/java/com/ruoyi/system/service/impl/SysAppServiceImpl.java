package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysBuyCoin;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysSaleCoin;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.vo.req.*;
import com.ruoyi.common.core.vo.resp.BuyDetailInfoRespVO;
import com.ruoyi.common.core.vo.resp.SaleDetailInfoRespVO;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.ImageUtils;
import com.ruoyi.common.utils.sign.Base64;
import com.ruoyi.system.mapper.SysBuyCoinMapper;
import com.ruoyi.system.mapper.SysSaleCoinMapper;
import com.ruoyi.system.service.ISysAppService;
import com.ruoyi.system.service.ISysSaleCoinService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Service
public class SysAppServiceImpl implements ISysAppService {

    @Autowired
    private ISysSaleCoinService sysSaleCoinService;

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private SysSaleCoinMapper sysSaleCoinMapper;

    @Autowired
    private SysBuyCoinMapper sysBuyCoinMapper;

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

        SysSaleCoin sysSaleCoin = new SysSaleCoin();
        String saleNo = "OK" + currentDateTime;
        sysSaleCoin.setSaleNo(saleNo);
        sysSaleCoin.setSaleUserId(userId);
        sysSaleCoin.setSaleSplitType(vo.getSaleSplitType());
        sysSaleCoin.setSupportBuyType(vo.getSupportBuyType());
        sysSaleCoin.setSaleAmount(vo.getSaleAmount());
        sysSaleCoin.setRemainAmount(vo.getSaleAmount());
        sysSaleCoin.setStatus("0"); //生成订单
        sysSaleCoin.setUrgentSaleFlg(vo.getUrgentSaleFlg());
        sysSaleCoin.setCreateBy(vo.getCreateBy());

        int insertRow = sysSaleCoinMapper.insertSysSaleCoin(sysSaleCoin);
        return sysSaleCoin.getSaleId();
    }

    @Override
    public int updateSaleStatus(UpdateSaleStatusReqVO vo) {

        SysSaleCoin sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(vo.getSaleId());
        if(StringUtils.isNull(sysSaleCoin)){
            throw new ServiceException("卖币信息不存在，请联系管理员");
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
        respVO.setStatus(saleCoin.getStatus());
        respVO.setUrgentSaleFlg(saleCoin.getUrgentSaleFlg());
        respVO.setSaleUserId(saleUser.getUserId());
        respVO.setSaleUserNickName(saleUser.getNickName());
        respVO.setSaleUserPhonenumber(saleUser.getPhonenumber());
        respVO.setUnionpayAccount(saleUser.getUnionpayAccount());
        respVO.setUnionpayCard(saleUser.getUnionpayCard());
        if(StringUtils.isNotEmpty(saleUser.getWechatPayImg())){
            respVO.setWechatPayImg(Base64.encode(ImageUtils.getImage(saleUser.getWechatPayImg())));
        }
        if(StringUtils.isNotEmpty(saleUser.getAlipayImg())){
            respVO.setAlipayImg(Base64.encode(ImageUtils.getImage(saleUser.getAlipayImg())));
        }

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

        List<SaleDetailInfoRespVO> saleList  = sysSaleCoinMapper.getSaleList(userId,deptId, vo.getSaleAmountFrom(), vo.getSaleAmountTo(), vo.getSaleSplitType(), supportBuyArg, (vo.getPageNumber()-1)*vo.getPageRowCount(),vo.getPageRowCount());
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
            && sysSaleCoin.getSaleAmount().compareTo(vo.getBuyAmount()) != 0){
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

        Float remainAmount = sysSaleCoin.getRemainAmount() - vo.getBuyAmount();
        if(remainAmount == 0){
            sysSaleCoin.setStatus("9");
        }
        sysSaleCoin.setRemainAmount(remainAmount);
        sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);

        int insertRow = sysBuyCoinMapper.insertSysBuyCoin(sysBuyCoin);

        //todo 扣除用户余额
        return sysBuyCoin.getBuyId();
    }

    @Override
    public int updateBuyStatus(UpdateBuyStatusReqVO vo) {

        SysBuyCoin sysBuyCoin = sysBuyCoinMapper.selectSysBuyCoinByBuyId(vo.getBuyId());
        if(StringUtils.isNull(sysBuyCoin)){
            throw new ServiceException("买币信息不存在，请联系管理员");
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
    public List<BuyDetailInfoRespVO> getMyBuyList(Long userId, GeyMyBuyListReqVO vo) {
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
}
