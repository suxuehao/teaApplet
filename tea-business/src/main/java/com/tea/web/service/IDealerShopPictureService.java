package com.tea.web.service;

import java.util.List;

import com.tea.web.domain.DealerShopPicture;
import org.apache.ibatis.annotations.Param;

/**
 * 店铺展示图Service接口
 *
 * @author suxuehao
 * @date 2024-08-24
 */
public interface IDealerShopPictureService {
    /**
     * 查询店铺展示图
     *
     * @param id 店铺展示图主键
     * @return 店铺展示图
     */
    public DealerShopPicture selectDealerShopPictureById(Long id);

    /**
     * 查询店铺展示图列表
     *
     * @param dealerShopPicture 店铺展示图
     * @return 店铺展示图集合
     */
    public List<DealerShopPicture> selectDealerShopPictureList(DealerShopPicture dealerShopPicture);

    /**
     * 新增店铺展示图
     *
     * @param dealerShopPicture 店铺展示图
     * @return 结果
     */
    public int insertDealerShopPicture(DealerShopPicture dealerShopPicture);

    /**
     * 修改店铺展示图
     *
     * @param dealerShopPicture 店铺展示图
     * @return 结果
     */
    public int updateDealerShopPicture(DealerShopPicture dealerShopPicture);

    /**
     * 批量删除店铺展示图
     *
     * @param ids 需要删除的店铺展示图主键集合
     * @return 结果
     */
    public int deleteDealerShopPictureByIds(String ids);

    /**
     * 删除店铺展示图信息
     *
     * @param id 店铺展示图主键
     * @return 结果
     */
    public int deleteDealerShopPictureById(Long id);

    /**
     * 批量新增店铺展示图
     *
     * @param dealerShopPicture 店铺展示图
     * @return 结果
     */
    public int batchInsertDealerShopPicture(List<DealerShopPicture> dealerShopPicture);

    /**
     * 批量修改店铺展示图顺序
     * @param sortList
     * @return
     */
    public int batchUpdateDealerShopPictureSort(@Param("sortList") List<DealerShopPicture> sortList);

}
