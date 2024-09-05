package com.tea.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tea.common.utils.ShiroUtils;
import com.tea.web.domain.DealerProduct;
import com.tea.web.service.IDealerProductService;
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
import com.tea.web.domain.DealerShop;
import com.tea.web.service.IDealerShopService;
import com.tea.common.core.controller.BaseController;
import com.tea.common.core.domain.AjaxResult;
import com.tea.common.utils.poi.ExcelUtil;
import com.tea.common.core.page.TableDataInfo;

/**
 * 经销商店铺Controller
 *
 * @author suxuehao
 * @date 2024-08-23
 */
@Controller
@RequestMapping("/web/shop")
public class DealerShopController extends BaseController {
    private String prefix = "web/shop";

    @Autowired
    private IDealerShopService dealerShopService;

    @Autowired
    private IDealerProductService dealerProductService;

    @RequiresPermissions("web:shop:view")
    @GetMapping()
    public String shop() {
        return prefix + "/shop";
    }

        /**
         * 查询经销商店铺列表
         */
        @RequiresPermissions("web:shop:list")
        @PostMapping("/list")
        @ResponseBody
        public TableDataInfo list(DealerShop dealerShop) {
            startPage();
            List<DealerShop> list = dealerShopService.selectDealerShopFilterList(dealerShop);
            return getDataTable(list);
        }

    /**
     * 导出经销商店铺列表
     */
    @RequiresPermissions("web:shop:export")
    @Log(title = "经销商店铺", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(DealerShop dealerShop) {
        List<DealerShop> list = dealerShopService.selectDealerShopList(dealerShop);
        ExcelUtil<DealerShop> util = new ExcelUtil<DealerShop>(DealerShop. class);
        return util.exportExcel(list, "经销商店铺数据");
    }

        /**
         * 新增经销商店铺
         */
        @GetMapping("/add")
        public String add() {
            return prefix + "/add";
        }

    /**
     * 新增保存经销商店铺
     */
    @RequiresPermissions("web:shop:add")
    @Log(title = "经销商店铺", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(DealerShop dealerShop) {
        return toAjax(dealerShopService.insertDealerShop(dealerShop));
    }

    /**
     * 修改经销商店铺
     */
    @RequiresPermissions("web:shop:edit")
    @GetMapping("/edit/{shopId}")
    public String edit(@PathVariable("shopId") Long shopId, ModelMap mmap) {
        DealerShop dealerShop =
            dealerShopService.selectDealerShopByShopId(shopId);
        mmap.put("dealerShop", dealerShop);
        return prefix + "/edit";
    }

    /**
     * 根据shopId查询经销商店铺
     */
    @GetMapping("/shopInfo/{shopId}")
    @ResponseBody
    public AjaxResult shopInfo(@PathVariable("shopId") Long shopId) {
        DealerShop dealerShop = dealerShopService.selectDealerShopByShopId(shopId);
        if (dealerShop == null) {
            return AjaxResult.error("店铺不存在");
        }
        //查询当前店铺下所有商品
        DealerProduct dealerProduct = new DealerProduct();
        dealerProduct.setDealerId(shopId);
        Map<String,Object> hashMap = new HashMap<String,Object>();
        //放到店铺参数中
        hashMap.put("dealerProductList",dealerProductService.selectDealerProductList(dealerProduct));
        dealerShop.setParams(hashMap);
        return AjaxResult.success(dealerShop);
    }

    /**
     * 修改保存经销商店铺
     */
    @RequiresPermissions("web:shop:edit")
    @Log(title = "经销商店铺", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(DealerShop dealerShop) {
        return toAjax(dealerShopService.updateDealerShop(dealerShop));
    }

        /**
         * 删除经销商店铺
         */
        @RequiresPermissions("web:shop:remove")
        @Log(title = "经销商店铺", businessType = BusinessType.DELETE)
        @PostMapping("/remove")
        @ResponseBody
        public AjaxResult remove(String ids) {
            return toAjax(dealerShopService.deleteDealerShopByShopIds(ids));
        }
}
