package com.tea.web.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tea.web.mapper.OrdersMapper;
import com.tea.web.domain.Orders;
import com.tea.web.service.IOrdersService;
import com.tea.common.core.text.Convert;

/**
 * 订单Service业务层处理
 *
 * @author suxuehao
 * @date 2024-08-23
 */
@Service
public class OrdersServiceImpl implements IOrdersService {
    @Autowired
    private OrdersMapper ordersMapper;

    /**
     * 查询订单
     *
     * @param orderId 订单主键
     * @return 订单
     */
    @Override
    public Orders selectOrdersByOrderId(String orderId) {
        return ordersMapper.selectOrdersByOrderId(orderId);
    }

    /**
     * 查询订单列表
     *
     * @param orders 订单
     * @return 订单
     */
    @Override
    public List<Orders> selectOrdersList(Orders orders) {
        return ordersMapper.selectOrdersList(orders);
    }

    /**
     * 新增订单
     *
     * @param orders 订单
     * @return 结果
     */
    @Override
    public int insertOrders(Orders orders) {
            return ordersMapper.insertOrders(orders);
    }

    /**
     * 修改订单
     *
     * @param orders 订单
     * @return 结果
     */
    @Override
    public int updateOrders(Orders orders) {
        return ordersMapper.updateOrders(orders);
    }

    /**
     * 批量删除订单
     *
     * @param orderIds 需要删除的订单主键
     * @return 结果
     */
    @Override
    public int deleteOrdersByOrderIds(String orderIds) {
        return ordersMapper.deleteOrdersByOrderIds(Convert.toStrArray(orderIds));
    }

    /**
     * 删除订单信息
     *
     * @param orderId 订单主键
     * @return 结果
     */
    @Override
    public int deleteOrdersByOrderId(String orderId) {
        return ordersMapper.deleteOrdersByOrderId(orderId);
    }
}
