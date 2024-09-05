package com.tea.web.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.tea.common.annotation.Excel;
import com.tea.common.core.domain.BaseEntity;

/**
 * 经销商商品管理对象 dealer_product
 *
 * @author suxuehao
 * @date 2024-08-23
 */
public class DealerProduct extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** 商品uid */
    private String productId;

    /** 商品名称 */
            @Excel(name = "商品名称")
    private String productName;

    /** 商品类别 */
            @Excel(name = "商品类别")
    private Long productCategory;

    /** 商品单价 */
            @Excel(name = "商品单价")
    private Long productPrice;

    /** 商品库存 */
            @Excel(name = "商品库存")
    private Long productInventory;

    /** 所属店铺id */
            @Excel(name = "所属店铺id")
    private Long dealerId;

    /** 商品状态(0:删除,1:正常,2:已下架) */
            @Excel(name = "商品状态(0:删除,1:正常,2:已下架)")
    private Long productDelete;

    /** 创建时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 修改时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDate;

    public void setProductId(String productId)
            {
            this.productId = productId;
            }

    public String getProductId()
            {
            return productId;
            }
    public void setProductName(String productName)
            {
            this.productName = productName;
            }

    public String getProductName()
            {
            return productName;
            }
    public void setProductCategory(Long productCategory)
            {
            this.productCategory = productCategory;
            }

    public Long getProductCategory()
            {
            return productCategory;
            }
    public void setProductPrice(Long productPrice)
            {
            this.productPrice = productPrice;
            }

    public Long getProductPrice()
            {
            return productPrice;
            }
    public void setProductInventory(Long productInventory)
            {
            this.productInventory = productInventory;
            }

    public Long getProductInventory()
            {
            return productInventory;
            }
    public void setDealerId(Long dealerId)
            {
            this.dealerId = dealerId;
            }

    public Long getDealerId()
            {
            return dealerId;
            }
    public void setProductDelete(Long productDelete)
            {
            this.productDelete = productDelete;
            }

    public Long getProductDelete()
            {
            return productDelete;
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
            .append("productId",getProductId())
            .append("productName",getProductName())
            .append("productCategory",getProductCategory())
            .append("productPrice",getProductPrice())
            .append("productInventory",getProductInventory())
            .append("dealerId",getDealerId())
            .append("productDelete",getProductDelete())
            .append("createDate",getCreateDate())
            .append("updateDate",getUpdateDate())
        .toString();
        }
        }
