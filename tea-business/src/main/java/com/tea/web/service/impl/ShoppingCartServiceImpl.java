package com.tea.web.service.impl;

import java.util.List;

import com.tea.common.UUID.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tea.web.mapper.ShoppingCartMapper;
import com.tea.web.domain.ShoppingCart;
import com.tea.web.service.IShoppingCartService;
import com.tea.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

/**
 * 购物车Service业务层处理
 *
 * @author suxuehao
 * @date 2024-08-23
 */
@Service
public class ShoppingCartServiceImpl implements IShoppingCartService {
    @Autowired
    private ShoppingCartMapper shoppingCartMapper;

    /**
     * 查询购物车
     *
     * @param cartId 购物车主键
     * @return 购物车
     */
    @Override
    public ShoppingCart selectShoppingCartByCartId(String cartId) {
        return shoppingCartMapper.selectShoppingCartByCartId(cartId);
    }

    /**
     * 查询购物车列表
     *
     * @param shoppingCart 购物车
     * @return 购物车
     */
    @Override
    public List<ShoppingCart> selectShoppingCartList(ShoppingCart shoppingCart) {
        return shoppingCartMapper.selectShoppingCartList(shoppingCart);
    }

    /**
     * 新增购物车
     *
     * @param shoppingCart 购物车
     * @return 结果
     */
    @Override
    @Transactional
    public int insertShoppingCart(ShoppingCart shoppingCart) {
            shoppingCart.setCartId(UUID.randomUUIDAsString());
            return shoppingCartMapper.insertShoppingCart(shoppingCart);
    }

    /**
     * 修改购物车
     *
     * @param shoppingCart 购物车
     * @return 结果
     */
    @Override
    public int updateShoppingCart(ShoppingCart shoppingCart) {
        return shoppingCartMapper.updateShoppingCart(shoppingCart);
    }

    /**
     * 批量删除购物车
     *
     * @param cartIds 需要删除的购物车主键
     * @return 结果
     */
    @Override
    public int deleteShoppingCartByCartIds(String cartIds) {
        return shoppingCartMapper.deleteShoppingCartByCartIds(Convert.toStrArray(cartIds));
    }

    /**
     * 删除购物车信息
     *
     * @param cartId 购物车主键
     * @return 结果
     */
    @Override
    public int deleteShoppingCartByCartId(String cartId) {
        return shoppingCartMapper.deleteShoppingCartByCartId(cartId);
    }
}
