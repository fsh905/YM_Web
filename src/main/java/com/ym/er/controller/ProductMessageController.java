package com.ym.er.controller;

import com.github.pagehelper.PageInfo;
import com.ym.er.model.*;
import com.ym.er.service.MessageService;
import com.ym.er.service.ProductMessageService;
import com.ym.er.service.ProductService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by YM on 3/16/2017.
 * 产品留言
 */
@Controller
@RequestMapping("/comment")
public class ProductMessageController {

    private ProductMessageService messageService;
    private MessageService messageSendService;
    private ProductService productService;

    @Autowired
    public ProductMessageController(ProductMessageService messageService, MessageService messageSendService, ProductService productService) {
        this.messageService = messageService;
        this.messageSendService = messageSendService;
        this.productService = productService;
    }

    @PostMapping("/add")
    @ResponseBody
    public Result addComment(@SessionAttribute(StatusUtil.USERIDKEY) int userId, ProductMessage message) {
        message.setFromUserId(userId);
        // 添加消息
        //商品评论消息
        int productId = message.getProductId();

        Result<Product> productResult = productService.selectProductById(productId);
        if (productResult.getStatus() == 200) {
            sendMsgToUser("您上架的商品有新评论了", "<a href='/product/"+productId+"'>点击查看</a>", productResult.getData().getUserId());
        }
        // 给回复的用户发消息
        if (message.getToUserId() != null) {
            sendMsgToUser("您的留言有新回复了！", "<a href='/product/"+productId+"'>点击查看</a>", message.getToUserId());
        }
        return messageService.insertMessage(message);
    }

    private Result<Message> sendMsgToUser(String title, String content, int userId) {
        Message proMsg = new Message();
        proMsg.setTitle(title);
        proMsg.setContent(content);
        proMsg.setUserId(userId);
        return messageSendService.insertMessage(proMsg);
    }

    @PostMapping("/{cId}/delete")
    @ResponseBody
    private Result deleteComment(@SessionAttribute(StatusUtil.USERIDKEY)int userId, @PathVariable int cId) {
        return messageService.deleteProductMessage(cId);
    }

    @GetMapping("/product/{pId}")
    @ResponseBody
    public Result<?> getProductComment(@PathVariable int pId, @RequestParam(value = "page", required = false) Integer page) {
        if (page == null) {
            page = 1;
        }

        Result<List<ProductMessage>> ms = messageService.selectMessageByProductId(pId);
        if (ms.getStatus() == 200) {
            PageInfo pageInfo = new PageInfo(ms.getData());
            return Result.build(200, ms.getMsg(), pageInfo);
        }
        return ms;
    }


}
