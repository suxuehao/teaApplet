package com.tea.web.service.impl;

import java.util.Collections;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tea.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tea.web.mapper.DealerProductPictureMapper;
import com.tea.web.domain.DealerProductPicture;
import com.tea.web.service.IDealerProductPictureService;
import com.tea.common.core.text.Convert;

/**
 * 店铺商品对应的附件图片Service业务层处理
 *
 * @author suxuehao
 * @date 2024-08-28
 */
@Service
public class DealerProductPictureServiceImpl extends ServiceImpl<DealerProductPictureMapper, DealerProductPicture> implements IDealerProductPictureService {
    @Autowired
    private DealerProductPictureMapper dealerProductPictureMapper;

    /**
     * 查询店铺商品对应的附件图片
     *
     * @param id 店铺商品对应的附件图片主键
     * @return 店铺商品对应的附件图片
     */
    @Override
    public DealerProductPicture selectDealerProductPictureById(Long id) {
        return dealerProductPictureMapper.selectDealerProductPictureById(id);
    }

    /**
     * 查询店铺商品对应的附件图片列表
     *
     * @param dealerProductPicture 店铺商品对应的附件图片
     * @return 店铺商品对应的附件图片
     */
    @Override
    public List<DealerProductPicture> selectDealerProductPictureList(DealerProductPicture dealerProductPicture) {
        return dealerProductPictureMapper.selectDealerProductPictureList(dealerProductPicture);
    }

    /**
     * 新增店铺商品对应的附件图片
     *
     * @param dealerProductPicture 店铺商品对应的附件图片
     * @return 结果
     */
    @Override
    public int insertDealerProductPicture(DealerProductPicture dealerProductPicture) {
                dealerProductPicture.setCreateTime(DateUtils.getNowDate());
            return dealerProductPictureMapper.insertDealerProductPicture(dealerProductPicture);
    }

    /**
     * 修改店铺商品对应的附件图片
     *
     * @param dealerProductPicture 店铺商品对应的附件图片
     * @return 结果
     */
    @Override
    public int updateDealerProductPicture(DealerProductPicture dealerProductPicture) {
                dealerProductPicture.setUpdateTime(DateUtils.getNowDate());
        return dealerProductPictureMapper.updateDealerProductPicture(dealerProductPicture);
    }

    /**
     * 批量删除店铺商品对应的附件图片
     *
     * @param ids 需要删除的店铺商品对应的附件图片主键
     * @return 结果
     */
    @Override
    public int deleteDealerProductPictureByIds(String ids) {
        return dealerProductPictureMapper.deleteDealerProductPictureByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除店铺商品对应的附件图片信息
     *
     * @param id 店铺商品对应的附件图片主键
     * @return 结果
     */
    @Override
    public int deleteDealerProductPictureById(Long id) {
        return dealerProductPictureMapper.deleteDealerProductPictureById(id);
    }

    /**
     * 批量新增店铺商品对应的附件图片
     *
     * @param dealerProductPictureList 新增的店铺商品对应的附件图片集合
     * @return 结果
     */
    @Override
    public int BatchInsertDealerProductPicture(List<DealerProductPicture> dealerProductPictureList) {
        return dealerProductPictureMapper.BatchInsertDealerProductPicture(dealerProductPictureList);
    }

    /**
     * 根据店铺商品id查询店铺商品对应的附件图片集合
     * @param dealerProductPicture
     * @return
     */
    @Override
    public List<DealerProductPicture> selectDealerProductPictureAndSysAttachmentList(DealerProductPicture dealerProductPicture) {
        return dealerProductPictureMapper.selectDealerProductPictureAndSysAttachmentList(dealerProductPicture);
    }
}
