package com.ym.er.service;

import com.sun.org.apache.regexp.internal.RE;
import com.ym.er.model.FavorProduct;
import com.ym.er.model.Product;
import com.ym.er.model.Result;

import java.util.List;

/**
 * Created by YM on 3/14/2017.
 * 点赞专用
 */
public interface FavorProductService {

    Result<List<FavorProduct>> selectFavorProductByUserId(int userId);

    /**
     *
     * @param userId
     * @param productId
     * @return 400,没有点赞， 200已点赞
     */
    Result selectIsFavorProduct(int userId, int productId);

    Result insertFavorProduct(int userId, int productId);

    Result deleteFavorProduct(int userId, int productId);

}
