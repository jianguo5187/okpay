package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.SysRecharge;
import com.ruoyi.common.core.vo.resp.RechargeDetailInfoRespVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 充值Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-13
 */
public interface SysRechargeMapper 
{
    /**
     * 查询充值
     * 
     * @param rechargeId 充值主键
     * @return 充值
     */
    public SysRecharge selectSysRechargeByRechargeId(Long rechargeId);

    /**
     * 查询充值列表
     * 
     * @param sysRecharge 充值
     * @return 充值集合
     */
    public List<SysRecharge> selectSysRechargeList(SysRecharge sysRecharge);

    /**
     * 新增充值
     * 
     * @param sysRecharge 充值
     * @return 结果
     */
    public int insertSysRecharge(SysRecharge sysRecharge);

    /**
     * 修改充值
     * 
     * @param sysRecharge 充值
     * @return 结果
     */
    public int updateSysRecharge(SysRecharge sysRecharge);

    /**
     * 删除充值
     * 
     * @param rechargeId 充值主键
     * @return 结果
     */
    public int deleteSysRechargeByRechargeId(Long rechargeId);

    /**
     * 批量删除充值
     * 
     * @param rechargeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRechargeByRechargeIds(Long[] rechargeIds);

    public RechargeDetailInfoRespVO getRechargeDetailInfo(Long rechargeId);

    public List<RechargeDetailInfoRespVO> getMyRechargeList(@Param("userId") Long userId, @Param("status") String status, @Param("rechargeAmountFrom") Float rechargeAmountFrom, @Param("rechargeAmountTo") Float rechargeAmountTo, @Param("rechargeType") String rechargeType, @Param("pageNumber") Integer pageNumber, @Param("pageRowCount") Integer pageRowCount);
}
