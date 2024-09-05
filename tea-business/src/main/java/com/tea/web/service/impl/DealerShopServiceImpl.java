package com.tea.web.service.impl;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.tea.common.core.domain.entity.SysUser;
import com.tea.common.utils.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tea.web.mapper.DealerShopMapper;
import com.tea.web.domain.DealerShop;
import com.tea.web.service.IDealerShopService;
import com.tea.common.core.text.Convert;

/**
 * 经销商店铺Service业务层处理
 *
 * @author suxuehao
 * @date 2024-08-23
 */
@Service
public class DealerShopServiceImpl implements IDealerShopService {
    @Autowired
    private DealerShopMapper dealerShopMapper;

    /**
     * 查询经销商店铺
     *
     * @param shopId 经销商店铺主键
     * @return 经销商店铺
     */
    @Override
    public DealerShop selectDealerShopByShopId(Long shopId) {
        return dealerShopMapper.selectDealerShopByShopId(shopId);
    }

    /**
     * 查询经销商店铺列表
     *
     * @param dealerShop 经销商店铺
     * @return 经销商店铺
     */
    @Override
    public List<DealerShop> selectDealerShopList(DealerShop dealerShop) {
        return dealerShopMapper.selectDealerShopList(dealerShop);
    }

    /**
     * 新增经销商店铺
     *
     * @param dealerShop 经销商店铺
     * @return 结果
     */
    @Override
    public int insertDealerShop(DealerShop dealerShop) {
            dealerShop.setUserId(ShiroUtils.getUserId());
            dealerShop.setShopState(2L);//默认正常状态
            dealerShop.setCreateDate(new Date());
            return dealerShopMapper.insertDealerShop(dealerShop);
    }

    /**
     * 修改经销商店铺
     *
     * @param dealerShop 经销商店铺
     * @return 结果
     */
    @Override
    public int updateDealerShop(DealerShop dealerShop) {
        dealerShop.setUpdateDate(new Date());
        return dealerShopMapper.updateDealerShop(dealerShop);
    }

    /**
     * 批量删除经销商店铺
     *
     * @param shopIds 需要删除的经销商店铺主键
     * @return 结果
     */
    @Override
    public int deleteDealerShopByShopIds(String shopIds) {
        return dealerShopMapper.deleteDealerShopByShopIds(Convert.toStrArray(shopIds));
    }

    /**
     * 删除经销商店铺信息
     *
     * @param shopId 经销商店铺主键
     * @return 结果
     */
    @Override
    public int deleteDealerShopByShopId(Long shopId) {
        return dealerShopMapper.deleteDealerShopByShopId(shopId);
    }
    /**
     * 查询经销商店铺和图片列表
     *
     * @param dealerShop 经销商店铺
     * @return 经销商店铺集合
     */
    @Override
    public List<DealerShop> selectDealerShopAndPictureList(DealerShop dealerShop) {
        return dealerShopMapper.selectDealerShopAndPictureList(dealerShop);
    }

    /**
     * 查询经销商店铺列表(适用于需要过滤角色，不满足条件的只查询当前登录用户的店铺数据)
     *
     * @param dealerShop 经销商店铺
     * @return 经销商店铺集合
     */
    @Override
    public List<DealerShop> selectDealerShopFilterList(DealerShop dealerShop) {
        // 获取当前登录用户的角色信息判断是否是超级管理员或普通管理员（不满足条件的只查询当前登录用户的店铺数据）
        ShiroUtils.getSysUser().getRoles().stream()
                .filter(role -> role.getRoleId() != 1L && role.getRoleId() != 101L)// 过滤角色条件
                .findFirst()// 获取第一个符合条件的角色，如果没有符合条件的角色则返回一个空的Optional对象
                // 满足的时候设置查询店铺数据的用户ID
                .ifPresent(role -> dealerShop.setUserId(ShiroUtils.getUserId()));
        return dealerShopMapper.selectDealerShopList(dealerShop);
    }
}
