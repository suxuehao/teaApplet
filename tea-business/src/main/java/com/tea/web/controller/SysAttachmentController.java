package com.tea.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import cn.hutool.core.collection.ListUtil;
import com.tea.common.annotation.RepeatSubmit;
import org.apache.poi.ss.formula.functions.T;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tea.common.annotation.Log;
import com.tea.common.enums.BusinessType;
import com.tea.web.domain.SysAttachment;
import com.tea.web.service.ISysAttachmentService;
import com.tea.common.core.controller.BaseController;
import com.tea.common.core.domain.AjaxResult;
import com.tea.common.utils.poi.ExcelUtil;
import com.tea.common.core.page.TableDataInfo;

/**
 * 文件附件Controller
 *
 * @author suxuehao
 * @date 2024-04-14
 */
@Controller
@RequestMapping("/web/attachment")
public class SysAttachmentController extends BaseController {
    private String prefix = "web/attachment";

    @Autowired
    private ISysAttachmentService sysAttachmentService;

    @Autowired
    private RedisTemplate redisTemplate;


    @RequiresPermissions("web:attachment:view")
    @GetMapping()
    public String attachment() {
        return prefix + "/attachment";
    }

        /**
         * 查询文件附件列表
         */
        @RequestMapping("/list")
        @ResponseBody
        public TableDataInfo list(SysAttachment sysAttachment) {
            long beginTime = System.currentTimeMillis();
            String key = "sysAttachment";
            startPage();
            List<SysAttachment> list = sysAttachmentService.selectSysAttachmentList(sysAttachment);

            ValueOperations<String,List<SysAttachment>> valueOperations = redisTemplate.opsForValue();

//            ListOperations<String ,Object> listOps  = redisTemplate.opsForList();
//
//            listOps.rightPush("myList", "aaaaa");
//            listOps.rightPush("myList", "bbbbb");
//            listOps.rightPush("myList", "ccccc");
//            listOps.rightPush("myList", "ddddd");
//            listOps.rightPush("myList", "eeeee");
//
//
//            List<Object> myList = listOps.range("myList", 0, -1);
//            System.out.println("Redis集合："+myList);
//            Boolean myList1 = listOps.getOperations().delete("myList");
//
//            if (myList1){
//                System.out.println("删除成功！！");
//            }
//
//
//            System.out.println("Redis集合："+myList);
            if (redisTemplate.hasKey(key)) {
                System.out.println("获取Redis数据");
                return getDataTable(valueOperations.get(key));
            }
            System.out.println("获取Redis数据1");
            valueOperations.set(key, list,60000, TimeUnit.SECONDS);
            return getDataTable(valueOperations.get(key));
        }

        @RequestMapping("/test")
        @ResponseBody
        public HashMap test (){
            HashMap hashMap = new HashMap();
            List<HashMap<String,Object>>  maplist = new ArrayList<>();
            HashMap<String ,Object> map = new HashMap<String ,Object>();
            for (int i = 0; i < 10; i++) {
                HashMap<String, Object> HashMap = new HashMap<>();
                HashMap.put("id", i);
                maplist.add(HashMap);
            }
            map.put("data",maplist);
            map.put("code",0);
            hashMap.put("data",map);
            return hashMap;
        }

    /**
     * 导出文件附件列表
     */
    @RequiresPermissions("web:attachment:export")
    @Log(title = "文件附件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysAttachment sysAttachment) {
        List<SysAttachment> list = sysAttachmentService.selectSysAttachmentList(sysAttachment);
        ExcelUtil<SysAttachment> util = new ExcelUtil<SysAttachment>(SysAttachment. class);
        return util.exportExcel(list, "文件附件数据");
    }

        /**
         * 新增文件附件
         */
        @GetMapping("/add")
        public String add() {
            return prefix + "/add";
        }

    /**
     * 新增保存文件附件
     */
    @RequiresPermissions("web:attachment:add")
    @Log(title = "文件附件", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysAttachment sysAttachment) {
        return toAjax(sysAttachmentService.insertSysAttachment(sysAttachment));
    }

    /**
     * 修改文件附件
     */
    @RequiresPermissions("web:attachment:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        SysAttachment sysAttachment =
            sysAttachmentService.selectSysAttachmentById(id);
        mmap.put("sysAttachment", sysAttachment);
        return prefix + "/edit";
    }

    /**
     * 修改保存文件附件
     */
    @RequiresPermissions("web:attachment:edit")
    @Log(title = "文件附件", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysAttachment sysAttachment) {
        return toAjax(sysAttachmentService.updateSysAttachment(sysAttachment));
    }

        /**
         * 删除文件附件
         */
        @RequiresPermissions("web:attachment:remove")
        @Log(title = "文件附件", businessType = BusinessType.DELETE)
        @PostMapping("/remove")
        @ResponseBody
        public AjaxResult remove(String ids) {
            return toAjax(sysAttachmentService.deleteSysAttachmentByIds(ids));
        }
}
