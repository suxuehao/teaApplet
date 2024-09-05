package com.tea.web.service.impl;

import java.util.Date;
import java.util.List;

import com.tea.common.UUID.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tea.web.mapper.DealerProductMapper;
import com.tea.web.domain.DealerProduct;
import com.tea.web.service.IDealerProductService;
import com.tea.common.core.text.Convert;

/**
 * 经销商商品管理Service业务层处理
 *
 * @author suxuehao
 * @date 2024-08-23
 */
@Service
public class DealerProductServiceImpl implements IDealerProductService {
    @Autowired
    private DealerProductMapper dealerProductMapper;

    /**
     * 查询经销商商品管理
     *
     * @param productId 经销商商品管理主键
     * @return 经销商商品管理
     */
    @Override
    public DealerProduct selectDealerProductByProductId(String productId) {
        return dealerProductMapper.selectDealerProductByProductId(productId);
    }

    /**
     * 查询经销商商品管理列表
     *
     * @param dealerProduct 经销商商品管理
     * @return 经销商商品管理
     */
    @Override
    public List<DealerProduct> selectDealerProductList(DealerProduct dealerProduct) {
        return dealerProductMapper.selectDealerProductList(dealerProduct);
    }

    /**
     * 新增经销商商品管理
     *
     * @param dealerProduct 经销商商品管理
     * @return 结果
     */
    @Override
    public int insertDealerProduct(DealerProduct dealerProduct) {
            dealerProduct.setProductId(UUID.randomUUIDAsString());
            dealerProduct.setProductDelete(1L);//默认正常状态
            dealerProduct.setCreateDate(new Date());
            return dealerProductMapper.insertDealerProduct(dealerProduct);
    }

    /**
     * 修改经销商商品管理
     *
     * @param dealerProduct 经销商商品管理
     * @return 结果
     */
    @Override
    public int updateDealerProduct(DealerProduct dealerProduct) {
        dealerProduct.setUpdateDate(new Date());
        return dealerProductMapper.updateDealerProduct(dealerProduct);
    }

    /**
     * 批量删除经销商商品管理
     *
     * @param productIds 需要删除的经销商商品管理主键
     * @return 结果
     */
    @Override
    public int deleteDealerProductByProductIds(String productIds) {
        return dealerProductMapper.deleteDealerProductByProductIds(Convert.toStrArray(productIds));
    }

    /**
     * 删除经销商商品管理信息
     *
     * @param productId 经销商商品管理主键
     * @return 结果
     */
    @Override
    public int deleteDealerProductByProductId(String productId) {
        return dealerProductMapper.deleteDealerProductByProductId(productId);
    }
}
