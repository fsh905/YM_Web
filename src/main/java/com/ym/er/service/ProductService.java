package com.ym.er.service;

import com.sun.org.apache.regexp.internal.RE;
import com.ym.er.model.*;

import javax.xml.crypto.dom.DOMCryptoContext;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by YM on 3/9/2017.
 * 闲置上下架/修改等功能service
 */
public interface ProductService {

    /**
     * 添加新商品
     * @param product 商品
     * @return 结果
     */
    Result<Product> insertProduct(Product product);

    /**
     * 删除商品, 暂未实现
     * @param productId 商品id
     * @return 结果
     */
    Result deleteProduct(int productId);

    /**
     * 更新商品
     * @param product 更新后商品
     * @return 结果
     */
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
     * 不应该把这个逻辑放到controller
     * @param example 条件
     * @return 结果
     */
    @Deprecated
    Result<List<Product>> selectProductByExample(ProductExample example);

    /**
     * 用户所有的商品
     * @param userId 用户id
     * @return 商品
     */
    Result<List<Product>> selectProductByUserId(int userId);

    /**
     * 排序查询
     * @param userId 用户id
     * @param order 排序方式 "上架时间, 价格"等
     * @param up true:升序 false降序
     * @return 结果
     */
    Result<List<Product>> selectProductByUserId(int userId, String order, boolean up);

    /**
     * 查询点赞过的商品
     * @param userId 用户id
     * @param order 排序条件 "上架时间, 价格"
     * @param up true:升序 false:降序
     * @return 商品
     */
    Result<List<Product>> selectFavorProductByUserId(int userId, String order, boolean up);

    /**
     * 多条件查询,
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

    /**
     * 商品图片添加
     * @param productImages 图片
     * @return 结果
     */
    Result<List<ProductImage>> insertProductImage(List<ProductImage> productImages);

    /**
     * 查询商品的所有图片
     * @param productId 商品
     * @return 图片
     */
    Result<List<ProductImage>> selectImageByProductId(int productId);

    /**
     * 获取商品的header image
     * 我认为不应该放在这一层
     * 推荐在controller中直接调用分页方法进行查询单条
     * @param productId
     * @return
     */
//    Result<ProductImage> selectHeaderImageByProductId(int productId);

    /**
     * 删除图片
     * @param imgId 图片
     * @return 结果
     */
    Result deleteProductImage(int imgId);

    /**
     * 批量删除图片
     * @param imgIds 图片ids
     * @return 结果
     */
    Result deleteProductImage(int[] imgIds);

    /**
     * 单个添加商品图片
     * @param productImage 商品图片
     * @return 结果
     */
    Result<ProductImage> insertProductImage(ProductImage productImage);

    /**
     * 增加查看次数
     * @param productId 商品id
     * @return 结果
     */
    Result updateWatchTimes(int productId);

    /**
     * 增加点赞次数
     * @param productId 商品
     * @return 结果
     */
    Result updateFavorTimes(int productId);

}
