package com.tea.web.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Setter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.tea.common.annotation.Excel;
import com.tea.common.core.domain.BaseEntity;

/**
 * 经销商店铺对象 dealer_shop
 *
 * @author suxuehao
 * @date 2024-08-23
 */
public class DealerShop extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** 店铺id */
    private Long shopId;

    /** 店铺名称 */
            @Excel(name = "店铺名称")
    private String shopName;

    /** 店铺地址 */
            @Excel(name = "店铺地址")
    private String shopAddress;

    /** 店铺描述 */
            @Excel(name = "店铺描述")
    private String shopDescription;

    /** 店铺状态(0:关闭,1:审核中,2:正常) */
            @Excel(name = "店铺状态(0:关闭,1:审核中,2:正常)")
    private Long shopState;

    /** 所属用户id */
            @Excel(name = "所属用户id")
    private Long userId;

    /** 创建时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

            /** 修改时间 */
            @Setter
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDate;

    /**店铺展示图片*/
    private List<DealerShopPicture> dealerShopPicture;

            public List<DealerShopPicture> getDealerShopPicture() {
                return dealerShopPicture;
            }

            public void setDealerShopPicture(List<DealerShopPicture> dealerShopPicture) {
                this.dealerShopPicture = dealerShopPicture;
            }

            public void setShopId(Long shopId)
            {
            this.shopId = shopId;
            }

    public Long getShopId()
            {
            return shopId;
            }
    public void setShopName(String shopName)
            {
            this.shopName = shopName;
            }

    public String getShopName()
            {
            return shopName;
            }
    public void setShopAddress(String shopAddress)
            {
            this.shopAddress = shopAddress;
            }

    public String getShopAddress()
            {
            return shopAddress;
            }
    public void setShopDescription(String shopDescription)
            {
            this.shopDescription = shopDescription;
            }

    public String getShopDescription()
            {
            return shopDescription;
            }
    public void setShopState(Long shopState)
            {
            this.shopState = shopState;
            }

    public Long getShopState()
            {
            return shopState;
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

            public Date getUpdateDate()
            {
            return updateDate;
            }

@Override
public String toString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("shopId",getShopId())
            .append("shopName",getShopName())
            .append("shopAddress",getShopAddress())
            .append("shopDescription",getShopDescription())
            .append("shopState",getShopState())
            .append("userid",getUserId())
            .append("createDate",getCreateDate())
            .append("updateDate",getUpdateDate())
            .append("dealerShopPicture",getDealerShopPicture())
        .toString();
        }
        }
