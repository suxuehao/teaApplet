package com.tea.web.controller;

import java.util.*;

import com.tea.common.utils.StringUtils;
import com.tea.web.domain.DealerShop;
import com.tea.web.domain.DealerShopPicture;
import com.tea.web.service.IDealerShopService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.tea.common.annotation.Log;
import com.tea.common.enums.BusinessType;
import com.tea.web.domain.DealerProductPicture;
import com.tea.web.service.IDealerProductPictureService;
import com.tea.common.core.controller.BaseController;
import com.tea.common.core.domain.AjaxResult;
import com.tea.common.utils.poi.ExcelUtil;
import com.tea.common.core.page.TableDataInfo;

/**
 * 店铺商品对应的附件图片Controller
 *
 * @author suxuehao
 * @date 2024-08-28
 */
@Controller
@RequestMapping("/web/productPicture")
public class DealerProductPictureController extends BaseController {
    private String prefix = "web/productPicture";

    @Autowired
    private IDealerProductPictureService dealerProductPictureService;

    @Autowired
    private IDealerShopService dealerShopService;
    @RequiresPermissions("web:picture:view")
    @GetMapping()
    public String picture() {
        return prefix + "/picture";
    }

        /**
         * 查询店铺商品对应的附件图片列表
         */
        @RequiresPermissions("web:picture:list")
        @PostMapping("/list")
        @ResponseBody
        public TableDataInfo list(DealerProductPicture dealerProductPicture) {
            startPage();
            List<DealerProductPicture> list = dealerProductPictureService.selectDealerProductPictureAndSysAttachmentList(dealerProductPicture);
            return getDataTable(list);
        }

    /**
     * 导出店铺商品对应的附件图片列表
     */
    @RequiresPermissions("web:picture:export")
    @Log(title = "店铺商品对应的附件图片", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(DealerProductPicture dealerProductPicture) {
        List<DealerProductPicture> list = dealerProductPictureService.selectDealerProductPictureList(dealerProductPicture);
        ExcelUtil<DealerProductPicture> util = new ExcelUtil<DealerProductPicture>(DealerProductPicture. class);
        return util.exportExcel(list, "店铺商品对应的附件图片数据");
    }

        /**
         * 新增店铺商品对应的附件图片
         */
        @GetMapping("/add/{productId}")
        public String add(@PathVariable("productId") String productId,ModelMap mmap) {
            mmap.put("productId",productId);
            return prefix + "/add";
        }

    /**
     * 新增保存店铺商品对应的附件图片
     */
    @RequiresPermissions("web:picture:add")
    @Log(title = "店铺商品对应的附件图片", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestParam("productId") String productId,
                              @RequestParam("sysAttachments")  String[] sysAttachments) {
        if (StringUtils.isEmpty(productId)){
            return AjaxResult.warn("请选择店铺");
        }
        if (sysAttachments.length > 10){
            return AjaxResult.warn("店铺展示图最多上传10张");
        }
        List<DealerProductPicture> dealerProducts = new ArrayList<>();
        for (int i = 0; i < sysAttachments.length; i++) {
            DealerProductPicture dealerProductPicture = new DealerProductPicture();
            dealerProductPicture.setDealerProductId(productId);
            dealerProductPicture.setProductFileId(sysAttachments[i]);
            dealerProductPicture.setSort(Long.valueOf(i)+1);
            dealerProductPicture.setCreateTime(new Date());
            dealerProducts.add(dealerProductPicture);
        }
        //查询当前商品是否已经绑定了10张图片
        DealerProductPicture dealerProductPicture = new DealerProductPicture();
        dealerProductPicture.setDealerProductId(productId);
        if (dealerProductPictureService.selectDealerProductPictureList(dealerProductPicture).size() == 10){
            return AjaxResult.warn("店铺展示图最多上传10张");
        }
        logger.info("商品图片附件绑定.....参数："+ Arrays.toString(sysAttachments));
        return toAjax(dealerProductPictureService.BatchInsertDealerProductPicture(dealerProducts));
    }

    /**
     * 修改店铺商品对应的附件图片
     */
    @RequiresPermissions("web:picture:edit")
    @GetMapping("/edit/{productId}")
    public String edit(@PathVariable("productId") String productId, ModelMap mmap) {
        DealerProductPicture dealerProductPicture = new DealerProductPicture();
        dealerProductPicture.setDealerProductId(productId);
        List<DealerProductPicture> dealerProductPictures = dealerProductPictureService.selectDealerProductPictureAndSysAttachmentList(dealerProductPicture);
        mmap.put("dealerProductPictures", dealerProductPictures);
        return prefix + "/edit";
    }

    /**
     * 修改保存店铺商品对应的附件图片
     */
    @RequiresPermissions("web:picture:edit")
    @Log(title = "店铺商品对应的附件图片", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody List<HashMap<String, Object>> sort) {
        int row=0;
        for (HashMap<String, Object> map : sort){
            DealerProductPicture dealerProductPicture = new DealerProductPicture();
            dealerProductPicture.setId(Long.valueOf(map.get("pictureId").toString()));
            dealerProductPicture.setSort(Long.valueOf(map.get("pictureSort").toString()));
            dealerProductPicture.setUpdateTime(new Date());
            row = dealerProductPictureService.updateDealerProductPicture(dealerProductPicture);
        }
        return toAjax(row);
    }

        /**
         * 删除店铺商品对应的附件图片
         */
        @RequiresPermissions("web:picture:remove")
        @Log(title = "店铺商品对应的附件图片", businessType = BusinessType.DELETE)
        @PostMapping("/remove")
        @ResponseBody
        public AjaxResult remove(String ids) {
            return toAjax(dealerProductPictureService.deleteDealerProductPictureByIds(ids));
        }
}
