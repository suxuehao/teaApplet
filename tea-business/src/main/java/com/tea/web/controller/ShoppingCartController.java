package com.tea.web.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tea.common.annotation.Log;
import com.tea.common.enums.BusinessType;
import com.tea.web.domain.ShoppingCart;
import com.tea.web.service.IShoppingCartService;
import com.tea.common.core.controller.BaseController;
import com.tea.common.core.domain.AjaxResult;
import com.tea.common.utils.poi.ExcelUtil;
import com.tea.common.core.page.TableDataInfo;

/**
 * 购物车Controller
 *
 * @author suxuehao
 * @date 2024-08-23
 */
@Controller
@RequestMapping("/web/cart")
public class ShoppingCartController extends BaseController {
    private String prefix = "web/cart";

    @Autowired
    private IShoppingCartService shoppingCartService;

    @RequiresPermissions("web:cart:view")
    @GetMapping()
    public String cart() {
        return prefix + "/cart";
    }

        /**
         * 查询购物车列表
         */
        @RequiresPermissions("web:cart:list")
        @PostMapping("/list")
        @ResponseBody
        public TableDataInfo list(ShoppingCart shoppingCart) {
            startPage();
            List<ShoppingCart> list = shoppingCartService.selectShoppingCartList(shoppingCart);
            return getDataTable(list);
        }

    /**
     * 导出购物车列表
     */
    @RequiresPermissions("web:cart:export")
    @Log(title = "购物车", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ShoppingCart shoppingCart) {
        List<ShoppingCart> list = shoppingCartService.selectShoppingCartList(shoppingCart);
        ExcelUtil<ShoppingCart> util = new ExcelUtil<ShoppingCart>(ShoppingCart. class);
        return util.exportExcel(list, "购物车数据");
    }

        /**
         * 新增购物车
         */
        @GetMapping("/add")
        public String add() {
            return prefix + "/add";
        }

    /**
     * 新增保存购物车
     */
    @RequiresPermissions("web:cart:add")
    @Log(title = "购物车", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ShoppingCart shoppingCart) {
        return toAjax(shoppingCartService.insertShoppingCart(shoppingCart));
    }

    /**
     * 修改购物车
     */
    @RequiresPermissions("web:cart:edit")
    @GetMapping("/edit/{cartId}")
    public String edit(@PathVariable("cartId") String cartId, ModelMap mmap) {
        ShoppingCart shoppingCart =
            shoppingCartService.selectShoppingCartByCartId(cartId);
        mmap.put("shoppingCart", shoppingCart);
        return prefix + "/edit";
    }

    /**
     * 修改保存购物车
     */
    @RequiresPermissions("web:cart:edit")
    @Log(title = "购物车", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ShoppingCart shoppingCart) {
        return toAjax(shoppingCartService.updateShoppingCart(shoppingCart));
    }

        /**
         * 删除购物车
         */
        @RequiresPermissions("web:cart:remove")
        @Log(title = "购物车", businessType = BusinessType.DELETE)
        @PostMapping("/remove")
        @ResponseBody
        public AjaxResult remove(String ids) {
            return toAjax(shoppingCartService.deleteShoppingCartByCartIds(ids));
        }
}
