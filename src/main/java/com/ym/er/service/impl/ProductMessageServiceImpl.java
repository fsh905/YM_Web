package com.ym.er.service.impl;

import com.ym.er.mapper.ProductMessageMapper;
import com.ym.er.mapper.ProductMessageViewMapper;
import com.ym.er.model.*;
import com.ym.er.service.ProductMessageService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by YM on 3/16/2017.
 *
 */
@Service
public class ProductMessageServiceImpl implements ProductMessageService{

    private ProductMessageMapper productMessageMapper;
    private ProductMessageViewMapper productMessageViewMapper;

    @Autowired
    public ProductMessageServiceImpl(ProductMessageMapper productMessageMapper, ProductMessageViewMapper productMessageViewMapper) {
        this.productMessageMapper = productMessageMapper;
        this.productMessageViewMapper = productMessageViewMapper;
    }

    @Override
    public Result<ProductMessage> insertMessage(ProductMessage message) {
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        message.setSendTime(date);
        int res = productMessageMapper.insertSelective(message);
        return res == 1 ? Result.build(200, "插入成功", message) : Result.build(400, "插入失败");
    }

    @Override
    public Result<List<Integer>> selectProductByUserId(int userId) {
        List<Integer> ids = productMessageMapper.selectProductIdByUserId(userId);
        return ids == null ? Result.build(400, "没有数据") : Result.build(200, "获取成功", ids);
    }

    @Override
    public Result deleteProductMessage(int msgId) {
        ProductMessageExample example = new ProductMessageExample();
        example.createCriteria().andProductMsgIdEqualTo(msgId);
        ProductMessage message = new ProductMessage();
        message.setProductMsgId(msgId);
        message.setStatus(StatusUtil.DELETE);
        int res = productMessageMapper.updateByExampleSelective(message, example);
        return res == 1 ? Result.build(200, "删除成功")  : Result.build(400, "删除失败");
    }

    @Override
    public Result<List<ProductMessage>> selectMessageByProductId(int productId) {
        ProductMessageExample example = new ProductMessageExample();
        example.createCriteria().andProductIdEqualTo(productId).andStatusEqualTo(StatusUtil.EXIST);
        List<ProductMessage> messages = productMessageMapper.selectByExample(example);
        return messages == null ? Result.build(400, "没有数据") : Result.build(200, "获取成功", messages);
    }
    @Override
    public Result<List<ProductMessageView>> selectMessageViewByProductId(int productId) {
        ProductMessageViewExample example = new ProductMessageViewExample();
        example.createCriteria().andProductIdEqualTo(productId);
        List<ProductMessageView> messages = productMessageViewMapper.selectByExample(example);
        return messages == null ? Result.build(400, "没有数据") : Result.build(200, "获取成功", messages);
    }
}
