package com.tea.web.mapper;

import java.util.List;

import com.tea.web.domain.SysAttachment;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

/**
 * 文件附件Mapper接口
 *
 * @author suxuehao
 * @date 2024-04-14
 */
@Transactional
public interface SysAttachmentMapper {
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
     * 删除文件附件
     *
     * @param id 文件附件主键
     * @return 结果
     */
    public int deleteSysAttachmentById(Long id);

    /**
     * 批量删除文件附件
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysAttachmentByIds(String[] ids);

@Transactional
    public int batchInsertSysAttachment( @Param("sysAttachmentList") List<SysAttachment> sysAttachmentList);
}
