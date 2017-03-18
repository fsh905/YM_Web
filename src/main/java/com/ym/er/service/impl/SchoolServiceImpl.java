package com.ym.er.service.impl;

import com.ym.er.mapper.SchoolMapper;
import com.ym.er.model.Result;
import com.ym.er.model.School;
import com.ym.er.model.SchoolExample;
import com.ym.er.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by YM on 3/10/2017.
 */
@Service
public class SchoolServiceImpl implements SchoolService{

    @Autowired
    private SchoolMapper schoolMapper;

    @Override
    public Result<School> insertSchool(School school) {
        school.setCreateTime(new java.sql.Timestamp(new Date().getTime()));
        int r = schoolMapper.insertSelective(school);
        return r == 1 ? Result.build(200, "添加成功", school) : Result.build(400, "添加失败");
    }

    @Override
    public Result<List<School>> selectSchoolByKeyword(String keyword) {
        SchoolExample example = new SchoolExample();
        example.createCriteria().andKeywordLike("%"+keyword+"%");
        List<School> all = schoolMapper.selectByExample(example);
        return all == null ? Result.build(400, "没有数据") : Result.build(200, "获取成功", all);

    }

    @Override
    public Result<List<School>> selectAllSchool() {
        List<School> all = schoolMapper.selectAllSchool();
        return all == null ? Result.build(400, "没有数据") : Result.build(200, "获取成功", all);
    }

    @Override
    public Result<School> selectSchoolById(int school_id) {
        return Result.build(200, "获取成功", schoolMapper.selectByPrimaryKey(school_id));
    }

    @Override
    public Result deleteSchool(int school_id) {
        int res = schoolMapper.deleteByPrimaryKey(school_id);
        return res == 1 ? Result.build(200, "删除成功") : Result.build(400, "删除失败");

    }

    @Override
    public Result<School> updateSchool(School school) {
        SchoolExample example = new SchoolExample();
        example.createCriteria().andSchoolIdEqualTo(school.getSchoolId());
        int res = schoolMapper.updateByExampleSelective(school, example);
        return res == 1 ? Result.build(200, "修改成功") : Result.build(400, "修改失败");
    }
}
