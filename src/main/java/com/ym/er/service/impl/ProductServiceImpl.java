package com.ym.er.service.impl;

import com.github.pagehelper.PageHelper;
import com.sun.org.apache.regexp.internal.RE;
import com.ym.er.mapper.*;
import com.ym.er.model.*;
import com.ym.er.service.ProductService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.*;

/**
 * Created by YM on 3/10/2017.
 *
 */
@Service
public class ProductServiceImpl implements ProductService {

    private ProductMapper productMapper;
    private ProductShowMapper productShowMapper;
    private ProductImageMapper productImageMapper;
    private FavorProductMapper favorProductMapper;
    private CategoryMapper categoryMapper;

    @Autowired
    public ProductServiceImpl(ProductMapper productMapper,
                              ProductShowMapper productShowMapper,
                              ProductImageMapper productImageMapper,
                              FavorProductMapper favorProductMapper,
                              CategoryMapper categoryMapper) {
        this.productMapper = productMapper;
        this.productShowMapper = productShowMapper;
        this.productImageMapper = productImageMapper;
        this.favorProductMapper = favorProductMapper;
        this.categoryMapper = categoryMapper;
    }




    /**
     * 传递者必须指定是闲置还是求购
     * @param product
     * @return
     */
    @Override
    public Result<Product> insertProduct(Product product) {
        product.setUpTime(new Timestamp(new Date().getTime()));
        int res = productMapper.insertSelective(product);
        return res == 1 ? Result.build(200, "添加成功", product) : Result.build(400, "添加失败");
    }

    @Override
    public Result deleteProduct(int productId) {
        int res = productMapper.deleteByPrimaryKey(productId);
        return res == 1 ? Result.build(200, "删除成功") : Result.build(400, "删除失败");
    }

    @Override
    public Result updateProduct(Product product) {
        int res = productMapper.updateByPrimaryKeySelective(product);
        return res == 1 ? Result.build(200, "修改成功") : Result.build(400, "修改失败");
    }

    @Override
    public Result pastProduct(int productId) {
        Product product = new Product();
        product.setProductId(productId);
        product.setStatus(StatusUtil.PAST);
        return updateProduct(product);
    }

    @Override
    public Result<Product> selectProductById(int productId) {
        Product product = productMapper.selectByPrimaryKey(productId);
        return Result.build(200, "获取成功", product);
    }

    @Override
    public Result<List<Product>> selectProductByExample(ProductExample example) {

        List<Product> products = productMapper.selectByExample(example);
        return Result.build(200, "获取成功", products);
    }

    @Override
    public Result<List<Product>> selectProductByUserId(int userId) {
        return selectProductByUserId(userId, "up_time", true);
    }

    @Override
    public Result<List<Product>> selectProductByUserId(int userId, String order, boolean up) {
        ProductExample example = new ProductExample();
        if (up) {
            example.setOrderByClause(order + " ASC");
        } else {
            example.setOrderByClause(order + " DESC");
        }
        //不能是已经删除的
        example.createCriteria().andUserIdEqualTo(userId).andStatusGreaterThanOrEqualTo(StatusUtil.EXIST);
        List<Product> products = productMapper.selectByExample(example);
        addHeaderImage(products);
        return Result.build(200, "获取成功", products);
    }

    @Override
    public Result<List<Product>> selectFavorProductByUserId(int userId, String order, boolean up) {
        FavorProductExample example = new FavorProductExample();
        if (up) {
            example.setOrderByClause(order + " ASC");
        } else {
            example.setOrderByClause(order + " DESC");
        }
        //不能是已经删除的
        example.createCriteria().andUserIdEqualTo(userId);
        List<FavorProduct> products = favorProductMapper.selectByExample(example);
        if (products == null || products.size() == 0) {
            return Result.build(400, "没有数据");
        }
        List<Integer> ids = new ArrayList<>();
        products.forEach(favorProduct -> ids.add(favorProduct.getProductId()));

        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andProductIdIn(ids).andStatusGreaterThanOrEqualTo(StatusUtil.EXIST);
        List<Product> products1 = productMapper.selectByExample(productExample);
        addHeaderImage(products1);
        return Result.build(200, "获取成功", products1);
    }

    @Override
    public Result<List<Product>> selectProductByMultiChoice(
            String keyword,
            Byte[] types,
            Integer bigCategory,
            Integer category,
            Double lowPrice,
            Double highPrice,
            Timestamp startTime,
            Timestamp endTime,
            Boolean favor,
            Boolean watchTimes,
            Boolean commentTimes,
            Integer schoolId
    ) {
        if (schoolId == null) {
            return Result.build(400, "必须指定学校");
        }
        ProductExample example = new ProductExample();
        ProductExample.Criteria criteria = example.createCriteria();
        criteria.andSchoolIdEqualTo(schoolId);
        criteria.andStatusEqualTo(StatusUtil.EXIST);
        Optional.ofNullable(favor).ifPresent(f -> example.setOrderByClause("favor_times DESC"));
        Optional.ofNullable(watchTimes).ifPresent(w -> example.setOrderByClause("watch_times DESC"));
//        Optional.ofNullable(commentTimes)   // 暂时实现不了对评论数进行排序
        Optional.ofNullable(types).ifPresent(t -> criteria.andTypeIn(Arrays.asList(t)));
        if (category == null) {
            Optional.ofNullable(bigCategory).ifPresent(b -> {
                List<Integer> ids =  categoryMapper.selectIdByPId(bigCategory);
                criteria.andCategoryIn(ids);
            });
        }
        Optional.ofNullable(category).ifPresent(criteria::andCategoryEqualTo);
        Optional.ofNullable(keyword).ifPresent(ke -> criteria.addKeywordIs("%" + ke + "%"));
        Optional.ofNullable(lowPrice).ifPresent(criteria::andPriceGreaterThanOrEqualTo);
        Optional.ofNullable(highPrice).ifPresent(criteria::andPriceLessThanOrEqualTo);
        Optional.ofNullable(startTime).ifPresent(criteria::andUpTimeGreaterThan);
        Optional.ofNullable(endTime).ifPresent(criteria::andUpTimeLessThanOrEqualTo);
        List<Product> res = productMapper.selectByExample(example);
//        debug model
        addHeaderImage(res);
        return Result.build(200, "获取成功", res);
    }

