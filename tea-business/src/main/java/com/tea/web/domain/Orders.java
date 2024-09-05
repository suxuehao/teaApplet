package com.tea.web.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.tea.common.annotation.Excel;
import com.tea.common.core.domain.BaseEntity;

/**
 * 订单对象 orders
 *
 * @author suxuehao
 * @date 2024-08-23
 */
public class Orders extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** 订单uid */
    private String orderId;

    /** 用户id */
            @Excel(name = "用户id")
    private Long userId;

    /** 经销商店铺id */
            @Excel(name = "经销商店铺id")
    private Long dealerShopId;

    /** 商品id */
            @Excel(name = "商品id")
    private String productId;

    /** 购买商品数量 */
            @Excel(name = "购买商品数量")
    private Long orderNum;

    /** 订单状态(1：新建,:2：待支付,:3：已发货,:4：完成) */
            @Excel(name = "订单状态(1：新建,:2：待支付,:3：已发货,:4：完成)")
    private Long orderState;

    /** 创建时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 修改时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDate;

    public void setOrderId(String orderId)
            {
            this.orderId = orderId;
            }

    public String getOrderId()
            {
            return orderId;
            }
    public void setUserId(Long userId)
            {
            this.userId = userId;
            }

    public Long getUserId()
            {
            return userId;
            }
    public void setDealerShopId(Long dealerShopId)
            {
            this.dealerShopId = dealerShopId;
            }

    public Long getDealerShopId()
            {
            return dealerShopId;
            }
    public void setProductId(String productId)
            {
            this.productId = productId;
            }

    public String getProductId()
            {
            return productId;
            }
    public void setOrderNum(Long orderNum)
            {
            this.orderNum = orderNum;
            }

    public Long getOrderNum()
            {
            return orderNum;
            }
    public void setOrderState(Long orderState)
            {
            this.orderState = orderState;
            }

    public Long getOrderState()
            {
            return orderState;
            }
    public void setCreateDate(Date createDate)
            {
            this.createDate = createDate;
            }

    public Date getCreateDate()
            {
            return createDate;
            }
    public void setUpdateDate(Date updateDate)
            {
            this.updateDate = updateDate;
            }

    public Date getUpdateDate()
            {
            return updateDate;
            }

@Override
public String toString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("orderId",getOrderId())
            .append("userId",getUserId())
            .append("dealerShopId",getDealerShopId())
            .append("productId",getProductId())
            .append("orderNum",getOrderNum())
            .append("orderState",getOrderState())
            .append("createDate",getCreateDate())
            .append("updateDate",getUpdateDate())
        .toString();
        }
        }
