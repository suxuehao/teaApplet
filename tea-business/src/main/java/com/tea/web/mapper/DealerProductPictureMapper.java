package com.tea.web.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tea.web.domain.DealerProductPicture;
import org.apache.ibatis.annotations.Param;

/**
 * 店铺商品对应的附件图片Mapper接口
 *
 * @author suxuehao
 * @date 2024-08-28
 */
public interface DealerProductPictureMapper  extends BaseMapper<DealerProductPicture> {
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
     * 删除店铺商品对应的附件图片
     *
     * @param id 店铺商品对应的附件图片主键
     * @return 结果
     */
    public int deleteDealerProductPictureById(Long id);

    /**
     * 批量删除店铺商品对应的附件图片
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDealerProductPictureByIds(String[] ids);

    /**
     * 批量新增店铺商品对应的附件图片
     *
     * @param dealerProductPictureList 新增的店铺商品对应的附件图片集合
     * @return 结果
     */
    public int BatchInsertDealerProductPicture(@Param("dealerProductPictureList") List<DealerProductPicture> dealerProductPictureList);

    /**
     * 根据店铺商品id查询店铺商品对应的附件图片集合
     * @param dealerProductPicture
     * @return
     */
    public List<DealerProductPicture> selectDealerProductPictureAndSysAttachmentList(DealerProductPicture dealerProductPicture);
}
