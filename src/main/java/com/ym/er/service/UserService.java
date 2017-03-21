package com.ym.er.service;

import com.ym.er.model.Result;
import com.ym.er.model.User;

/**
 * Created by YM on 3/8/2017.
 * 普通用户个人信息方面的service
 * todo:登陆，注册，个人信息增改
 */
public interface UserService {

    /**
     * 登录
     * @param name
     * @param password
     * @return
     */
    Result<User> login(String name, String password);

    /**
     *  注册
     * @param user
     * @return
     */
    Result<User> signin(User user);

    /**
     * 修改信息
     * @param user
     * @return
     */
    Result update(User user);

    /**
     * 修改密码
     * @param user
     * @return
     */
    Result updatePassword(User user);

    /**
     * 获取个人信息
     * @param id
     * @return
     */
    Result<User> selectUserById(int id);

    Result checkNameIsDuplicate(String name);

    Result<Integer> countBySchoolIn7Day(Integer schoolId);
    Result<Integer> countBySchoolInAllTime(Integer schoolId);
    Result<Integer> countAllIn7Day();
    Result<Integer> countAllInAllTime();

}
