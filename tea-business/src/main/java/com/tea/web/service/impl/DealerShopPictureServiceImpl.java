package com.tea.web.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tea.web.mapper.DealerShopPictureMapper;
import com.tea.web.domain.DealerShopPicture;
import com.tea.web.service.IDealerShopPictureService;
import com.tea.common.core.text.Convert;

/**
 * 店铺展示图Service业务层处理
 *
 * @author suxuehao
 * @date 2024-08-24
 */
@Service
public class DealerShopPictureServiceImpl implements IDealerShopPictureService {
    @Autowired
    private DealerShopPictureMapper dealerShopPictureMapper;

    /**
     * 查询店铺展示图
     *
     * @param id 店铺展示图主键
     * @return 店铺展示图
     */
    @Override
    public DealerShopPicture selectDealerShopPictureById(Long id) {
        return dealerShopPictureMapper.selectDealerShopPictureById(id);
    }

    /**
     * 查询店铺展示图列表
     *
     * @param dealerShopPicture 店铺展示图
     * @return 店铺展示图
     */
    @Override
    public List<DealerShopPicture> selectDealerShopPictureList(DealerShopPicture dealerShopPicture) {
        return dealerShopPictureMapper.selectDealerShopPictureList(dealerShopPicture);
    }

    /**
     * 新增店铺展示图
     *
     * @param dealerShopPicture 店铺展示图
     * @return 结果
     */
    @Override
    public int insertDealerShopPicture(DealerShopPicture dealerShopPicture) {
            return dealerShopPictureMapper.insertDealerShopPicture(dealerShopPicture);
    }

    /**
     * 修改店铺展示图
     *
     * @param dealerShopPicture 店铺展示图
     * @return 结果
     */
    @Override
    public int updateDealerShopPicture(DealerShopPicture dealerShopPicture) {
        return dealerShopPictureMapper.updateDealerShopPicture(dealerShopPicture);
    }

    /**
     * 批量删除店铺展示图
     *
     * @param ids 需要删除的店铺展示图主键
     * @return 结果
     */
    @Override
    public int deleteDealerShopPictureByIds(String ids) {
        return dealerShopPictureMapper.deleteDealerShopPictureByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除店铺展示图信息
     *
     * @param id 店铺展示图主键
     * @return 结果
     */
    @Override
    public int deleteDealerShopPictureById(Long id) {
        return dealerShopPictureMapper.deleteDealerShopPictureById(id);
    }

    /**
     * 批量新增店铺展示图
     *
     * @param dealerShopPicture 店铺展示图
     * @return 结果
     */
    @Override
    public int batchInsertDealerShopPicture(List<DealerShopPicture> dealerShopPicture) {
        return dealerShopPictureMapper.batchInsertDealerShopPicture(dealerShopPicture);
    }

    /**
     * 批量修改店铺展示图顺序
     * @param sortList
     * @return
     */
    @Override
    public int batchUpdateDealerShopPictureSort(List<DealerShopPicture> sortList) {
        return dealerShopPictureMapper.batchUpdateDealerShopPictureSort(sortList);
    }
}
