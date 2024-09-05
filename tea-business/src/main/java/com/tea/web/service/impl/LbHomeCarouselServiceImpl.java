package com.tea.web.service.impl;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import cn.hutool.core.io.IoUtil;
import com.alibaba.fastjson.JSONObject;
import com.tea.common.config.RuoYiConfig;
import com.tea.common.utils.file.FileUploadUtils;
import com.tea.common.utils.uuid.UUID;
import com.tea.web.domain.SysAttachment;
import com.tea.web.mapper.SysAttachmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tea.web.mapper.LbHomeCarouselMapper;
import com.tea.web.domain.LbHomeCarousel;
import com.tea.web.service.ILbHomeCarouselService;
import com.tea.common.core.text.Convert;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * 首页轮播Service业务层处理
 *
 * @author suxuehao
 * @date 2024-04-13
 */
@Service
public class LbHomeCarouselServiceImpl implements ILbHomeCarouselService {
    @Resource
    private LbHomeCarouselMapper lbHomeCarouselMapper;
    @Resource
    private SysAttachmentMapper  sysAttachmentMapper;

    /**
     * 查询首页轮播
     *
     * @param lbId 首页轮播主键
     * @return 首页轮播
     */
    @Override
    public LbHomeCarousel selectLbHomeCarouselByLbId(Long lbId) {
        return lbHomeCarouselMapper.selectLbHomeCarouselByLbId(lbId);
    }

    /**
     * 查询首页轮播列表
     *
     * @param lbHomeCarousel 首页轮播
     * @return 首页轮播
     */
    @Override
    public List<LbHomeCarousel> selectLbHomeCarouselList(LbHomeCarousel lbHomeCarousel) {
        return lbHomeCarouselMapper.selectLbHomeCarouselList(lbHomeCarousel);
    }

    /**
     * 新增首页轮播
     *
     * @param homeCarousel 首页轮播
     * @return 结果
     */
    @Override
    public int insertLbHomeCarousel(MultipartFile file ,LbHomeCarousel homeCarousel) throws IOException {
        String uuid = UUID.randomUUID().toString();
        // 上传文件路径
        String filePath = RuoYiConfig.getUploadPath();
        // 上传并返回新文件路径
        String newfilePath = FileUploadUtils.upload(filePath, file);
        //文件名称
        String fileName = Paths.get(newfilePath).getFileName().toString();
        //获取文件后缀类型
        String extension = "";
        int dotIndex = fileName.lastIndexOf('.');
        if (dotIndex > 0) {
            extension = fileName.substring(dotIndex + 1);
        }
        //文件附件信息
        SysAttachment attachment = new SysAttachment();
        attachment.setFileId(uuid);
        attachment.setFileName(fileName);
        attachment.setFilePath(newfilePath);
        attachment.setFileSize(file.getSize());
        attachment.setFileExt(extension);
        attachment.setSysType("1");
        attachment.setState("1");
        attachment.setUploadTime(new Date());
        sysAttachmentMapper.insertSysAttachment(attachment);
        //轮播图附件ID
        homeCarousel.setLbFileId(uuid);
            return lbHomeCarouselMapper.insertLbHomeCarousel(homeCarousel);
    }

    /**
     * 修改首页轮播
     *
     * @param lbHomeCarousel 首页轮播
     * @return 结果
     */
    @Override
    public int updateLbHomeCarousel(LbHomeCarousel lbHomeCarousel) {
        return lbHomeCarouselMapper.updateLbHomeCarousel(lbHomeCarousel);
    }

    /**
     * 批量删除首页轮播
     *
     * @param lbIds 需要删除的首页轮播主键
     * @return 结果
     */
    @Override
    public int deleteLbHomeCarouselByLbIds(String lbIds) {
        return lbHomeCarouselMapper.deleteLbHomeCarouselByLbIds(Convert.toStrArray(lbIds));
    }

    /**
     * 删除首页轮播信息
     *
     * @param lbId 首页轮播主键
     * @return 结果
     */
    @Override
    public int deleteLbHomeCarouselByLbId(Long lbId) {
        return lbHomeCarouselMapper.deleteLbHomeCarouselByLbId(lbId);
    }
}
