package com.ruoyi.system.service;

import com.ruoyi.common.core.vo.req.SaleCoinReqVO;
import com.ruoyi.common.core.vo.req.UpdateSaleStatusReqVO;
import com.ruoyi.common.core.vo.resp.SaleDetailInfoRespVO;

public interface ISysAppService {

    public Long addSaleCoin(Long userId, SaleCoinReqVO vo);

    public int updateSaleStatus(UpdateSaleStatusReqVO vo);

    public SaleDetailInfoRespVO getSaleDetailInfo(Long saleId);
}
