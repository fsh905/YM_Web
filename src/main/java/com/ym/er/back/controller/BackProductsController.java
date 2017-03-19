package com.ym.er.back.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ym.er.auth.SchoolManagerAuthPassport;
import com.ym.er.model.Message;
import com.ym.er.model.ProductShow;
import com.ym.er.model.Result;
import com.ym.er.service.BackProductService;
import com.ym.er.service.MessageService;
import com.ym.er.service.ProductMessageService;
import com.ym.er.service.ProductService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by YM on 3/18/2017.
 * 商品后台管理
 */
@Controller
@RequestMapping("/backend")
public class BackProductsController {

    private BackProductService productService;
    private ProductService productPastService;
    private MessageService messageService;

    @Autowired
    public BackProductsController(BackProductService productService, ProductService productPastService, MessageService messageService) {
        this.productService = productService;
        this.productPastService = productPastService;
        this.messageService = messageService;
    }

    @SchoolManagerAuthPassport
    @GetMapping("/products")
    public String productPage() {
        return "backend/products";
    }

    @SchoolManagerAuthPassport
    @PostMapping("/products")
    @ResponseBody
    public Result<?> getProducts(@SessionAttribute(StatusUtil.SCHOOLIDKEY) Integer schoolId, @RequestParam(value = "page",required = false) Integer page,
                                 @RequestParam(value = "keyword",required = false) String keyword,
                                 @RequestParam(value = "sort", required = false) Integer flag) {

        if (page == null) {
            page = 1;
        }
        if (flag == null) {
            flag = 0;
        }
        PageHelper.startPage(page, 10);
        Result<List<ProductShow>> ps = productService.selectProductByFlag(keyword, flag, schoolId);
        if (ps.getStatus() == 200) {
            return Result.build(200, "获取成功", new PageInfo<>(ps.getData()));
        } else {
            return ps;
        }
    }

    @SchoolManagerAuthPassport
    @PostMapping("/products/{productId}/past")
    @ResponseBody
    public Result pastProduct(@PathVariable int productId, Model model, @RequestParam("userId")int userId,@SessionAttribute(StatusUtil.SUPERUSERIDKEY)int managerId) {
        Result result = productPastService.pastProduct(productId);
        if (result.getStatus() == 200) {
            Message message = new Message();
            message.setUserId(userId);
            message.setTitle("您的商品被下架");
            message.setContent("你的<a href='/product/"+productId+"'>商品</a>涉嫌违规，已被管理员@"+managerId+"下架，如有问题，请联系155****");
            messageService.insertMessage(message);
        }
        return result;
    }

}
