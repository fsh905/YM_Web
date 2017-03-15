package com.ym.er.service.impl;

import com.ym.er.mapper.CategoryMapper;
import com.ym.er.model.Category;
import com.ym.er.model.CategoryExample;
import com.ym.er.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by YM on 3/13/2017.
 *
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    public CategoryServiceImpl(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }

    private CategoryMapper categoryMapper;

    @Override
    public List<Category> selectCategoryByPId(int pId) {
        CategoryExample example = new CategoryExample();
        example.createCriteria().andPIdEqualTo(pId);
        return categoryMapper.selectByExample(example);
    }

    @Override
    public List<Category> selectBigCategory() {
        return selectCategoryByPId(0);
    }

    @Override
    public List<Category> selectSamePIdCategory(int id) {
        return categoryMapper.selectSameBrotherCategory(id);
    }
}
