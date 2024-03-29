package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.vo.req.*;
import com.ruoyi.common.core.vo.resp.MerchantUserRespVO;
import com.ruoyi.common.core.vo.resp.SaleDetailInfoRespVO;
import com.ruoyi.common.core.vo.resp.UserAmountInfoRespVO;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.ImageUtils;
import com.ruoyi.common.utils.sign.Base64;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.service.ISysAppService;
import com.ruoyi.system.service.ISysSaleCoinService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * APP使用接口
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/app")
public class SysAppController extends BaseController {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private ISysAppService sysAppService;
    @Autowired
    private ISysSaleCoinService sysSaleCoinService;

    /**
     * 修改密码接口
     */
    @PostMapping("/changePwd")
    public AjaxResult changePwd(@RequestBody ChangePwdReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        String userName = loginUser.getUsername();
        String password = loginUser.getPassword();
        if (!SecurityUtils.matchesPassword(vo.getOldPassword(), password))
        {
            return error("修改密码失败，旧密码错误");
        }
        if (SecurityUtils.matchesPassword(vo.getNewPassword(), password))
        {
            return error("新密码不能与旧密码相同");
        }
        String newPassword = SecurityUtils.encryptPassword(vo.getNewPassword());
        if (userService.resetUserPwd(userName, newPassword) > 0)
        {
            // 更新缓存用户密码
            loginUser.getUser().setPassword(newPassword);
            tokenService.setLoginUser(loginUser);
            return success();
        }
        return error("修改密码异常，请联系管理员");
    }

    /**
     * 修改支付密码
     */
    @PostMapping("/changePayPwd")
    public AjaxResult changePayPwd(@RequestBody ChangePayPwdReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        Long userId = loginUser.getUserId();
        String payPassword = loginUser.getPayPassword();
        if (!SecurityUtils.matchesPassword(vo.getOldPayPassword(), payPassword))
        {
            return error("修改支付密码失败，旧密码错误");
        }
        if (SecurityUtils.matchesPassword(vo.getNewPayPassword(), payPassword))
        {
            return error("新密码不能与旧密码相同");
        }
        String newPayPassword = SecurityUtils.encryptPassword(vo.getNewPayPassword());
        if (userService.resetUserPayPwd(userId, newPayPassword) > 0)
        {
            // 更新缓存用户密码
            loginUser.getUser().setPayPassword(newPayPassword);
            tokenService.setLoginUser(loginUser);
            return success();
        }
        return error("修改支付密码异常，请联系管理员");
    }

