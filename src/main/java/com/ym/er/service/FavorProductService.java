package com.ym.er.service;

import com.ym.er.model.FavorProduct;
import com.ym.er.model.Result;

import java.util.List;

/**
 * Created by YM on 3/14/2017.
 * 点赞使用service
 */
public interface FavorProductService {

    /**
     * 选择用户点赞过的商品
     * @param userId
     * @return
     */
    Result<List<FavorProduct>> selectFavorProductByUserId(int userId);

    /**
     * 查询此用户是否点赞此商品
     * @param userId 用户id
     * @param productId 商品id
     * @return 400,没有点赞， 200已点赞
     */
    Result selectIsFavorProduct(int userId, int productId);

    /**
     * 点赞商品
     * @param userId 用户id
     * @param productId 商品id
     * @return 结果
     */
    Result insertFavorProduct(int userId, int productId);

    /**
     * 取消点赞
     * @param userId 用户
     * @param productId 商品
     * @return 结果
     */
    Result deleteFavorProduct(int userId, int productId);

}
