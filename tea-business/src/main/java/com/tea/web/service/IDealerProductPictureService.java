package com.tea.web.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tea.web.domain.DealerProductPicture;

/**
 * 店铺商品对应的附件图片Service接口
 *
 * @author suxuehao
 * @date 2024-08-28
 */
public interface IDealerProductPictureService extends IService<DealerProductPicture> {
    /**
     * 查询店铺商品对应的附件图片
     *
     * @param id 店铺商品对应的附件图片主键
     * @return 店铺商品对应的附件图片
     */
    public DealerProductPicture selectDealerProductPictureById(Long id);

    /**
     * 查询店铺商品对应的附件图片列表
     *
     * @param dealerProductPicture 店铺商品对应的附件图片
     * @return 店铺商品对应的附件图片集合
     */
    public List<DealerProductPicture> selectDealerProductPictureList(DealerProductPicture dealerProductPicture);

    /**
     * 新增店铺商品对应的附件图片
     *
     * @param dealerProductPicture 店铺商品对应的附件图片
     * @return 结果
     */
    public int insertDealerProductPicture(DealerProductPicture dealerProductPicture);

    /**
     * 修改店铺商品对应的附件图片
     *
     * @param dealerProductPicture 店铺商品对应的附件图片
     * @return 结果
     */
    public int updateDealerProductPicture(DealerProductPicture dealerProductPicture);

    /**
     * 批量删除店铺商品对应的附件图片
     *
     * @param ids 需要删除的店铺商品对应的附件图片主键集合
     * @return 结果
     */
    public int deleteDealerProductPictureByIds(String ids);

    /**
     * 删除店铺商品对应的附件图片信息
     *
     * @param id 店铺商品对应的附件图片主键
     * @return 结果
     */
    public int deleteDealerProductPictureById(Long id);

    /**
     * 批量新增店铺商品对应的附件图片
     *
     * @param dealerProductPictureList 新增的店铺商品对应的附件图片集合
     * @return 结果
     */
    public int BatchInsertDealerProductPicture(List<DealerProductPicture> dealerProductPictureList);

    /**
     * 根据店铺商品id查询店铺商品对应的附件图片集合
     * @param dealerProductPicture
     * @return
     */
    public List<DealerProductPicture> selectDealerProductPictureAndSysAttachmentList(DealerProductPicture dealerProductPicture);
}
