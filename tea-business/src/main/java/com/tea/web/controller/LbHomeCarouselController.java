package com.tea.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import cn.hutool.core.io.FileUtil;
import cn.hutool.extra.qrcode.QrCodeUtil;
import com.tea.web.common.MyLog;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.tea.common.annotation.Log;
import com.tea.common.enums.BusinessType;
import com.tea.web.domain.LbHomeCarousel;
import com.tea.web.service.ILbHomeCarouselService;
import com.tea.common.core.controller.BaseController;
import com.tea.common.core.domain.AjaxResult;
import com.tea.common.utils.poi.ExcelUtil;
import com.tea.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 首页轮播Controller
 *
 * @author suxuehao
 * @date 2024-04-13
 */
@Controller
@RequestMapping("/web/carousel")
public class LbHomeCarouselController extends BaseController {
    private String prefix = "web/carousel";

    @Autowired
    private ILbHomeCarouselService lbHomeCarouselService;

    @RequiresPermissions("web:carousel:view")
    @GetMapping()
    public String carousel() {
        return prefix + "/carousel";
    }

        /**
         * 查询首页轮播列表
         */
        @RequiresPermissions("web:carousel:list")
        @PostMapping("/list")
        @ResponseBody
        @MyLog
        public TableDataInfo list(LbHomeCarousel lbHomeCarousel) {

            startPage();
            List<LbHomeCarousel> list = lbHomeCarouselService.selectLbHomeCarouselList(lbHomeCarousel);
            return getDataTable(list);
        }

    /**
     * 导出首页轮播列表
     */
    @RequiresPermissions("web:carousel:export")
    @Log(title = "首页轮播", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(LbHomeCarousel lbHomeCarousel) {
        List<LbHomeCarousel> list = lbHomeCarouselService.selectLbHomeCarouselList(lbHomeCarousel);
        ExcelUtil<LbHomeCarousel> util = new ExcelUtil<LbHomeCarousel>(LbHomeCarousel. class);
        return util.exportExcel(list, "首页轮播数据");
    }

        /**
         * 新增首页轮播
         */
        @GetMapping("/add")
        public String add() {
            return prefix + "/add";
        }


    /**
     * 新增保存首页轮播
     */
    @RequiresPermissions("web:carousel:add")
    @Log(title = "首页轮播", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(
            @RequestParam("file") MultipartFile file ,@RequestParam("lbPictureName")String lbPictureName,
            @RequestParam("lbCreateTime")String lbCreateTime,@RequestParam("lbIsUse")String lbIsUse
    ) throws IOException, ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            LbHomeCarousel homeCarousel = new LbHomeCarousel();
            homeCarousel.setLbCreateTime(dateFormat.parse(lbCreateTime));
            homeCarousel.setLbPictureName(lbPictureName);
            homeCarousel.setLbIsUse(lbIsUse);
        return toAjax(lbHomeCarouselService.insertLbHomeCarousel(file, homeCarousel));
    }

    /**
     * 修改首页轮播
     */
    @RequiresPermissions("web:carousel:edit")
    @GetMapping("/edit/{lbId}")
    public String edit(@PathVariable("lbId") Long lbId, ModelMap mmap) {
        LbHomeCarousel lbHomeCarousel =
            lbHomeCarouselService.selectLbHomeCarouselByLbId(lbId);
        mmap.put("lbHomeCarousel", lbHomeCarousel);
        File generate = QrCodeUtil.generate("https://www.tianyancha.com/company/303283702", 300, 300, FileUtil.file("d:/1.jpg"));
        if (generate!=null){
            System.out.println("生成二维码成功!!!");
        }

        return prefix + "/edit";
    }

    /**
     * 修改保存首页轮播
     */
    @RequiresPermissions("web:carousel:edit")
    @Log(title = "首页轮播", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(LbHomeCarousel lbHomeCarousel) {
        return toAjax(lbHomeCarouselService.updateLbHomeCarousel(lbHomeCarousel));
    }

        /**
         * 删除首页轮播
         */
        @RequiresPermissions("web:carousel:remove")
        @Log(title = "首页轮播", businessType = BusinessType.DELETE)
        @PostMapping("/remove")
        @ResponseBody
        public AjaxResult remove(String ids) {
            return toAjax(lbHomeCarouselService.deleteLbHomeCarouselByLbIds(ids));
        }

}
