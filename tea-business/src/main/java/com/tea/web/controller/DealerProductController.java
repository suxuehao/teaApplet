package com.tea.web.controller;

import java.util.List;

import com.tea.web.domain.DealerShop;
import com.tea.web.service.IDealerShopService;
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
import com.tea.web.domain.DealerProduct;
import com.tea.web.service.IDealerProductService;
import com.tea.common.core.controller.BaseController;
import com.tea.common.core.domain.AjaxResult;
import com.tea.common.utils.poi.ExcelUtil;
import com.tea.common.core.page.TableDataInfo;

/**
 * 经销商商品管理Controller
 *
 * @author suxuehao
 * @date 2024-08-23
 */
@Controller
@RequestMapping("/web/product")
public class DealerProductController extends BaseController {
    private String prefix = "web/product";

    @Autowired
    private IDealerProductService dealerProductService;

    @Autowired
    private IDealerShopService dealerShopService;

    @RequiresPermissions("web:product:view")
    @GetMapping()
    public String product(ModelMap mmap) {
        mmap.put("dealerShop",dealerShopService.selectDealerShopFilterList(new DealerShop()));
        return prefix + "/product";
    }

        /**
         * 查询经销商商品管理列表
         */
        @RequiresPermissions("web:product:list")
        @PostMapping("/list")
        @ResponseBody
        public TableDataInfo list(DealerProduct dealerProduct) {
            startPage();
            List<DealerProduct> list = dealerProductService.selectDealerProductList(dealerProduct);
            return getDataTable(list);
        }

    /**
     * 导出经销商商品管理列表
     */
    @RequiresPermissions("web:product:export")
    @Log(title = "经销商商品管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(DealerProduct dealerProduct) {
        List<DealerProduct> list = dealerProductService.selectDealerProductList(dealerProduct);
        ExcelUtil<DealerProduct> util = new ExcelUtil<DealerProduct>(DealerProduct. class);
        return util.exportExcel(list, "经销商商品管理数据");
    }

        /**
         * 新增经销商商品管理
         */
        @GetMapping("/add")
        public String add(ModelMap mmap) {
            mmap.put("dealerShop",dealerShopService.selectDealerShopFilterList(new DealerShop()));
            return prefix + "/add";
        }

    /**
     * 新增保存经销商商品管理
     */
    @RequiresPermissions("web:product:add")
    @Log(title = "经销商商品管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(DealerProduct dealerProduct) {
        return toAjax(dealerProductService.insertDealerProduct(dealerProduct));
    }

    /**
     * 修改经销商商品管理
     */
    @RequiresPermissions("web:product:edit")
    @GetMapping("/edit/{productId}")
    public String edit(@PathVariable("productId") String productId, ModelMap mmap) {
        DealerProduct dealerProduct =
            dealerProductService.selectDealerProductByProductId(productId);
        mmap.put("dealerProduct", dealerProduct);
        mmap.put("dealerShop",dealerShopService.selectDealerShopFilterList(new DealerShop()));
        return prefix + "/edit";
    }

    /**
     * 修改保存经销商商品管理
     */
    @RequiresPermissions("web:product:edit")
    @Log(title = "经销商商品管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(DealerProduct dealerProduct) {
        return toAjax(dealerProductService.updateDealerProduct(dealerProduct));
    }

        /**
         * 删除经销商商品管理
         */
        @RequiresPermissions("web:product:remove")
        @Log(title = "经销商商品管理", businessType = BusinessType.DELETE)
        @PostMapping("/remove")
        @ResponseBody
        public AjaxResult remove(String ids) {
            return toAjax(dealerProductService.deleteDealerProductByProductIds(ids));
        }
}
