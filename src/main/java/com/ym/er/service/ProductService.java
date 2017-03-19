package com.ym.er.service;

import com.sun.org.apache.regexp.internal.RE;
import com.ym.er.model.*;

import javax.xml.crypto.dom.DOMCryptoContext;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by YM on 3/9/2017.
 * 闲置上下架/修改等功能service
 * 分页放在.....
 */
public interface ProductService {






    Result<Product> insertProduct(Product product);

    Result deleteProduct(int productId);

    Result updateProduct(Product product);

    /**
     * 下架商品
     * @param productId
     * @return
     */
    Result pastProduct(int productId);

    /**
     * 默认不包含header
     * @param productId
     * @return
     */
    Result<Product> selectProductById(int productId);

    /**
     * 多条件查询, 交给controller负责
     * @param example 条件
     * @return 结果
     */
    Result<List<Product>> selectProductByExample(ProductExample example);

    Result<List<Product>> selectProductByUserId(int userId);

    Result<List<Product>> selectProductByUserId(int userId, String order, boolean up);

    Result<List<Product>> selectFavorProductByUserId(int userId, String order, boolean up);

    /**
     *
     * @param types 商品/闲置
     * @param bigCategory 大类 :
     * @param category 小类, 与大类不能共存
     * @param lowPrice 最低价
     * @param highPrice 最高价
     * @param startTime 上架时间开始
     * @param endTime 上架时间结束
     * @param favor 是否点赞次数进行排序
     * @param watchTimes 是否查看次数进行排序
     * @param commentTimes 是否以评论次数进行排序
     * @return 结果
     */
    Result<List<Product>> selectProductByMultiChoice(
            String keyword,
            Byte types[],
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
                                                     );
    /**
     *
     * @param types 商品/闲置
     * @param bigCategory 大类 :
     * @param category 小类, 与大类不能共存
     * @param lowPrice 最低价
     * @param highPrice 最高价
     * @param startTime 上架时间开始
     * @param endTime 上架时间结束
     * @param favor 是否点赞次数进行排序
     * @param watchTimes 是否查看次数进行排序
     * @param commentTimes 是否以评论次数进行排序
     * @return 结果
     */
    Result<List<ProductShow>> selectProductShowByMultiChoice(
            String keyword,
            Byte types[],
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
                                                     );


    Result<List<ProductImage>> insertProductImage(List<ProductImage> productImages);

    Result<List<ProductImage>> selectImageByProductId(int productId);

    /**
     * 获取商品的header image
     * 我认为不应该放在这一层
     * 推荐在controller中直接调用分页方法进行查询单条
     * @param productId
     * @return
     */
//    Result<ProductImage> selectHeaderImageByProductId(int productId);

    Result deleteProductImage(int imgId);

    Result deleteProductImage(int[] imgIds);

    Result<ProductImage> insertProductImage(ProductImage productImage);

    Result updateWatchTimes(int productId);

    Result updateFavorTimes(int productId);

}
