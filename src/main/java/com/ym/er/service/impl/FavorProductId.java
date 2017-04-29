package com.ym.er.service.impl;

import com.ym.er.mapper.FavorProductMapper;
import com.ym.er.model.FavorProduct;
import com.ym.er.model.FavorProductExample;
import com.ym.er.model.Result;
import com.ym.er.service.FavorProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by YM on 3/14/2017.
 *
 */
@Service
public class FavorProductId implements FavorProductService{
    private FavorProductMapper favorProductMapper;

    @Autowired
    public FavorProductId(FavorProductMapper favorProductMapper) {
        this.favorProductMapper = favorProductMapper;
    }

    @Override
    public Result<List<FavorProduct>> selectFavorProductByUserId(int userId) {
        FavorProductExample example = new FavorProductExample();
        example.createCriteria().andUserIdEqualTo(userId);
        return Result.build(200, "获取成功", favorProductMapper.selectByExample(example));
    }


    @Override
    public Result selectIsFavorProduct(int userId, int productId) {
        FavorProductExample example = new FavorProductExample();
        example.createCriteria().andUserIdEqualTo(userId).andProductIdEqualTo(productId);
        int l = favorProductMapper.countByExample(example);
        return (l == 0) ? Result.build(400, "no") : Result.build(200, "yes");
    }

    @Override
    public Result insertFavorProduct(int userId, int productId) {
        FavorProduct favorProduct = new FavorProduct();
        favorProduct.setProductId(productId);
        favorProduct.setUserId(userId);
        favorProduct.setTime(new java.sql.Timestamp(new Date().getTime()));
        int res= favorProductMapper.insert(favorProduct);
        return res == 0 ? Result.build(400, "no") : Result.build(200, "yes");

    }

    @Override
    public Result deleteFavorProduct(int userId, int productId) {
        FavorProductExample example = new FavorProductExample();
        example.createCriteria().andUserIdEqualTo(userId).andProductIdEqualTo(productId);
        int res = favorProductMapper.deleteByExample(example);
        return res >= 0 ? Result.build(200, "yes") : Result.build(400, "no");
    }


}
