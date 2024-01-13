package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SysSaleCoin;

/**
 * 卖币Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
public interface SysSaleCoinMapper 
{
    /**
     * 查询卖币
     * 
     * @param saleId 卖币主键
     * @return 卖币
     */
    public SysSaleCoin selectSysSaleCoinBySaleId(Long saleId);

    /**
     * 查询卖币列表
     * 
     * @param sysSaleCoin 卖币
     * @return 卖币集合
     */
    public List<SysSaleCoin> selectSysSaleCoinList(SysSaleCoin sysSaleCoin);

    /**
     * 新增卖币
     * 
     * @param sysSaleCoin 卖币
     * @return 结果
     */
    public int insertSysSaleCoin(SysSaleCoin sysSaleCoin);

    /**
     * 修改卖币
     * 
     * @param sysSaleCoin 卖币
     * @return 结果
     */
    public int updateSysSaleCoin(SysSaleCoin sysSaleCoin);

    /**
     * 删除卖币
     * 
     * @param saleId 卖币主键
     * @return 结果
     */
    public int deleteSysSaleCoinBySaleId(Long saleId);

    /**
     * 批量删除卖币
     * 
     * @param saleIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysSaleCoinBySaleIds(Long[] saleIds);
}
