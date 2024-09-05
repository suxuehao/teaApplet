package com.tea.web.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.tea.common.annotation.Excel;
import com.tea.common.core.domain.BaseEntity;

/**
 * 首页轮播对象 lb_home_carousel
 *
 * @author suxuehao
 * @date 2024-04-13
 */
public class LbHomeCarousel extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** 主键id */
    private Long lbId;

    /** 首页轮播图名称 */
            @Excel(name = "首页轮播图名称")
    private String lbPictureName;

    /** 附件ID */
            @Excel(name = "附件ID")
    private String lbFileId;

    /** 创建时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lbCreateTime;

    /** 是否可用（1：是，0否） */
            @Excel(name = "是否可用", readConverterExp = "1=：是，0否")
    private String lbIsUse;

    /** 是否可用（1：是，0否） */
    @Excel(name = "是否可用", readConverterExp = "1=：是，0否")
    protected SysAttachment sysAttachment;

    public void setLbId(Long lbId)
            {
            this.lbId = lbId;
            }

    public Long getLbId()
            {
            return lbId;
            }
    public void setLbPictureName(String lbPictureName)
            {
            this.lbPictureName = lbPictureName;
            }

    public String getLbPictureName()
            {
            return lbPictureName;
            }
    public void setLbFileId(String lbFileId)
            {
            this.lbFileId = lbFileId;
            }

    public String getLbFileId()
            {
            return lbFileId;
            }
    public void setLbCreateTime(Date lbCreateTime)
            {
            this.lbCreateTime = lbCreateTime;
            }

    public Date getLbCreateTime()
            {
            return lbCreateTime;
            }
    public void setLbIsUse(String lbIsUse)
            {
            this.lbIsUse = lbIsUse;
            }

    public String getLbIsUse()
            {
            return lbIsUse;
            }

            public SysAttachment getSysAttachment() {
            if (sysAttachment == null){
                sysAttachment = new SysAttachment();
            }
                return sysAttachment;
            }

            public void setSysAttachment(SysAttachment sysAttachment) {
                this.sysAttachment = sysAttachment;
            }

            @Override
public String toString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("lbId",getLbId())
            .append("lbPictureName",getLbPictureName())
            .append("lbFileId",getLbFileId())
            .append("lbCreateTime",getLbCreateTime())
            .append("lbIsUse",getLbIsUse())
        .toString();
        }
        }
