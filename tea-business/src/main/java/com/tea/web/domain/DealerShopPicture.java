package com.tea.web.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.tea.common.annotation.Excel;
import com.tea.common.core.domain.BaseEntity;

/**
 * 店铺展示图对象 dealer_shop_picture
 *
 * @author suxuehao
 * @date 2024-08-24
 */
public class DealerShopPicture extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** 店铺展示图id */
    private Long id;

    /** 对应附件的uid */
    private String pictureFileId;

    private SysAttachment sysAttachment;

            /** 图片描述 */
            @Excel(name = "图片描述")
    private String pictureDescription;

    /** 所属店铺id */
    private Long dealerId;

    /** 图片排序 */
    private Long pictureSort;

    /** 创建时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 修改时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDate;

    public void setId(Long id)
            {
            this.id = id;
            }

    public Long getId()
            {
            return id;
            }
    public void setPictureFileId(String pictureFileId)
            {
            this.pictureFileId = pictureFileId;
            }

            public SysAttachment getSysAttachment() {
                return sysAttachment;
            }

            public void setSysAttachment(SysAttachment sysAttachment) {
                this.sysAttachment = sysAttachment;
            }
    public String getPictureFileId()
            {
            return pictureFileId;
            }
    public void setPictureDescription(String pictureDescription)
            {
            this.pictureDescription = pictureDescription;
            }

    public String getPictureDescription()
            {
            return pictureDescription;
            }
    public void setDealerId(Long dealerId)
            {
            this.dealerId = dealerId;
            }

    public Long getDealerId()
            {
            return dealerId;
            }
    public void setPictureSort(Long pictureSort)
            {
            this.pictureSort = pictureSort;
            }

    public Long getPictureSort()
            {
            return pictureSort;
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
            .append("id",getId())
            .append("pictureFileId",getPictureFileId())
            .append("pictureDescription",getPictureDescription())
            .append("dealerId",getDealerId())
            .append("pictureSort",getPictureSort())
            .append("createDate",getCreateDate())
            .append("updateDate",getUpdateDate())
            .append("sysAttachment",getSysAttachment())
        .toString();
        }
        }
