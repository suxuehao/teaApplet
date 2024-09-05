package com.tea.web.mapper;

import java.util.List;

import com.tea.web.domain.Orders;

/**
 * 订单Mapper接口
 *
 * @author suxuehao
 * @date 2024-08-23
 */
public interface OrdersMapper {
    /**
     * 查询订单
     *
     * @param orderId 订单主键
     * @return 订单
     */
    public Orders selectOrdersByOrderId(String orderId);

    /**
     * 查询订单列表
     *
     * @param orders 订单
     * @return 订单集合
     */
    public List<Orders> selectOrdersList(Orders orders);

    /**
     * 新增订单
     *
     * @param orders 订单
     * @return 结果
     */
    public int insertOrders(Orders orders);

    /**
     * 修改订单
     *
     * @param orders 订单
     * @return 结果
     */
    public int updateOrders(Orders orders);

    /**
     * 删除订单
     *
     * @param orderId 订单主键
     * @return 结果
     */
    public int deleteOrdersByOrderId(String orderId);

    /**
     * 批量删除订单
     *
     * @param orderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrdersByOrderIds(String[] orderIds);
}
