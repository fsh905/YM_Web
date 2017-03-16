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

    Result<Message> insertMessage(Message message);

    Result deleteMessage(int msgId);

    Result readMessage(int msgId);

    Result readMessagesByUserId(int userId);

    Result readMessages(List<Integer> msgIds);

    Result<List<Message>> selectMessageByUserId(int userId);

    Result<Integer> countUnreadMessage(int userId);

}
