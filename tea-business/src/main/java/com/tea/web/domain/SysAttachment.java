package com.tea.web.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.tea.common.annotation.Excel;
import com.tea.common.core.domain.BaseEntity;

/**
 * 文件附件对象 sys_attachment
 *
 * @author suxuehao
 * @date 2024-04-14
 */
public class SysAttachment extends BaseEntity
        {
private static final long serialVersionUID=1L;

    /** 主键id */
    private Long id;

    /** 文件加密UUID */
            @Excel(name = "文件加密UUID")
    private String fileId;

    /** 文件名称 */
            @Excel(name = "文件名称")
    private String fileName;

    /** 文件路径 */
            @Excel(name = "文件路径")
    private String filePath;

    /** 文件大小 */
            @Excel(name = "文件大小")
    private Long fileSize;

    /** 文件扩展名 */
            @Excel(name = "文件扩展名")
    private String fileExt;

    /** 上传时间 */
            @JsonFormat(pattern = "yyyy-MM-dd")
            @Excel(name = "上传时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date uploadTime;

    /** 文件上传类型（1：系统上传，2：接口上传，3：其他） */
            @Excel(name = "文件上传类型", readConverterExp = "1=：系统上传，2：接口上传，3：其他")
    private String sysType;

    /** 文件状态（1：有效，0：无效） */
            @Excel(name = "文件状态", readConverterExp = "1=：有效，0：无效")
    private String state;

    public void setId(Long id)
            {
            this.id = id;
            }

    public Long getId()
            {
            return id;
            }
    public void setFileId(String fileId)
            {
            this.fileId = fileId;
            }

    public String getFileId()
            {
            return fileId;
            }
    public void setFileName(String fileName)
            {
            this.fileName = fileName;
            }

    public String getFileName()
            {
            return fileName;
            }
    public void setFilePath(String filePath)
            {
            this.filePath = filePath;
            }

    public String getFilePath()
            {
            return filePath;
            }
    public void setFileSize(Long fileSize)
            {
            this.fileSize = fileSize;
            }

    public Long getFileSize()
            {
            return fileSize;
            }
    public void setFileExt(String fileExt)
            {
            this.fileExt = fileExt;
            }

    public String getFileExt()
            {
            return fileExt;
            }
    public void setUploadTime(Date uploadTime)
            {
            this.uploadTime = uploadTime;
            }

    public Date getUploadTime()
            {
            return uploadTime;
            }
    public void setSysType(String sysType)
            {
            this.sysType = sysType;
            }

    public String getSysType()
            {
            return sysType;
            }
    public void setState(String state)
            {
            this.state = state;
            }

    public String getState()
            {
            return state;
            }

@Override
public String toString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id",getId())
            .append("fileId",getFileId())
            .append("fileName",getFileName())
            .append("filePath",getFilePath())
            .append("fileSize",getFileSize())
            .append("fileExt",getFileExt())
            .append("uploadTime",getUploadTime())
            .append("sysType",getSysType())
            .append("state",getState())
        .toString();
        }
        }
