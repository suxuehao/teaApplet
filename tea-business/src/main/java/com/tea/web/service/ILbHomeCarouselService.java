package com.tea.web.service;

import java.io.IOException;
import java.util.List;

import com.tea.web.domain.LbHomeCarousel;
import org.springframework.web.multipart.MultipartFile;

/**
 * 首页轮播Service接口
 *
 * @author suxuehao
 * @date 2024-04-13
 */
public interface ILbHomeCarouselService {
    /**
     * 查询首页轮播
     *
     * @param lbId 首页轮播主键
     * @return 首页轮播
     */
    public LbHomeCarousel selectLbHomeCarouselByLbId(Long lbId);

    /**
     * 查询首页轮播列表
     *
     * @param lbHomeCarousel 首页轮播
     * @return 首页轮播集合
     */
    public List<LbHomeCarousel> selectLbHomeCarouselList(LbHomeCarousel lbHomeCarousel);

    /**
     * 新增首页轮播
     *
     * @param lbHomeCarousel 首页轮播
     * @return 结果
     */
    public int insertLbHomeCarousel(MultipartFile file, LbHomeCarousel homeCarousel) throws IOException;

    /**
     * 修改首页轮播
     *
     * @param lbHomeCarousel 首页轮播
     * @return 结果
     */
    public int updateLbHomeCarousel(LbHomeCarousel lbHomeCarousel);

    /**
     * 批量删除首页轮播
     *
     * @param lbIds 需要删除的首页轮播主键集合
     * @return 结果
     */
    public int deleteLbHomeCarouselByLbIds(String lbIds);

    /**
     * 删除首页轮播信息
     *
     * @param lbId 首页轮播主键
     * @return 结果
     */
    public int deleteLbHomeCarouselByLbId(Long lbId);
}
