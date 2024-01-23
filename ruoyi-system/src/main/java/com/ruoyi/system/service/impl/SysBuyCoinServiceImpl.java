package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.core.vo.req.ShoppingBuyListReqVO;
import com.ruoyi.common.core.vo.resp.BuyDetailInfoRespVO;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysBuyCoinMapper;
import com.ruoyi.common.core.domain.entity.SysBuyCoin;
import com.ruoyi.system.service.ISysBuyCoinService;

/**
 * 买币Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
@Service
public class SysBuyCoinServiceImpl implements ISysBuyCoinService 
{
    @Autowired
    private SysBuyCoinMapper sysBuyCoinMapper;

    /**
     * 查询买币
     * 
     * @param buyId 买币主键
     * @return 买币
     */
    @Override
    public SysBuyCoin selectSysBuyCoinByBuyId(Long buyId)
    {
        return sysBuyCoinMapper.selectSysBuyCoinByBuyId(buyId);
    }

    /**
     * 查询买币列表
     * 
     * @param sysBuyCoin 买币
     * @return 买币
     */
    @Override
    public List<SysBuyCoin> selectSysBuyCoinList(SysBuyCoin sysBuyCoin)
    {
        return sysBuyCoinMapper.selectSysBuyCoinList(sysBuyCoin);
    }

    /**
     * 新增买币
     * 
     * @param sysBuyCoin 买币
     * @return 结果
     */
    @Override
    public int insertSysBuyCoin(SysBuyCoin sysBuyCoin)
    {
        sysBuyCoin.setCreateTime(DateUtils.getNowDate());
        return sysBuyCoinMapper.insertSysBuyCoin(sysBuyCoin);
    }

    /**
     * 修改买币
     * 
     * @param sysBuyCoin 买币
     * @return 结果
     */
    @Override
    public int updateSysBuyCoin(SysBuyCoin sysBuyCoin)
    {
        sysBuyCoin.setUpdateTime(DateUtils.getNowDate());
        return sysBuyCoinMapper.updateSysBuyCoin(sysBuyCoin);
    }

    /**
     * 批量删除买币
     * 
     * @param buyIds 需要删除的买币主键
     * @return 结果
     */
    @Override
    public int deleteSysBuyCoinByBuyIds(Long[] buyIds)
    {
        return sysBuyCoinMapper.deleteSysBuyCoinByBuyIds(buyIds);
    }

    /**
     * 删除买币信息
     * 
     * @param buyId 买币主键
     * @return 结果
     */
    @Override
    public int deleteSysBuyCoinByBuyId(Long buyId)
    {
        return sysBuyCoinMapper.deleteSysBuyCoinByBuyId(buyId);
    }

    @Override
    public List<BuyDetailInfoRespVO> selectShoppingBuyList(Long userId, Long deptId, ShoppingBuyListReqVO vo) {
        return sysBuyCoinMapper.selectShoppingBuyList(userId,deptId,vo.getBuyUserId(),vo.getSaleNo(),vo.getStatus(),vo.getBuyType(),vo.getStartBuyTime(),vo.getEndBuyTime());
    }
}
