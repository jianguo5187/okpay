package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.vo.req.ChangePwdReqVO;
import com.ruoyi.common.core.vo.req.UpdatePayInfoReqVO;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.ImageUtils;
import com.ruoyi.common.utils.sign.Base64;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

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
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getUserInfo")
    public AjaxResult getInfo()
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        AjaxResult ajax = AjaxResult.success();
        if(StringUtils.isNotEmpty(user.getAvatar())){
            user.setAvatar(Base64.encode(ImageUtils.getImage(user.getAvatar())));
        }
        if(StringUtils.isNotEmpty(user.getIdcardFrontImg())){
            user.setIdcardFrontImg(Base64.encode(ImageUtils.getImage(user.getIdcardFrontImg())));
        }
        if(StringUtils.isNotEmpty(user.getIdcardBackImg())){
            user.setIdcardBackImg(Base64.encode(ImageUtils.getImage(user.getIdcardBackImg())));
        }
        if(StringUtils.isNotEmpty(user.getFaceImg())){
            user.setFaceImg(Base64.encode(ImageUtils.getImage(user.getFaceImg())));
        }
        if(StringUtils.isNotEmpty(user.getWechatPayImg())){
            user.setWechatPayImg(Base64.encode(ImageUtils.getImage(user.getWechatPayImg())));
        }
        if(StringUtils.isNotEmpty(user.getAlipayImg())){
            user.setAlipayImg(Base64.encode(ImageUtils.getImage(user.getAlipayImg())));
        }

        ajax.put("user", user);
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

        if(StringUtils.isNotEmpty(vo.getWechatPayImg())){
            String wechatPayImgFileName = ImageUtils.savaBase64ImageFile(vo.getWechatPayImg());
            if(StringUtils.isNotEmpty(wechatPayImgFileName)){
                user.setWechatPayImg(wechatPayImgFileName);
            }else{
                return error("微信收款码图片地址上传失败");
            }
        }

        if(StringUtils.isNotEmpty(vo.getAlipayImg())){
            String alipayImgFileName = ImageUtils.savaBase64ImageFile(vo.getAlipayImg());
            if(StringUtils.isNotEmpty(alipayImgFileName)){
                user.setAlipayImg(alipayImgFileName);
            }else{
                return error("支付宝收款码地址上传失败");
            }
        }

        if(StringUtils.isNotEmpty(vo.getUnionpayAccount())){
            user.setUnionpayAccount(vo.getUnionpayAccount());
        }

        if(StringUtils.isNotEmpty(vo.getUnionpayCard())){
            user.setUnionpayCard(vo.getUnionpayCard());
        }

        int updateRow = userService.updateUser(user);
        if (updateRow > 0){
            // 更新缓存用户信息
            tokenService.setLoginUser(loginUser);
            return success();
        }
        return error("修改失败，请联系管理员");
    }
}
