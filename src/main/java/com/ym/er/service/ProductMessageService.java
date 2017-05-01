package com.ym.er.service;

import com.ym.er.model.ProductMessage;
import com.ym.er.model.ProductMessageView;
import com.ym.er.model.Result;

import java.util.List;

/**
 * Created by YM on 3/9/2017.
 * 商品/需求 评论service
 */
public interface ProductMessageService {

    /**
     * 增加新评论
     * @param message 评论
     * @return 评论
     */
    Result<ProductMessage> insertMessage(ProductMessage message);

    /**
     * 用户评论过的商品列表
     * @param userId 用户id
     * @return 商品id
     */
    Result<List<Integer>> selectProductByUserId(int userId);

    /**
     * 删除评论
     * @param msgId 评论
     * @return 结果
     */
    Result deleteProductMessage(int msgId);

    /**
     * 某商品所有评论
     * @param productId 商品id
     * @return 评论
     */
    Result<List<ProductMessage>> selectMessageByProductId(int productId);

    /**
     * 商品评论, 包含用户名等
     * 推荐使用
     * @param productId 商品id
     * @return 评论
     */
    Result<List<ProductMessageView>> selectMessageViewByProductId(int productId);

}
