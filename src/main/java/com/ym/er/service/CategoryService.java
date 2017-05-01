package com.ym.er.service;

import com.ym.er.model.Category;

import java.util.List;

/**
 * Created by YM on 3/13/2017.
 * 商品种类表
 */
public interface CategoryService {

    /**
     * 通过父id获取子类
     * @param pId 父id
     * @return 子类别
     */
    List<Category> selectCategoryByPId(int pId);

    /**
     * 获取所有商品大类
     * @return 大类
     */
    List<Category> selectBigCategory();

    /**
     * 相同大类下的子类别
     * @param id 父类id
     * @return 子类别
     */
    List<Category> selectSamePIdCategory(int id);

}
