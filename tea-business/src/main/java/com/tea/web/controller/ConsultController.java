package com.tea.web.controller;

import com.tea.web.common.MyLog;
import com.tea.web.domain.DealerProduct;
import com.tea.web.domain.DealerShop;
import com.tea.web.service.IDealerProductService;
import com.tea.web.service.IDealerShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/web/consult")
public class ConsultController {

    private String prefix = "web/consult";

    @Value("${socket.url:ws://127.0.0.1:8081}")
    private String socketUrl;

    @Autowired
    private IDealerShopService dealerShopService;

    @Autowired
    private IDealerProductService dealerProductService;
    @MyLog
    @RequestMapping("/consultChat")
    public String consultChat(
            @RequestParam("shopId") Long shopId,
            @RequestParam("userId") Long userId,
            @RequestParam("userName") String userName,
            ModelMap mmap
    ) {
        mmap.put("shopId",shopId);
        mmap.put("userId",userId);
        mmap.put("userName",userName);
        mmap.put("socketUrl",socketUrl);
        //查询店铺信息
        DealerShop dealerShop = dealerShopService.selectDealerShopByShopId(shopId);
        //查询当前店铺下所有商品
        DealerProduct dealerProduct = new DealerProduct();
        dealerProduct.setDealerId(shopId);
        Map<String,Object> hashMap = new HashMap<String,Object>();
        //放到店铺参数中
        hashMap.put("dealerProductList",dealerProductService.selectDealerProductList(dealerProduct));
        dealerShop.setParams(hashMap);
        mmap.put("shopInfo",dealerShop );
        return prefix+"/consultChat";
    }
}
