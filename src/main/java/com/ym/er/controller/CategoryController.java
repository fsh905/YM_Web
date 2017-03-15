package com.ym.er.controller;

import com.sun.org.apache.regexp.internal.RE;
import com.ym.er.model.Category;
import com.ym.er.model.Result;
import com.ym.er.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 *
 * Created by YM on 3/13/2017.
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

    private CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/{id}")
    @ResponseBody
    public Result<List<Category>> getCategoryListById(@PathVariable("id")int id) {
       List<Category> categories = categoryService.selectCategoryByPId(id);
       if (categories != null) {
           return Result.build(200, "获取成功", categories);
       } else
           return Result.build(400, "错误参数");
   }

}
