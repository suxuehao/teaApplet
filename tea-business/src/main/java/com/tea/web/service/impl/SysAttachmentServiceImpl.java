package com.tea.web.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tea.common.UUID.UUID;
import com.tea.common.annotation.Log;
import com.tea.common.config.RuoYiConfig;
import com.tea.common.utils.file.FileUploadUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tea.web.mapper.SysAttachmentMapper;
import com.tea.web.domain.SysAttachment;
import com.tea.web.service.ISysAttachmentService;
import com.tea.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


/**
 * 文件附件Service业务层处理
 *
 * @author suxuehao
 * @date 2024-04-14
 */
@Service
@Transactional
public class SysAttachmentServiceImpl implements ISysAttachmentService {
    protected static final Logger logger = LoggerFactory.getLogger(SysAttachmentServiceImpl.class);

    @Autowired
    private SysAttachmentMapper sysAttachmentMapper;

    /**
     * 查询文件附件
     *
     * @param id 文件附件主键
     * @return 文件附件
     */
    @Override
    public SysAttachment selectSysAttachmentById(Long id) {
        return sysAttachmentMapper.selectSysAttachmentById(id);
    }

    /**
     * 查询文件附件列表
     *
     * @param sysAttachment 文件附件
     * @return 文件附件
     */
    @Override
    public List<SysAttachment> selectSysAttachmentList(SysAttachment sysAttachment) {
        return sysAttachmentMapper.selectSysAttachmentList(sysAttachment);
    }

    /**
     * 新增文件附件
     *
     * @param sysAttachment 文件附件
     * @return 结果
     */
    @Override
    public int insertSysAttachment(SysAttachment sysAttachment) {
        sysAttachment.setFileId(UUID.randomUUIDAsString());
            return sysAttachmentMapper.insertSysAttachment(sysAttachment);
    }

    /**
     * 修改文件附件
     *
     * @param sysAttachment 文件附件
     * @return 结果
     */
    @Override
    public int updateSysAttachment(SysAttachment sysAttachment) {
        return sysAttachmentMapper.updateSysAttachment(sysAttachment);
    }

    /**
     * 批量删除文件附件
     *
     * @param ids 需要删除的文件附件主键
     * @return 结果
     */
    @Override
    public int deleteSysAttachmentByIds(String ids) {
        return sysAttachmentMapper.deleteSysAttachmentByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除文件附件信息
     *
     * @param id 文件附件主键
     * @return 结果
     */
    @Override
    public int deleteSysAttachmentById(Long id) {
        return sysAttachmentMapper.deleteSysAttachmentById(id);
    }

    /**
     * 上传文件（附件表：返回保存的附件信息）
     * @param file
     * @return
     */
    @Transactional
    public  SysAttachment insertSysAttachmentField(MultipartFile file)
    {
        SysAttachment sysAttachment = new SysAttachment();
        try {
            logger.info("上传文件开始");
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            logger.info("上传文件路径：" + filePath);
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            sysAttachment.setFileName(FilenameUtils.getName(file.getOriginalFilename()));//文件名称
            sysAttachment.setFileSize(file.getSize());//文件大小
            sysAttachment.setSysType("1");//文件上传类型
            sysAttachment.setFilePath(fileName);//文件路径
            sysAttachment.setState("1");//文件状态默认1：正常
            sysAttachment.setUploadTime(new Date());
            sysAttachment.setFileExt(FilenameUtils.getExtension(file.getOriginalFilename()));//文件扩展名
            this.insertSysAttachment(sysAttachment);
        } catch (IOException e){
            e.printStackTrace();
            logger.error("上传文件失败：" + e.getMessage());
        }
        return sysAttachment;
    }

    /**
     * 上传文件：适用于多附件（附件表：返回保存的附件信息）
     * @param files
     * @return
     */
    @Override
    public List<SysAttachment> insertSysAttachmentFields(List<MultipartFile> files) {
        ArrayList<SysAttachment> sysAttachments = new ArrayList<>();
        try {
            logger.info("上传文件开始");
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            logger.info("上传文件路径：" + filePath);
            // 上传并返回新文件名称
            for (MultipartFile file : files) {
                String fileName = FileUploadUtils.upload(filePath, file);
                SysAttachment sysAttachment = new SysAttachment();
                sysAttachment.setFileId(UUID.randomUUIDAsString());//附件UUID
                sysAttachment.setFileName(FilenameUtils.getName(file.getOriginalFilename()));//文件名称
                sysAttachment.setFileSize(file.getSize());//文件大小
                sysAttachment.setSysType("1");//文件上传类型
                sysAttachment.setFilePath(fileName);//文件路径
                sysAttachment.setState("1");//文件状态默认1：正常
                sysAttachment.setUploadTime(new Date());
                sysAttachment.setFileExt(FilenameUtils.getExtension(file.getOriginalFilename()));//文件扩展名
                sysAttachments.add(sysAttachment);
            }
            sysAttachmentMapper.batchInsertSysAttachment(sysAttachments);
        }catch (IOException e){
            e.printStackTrace();
            logger.error("上传多个文件失败：" + e.getMessage());
        }
        return sysAttachments;
    }
}
