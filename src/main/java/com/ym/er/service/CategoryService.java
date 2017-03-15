package com.ym.er.service;

import com.ym.er.model.Category;

import java.util.List;

/**
 * Created by YM on 3/13/2017.
 * 商品种类表
 */
public interface CategoryService {

    List<Category> selectCategoryByPId(int pId);

    List<Category> selectBigCategory();

    List<Category> selectSamePIdCategory(int id);

}
