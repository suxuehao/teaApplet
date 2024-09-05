package com.tea.web.controller;

import com.tea.common.annotation.RepeatSubmit;
import com.tea.common.core.domain.AjaxResult;
import com.tea.web.common.queue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/web/task")
public class TaskController {

    @RequestMapping("/add")
    @RepeatSubmit(message = "请勿频繁取号")
    public AjaxResult add(@RequestParam Map<String, Object> map) {
        boolean add = queue.add(map);
        if (!add) {
            return AjaxResult.error("添加失败");
        }
        return AjaxResult.success("添加成功");
    }


    @RequestMapping("/queue")
    @RepeatSubmit(message = "请勿频繁点击")
    public AjaxResult queue() {
        Map<String, Object> take = queue.take();
        return AjaxResult.success(take);
    }
}
