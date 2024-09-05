package com.tea.web.mapper;

import java.util.List;

import com.tea.web.domain.DealerShop;

/**
 * 经销商店铺Mapper接口
 *
 * @author suxuehao
 * @date 2024-08-23
 */
public interface DealerShopMapper {
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
     * 删除经销商店铺
     *
     * @param shopId 经销商店铺主键
     * @return 结果
     */
    public int deleteDealerShopByShopId(Long shopId);

    /**
     * 批量删除经销商店铺
     *
     * @param shopIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDealerShopByShopIds(String[] shopIds);

    /**
     * 查询经销商店铺和图片列表
     *
     * @param dealerShop 经销商店铺
     * @return 经销商店铺集合
     */
    public List<DealerShop> selectDealerShopAndPictureList(DealerShop dealerShop);
}
