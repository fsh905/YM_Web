package com.ym.er.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ym.er.model.Message;
import com.ym.er.model.Result;
import com.ym.er.service.MessageService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by YM on 3/15/2017.
 * 消息控制
 */
@Controller
@RequestMapping("/message")
public class MessageController {

    private MessageService messageService;

    @Autowired
    public MessageController(MessageService messageService) {
        this.messageService = messageService;
    }

    @PostMapping("/list")
    @ResponseBody
    public Result<PageInfo> getMessages(@SessionAttribute(StatusUtil.USERIDKEY) int userId,
                                        @RequestParam(value = "page", required = false) Integer page) {
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, 2);
        Result<List<Message>> messageList = messageService.selectMessageByUserId(userId);
        // 查询的时候就认为已经把消息全部读取完毕
        messageService.readMessagesByUserId(userId);
        if (messageList.getData() != null) {
            return Result.build(200, "获取成功", new PageInfo(messageList.getData()));
        } else {
            return Result.build(400, "没有数据");
        }
    }

    @PostMapping("/{msgId}/delete")
    @ResponseBody
    public Result deleteMsg(@SessionAttribute(StatusUtil.USERIDKEY) int id, @PathVariable int msgId) {
        return messageService.deleteMessage(msgId);
    }

}