    /**
     * 支付密码验证
     */
    @PostMapping("/checkPayPwd")
    public AjaxResult checkPayPwd(@RequestBody CheckPayPwdReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = userService.selectUserById(loginUser.getUser().getUserId());
        String payPassword = user.getPayPassword();
        if (!SecurityUtils.matchesPassword(vo.getPayPassword(), payPassword))
        {
            return error("支付密码错误");
        }
        return success();
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getUserInfo")
    public AjaxResult getInfo()
    {
        SysUser sessionUser = SecurityUtils.getLoginUser().getUser();
        SysUser user = userService.selectUserById(sessionUser.getUserId());
        AjaxResult ajax = AjaxResult.success();
//        if(StringUtils.isNotEmpty(user.getAvatar())){
//            user.setAvatar(Base64.encode(ImageUtils.getImage(user.getAvatar())));
//        }
//        if(StringUtils.isNotEmpty(user.getIdcardFrontImg())){
//            user.setIdcardFrontImg(Base64.encode(ImageUtils.getImage(user.getIdcardFrontImg())));
//        }
//        if(StringUtils.isNotEmpty(user.getIdcardBackImg())){
//            user.setIdcardBackImg(Base64.encode(ImageUtils.getImage(user.getIdcardBackImg())));
//        }
//        if(StringUtils.isNotEmpty(user.getFaceImg())){
//            user.setFaceImg(Base64.encode(ImageUtils.getImage(user.getFaceImg())));
//        }
//        if(StringUtils.isNotEmpty(user.getWechatPayImg())){
//            user.setWechatPayImg(Base64.encode(ImageUtils.getImage(user.getWechatPayImg())));
//        }
//        if(StringUtils.isNotEmpty(user.getAlipayImg())){
//            user.setAlipayImg(Base64.encode(ImageUtils.getImage(user.getAlipayImg())));
//        }
        user.setMerchantUserId(sysAppService.parentMerchantUserId(user.getParentUserId()));
        ajax.put("user", user);
        if(user.getMerchantUserId() != null && user.getMerchantUserId() != 0){
            SysUser merchantUser = userService.selectUserById(user.getMerchantUserId());
            if (StringUtils.isNotNull(merchantUser)){
                MerchantUserRespVO merchantUserRespVO = new MerchantUserRespVO();
                merchantUserRespVO.setMerchantUserId(merchantUser.getUserId());
                merchantUserRespVO.setMerchantUserNickName(merchantUser.getNickName());

                merchantUserRespVO.setMerchantUserAvatar(merchantUser.getAvatar());
//                if(StringUtils.isNotEmpty(merchantUser.getAvatar())){
//                    merchantUserRespVO.setMerchantUserAvatar(Base64.encode(ImageUtils.getImage(merchantUser.getAvatar())));
//                }

                merchantUserRespVO.setUngentCommission(merchantUser.getUngentCommission());
                merchantUserRespVO.setNormalCommission(merchantUser.getNormalCommission());
                merchantUserRespVO.setSplitMinRate(merchantUser.getSplitMinRate());
                merchantUserRespVO.setSplitMaxRate(merchantUser.getSplitMaxRate());
                merchantUserRespVO.setSingleBuyMaxAmount(merchantUser.getSingleBuyMaxAmount());

                ajax.put("merchantUser", merchantUserRespVO);
            }
        }
        return ajax;
    }

    /**
     * 获取下属全部用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getAllUserList")
    public AjaxResult getAllUserList()
    {

        SysUser user = SecurityUtils.getLoginUser().getUser();
        SysUser searchUser = new SysUser();
        searchUser.setDeptId(user.getDeptId());
        AjaxResult ajax = AjaxResult.success();
        ajax.put("rows", userService.selectUserList(searchUser));
        return ajax;
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getUserList")
    public AjaxResult getUserList()
    {

        SysUser user = SecurityUtils.getLoginUser().getUser();
        SysUser searchUser = new SysUser();
        searchUser.setDeptId(user.getDeptId());
        AjaxResult ajax = AjaxResult.success();
        ajax.put("userList", userService.selectUserList(searchUser).stream().filter(r -> r.getUserId().compareTo(user.getUserId()) != 0).collect(Collectors.toList()));
        return ajax;
    }

    /**
     * 获取代理用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getAgentUserList")
    public AjaxResult getAgentUserList()
    {

        SysUser user = SecurityUtils.getLoginUser().getUser();
        Long merchantUserId = sysAppService.parentMerchantUserId(user.getUserId());
        SysUser merchantUser = userService.selectUserById(merchantUserId);

        SysUser searchUser = new SysUser();
        searchUser.setDeptId(merchantUser.getDeptId());
        AjaxResult ajax = AjaxResult.success();
        ajax.put("userList", userService.selectUserList(searchUser).stream().filter(r -> StringUtils.equals(r.getUserType(),"03")).collect(Collectors.toList()));
        return ajax;
    }


    /**
     * 获取用户金额信息
     *
     * @return 用户信息
     */
    @GetMapping("getUserAmountInfo")
    public AjaxResult getUserAmountInfo()
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("userAmountInfo", sysAppService.getUserAmountInfo(user.getUserId()));
        return ajax;
    }

    /**
     * 修改支付信息接口
     */
    @PostMapping("/updatePayInfo")
    public AjaxResult updatePayInfo(@RequestBody UpdatePayInfoReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        vo.setUpdateBy(getUsername());
        int updateRow = sysAppService.updatePayInfo(user.getUserId(),vo);
        if (updateRow > 0){
            // 更新缓存用户信息
            tokenService.setLoginUser(loginUser);
            return success();
        }
        return error("修改失败，请联系管理员");
    }

