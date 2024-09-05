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
import com.tea.web.domain.Orders;
import com.tea.web.service.IOrdersService;
import com.tea.common.core.controller.BaseController;
import com.tea.common.core.domain.AjaxResult;
import com.tea.common.utils.poi.ExcelUtil;
import com.tea.common.core.page.TableDataInfo;

/**
 * 订单Controller
 *
 * @author suxuehao
 * @date 2024-08-23
 */
@Controller
@RequestMapping("/web/orders")
public class OrdersController extends BaseController {
    private String prefix = "web/orders";

    @Autowired
    private IOrdersService ordersService;

    @RequiresPermissions("web:orders:view")
    @GetMapping()
    public String orders() {
        return prefix + "/orders";
    }

        /**
         * 查询订单列表
         */
        @RequiresPermissions("web:orders:list")
        @PostMapping("/list")
        @ResponseBody
        public TableDataInfo list(Orders orders) {
            startPage();
            List<Orders> list = ordersService.selectOrdersList(orders);
            return getDataTable(list);
        }

    /**
     * 导出订单列表
     */
    @RequiresPermissions("web:orders:export")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Orders orders) {
        List<Orders> list = ordersService.selectOrdersList(orders);
        ExcelUtil<Orders> util = new ExcelUtil<Orders>(Orders. class);
        return util.exportExcel(list, "订单数据");
    }

        /**
         * 新增订单
         */
        @GetMapping("/add")
        public String add() {
            return prefix + "/add";
        }

    /**
     * 新增保存订单
     */
    @RequiresPermissions("web:orders:add")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Orders orders) {
        return toAjax(ordersService.insertOrders(orders));
    }

    /**
     * 修改订单
     */
    @RequiresPermissions("web:orders:edit")
    @GetMapping("/edit/{orderId}")
    public String edit(@PathVariable("orderId") String orderId, ModelMap mmap) {
        Orders orders =
            ordersService.selectOrdersByOrderId(orderId);
        mmap.put("orders", orders);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单
     */
    @RequiresPermissions("web:orders:edit")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Orders orders) {
        return toAjax(ordersService.updateOrders(orders));
    }

        /**
         * 删除订单
         */
        @RequiresPermissions("web:orders:remove")
        @Log(title = "订单", businessType = BusinessType.DELETE)
        @PostMapping("/remove")
        @ResponseBody
        public AjaxResult remove(String ids) {
            return toAjax(ordersService.deleteOrdersByOrderIds(ids));
        }
}