    @Override
    public Result<List<ProductShow>> selectProductShowByMultiChoice(String keyword, Byte[] types, Integer bigCategory, Integer category, Double lowPrice, Double highPrice, Timestamp startTime, Timestamp endTime, Boolean favor, Boolean watchTimes, Boolean commentTimes, Integer schoolId) {
        if (schoolId == null) {
            return Result.build(400, "必须指定学校");
        }
        ProductShowExample example = new ProductShowExample();
        ProductShowExample.Criteria criteria = example.createCriteria();
        criteria.andSchoolIdEqualTo(schoolId);
        Optional.ofNullable(favor).ifPresent(f -> example.setOrderByClause("favor_times DESC"));
        Optional.ofNullable(watchTimes).ifPresent(w -> example.setOrderByClause("watch_times DESC"));
//        Optional.ofNullable(commentTimes)   // 暂时实现不了对评论数进行排序
        Optional.ofNullable(types).ifPresent(t -> criteria.andTypeIn(Arrays.asList(t)));
        if (category == null) {
            Optional.ofNullable(bigCategory).ifPresent(b -> {
                List<Integer> ids =  categoryMapper.selectIdByPId(bigCategory);
                criteria.andCategoryIn(ids);
            });
        }
        Optional.ofNullable(category).ifPresent(criteria::andCategoryEqualTo);
        Optional.ofNullable(keyword).ifPresent(ke -> criteria.andKeywordIs("%" + ke + "%"));
        Optional.ofNullable(lowPrice).ifPresent(criteria::andPriceGreaterThanOrEqualTo);
        Optional.ofNullable(highPrice).ifPresent(criteria::andPriceLessThanOrEqualTo);
        Optional.ofNullable(startTime).ifPresent(criteria::andUpTimeGreaterThan);
        Optional.ofNullable(endTime).ifPresent(criteria::andUpTimeLessThanOrEqualTo);
        List<ProductShow> res = productShowMapper.selectByExample(example);
//        debug model
        addProductShowHeaderImage(res);
        return Result.build(200, "获取成功", res);
    }

    @Override
    @Transactional
    public Result<List<ProductImage>> insertProductImage(List<ProductImage> productImages) {
        int res = productImageMapper.insertImages(productImages);
        if (res >= 1) {
            return Result.build(200, "插入成功", productImages);
        }
        return Result.build(400, "插入失败");
    }

    @Override
    public Result<List<ProductImage>> selectImageByProductId(int productId) {
        ProductImageExample example = new ProductImageExample();
        example.createCriteria().andProductIdEqualTo(productId);
        List<ProductImage> productImages = productImageMapper.selectByExample(example);
        return Result.build(200, "获取成功", productImages);
    }

//    @Override
//    public Result<ProductImage> selectHeaderImageByProductId(int productId) {
//
//        if (productImages.size() > 0)
//            return Result.build(200, "获取成功", productImages.get(0));
//        else
//            return Result.build(400, "获取失败");
//    }

    @Override
    public Result deleteProductImage(int imgId) {
        int res = productImageMapper.deleteByPrimaryKey(imgId);
        return  res > 0 ? Result.build(200, "删除成功") : Result.build(400, "删除失败");
    }

    @Override
    public Result deleteProductImage(int[] imgIds) {
        Result result = null;
        for (int imgId : imgIds) {
            result = deleteProductImage(imgId);
        }
        return result;
    }

    @Override
    public Result<ProductImage> insertProductImage(ProductImage productImage) {
        int res = productImageMapper.insertSelective(productImage);
        return  res > 0 ? Result.build(200, "插入成功", productImage) : Result.build(400, "插入失败");
    }

    @Override
    public Result updateWatchTimes(int productId) {
        return productMapper.updateWatchTimes(productId) > 0 ? Result.build(200, "查看成功") : Result.build(400, "操作失败");
    }

    @Override
    public Result updateFavorTimes(int productId) {
        return productMapper.updateFavorTimes(productId) > 0 ? Result.build(200, "查看成功") : Result.build(400, "操作失败");
    }


    private void addHeaderImage(List<Product> products) {

        products.forEach(this::setHeader);
    }
    private void addProductShowHeaderImage(List<ProductShow> products) {
        products.forEach(this::setHeader);
    }

    private void setHeader(Product product) {
        ProductImageExample example = new ProductImageExample();
        example.createCriteria().andProductIdEqualTo(product.getProductId());
        PageHelper.startPage(1,1);
        List<ProductImage> productImages = productImageMapper.selectByExample(example);
        product.setHeader(productImages.get(0).getUrl());
    }

}
