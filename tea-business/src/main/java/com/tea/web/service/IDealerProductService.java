package com.tea.web.service;

import java.util.List;

import com.tea.web.domain.DealerProduct;

/**
 * 经销商商品管理Service接口
 *
 * @author suxuehao
 * @date 2024-08-23
 */
public interface IDealerProductService {
    /**
     * 查询经销商商品管理
     *
     * @param productId 经销商商品管理主键
     * @return 经销商商品管理
     */
    public DealerProduct selectDealerProductByProductId(String productId);

    /**
     * 查询经销商商品管理列表
     *
     * @param dealerProduct 经销商商品管理
     * @return 经销商商品管理集合
     */
    public List<DealerProduct> selectDealerProductList(DealerProduct dealerProduct);

    /**
     * 新增经销商商品管理
     *
     * @param dealerProduct 经销商商品管理
     * @return 结果
     */
    public int insertDealerProduct(DealerProduct dealerProduct);

    /**
     * 修改经销商商品管理
     *
     * @param dealerProduct 经销商商品管理
     * @return 结果
     */
    public int updateDealerProduct(DealerProduct dealerProduct);

    /**
     * 批量删除经销商商品管理
     *
     * @param productIds 需要删除的经销商商品管理主键集合
     * @return 结果
     */
    public int deleteDealerProductByProductIds(String productIds);

    /**
     * 删除经销商商品管理信息
     *
     * @param productId 经销商商品管理主键
     * @return 结果
     */
    public int deleteDealerProductByProductId(String productId);
}
