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


    Result<List<ProductShow>> selectProductByFlag(String keyword, int flag, int schoolId);

    Result<Integer> countBySchoolIn7Day(Integer schoolId, Byte status);
    Result<Integer> countBySchoolInAllTime(Integer schoolId, Byte status);
    Result<Integer> countAllIn7Day(Byte status);
    Result<Integer> countAllInAllTime(Byte status);

}
