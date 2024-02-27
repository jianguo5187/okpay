package com.ruoyi.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.entity.SysBuyCoin;
import com.ruoyi.common.core.domain.entity.SysTransactionRecord;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.vo.req.BuyCoinReqVO;
import com.ruoyi.common.core.vo.req.SaleShoppingCoinReqVo;
import com.ruoyi.common.core.vo.req.ShoppingListReqVO;
import com.ruoyi.common.core.vo.resp.SaleDetailInfoRespVO;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.SysBuyCoinMapper;
import com.ruoyi.system.mapper.SysTransactionRecordMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysSaleCoinMapper;
import com.ruoyi.common.core.domain.entity.SysSaleCoin;
import com.ruoyi.system.service.ISysSaleCoinService;

/**
 * 卖币Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
@Service
public class SysSaleCoinServiceImpl implements ISysSaleCoinService 
{
    @Autowired
    private SysSaleCoinMapper sysSaleCoinMapper;
    @Autowired
    private SysUserMapper userMapper;

    @Autowired
    private SysBuyCoinMapper sysBuyCoinMapper;

    @Autowired
    private SysTransactionRecordMapper sysTransactionRecordMapper;

    /**
     * 查询卖币
     * 
     * @param saleId 卖币主键
     * @return 卖币
     */
    @Override
    public SysSaleCoin selectSysSaleCoinBySaleId(Long saleId)
    {
        return sysSaleCoinMapper.selectSysSaleCoinBySaleId(saleId);
    }

    /**
     * 查询卖币列表
     * 
     * @param sysSaleCoin 卖币
     * @return 卖币
     */
    @Override
    public List<SysSaleCoin> selectSysSaleCoinList(SysSaleCoin sysSaleCoin)
    {
        return sysSaleCoinMapper.selectSysSaleCoinList(sysSaleCoin);
    }

    /**
     * 新增卖币
     * 
     * @param sysSaleCoin 卖币
     * @return 结果
     */
    @Override
    public int insertSysSaleCoin(SysSaleCoin sysSaleCoin)
    {
        sysSaleCoin.setCreateTime(DateUtils.getNowDate());
        return sysSaleCoinMapper.insertSysSaleCoin(sysSaleCoin);
    }

    /**
     * 修改卖币
     * 
     * @param sysSaleCoin 卖币
     * @return 结果
     */
    @Override
    public int updateSysSaleCoin(SysSaleCoin sysSaleCoin)
    {
        sysSaleCoin.setUpdateTime(DateUtils.getNowDate());
        return sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);
    }

    /**
     * 批量删除卖币
     * 
     * @param saleIds 需要删除的卖币主键
     * @return 结果
     */
    @Override
    public int deleteSysSaleCoinBySaleIds(Long[] saleIds)
    {
        return sysSaleCoinMapper.deleteSysSaleCoinBySaleIds(saleIds);
    }

    /**
     * 删除卖币信息
     * 
     * @param saleId 卖币主键
     * @return 结果
     */
    @Override
    public int deleteSysSaleCoinBySaleId(Long saleId)
    {
        return sysSaleCoinMapper.deleteSysSaleCoinBySaleId(saleId);
    }

    @Override
    public List<SaleDetailInfoRespVO> selectShoppingList(Long userId, Long deptId, ShoppingListReqVO vo) {

        String[] supportBuyArg = new String[]{};
        if(vo.getSupportBuyType() != null){
            supportBuyArg = vo.getSupportBuyType().split(",");
        }
        List<SaleDetailInfoRespVO> resutlt = sysSaleCoinMapper.selectShoppingList(userId,deptId,vo.getSaleUserId(), vo.getSaleNo(),vo.getStatus(), vo.getSaleSplitType(),supportBuyArg,vo.getUrgentSaleFlg(),vo.getStartSaleTime(),vo.getEndSaleTime());
        for(SaleDetailInfoRespVO respVO : resutlt){
            String supportBuyTypeName = "";
            if(respVO.getSupportBuyType().indexOf("0") >= 0){
                supportBuyTypeName += "支付宝";
            }
            if(respVO.getSupportBuyType().indexOf("1") >= 0){
                if(StringUtils.isNotEmpty(supportBuyTypeName)){
                    supportBuyTypeName += ",";
                }
                supportBuyTypeName += "微信";
            }
            if(respVO.getSupportBuyType().indexOf("2") >= 0){
                if(StringUtils.isNotEmpty(supportBuyTypeName)){
                    supportBuyTypeName += ",";
                }
                supportBuyTypeName += "银联";
            }
            respVO.setSupportBuyTypeName(supportBuyTypeName);
        }
        return resutlt;
    }

    @Override
    public SaleDetailInfoRespVO selectShoppingInfo(Long saleId) {
        SaleDetailInfoRespVO respVO = new SaleDetailInfoRespVO();
        SysSaleCoin saleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(saleId);
        SysUser saleUser = userMapper.selectUserById(saleCoin.getSaleUserId());

        respVO.setSaleId(saleId);
        respVO.setSaleNo(saleCoin.getSaleNo());
        respVO.setSaleTime(saleCoin.getSaleTime());
        respVO.setSaleSplitType(saleCoin.getSaleSplitType());
        if(StringUtils.isNotEmpty(saleCoin.getSupportBuyType())){
            respVO.setSupportBuyTypeArg(saleCoin.getSupportBuyType().split(","));
        }
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

        return respVO;
    }

    @Override
    public int shoppingCoinBuy(Long userId, BuyCoinReqVO vo) {
        SysSaleCoin sysSaleCoin = sysSaleCoinMapper.selectSysSaleCoinBySaleId(vo.getSaleId());

        SysBuyCoin sysBuyCoin = new SysBuyCoin();
        sysBuyCoin.setSaleId(vo.getSaleId());
        sysBuyCoin.setSaleUserId(sysSaleCoin.getSaleUserId());
        sysBuyCoin.setBuyUserId(userId);
        sysBuyCoin.setBuyType(vo.getBuyType());
        sysBuyCoin.setBuyAmount(vo.getBuyAmount());
        sysBuyCoin.setStatus("2"); //完成
        sysBuyCoin.setCreateBy(vo.getCreateBy());

        Float saleRemainAmount = sysSaleCoin.getRemainAmount() - vo.getBuyAmount();
        if(saleRemainAmount == 0){
            sysSaleCoin.setStatus("2");
        }
        sysSaleCoin.setRemainAmount(saleRemainAmount);
        sysSaleCoinMapper.updateSysSaleCoin(sysSaleCoin);

        int insertRow = sysBuyCoinMapper.insertSysBuyCoin(sysBuyCoin);

        //商户购买，直接完成交易(买币完成)
        SysTransactionRecord buyRecord = new SysTransactionRecord();

        //买币交易记录
        buyRecord.setUserId(userId);
        buyRecord.setBuyId(sysBuyCoin.getBuyId());
        buyRecord.setRecordType("0"); //买币
        buyRecord.setRecordAmount(vo.getBuyAmount());
        buyRecord.setStatus("0");
        buyRecord.setCreateBy(vo.getCreateBy());
        sysTransactionRecordMapper.insertSysTransactionRecord(buyRecord);

//        //更新用户余额
//        SysUser user = userMapper.selectUserById(userId);
//        Float remainAmount = user.getAmount() + sysBuyCoin.getBuyAmount();
//        userMapper.updateUserAmount(userId, remainAmount);

        return insertRow;
    }

    @Override
    public int saleShoppingCoin(Long userId, SaleShoppingCoinReqVo vo) {
        Date currentDate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String currentDateTime = sdf.format(currentDate);
        String saleNo = "OK" + currentDateTime;

        SysUser saleUser = userMapper.selectUserById(userId);
        SysSaleCoin sysSaleCoin = new SysSaleCoin();
        sysSaleCoin.setSaleNo(saleNo);
        sysSaleCoin.setSaleUserId(userId);
        String supportBuyType = "";
        for(String s : vo.getSupportBuyTypeArg()){
            if(StringUtils.isNotEmpty(supportBuyType)){
                supportBuyType += ",";
            }
            supportBuyType += s;
        }
        sysSaleCoin.setSaleSplitType(vo.getSaleSplitType());
        sysSaleCoin.setSupportBuyType(supportBuyType);
        sysSaleCoin.setSaleAmount(vo.getSaleAmount());
        sysSaleCoin.setSaleAmountWithoutCommission(vo.getSaleAmount());
        sysSaleCoin.setCommissionAmount(0f);
        sysSaleCoin.setRemainAmount(vo.getSaleAmount());
        sysSaleCoin.setStatus("1"); //生成订单
        sysSaleCoin.setUrgentSaleFlg(vo.getUrgentSaleFlg());
        sysSaleCoin.setCreateBy(vo.getCreateBy());

        // 这个方法只有商户后台使用，所以直接用卖币用户的设置值
        sysSaleCoin.setSplitMinRate(saleUser.getSplitMinRate());
        sysSaleCoin.setSplitMaxRate(saleUser.getSplitMaxRate());
        sysSaleCoin.setSingleBuyMaxAmount(saleUser.getSingleBuyMaxAmount());

        int insertRow = sysSaleCoinMapper.insertSysSaleCoin(sysSaleCoin);
        //临时交易记录生成
        SysTransactionRecord transactionRecord = new SysTransactionRecord();
        //卖币生成
        transactionRecord.setUserId(userId);
        transactionRecord.setSaleId(sysSaleCoin.getSaleId());
        transactionRecord.setRecordType("1"); //卖币
        transactionRecord.setRecordAmount(vo.getSaleAmount());
        transactionRecord.setStatus("0"); //临时记录
        int transactionRecordRow = sysTransactionRecordMapper.insertSysTransactionRecord(transactionRecord);

        return insertRow;
    }
}
