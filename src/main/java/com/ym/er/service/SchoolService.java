package com.ym.er.service;

import com.ym.er.model.Result;
import com.ym.er.model.School;

import java.util.List;

/**
 * Created by YM on 3/10/2017.
 * 学校类相关
 */
public interface SchoolService {

    /**
     * 插入新学校
     * @param school 学校
     * @return 结果
     */
    Result<School> insertSchool(School school);

    /**
     * 获取所有学校
     * @return 学校列表
     */
    Result<List<School>> selectAllSchool();

    /**
     * 查询学校
     * @param keyword 名称关键字
     * @return 符合条件的学校
     */
    Result<List<School>> selectSchoolByKeyword(String keyword);

    /**
     * 获取学校相关信息
     * @param school_id 学校id
     * @return 学校
     */
    Result<School> selectSchoolById(int school_id);

    /**
     * 删除学校
     * @param school_id 学校id
     * @return 结果
     */
    Result deleteSchool(int school_id);

    /**
     * 更新学校信息,主要是学校名
     * @param school 学校
     * @return 更新结果
     */
    Result<School> updateSchool(School school);
}
