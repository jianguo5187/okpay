package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.vo.req.ChangePayPwdReqVO;
import com.ruoyi.common.core.vo.req.ChangePwdReqVO;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * APP使用接口(无需登录)
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/noauth")
public class SysNoAuthController extends BaseController {


    @Autowired
    private ISysUserService userService;


    /**
     * 修改密码(手机验证码)接口
     */
    @PostMapping("/changePwdWithPhone")
    public AjaxResult changePwdWithPhone(@RequestBody ChangePwdReqVO vo)
    {
        SysUser user = userService.selectUserByPhonenumber(vo.getPhonenumber());
        if(StringUtils.isNull(user)){
            return error("修改密码失败，电话号码绑定用户不存在");
        }
//        LoginUser loginUser = getLoginUser();
//        String userName = loginUser.getUsername();
//        String password = loginUser.getPassword();
//        String phonenumber = loginUser.getUser().getPhonenumber();
//        if (!SecurityUtils.matchesPassword(vo.getPhonenumber(), phonenumber))
//        {
//            return error("修改密码失败，旧密码错误");
//        }
//        if (SecurityUtils.matchesPassword(vo.getNewPassword(), password))
//        {
//            return error("新密码不能与旧密码相同");
//        }
        String newPassword = SecurityUtils.encryptPassword(vo.getNewPassword());
        if (userService.resetUserPwd(user.getUserName(), newPassword) > 0)
        {
//            // 更新缓存用户密码
//            loginUser.getUser().setPassword(newPassword);
//            tokenService.setLoginUser(loginUser);
            return success();
        }
        return error("修改密码异常，请联系管理员");
    }

    /**
     * 修改支付密码(手机验证码)
     */
    @PostMapping("/changePayPwdWithPhone")
    public AjaxResult changePayPwdWithPhone(@RequestBody ChangePayPwdReqVO vo)
    {
        SysUser user = userService.selectUserByPhonenumber(vo.getPhonenumber());
        if(StringUtils.isNull(user)){
            return error("修改密码失败，电话号码绑定用户不存在");
        }
        String newPayPassword = SecurityUtils.encryptPassword(vo.getNewPayPassword());
        if (userService.resetUserPayPwd(user.getUserId(), newPayPassword) > 0)
        {
//            // 更新缓存用户密码
//            loginUser.getUser().setPayPassword(newPayPassword);
//            tokenService.setLoginUser(loginUser);
            return success();
        }
        return error("修改支付密码异常，请联系管理员");
    }
}
