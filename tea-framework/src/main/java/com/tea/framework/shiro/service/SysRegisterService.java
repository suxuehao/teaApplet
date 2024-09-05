package com.tea.framework.shiro.service;

import com.tea.system.domain.SysUserRole;
import com.tea.system.mapper.SysUserRoleMapper;
import com.tea.web.common.MyLog;
import com.tea.web.domain.ShoppingCart;
import com.tea.web.service.IShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.tea.common.constant.Constants;
import com.tea.common.constant.ShiroConstants;
import com.tea.common.constant.UserConstants;
import com.tea.common.core.domain.entity.SysUser;
import com.tea.common.utils.DateUtils;
import com.tea.common.utils.MessageUtils;
import com.tea.common.utils.ServletUtils;
import com.tea.common.utils.ShiroUtils;
import com.tea.common.utils.StringUtils;
import com.tea.framework.manager.AsyncManager;
import com.tea.framework.manager.factory.AsyncFactory;
import com.tea.system.service.ISysUserService;

import java.util.ArrayList;
import java.util.List;

/**
 * 注册校验方法
 *
 * @author ruoyi
 */
@Component
public class SysRegisterService {
    @Autowired
    private ISysUserService userService;

    @Autowired
    private SysPasswordService passwordService;

    @Autowired
    private SysUserRoleMapper sysUserRoleMapper ;

    @Autowired
    private IShoppingCartService iShoppingCartService ;

    /**
     * 注册
     */
    @MyLog
    public String register(SysUser user) {
        String msg = "", loginName = user.getLoginName(), password = user.getPassword();

        if (ShiroConstants.CAPTCHA_ERROR.equals(ServletUtils.getRequest().getAttribute(ShiroConstants.CURRENT_CAPTCHA))) {
            msg = "验证码错误";
        } else if (StringUtils.isEmpty(loginName)) {
            msg = "用户名不能为空";
        } else if (StringUtils.isEmpty(password)) {
            msg = "用户密码不能为空";
        } else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            msg = "密码长度必须在5到20个字符之间";
        } else if (loginName.length() < UserConstants.USERNAME_MIN_LENGTH
                || loginName.length() > UserConstants.USERNAME_MAX_LENGTH) {
            msg = "账户长度必须在2到20个字符之间";
        } else if (!userService.checkLoginNameUnique(user)) {
            msg = "保存用户'" + loginName + "'失败，注册账号已存在";
        } else {
            user.setPwdUpdateDate(DateUtils.getNowDate());
            user.setUserName(loginName);
            user.setSalt(ShiroUtils.randomSalt());
            user.setPassword(passwordService.encryptPassword(loginName, password, user.getSalt()));
            boolean regFlag = userService.registerUser(user);
            // 注册角色
            SysUserRole sysRole = new SysUserRole();
            sysRole.setUserId(user.getUserId());
            sysRole.setRoleId(user.getRoleId());
            List<SysUserRole> sysRoles = new ArrayList<SysUserRole>();
            sysRoles.add(sysRole);
            sysUserRoleMapper.batchUserRole(sysRoles);
            // 注册购物车（注册账号默认购物车）
            ShoppingCart shoppingCart = new ShoppingCart();
            shoppingCart.setUserId(user.getUserId());
            iShoppingCartService.insertShoppingCart(shoppingCart);
            if (!regFlag) {
                msg = "注册失败,请联系系统管理人员";
            } else {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(loginName, Constants.REGISTER, MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }
}
