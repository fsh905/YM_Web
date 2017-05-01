package com.ym.er.service;

import com.ym.er.model.Message;
import com.ym.er.model.Result;

import java.util.List;

/**
 * Created by YM on 3/9/2017.
 * 消息通知service
 * 添加，删除，阅读，查询
 */
public interface MessageService {

    /**
     * 添加新消息
     * @param message 消息
     * @return 添加后的结果
     */
    Result<Message> insertMessage(Message message);

    /**
     * 删除消息
     * @param msgId 消息
     * @return 结果
     */
    Result deleteMessage(int msgId);

    /**
     * 查看消息
     * @param msgId 消息
     * @return 结果
     */
    Result readMessage(int msgId);

    /**
     * 将用户所有的消息设置为已查看
     * @param userId 用户
     * @return 结果
     */
    Result readMessagesByUserId(int userId);

    /**
     * 批量设置已读
     * @param msgIds 消息
     * @return 结果
     */
    Result readMessages(List<Integer> msgIds);

    /**
     * 用户所有的消息
     * @param userId  用户
     * @return 消息
     */
    Result<List<Message>> selectMessageByUserId(int userId);

    /**
     * 消息数量
     * @param userId 用户
     * @return 数量
     */
    Result<Integer> countUnreadMessage(int userId);

}
