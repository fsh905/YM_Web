package com.ym.er.controller;

import com.github.pagehelper.PageHelper;
import com.ym.er.model.Category;
import com.ym.er.model.Product;
import com.ym.er.model.Result;
import com.ym.er.service.CategoryService;
import com.ym.er.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by YM on 3/13/2017.
 * 主要负责首页显示
 */
@Controller
public class IndexController {

    private CategoryService categoryService;
    private ProductService productService;

    @Autowired
    public IndexController(CategoryService categoryService, ProductService productService) {
        this.categoryService = categoryService;
        this.productService = productService;
    }


    @ModelAttribute("cate")
    public void productCategory(Model model) {
        List<Category> bigCate = categoryService.selectBigCategory();
        model.addAttribute("bigCategory", bigCate);
        model.addAttribute("category", categoryService.selectCategoryByPId(bigCate.get(0).getId()));
    }

    @ModelAttribute("products")
    public void indexProductShow(Model model) {
        PageHelper.startPage(1,3);
        Result<List<Product>> watchRes = productService.selectProductByMultiChoice(null,null,
                null,null,null,null,
                null,null,null,true,null);
        PageHelper.startPage(1,6);
        Result<List<Product>> newRes = productService.selectProductByMultiChoice(null,null,
                null,null,null,null,
                null,null,null,null,null);
        PageHelper.startPage(1,6);
        Result<List<Product>> favorRes = productService.selectProductByMultiChoice(null,null,
                null,null,null,null,
                null,null,true,null,null);
        PageHelper.startPage(1,6);
        Result<List<Product>> commentRes = productService.selectProductByMultiChoice(null,null,
                null,null,null,null,
                null,null,null,null,true);
        model.addAttribute("watchProducts", watchRes.getData());
        model.addAttribute("newProducts", newRes.getData());
        model.addAttribute("favorProducts", favorRes.getData());
        model.addAttribute("commentProducts", commentRes.getData());
    }


    @GetMapping("/redirect")
    public String redirect(@RequestParam("url") String url) {
        return "redirect:"+url;
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

}
