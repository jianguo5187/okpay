package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
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
}
