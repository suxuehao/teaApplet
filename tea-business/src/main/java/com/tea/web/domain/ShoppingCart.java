package com.tea.web.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.tea.common.annotation.Excel;
import com.tea.common.core.domain.BaseEntity;

/**
 * 购物车对象 shopping_cart
 *
 * @author suxuehao
 * @date 2024-08-23
 */
public class ShoppingCart extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** $column.columnComment */
    private String cartId;

    /** 用户id */
            @Excel(name = "用户id")
    private Long userId;

    /** 创建时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 修改时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDate;

    public void setCartId(String cartId)
            {
            this.cartId = cartId;
            }

    public String getCartId()
            {
            return cartId;
            }
    public void setUserId(Long userId)
            {
            this.userId = userId;
            }

    public Long getUserId()
            {
            return userId;
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
            .append("cartId",getCartId())
            .append("userId",getUserId())
            .append("createDate",getCreateDate())
            .append("updateDate",getUpdateDate())
        .toString();
        }
        }
