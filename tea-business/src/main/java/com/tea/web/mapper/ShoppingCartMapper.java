package com.tea.web.mapper;

import java.util.List;

import com.tea.web.domain.ShoppingCart;

/**
 * 购物车Mapper接口
 *
 * @author suxuehao
 * @date 2024-08-23
 */
public interface ShoppingCartMapper {
    /**
     * 查询购物车
     *
     * @param cartId 购物车主键
     * @return 购物车
     */
    public ShoppingCart selectShoppingCartByCartId(String cartId);

    /**
     * 查询购物车列表
     *
     * @param shoppingCart 购物车
     * @return 购物车集合
     */
    public List<ShoppingCart> selectShoppingCartList(ShoppingCart shoppingCart);

    /**
     * 新增购物车
     *
     * @param shoppingCart 购物车
     * @return 结果
     */
    public int insertShoppingCart(ShoppingCart shoppingCart);

    /**
     * 修改购物车
     *
     * @param shoppingCart 购物车
     * @return 结果
     */
    public int updateShoppingCart(ShoppingCart shoppingCart);

    /**
     * 删除购物车
     *
     * @param cartId 购物车主键
     * @return 结果
     */
    public int deleteShoppingCartByCartId(String cartId);

    /**
     * 批量删除购物车
     *
     * @param cartIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteShoppingCartByCartIds(String[] cartIds);
}
