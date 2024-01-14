package com.ruoyi.system.service;

import com.ruoyi.common.core.vo.req.GetMySaleListReqVO;
import com.ruoyi.common.core.vo.req.GetSaleListReqVO;
import com.ruoyi.common.core.vo.req.SaleCoinReqVO;
import com.ruoyi.common.core.vo.req.UpdateSaleStatusReqVO;
import com.ruoyi.common.core.vo.resp.SaleDetailInfoRespVO;

import java.util.List;

public interface ISysAppService {

    public Long addSaleCoin(Long userId, SaleCoinReqVO vo);

    public int updateSaleStatus(UpdateSaleStatusReqVO vo);

    public SaleDetailInfoRespVO getSaleDetailInfo(Long saleId);

    public List<SaleDetailInfoRespVO> getSaleList(Long userId, Long deptId, GetSaleListReqVO vo);

    public List<SaleDetailInfoRespVO> getMySaleList(Long userId, GetMySaleListReqVO vo);
}
