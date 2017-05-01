package com.ym.er.service;

import com.ym.er.model.ProductShow;
import com.ym.er.model.Result;

import javax.swing.*;
import java.util.List;

/**
 * Created by YM on 3/18/2017.
 * 后台查询商品使用的service
 *
 * 1 today
 * 2 yesterday
 * 3 recent 3 day
 * 7 recent 7 day
 * 30 recent 30 day
 * 31 this month
 * 32 last month
 */
public interface BackProductService {

    /**
     * 通过关键字, 标识和学校进行查询商品
     * @param keyword 关键字
     * @param flag 标识:      * 1 today
                             * 2 yesterday
                             * 3 recent 3 day
                             * 7 recent 7 day
                             * 30 recent 30 day
                             * 31 this month
                             * 32 last month
     * @param schoolId 学校编号
     * @return 符合条件的商品
     */
    Result<List<ProductShow>> selectProductByFlag(String keyword, int flag, int schoolId);

    /**
     * 指定学校最近七天的商品数量
     * @param schoolId 学校id
     * @param status 1:上架 0 下架
     * @return 数量
     */
    Result<Integer> countBySchoolIn7Day(Integer schoolId, Byte status);

    /**
     * 指定学校商品数量
     * @param schoolId 学校id
     * @param status 1: 上架 0: 下架
     * @return 数量
     */
    Result<Integer> countBySchoolInAllTime(Integer schoolId, Byte status);

    /**
     * 全网最近七天商品数量
     * @param status 1:上架 0:下架
     * @return 数量
     */
    Result<Integer> countAllIn7Day(Byte status);

    /**
     * 全网所有商品数量
     * @param status 1:上架 0:下架
     * @return 数量
     */
    Result<Integer> countAllInAllTime(Byte status);

}