    /**
     * 修改用户信息接口
     */
    @PostMapping("/updateUserInfo")
    public AjaxResult updateUserInfo(@RequestBody UpdateUserInfoReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        int updateRow = sysAppService.updateUserInfo(user.getUserId(),vo);
        if (updateRow > 0){
            // 更新缓存用户信息
            tokenService.setLoginUser(loginUser);
            return success();
        }
        return error("修改失败，请联系管理员");
    }

    /**
     * 卖币接口
     */
    @PostMapping("/saleCoin")
    public AjaxResult saleCoin(@RequestBody SaleCoinReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        UserAmountInfoRespVO amountInfo = sysAppService.getUserAmountInfo(user.getUserId());
        Float reaminUserAmount = amountInfo.getAmount();

        if(vo.getSaleAmount() <=0){
            return error("卖币金额必须大于0");
        }
        if(reaminUserAmount.compareTo(vo.getSaleAmount()) < 0){
            return error("卖币失败，余额不足，请先充值");
        }
        vo.setCreateBy(getUsername());

        Long saleId = sysAppService.addSaleCoin(user.getUserId(),vo);
        if(saleId > 0){
        	
            AjaxResult ajax = AjaxResult.success();
            Float remainAmount = sysAppService.updateUserAmount(user.getUserId(), "1", saleId, vo.getSaleAmount(),getUsername());
            user.setAmount(remainAmount);
            // 更新缓存用户信息
            tokenService.setLoginUser(loginUser);
            
            ajax.put("saleInfo", sysAppService.getSaleDetailInfo(saleId));
            return ajax;
        }
        return error("新增卖币失败，请联系管理员");
    }

    /**
     * 更新卖币状态接口
     */
    @PostMapping("/updateSaleStatus")
    public AjaxResult updateSaleStatus(@RequestBody UpdateSaleStatusReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        
        vo.setUpdateBy(getUsername());
        int insertRow = sysAppService.updateSaleStatus(user.getUserId(),vo);
        if(insertRow > 0){
            AjaxResult ajax = AjaxResult.success();
            UserAmountInfoRespVO amountInfo = sysAppService.getUserAmountInfo(user.getUserId());
            user.setAmount(amountInfo.getAmount());
            // 更新缓存用户信息
            tokenService.setLoginUser(loginUser);
            
            ajax.put("saleInfo", sysAppService.getSaleDetailInfo(vo.getSaleId()));
            return ajax;
        }
        return error("更新卖币状态失败，请联系管理员");
    }

    /**
     * 卖币订单详情接口
     */
    @PostMapping("/getSaleDetailInfo")
    public AjaxResult getSaleDetailInfo(@RequestBody GetSaleDetailInfoReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("saleInfo", sysAppService.getSaleDetailInfo(vo.getSaleId()));
        return ajax;
    }

    /**
     * 交易大厅卖币列表接口
     */
    @PostMapping("/getSaleList")
    public AjaxResult getSaleList(@RequestBody GetSaleListReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("saleList", sysAppService.getSaleList(user.getUserId(), user.getDeptId(), vo));
        return ajax;
    }

    /**
     * 我的挂单接口
     */
    @PostMapping("/getMySaleList")
    public AjaxResult getMySaleList(@RequestBody GetMySaleListReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        AjaxResult ajax = AjaxResult.success();
        ajax.put("mySaleList", sysAppService.getMySaleList(user.getUserId(), vo));
        return ajax;
    }

