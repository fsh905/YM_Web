package com.ym.er.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ym.er.model.Category;
import com.ym.er.model.Product;
import com.ym.er.model.Result;
import com.ym.er.service.CategoryService;
import com.ym.er.service.ProductService;
import javafx.scene.layout.Pane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by YM on 3/13/2017.
 * 公共的显示商品
 */
@Controller("")
@RequestMapping("/products")
public class ProductsController {

    private ProductService productService;
    private CategoryService categoryService;
    private final int pageShow = 2;

    @Autowired
    public ProductsController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }

    /**
     * 首页搜索条跳转
     * 只跳转，其他交给ajax
     */
    @GetMapping("/search")
    public ModelAndView pageList(ModelAndView modelAndView) {

//        PageHelper.startPage(1, pageShow);
//        Result<List<Product>> products = productService.selectProductByMultiChoiceAndSmallCategory(keyword, types,
//                category,lowPrice,highPrice,null,null,null,null,null);
//        modelAndView.addObject("result", products);
        List<Category> bigCate = categoryService.selectBigCategory();
        List<Map<String, Object>> cates = new ArrayList<>(10);
        bigCate.forEach(bi -> {
            Map<String, Object> map = new HashMap<>();
            List<Category> cas = categoryService.selectCategoryByPId(bi.getId());
            map.put("bigCategory", bi);
            map.put("category", cas);
            cates.add(map);
        });
        modelAndView.addObject("category", cates);
//        modelAndView.addObject("category", categoryService.selectCategoryByPId(bigCate.get(0).getId()));
        modelAndView.setViewName("products/list");
        return  modelAndView;
    }

    /**
     * 搜索之后将结果放到url,方便ajax请求
     */
    @PostMapping("/search")
    @ResponseBody
    public Result<PageInfo> keywordSearchList(
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "type", required = false) Byte types[],
            @RequestParam(value = "bigCategory", required = false) Integer bigCategory,
            @RequestParam(value = "category", required = false) Integer category,
            @RequestParam(value = "lowPrice",required = false) Double lowPrice,
            @RequestParam(value = "highPrice", required = false) Double highPrice,
            @RequestParam(value = "startTime", required = false) Timestamp startTime,
            @RequestParam(value = "endTime",required = false) Timestamp endTime,
            @RequestParam(value = "favor", required = false) Boolean favor,
            @RequestParam(value = "watchTimes", required = false) Boolean watchTimes,
            @RequestParam(value = "page", required = false) Integer page
    ){
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, pageShow);
        Result<List<Product>> result = productService.selectProductByMultiChoice(keyword,types,bigCategory,category,lowPrice,highPrice,startTime,endTime,favor,watchTimes,null);

        return Result.build(200, "获取成功", new PageInfo(result.getData()));
    }



}