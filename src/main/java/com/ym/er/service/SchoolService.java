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
     * @param school
     * @return
     */
    Result<School> insertSchool(School school);

    /**
     * 获取所有学校
     * @return
     */
    Result<List<School>> selectAllSchool();

    Result<List<School>> selectSchoolByKeyword(String keyword);

    /**
     * 获取学校相关信息
     * @param school_id
     * @return
     */
    Result<School> selectSchoolById(int school_id);

    /**
     * 删除学校
     * @param school_id
     * @return
     */
    Result deleteSchool(int school_id);

    /**
     * 更新学校信息,主要是学校名
     * @param school
     * @return
     */
    Result<School> updateSchool(School school);
}
