package com.tea.web.service;

import java.util.List;

import com.tea.web.domain.DealerShop;

/**
 * 经销商店铺Service接口
 *
 * @author suxuehao
 * @date 2024-08-23
 */
public interface IDealerShopService {
    /**
     * 查询经销商店铺
     *
     * @param shopId 经销商店铺主键
     * @return 经销商店铺
     */
    public DealerShop selectDealerShopByShopId(Long shopId);

    /**
     * 查询经销商店铺列表
     *
     * @param dealerShop 经销商店铺
     * @return 经销商店铺集合
     */
    public List<DealerShop> selectDealerShopList(DealerShop dealerShop);

    /**
     * 新增经销商店铺
     *
     * @param dealerShop 经销商店铺
     * @return 结果
     */
    public int insertDealerShop(DealerShop dealerShop);

    /**
     * 修改经销商店铺
     *
     * @param dealerShop 经销商店铺
     * @return 结果
     */
    public int updateDealerShop(DealerShop dealerShop);

    /**
     * 批量删除经销商店铺
     *
     * @param shopIds 需要删除的经销商店铺主键集合
     * @return 结果
     */
    public int deleteDealerShopByShopIds(String shopIds);

    /**
     * 删除经销商店铺信息
     *
     * @param shopId 经销商店铺主键
     * @return 结果
     */
    public int deleteDealerShopByShopId(Long shopId);

    /**
     * 查询经销商店铺和图片列表
     *
     * @param dealerShop 经销商店铺
     * @return 经销商店铺集合
     */
    public List<DealerShop> selectDealerShopAndPictureList(DealerShop dealerShop);

    /**
     * 查询经销商店铺列表(适用于需要过滤角色，不满足条件的只查询当前登录用户的店铺数据)
     *
     * @param dealerShop 经销商店铺
     * @return 经销商店铺集合
     */
    public List<DealerShop> selectDealerShopFilterList(DealerShop dealerShop);
}
