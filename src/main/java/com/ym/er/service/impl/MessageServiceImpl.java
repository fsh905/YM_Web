package com.ym.er.service.impl;

import com.ym.er.mapper.MessageMapper;
import com.ym.er.model.Message;
import com.ym.er.model.MessageExample;
import com.ym.er.model.Result;
import com.ym.er.service.MessageService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by YM on 3/15/2017.
 *
 */
@Service
public class MessageServiceImpl implements MessageService {

    private MessageMapper messageMapper;

    @Autowired
    public MessageServiceImpl(MessageMapper messageMapper) {
        this.messageMapper = messageMapper;
    }

    @Override
    public Result<Message> insertMessage(Message message) {
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        message.setTime(date);
        int res = messageMapper.insertSelective(message);
        return res == 1 ? Result.build(200, "插入成功", message) : Result.build(400,  "插入失败");

    }

    @Override
    public Result deleteMessage(int msgId) {
        int res = messageMapper.deleteByPrimaryKey(msgId);
        return res == 1 ? Result.build(200, "删除成功") : Result.build(400,  "删除失败");

    }

    @Override
    public Result readMessage(int msgId) {
        MessageExample example = new MessageExample();
        example.createCriteria().andMsgIdEqualTo(msgId);
        Message message = new Message();
        message.setRead(StatusUtil.READ);
        return messageMapper.updateByExampleSelective(message, example) == 1
                ? Result.build(200, "修改成功")
                : Result.build(400, "修改失败");

    }

    @Override
    public Result readMessages(int userId) {
        MessageExample example = new MessageExample();
        example.createCriteria().andUserIdEqualTo(userId);
        Message message = new Message();
        message.setRead(StatusUtil.READ);
        return messageMapper.updateByExampleSelective(message, example) >= 0
                ? Result.build(200, "修改成功")
                : Result.build(400, "修改失败");
    }

    @Override
    public Result readMessages(List<Integer> msgIds) {
        MessageExample example = new MessageExample();
        example.createCriteria().andMsgIdIn(msgIds);
        Message message = new Message();
        message.setRead(StatusUtil.READ);
        return messageMapper.updateByExampleSelective(message, example) >= 0
                ? Result.build(200, "修改成功")
                : Result.build(400, "修改失败");
    }

    @Override
    public Result<List<Message>> selectMessageByUserId(int userId) {
        MessageExample example = new MessageExample();
        example.createCriteria().andUserIdEqualTo(userId).andStatusEqualTo(StatusUtil.EXIST);
        List<Message> messages = messageMapper.selectByExample(example);
        return Result.build(200, "获取成功", messages);
    }

    @Override
    public Result<Integer> countUnreadMessage(int userId) {
        MessageExample example = new MessageExample();
        example.createCriteria().andUserIdEqualTo(userId).andReadEqualTo(StatusUtil.UNREAD).andStatusEqualTo(StatusUtil.EXIST);
        int count = messageMapper.countByExample(example);
        return Result.build(200, "", count);
    }
}
