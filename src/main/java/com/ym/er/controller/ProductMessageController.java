package com.ym.er.controller;

import com.github.pagehelper.PageInfo;
import com.ym.er.model.ProductMessage;
import com.ym.er.model.Result;
import com.ym.er.service.ProductMessageService;
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

    @Autowired
    public ProductMessageController(ProductMessageService messageService) {
        this.messageService = messageService;
    }

    @PostMapping("/add")
    @ResponseBody
    public Result addComment(@SessionAttribute(StatusUtil.USERIDKEY) int userId, ProductMessage message) {
        message.setFromUserId(userId);
        return messageService.insertMessage(message);
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
