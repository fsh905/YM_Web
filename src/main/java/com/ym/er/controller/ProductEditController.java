package com.ym.er.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.ym.er.model.*;
import com.ym.er.service.*;
import com.ym.er.util.FileUtil;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Created by YM on 3/11/2017.
 *
 */
@Controller
@RequestMapping("/product")
public class ProductEditController {

    private ProductService productService;
    private CategoryService categoryService;
    private FavorProductService favorProductService;
    private UserService userService;
    private ProductMessageService productMessageService;

    @Autowired
    public ProductEditController(ProductService productService, CategoryService categoryService, FavorProductService favorProductService, UserService userService, ProductMessageService productMessageService) {
        this.productService = productService;
        this.categoryService = categoryService;
        this.favorProductService = favorProductService;
        this.userService = userService;
        this.productMessageService = productMessageService;
    }

    @ModelAttribute
    public Model getProductInfo(@PathVariable("pId")int pId, Model model) {
        Result<Product> productResult = productService.selectProductById(pId);
        Result<List<ProductImage>> imageResult = productService.selectImageByProductId(pId);
        // 评论
        Optional.ofNullable(productResult.getData()).ifPresent((product -> model.addAttribute("product", product)));
        Optional.ofNullable(imageResult.getData()).ifPresent(productImages -> model.addAttribute("productImages", productImages));
        return model;
    }

    @GetMapping("/{pId}/update")
    public ModelAndView updateProductInfo(@SessionAttribute(StatusUtil.USERIDKEY) int userId, @ModelAttribute("product")Product product, ModelAndView modelAndView) {
        // 带上种类
        List<Category> bigCate = categoryService.selectBigCategory();
        modelAndView.addObject("bigCategory", bigCate);
        modelAndView.addObject("category", categoryService.selectSamePIdCategory(product.getCategory()));
        modelAndView.addObject("method", "update");
        modelAndView.setViewName("product/publish");
        return modelAndView;
    }


    @GetMapping("/{pId}")
    public ModelAndView getProductInfo(@PathVariable int pId,@ModelAttribute("product")Product product, ModelAndView modelAndView, HttpSession session) {
        //浏览次数更改
        productService.updateWatchTimes(pId);
        if (session.getAttribute(StatusUtil.LOGINSTATUSKEY) != null) {
            //已经登录，查询点赞状态
            Integer userId = (int) session.getAttribute(StatusUtil.USERIDKEY);
            Result favorProduct = favorProductService.selectIsFavorProduct(userId, pId);
            if (favorProduct.getStatus() == 200) {
                modelAndView.addObject("isFavored", "YES");
            } else {
                modelAndView.addObject("isFavored", "NO");
            }
            modelAndView.addObject("login",userId);
        }
        //提供评论信息
        Result<List<ProductMessageView>> msR = productMessageService.selectMessageViewByProductId(pId);
        if (msR.getStatus() == 200) {
            modelAndView.addObject("comments", msR.getData());
        }
        // 提供上架该商品的用户基本信息
        int userId = product.getUserId();
        Result<User> userResult = userService.selectUserById(userId);
        modelAndView.addObject("user", userResult.getData());
        modelAndView.setViewName("product/info");
        return modelAndView;
    }

}


