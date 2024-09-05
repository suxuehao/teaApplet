package com.tea.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.tea.common.annotation.Excel;
import com.tea.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 店铺商品对应的附件图片对象 dealer_product_picture
 *
 * @author suxuehao
 * @date 2024-08-28
 */
public class DealerProductPicture extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** 主键id */
    private Long id;

    /** 对应店铺商品主键 */
            @Excel(name = "对应店铺商品主键")
    private String dealerProductId;

    /** 对应附件文件id */
            @Excel(name = "对应附件文件id")
    private String productFileId;

    /** 显示排序 */
            @Excel(name = "显示排序")
    private Long sort;

    private SysAttachment sysAttachments;

    public void setId(Long id)
            {
            this.id = id;
            }

    public Long getId()
            {
            return id;
            }
    public void setDealerProductId(String dealerProductId)
            {
            this.dealerProductId = dealerProductId;
            }

    public String getDealerProductId()
            {
            return dealerProductId;
            }
    public void setProductFileId(String productFileId)
            {
            this.productFileId = productFileId;
            }

    public String getProductFileId()
            {
            return productFileId;
            }
    public void setSort(Long sort)
            {
            this.sort = sort;
            }

    public Long getSort()
            {
            return sort;
            }

            public SysAttachment getSysAttachments() {
                return sysAttachments;
            }

            public void setSysAttachments(SysAttachment sysAttachments) {
                this.sysAttachments = sysAttachments;
            }

            @Override
public String toString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id",getId())
            .append("dealerProductId",getDealerProductId())
            .append("productFileId",getProductFileId())
            .append("sort",getSort())
            .append("createTime",getCreateTime())
            .append("updateTime",getUpdateTime())
            .append("sysAttachmentsList",getSysAttachments())
        .toString();
        }
        }
