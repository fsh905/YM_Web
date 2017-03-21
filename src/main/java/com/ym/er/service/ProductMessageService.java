package com.ym.er.service;

import com.ym.er.model.ProductMessage;
import com.ym.er.model.ProductMessageView;
import com.ym.er.model.Result;

import java.util.List;

/**
 * Created by YM on 3/9/2017.
 * 商品/需求 留言service
 */
public interface ProductMessageService {

    Result<ProductMessage> insertMessage(ProductMessage message);

    Result<List<Integer>> selectProductByUserId(int userId);

    Result deleteProductMessage(int msgId);

    Result<List<ProductMessage>> selectMessageByProductId(int productId);

    Result<List<ProductMessageView>> selectMessageViewByProductId(int productId);

}