    /**
     * 买币接口
     */
    @PostMapping("/buyCoin")
    public AjaxResult buyCoin(@RequestBody BuyCoinReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        if(vo.getBuyAmount() <=0){
            return error("买币金额必须大于0");
        }
        if(sysAppService.existSalingOrder(vo.getSaleId())){
            return error("该卖币已经被其他人购买。");
        }

//        Float reaminUserAmount = user.getAmount();
//
//        if(reaminUserAmount.compareTo(vo.getBuyAmount()) < 0){
//            return error("买币失败，余额不足，请先充值");
//        }
        vo.setCreateBy(getUsername());

        Long buyId = sysAppService.addBuyCoin(user.getUserId(),vo);
        if(buyId > 0){

            AjaxResult ajax = AjaxResult.success();

            ajax.put("buyInfo", sysAppService.getBuyDetailInfo(buyId));
            return ajax;
        }
        return error("新增卖币失败，请联系管理员");
    }
//
//    /**
//     * 查询交易列表
//     */
//    @PostMapping("/shoppingList")
//    public TableDataInfo shoppingList(@RequestBody ShoppingListReqVO vo)
//    {
//        startPage();
//        LoginUser loginUser = getLoginUser();
//        SysUser user = loginUser.getUser();
//        List<SaleDetailInfoRespVO> list = sysSaleCoinService.selectShoppingList(user.getUserId(), user.getDeptId(), vo);
//        return getDataTable(list);
//    }

    /**
     * 更新买币状态接口
     */
    @PostMapping("/updateBuyStatus")
    public AjaxResult updateBuyStatus(@RequestBody UpdateBuyStatusReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        vo.setUpdateBy(getUsername());
        int insertRow = sysAppService.updateBuyStatus(user.getUserId(), vo);
        if(insertRow > 0){
            AjaxResult ajax = AjaxResult.success();

            UserAmountInfoRespVO amountInfo = sysAppService.getUserAmountInfo(user.getUserId());
            user.setAmount(amountInfo.getAmount());
            // 更新缓存用户信息
            tokenService.setLoginUser(loginUser);

            ajax.put("buyInfo", sysAppService.getBuyDetailInfo(vo.getBuyId()));
            return ajax;
        }
        return error("更新卖币状态失败，请联系管理员");
    }

    /**
     * 上传买币支付凭证接口
     */
    @PostMapping("/uploadBuyVoucher")
    public AjaxResult uploadBuyVoucher(@RequestBody UploadBuyVoucherReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        vo.setUpdateBy(getUsername());
        int insertRow = sysAppService.uploadBuyVoucher(user.getUserId(), vo);
        if(insertRow > 0){
            AjaxResult ajax = AjaxResult.success();

            ajax.put("buyInfo", sysAppService.getBuyDetailInfo(vo.getBuyId()));
            return ajax;
        }
        return error("上传买币支付凭证失败，请联系管理员");
    }

    /**
     * 买币订单详情接口
     */
    @PostMapping("/getBuyDetailInfo")
    public AjaxResult getBuyDetailInfo(@RequestBody GetBuyDetailInfoReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("buyInfo", sysAppService.getBuyDetailInfo(vo.getBuyId()));
        return ajax;
    }

    /**
     * 我的买币列表接口
     */
    @PostMapping("/getMyBuyList")
    public AjaxResult getMyBuyList(@RequestBody GetMyBuyListReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        AjaxResult ajax = AjaxResult.success();
        ajax.put("myBuyList", sysAppService.getMyBuyList(user.getUserId(), vo));
        return ajax;
    }

    /**
     * 充值到商户
     */
    @PostMapping("/rechargeToMerchant")
    public AjaxResult rechargeToMerchant(@RequestBody RechargeToMerchantReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        UserAmountInfoRespVO amountInfo = sysAppService.getUserAmountInfo(user.getUserId());
        Float reaminUserAmount = amountInfo.getAmount();

        if(reaminUserAmount.compareTo(vo.getRechargeAmount()) < 0){
            return error("充值失败，余额不足，请先充值");
        }
        vo.setCreateBy(getUsername());

        Long rechargeId = sysAppService.addRechargeToMerchant(user.getUserId(),vo);
        if(rechargeId > 0){
            AjaxResult ajax = AjaxResult.success();
            ajax.put("rechargeInfo", sysAppService.getRechargeDetailInfo(rechargeId));
            return ajax;
        }
        return error("充值失败，请联系管理员");
    }

