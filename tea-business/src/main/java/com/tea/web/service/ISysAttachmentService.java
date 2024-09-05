package com.tea.web.service;

import java.util.List;

import com.tea.web.domain.SysAttachment;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件附件Service接口
 *
 * @author suxuehao
 * @date 2024-04-14
 */
public interface ISysAttachmentService {
    /**
     * 查询文件附件
     *
     * @param id 文件附件主键
     * @return 文件附件
     */
    public SysAttachment selectSysAttachmentById(Long id);

    /**
     * 查询文件附件列表
     *
     * @param sysAttachment 文件附件
     * @return 文件附件集合
     */
    public List<SysAttachment> selectSysAttachmentList(SysAttachment sysAttachment);

    /**
     * 新增文件附件
     *
     * @param sysAttachment 文件附件
     * @return 结果
     */
    public int insertSysAttachment(SysAttachment sysAttachment);

    /**
     * 修改文件附件
     *
     * @param sysAttachment 文件附件
     * @return 结果
     */
    public int updateSysAttachment(SysAttachment sysAttachment);

    /**
     * 批量删除文件附件
     *
     * @param ids 需要删除的文件附件主键集合
     * @return 结果
     */
    public int deleteSysAttachmentByIds(String ids);

    /**
     * 删除文件附件信息
     *
     * @param id 文件附件主键
     * @return 结果
     */
    public int deleteSysAttachmentById(Long id);

    /**
     * 上传文件：适用于单个附件（附件表：返回保存的附件信息）
     * @param file
     * @return
     */
    public  SysAttachment insertSysAttachmentField(MultipartFile file);

    /**
     * 上传文件：适用于多附件（附件表：返回保存的附件信息）
     * @param files
     * @return
     */
    public  List<SysAttachment> insertSysAttachmentFields(List<MultipartFile> files);
}
