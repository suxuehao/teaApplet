package com.tea.web.controller;

import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import com.tea.common.core.page.PageDomain;
import com.tea.common.core.page.TableSupport;
import com.tea.common.utils.StringUtils;
import com.tea.web.domain.DealerProduct;
import com.tea.web.domain.DealerProductPicture;
import com.tea.web.domain.DealerShop;
import com.tea.web.service.IDealerProductPictureService;
import com.tea.web.service.IDealerProductService;
import com.tea.web.service.IDealerShopService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.tea.common.annotation.Log;
import com.tea.common.enums.BusinessType;
import com.tea.web.domain.DealerShopPicture;
import com.tea.web.service.IDealerShopPictureService;
import com.tea.common.core.controller.BaseController;
import com.tea.common.core.domain.AjaxResult;
import com.tea.common.utils.poi.ExcelUtil;
import com.tea.common.core.page.TableDataInfo;

/**
 * 店铺展示图Controller
 *
 * @author suxuehao
 * @date 2024-08-24
 */
@Controller
@RequestMapping("/web/picture")
public class DealerShopPictureController extends BaseController {
    Logger logger = org.slf4j.LoggerFactory.getLogger(DealerShopPictureController.class);
    private String prefix = "web/picture";

    private String detailsPrefix = "web/details";
    @Autowired
    private IDealerShopPictureService dealerShopPictureService;

    @Autowired
    private IDealerShopService dealerShopService;

    @Autowired
    private IDealerProductService dealerProductService;

    @Autowired
    private IDealerProductPictureService iDealerProductPictureService;
    @RequiresPermissions("web:picture:view")
    @GetMapping()
    public String picture() {
        return prefix + "/picture";
    }

        /**
         * 查询店铺展示图列表
         */
        @RequiresPermissions("web:picture:list")
        @PostMapping("/list")
        @ResponseBody
        public TableDataInfo list(DealerShop dealerShop) {
            startPage();
            List<DealerShop> list = dealerShopService.selectDealerShopAndPictureList(dealerShop);
            return getDataTable(list);
        }

    /**
     * 导出店铺展示图列表
     */
    @RequiresPermissions("web:picture:export")
    @Log(title = "店铺展示图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(DealerShopPicture dealerShopPicture) {
        List<DealerShopPicture> list = dealerShopPictureService.selectDealerShopPictureList(dealerShopPicture);
        ExcelUtil<DealerShopPicture> util = new ExcelUtil<DealerShopPicture>(DealerShopPicture. class);
        return util.exportExcel(list, "店铺展示图数据");
    }

        /**
         * 新增店铺展示图
         */
        @GetMapping("/add")
        public String add(ModelMap mmap) {
            mmap.put("dealers", dealerShopService.selectDealerShopList(new DealerShop()));
            return prefix + "/add";
        }