    /**
     * 充值到用户
     */
    @PostMapping("/rechargeToUser")
    public AjaxResult rechargeToUser(@RequestBody RechargeToUserReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        UserAmountInfoRespVO amountInfo = sysAppService.getUserAmountInfo(user.getUserId());
        Float reaminUserAmount = amountInfo.getAmount();

        if(reaminUserAmount.compareTo(vo.getRechargeAmount()) < 0){
            return error("充值失败，余额不足，请先充值");
        }
        vo.setCreateBy(getUsername());

        Long rechargeId = sysAppService.addRechargeToUser(user.getUserId(),vo);
        if(rechargeId > 0){
            AjaxResult ajax = AjaxResult.success();
            ajax.put("rechargeInfo", sysAppService.getRechargeDetailInfo(rechargeId));
            return ajax;
        }
        return error("充值失败，请联系管理员");
    }

    /**
     * 更新充值状态接口
     */
    @PostMapping("/updateRechargeStatus")
    public AjaxResult updateRechargeStatus(@RequestBody UpdateRechargeStatusReqVO vo)
    {
        vo.setUpdateBy(getUsername());
        int insertRow = sysAppService.updateRechargeStatus(vo);
        if(insertRow > 0){
            AjaxResult ajax = AjaxResult.success();
            ajax.put("rechargeInfo", sysAppService.getRechargeDetailInfo(vo.getRechargeId()));
            return ajax;
        }
        return error("更新卖币状态失败，请联系管理员");
    }

    /**
     * 充值详情接口
     */
    @PostMapping("/getRechargeDetailInfo")
    public AjaxResult getRechargeDetailInfo(@RequestBody GetRechargeDetailInfoReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        ajax.put("rechargeInfo", sysAppService.getRechargeDetailInfo(vo.getRechargeId()));
        return ajax;
    }

    /**
     * 我的充值列表接口
     */
    @PostMapping("/getMyRechargeList")
    public AjaxResult getMyRechargeList(@RequestBody GetMyRechargeListReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        AjaxResult ajax = AjaxResult.success();
        ajax.put("myRechargeList", sysAppService.getMyRechargeList(user.getUserId(), vo));
        return ajax;
    }

    /**
     * 站内信列表接口
     */
    @PostMapping("/getNoticeList")
    public AjaxResult getNoticeList(@RequestBody GetNoticeListReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        ajax.put("notice", sysAppService.getUserNoticeList(user.getUserId(),vo));
        return ajax;
    }

    /**
     * 更新站内信已读接口
     */
    @PostMapping("/updateNoticeReadStatus")
    public AjaxResult updateNoticeReadStatus(@RequestBody UpdateNoticeReadStatusReqVO vo)
    {

        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        if(vo.getNoticeId() == null || vo.getNoticeId() == 0){
            return error("更新站内信已读，公告ID必须输入");
        }

        int insertRow = sysAppService.updateNoticeReadStatus(user.getUserId(),vo.getNoticeId());
        if(insertRow > 0){
            AjaxResult ajax = AjaxResult.success();
            return ajax;
        }
        return error("更新站内信已读失败，请联系管理员");
    }

    /**
     * 交易记录列表接口
     */
    @PostMapping("/getMyTransactionList")
    public AjaxResult getMyTransactionList(@RequestBody GetMyTransactionListReqVO vo)
    {
        AjaxResult ajax = AjaxResult.success();
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        ajax.put("transactionList", sysAppService.getMyTransactionList(user.getUserId(),vo));
        return ajax;
    }

    /**
     * 获取用户流水信息
     *
     * @return 用户流水信息
     */
    @GetMapping("getUserCashFlow")
    public AjaxResult getUserCashFlow()
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("userCashFlow", sysAppService.getUserCashFlow(user.getUserId()));
        return ajax;
    }

    /**
     * 更新支付方式状态接口
     */
    @PostMapping("/updatePayTypeStatus")
    public AjaxResult updatePayTypeStatus(@RequestBody UpdatePayTypeReqVO vo)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        vo.setUpdateBy(getUsername());
        int insertRow = sysAppService.updatePayTypeStatus(user.getUserId(), vo);
        if(insertRow > 0){
            AjaxResult ajax = AjaxResult.success("状态变更成功");
            return ajax;
        }
        return error("更新卖币状态失败，请联系管理员");
    }
}
