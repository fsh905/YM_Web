package com.ym.er.service;

import com.ym.er.model.Result;
import com.ym.er.model.SuperUser;

import java.util.List;

/**
 * Created by YM on 3/17/2017.
 * 管理员
 */
public interface SuperUserService {

    /**
     * 管理员登录
     * @param userName 用户名
     * @param password 密码
     * @return 登陆成功后的管理员信息
     */
    Result<SuperUser> login(String userName, String password);

    /**
     * 获取校级管理员
     */
    Result<List<SuperUser>> selectUserBySchoolId(Integer schoolId);

    /**
     * 获取超级管理员
     */
    Result<List<SuperUser>> selectAdminUser();

    /**
     * 校区管理员添加，添加的必须是本校的
     */
    Result insertManagerUser(Integer userId);

    /**
     * 超级管理员添加
     */
    Result insertAdminUser(Integer userId);

    /**
     * 删除管理员，role置为3即可
     */
    Result deleteSuperUser(Integer userId);

}