    /**
     * 新增保存店铺展示图
     */
    @RequiresPermissions("web:picture:add")
    @Log(title = "店铺展示图", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(
            @RequestParam("dealerId") String dealerId,
            @RequestParam("sysAttachments")  String[] sysAttachments
    ) {
        if (StringUtils.isEmpty(dealerId)){
            return AjaxResult.warn("请选择店铺");
        }
        if (sysAttachments.length > 5){
            return AjaxResult.warn("店铺展示图最多上传5张");
        }
        List<DealerShopPicture> dealerShopPictureLists = new ArrayList<>();
        //店铺展示图绑定
        for (int i = 0; i < sysAttachments.length; i++){
            DealerShopPicture picture = new DealerShopPicture();
            picture.setPictureFileId(String.valueOf(sysAttachments[i]));
            picture.setDealerId(Long.valueOf(dealerId));
            picture.setPictureSort((long)i+1);
            picture.setCreateDate(new Date());
            dealerShopPictureLists.add(picture);
        }
        DealerShopPicture dealerShopPicture = new DealerShopPicture();
        dealerShopPicture.setDealerId(Long.valueOf(dealerId));
        List<DealerShopPicture> dealerShopPictures = dealerShopPictureService.selectDealerShopPictureList(dealerShopPicture);
        if (dealerShopPictures.size() == 5){
            return AjaxResult.warn("店铺展示图最多上传5张");
        }
        logger.info("店铺图片附件绑定.....参数："+ Arrays.toString(sysAttachments));
        return toAjax(dealerShopPictureService.batchInsertDealerShopPicture(dealerShopPictureLists));
    }

    /**
     * 修改店铺展示图
     */
    @RequiresPermissions("web:picture:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        DealerShop dealerShop = new DealerShop();
        dealerShop.setShopId(id);
        List<DealerShop> dealerShopList = dealerShopService.selectDealerShopAndPictureList(dealerShop);
        mmap.put("dealerShopList", dealerShopList.get(0));
        return prefix + "/edit";
    }

    /**
     * 修改保存店铺展示图
     */
    @RequiresPermissions("web:picture:edit")
    @Log(title = "店铺展示图", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody List<HashMap<String, Object>> sort) {
        int row=0;
        for (HashMap<String, Object> map : sort){
            DealerShopPicture dealerShopPicture = new DealerShopPicture();
            dealerShopPicture.setId(Long.valueOf(map.get("pictureId").toString()));
            dealerShopPicture.setPictureSort(Long.valueOf(map.get("pictureSort").toString()));
            dealerShopPicture.setUpdateDate(new Date());
            row = dealerShopPictureService.updateDealerShopPicture(dealerShopPicture);
        }
        return toAjax(row);
    }

        /**
         * 删除店铺展示图
         */
        @RequiresPermissions("web:picture:remove")
        @Log(title = "店铺展示图", businessType = BusinessType.DELETE)
        @PostMapping("/remove")
        @ResponseBody
        public AjaxResult remove(String ids) {
            return toAjax(dealerShopPictureService.deleteDealerShopPictureByIds(ids));
        }

        @Log(title = "商品详情页面", businessType = BusinessType.OTHER)
        @RequestMapping("/productDetails")
        public  String productDetails(@RequestParam("shopId") Long shopId, ModelMap mmap){
            mmap.put("shopId", shopId);
            return detailsPrefix + "/productDetails";
        }

    @Log(title = "商品详情页面数据", businessType = BusinessType.OTHER)
    @RequestMapping("/productDetailsData/{shopId}")
    @ResponseBody
    public  TableDataInfo  productDetailsData(@PathVariable("shopId") Long shopId, ModelMap mmap){
        TableDataInfo rspData = new TableDataInfo();
        DealerProduct dealerProduct = new DealerProduct();
        dealerProduct.setDealerId(shopId);
        List<DealerProduct> dealerProductList = dealerProductService.selectDealerProductList(dealerProduct).stream().map(m -> {
            Map<String, Object> map = new HashMap<>();
            DealerProductPicture dealerProductPicture = new DealerProductPicture();
            dealerProductPicture.setDealerProductId(m.getProductId());
            dealerProductPicture.setSort(1L);
            //查询商品图片（第一张）放到商品的参数中
            map.put("productPicture", iDealerProductPictureService.selectDealerProductPictureAndSysAttachmentList(dealerProductPicture).get(0));
            m.setParams(map);
            return m;
        }).collect(Collectors.toList());
        PageDomain pageDomain = TableSupport.buildPageRequest();
        if (null == pageDomain.getPageNum() || null == pageDomain.getPageSize()) {
            rspData.setRows(dealerProductList);
            rspData.setTotal(dealerProductList.size());
            return rspData;
        }
        Integer pageNum = (pageDomain.getPageNum() - 1) * 10;
        Integer pageSize = pageDomain.getPageNum() * 10;
        if (pageSize > dealerProductList.size()) {
            pageSize = dealerProductList.size();
        }
        rspData.setRows(dealerProductList.subList(pageNum, pageSize));
        rspData.setTotal(dealerProductList.size());
        return rspData;
    }
}
