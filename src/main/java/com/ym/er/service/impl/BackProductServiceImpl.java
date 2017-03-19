package com.ym.er.service.impl;

import com.ym.er.mapper.ProductShowMapper;
import com.ym.er.model.ProductShow;
import com.ym.er.model.ProductShowExample;
import com.ym.er.model.Result;
import com.ym.er.service.BackProductService;
import com.ym.er.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by YM on 3/18/2017.
 */
@Service
public class BackProductServiceImpl implements BackProductService {

    private ProductShowMapper productShowMapper;

    @Autowired
    public BackProductServiceImpl(ProductShowMapper productShowMapper) {
        this.productShowMapper = productShowMapper;
    }

    @Override
    public Result<List<ProductShow>> selectProductByFlag(String keyword, int falg, int schoolId) {
        List<ProductShow> productShows = productShowMapper.selectByExample(createExample(falg, keyword, schoolId));
        if (productShows == null) {
            return Result.build(400, "查询失败");
        }
        return Result.build(200, "查询成功", productShows);
    }

    @Override
    public Result<Integer> countBySchoolIn7Day(Integer schoolId, Byte status) {
        ProductShowExample example = new ProductShowExample();
        example.setSelectDate("DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= DATE(up_time)");
        if (schoolId == null) {
            example.createCriteria().andStatusEqualTo(status);
        } else
            example.createCriteria().andStatusEqualTo(status).andSchoolIdEqualTo(schoolId);
        int count = productShowMapper.countByExample(example);
        return Result.build(200, "查询成功", count);
    }

    @Override
    public Result<Integer> countBySchoolInAllTime(Integer schoolId, Byte status) {
        ProductShowExample example = new ProductShowExample();
        if (schoolId == null) {
            example.createCriteria().andStatusEqualTo(status);
        } else
            example.createCriteria().andStatusEqualTo(status).andSchoolIdEqualTo(schoolId);
        int count = productShowMapper.countByExample(example);
        return Result.build(200, "查询成功", count);
    }

    @Override
    public Result<Integer> countAllIn7Day(Byte status) {
        return countBySchoolIn7Day(null, status);
    }

    @Override
    public Result<Integer> countAllInAllTime(Byte status) {
        return countBySchoolInAllTime(null, status);
    }



    /**
     * 1 today
     * 2 yesterday
     * 3 recent 3 day
     * 7 recent 7 day
     * 30 recent 30 day
     * 31 this month
     * 32 last month
     */
    private ProductShowExample createExample(int flag, String keyword, int schoolId) {
        ProductShowExample example = new ProductShowExample();
        String selectDate = null;
        switch (flag) {
            case 1 : selectDate = "TO_DAYS(NOW()) = TO_DAYS(up_time)";
            break;
            case 2 : selectDate = "TO_DAYS(NOW()) - TO_DAYS(up_time) <= 1";
            break;
            case 3 : selectDate = "DATE_SUB(CURDATE(), INTERVAL 3 DAY) <= DATE(up_time)";
            break;
            case 7 : selectDate = "DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= DATE(up_time)";
            break;
            case 30 : selectDate = "DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= DATE(up_time)";
            break;
            case 31 : selectDate = "DATE_FORMAT( up_time, '%Y%m' ) = DATE_FORMAT( CURDATE( ) , '%Y%m')";
            break;
            case 32 : selectDate = "PERIOD_DIFF( DATE_FORMAT( NOW( ) , '%Y%m' ) , DATE_FORMAT( up_time, '%Y%m' ) ) =1";
            break;
            default:{}
        }
        example.setSelectDate(selectDate);
        if (keyword != null) {
            example.createCriteria().andKeywordIs("%"+keyword+"%").andSchoolIdEqualTo(schoolId).andStatusEqualTo(StatusUtil.EXIST);
        } else {
            example.createCriteria().andSchoolIdEqualTo(schoolId).andStatusEqualTo(StatusUtil.EXIST);
        }
        return example;
    }

}
